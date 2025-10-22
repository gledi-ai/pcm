import re
from pathlib import Path

from sqlglot import exp, parse_one, transpile
from trino.auth import BasicAuthentication
from trino.dbapi import connect

DATA_DIR = Path(__file__).parent / "data"
STAGING_SCHEMA_FILE = DATA_DIR / "create_tables_staging.sql"
LOCAL_SCHEMA_FILE = DATA_DIR / "create_tables_local.sql"
TBL_NAME_PREFIX = 'CREATE TABLE IF NOT EXISTS "local-equalizer".'
TBL_NAME_START = len(TBL_NAME_PREFIX)

re_tbls_exclude = re.compile(r"^(asset|demo)_table_results_[0-9a-f]{32}$")

config = {
    "trino": {
        "host": "trino-gateway.eu-internal.cardoaiapps.com",
        "port": 443,
        "user": "equalizer-tests",
        "password": "64dddIPsTjKSXY7yABIlbXKHl9xrfgEipetfIxBCZexxtzSHie58pvN3UbVGR6vU",
        "catalog": "staging-equalizer",
        "schema": "cardoai_eu_st_glue_db_equalizer",
    }
}


def get_create_table_stmts(tables: str | list[str] | None = None) -> list[str]:
    """
    Returns a list of CREATE TABLE statements for the specified catalog, schema, and tables.
    If tables is None, it returns statements for all tables in the schema.
    """
    user = username = config["trino"]["user"]
    password = config["trino"]["password"]
    auth = BasicAuthentication(username=username, password=password)

    host = config["trino"]["host"]
    port = config["trino"]["port"]
    catalog = config["trino"]["catalog"]
    schema = config["trino"]["schema"]
    conn = connect(host, port=port, user=user, auth=auth, catalog=catalog, schema=schema)
    cur = conn.cursor()

    if tables is None:
        cur.execute("SHOW TABLES")
        tables = [row[0] for row in cur.fetchall()]
    else:
        if isinstance(tables, str):
            tables = [tables]

    create_table_stmts = []
    for table in tables:
        if re_tbls_exclude.match(table):
            print(f"Excluding table: {table}")
            continue
        cur.execute(f"SHOW CREATE TABLE {table}")
        create_table_stmts.append(cur.fetchone()[0])

    return create_table_stmts


def load_create_table_stmts_from_file(file_path: str) -> list[str]:
    with open(file_path) as f:
        content = f.read()
    statements = [stmt.strip() for stmt in content.split(";") if stmt.strip()]
    return statements


def to_local_create_table_stmt(create_table_stmt: str) -> str:
    """
    Replaces:
        CREATE TABLE "staging-equalizer".cardoai_eu_st_glue_db_equalizer.
      with:
        CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.

    And
        s3://cardoai-eu-st-s3-bucket-equalizer-data-lakehouse/iceberg_tables/
    with:
        s3://warehouse/cardoai_local_equalizer
    """
    modified_stmt = create_table_stmt.replace(
        'CREATE TABLE "staging-equalizer".cardoai_eu_st_glue_db_equalizer.',
        'CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.',
    ).replace(
        "s3://cardoai-eu-st-s3-bucket-equalizer-data-lakehouse/iceberg_tables/",
        "s3://warehouse/cardoai_local_equalizer/",
    )

    return modified_stmt


def _get_table_columns(create_expr: exp.Create) -> set[str]:
    schema_expr = create_expr.find(exp.Schema)
    if not schema_expr:
        return set()

    return {
        col_def.this.name.lower()
        for col_def in schema_expr.find_all(exp.ColumnDef)
        if col_def.this and col_def.this.name
    }


def _get_properties(create_expr: exp.Create) -> list[exp.Expression]:
    properties_expr = create_expr.args.get("properties")
    if isinstance(properties_expr, exp.Properties):
        return properties_expr.expressions
    if isinstance(properties_expr, list):
        return properties_expr
    return []


def _get_property_value(prop: exp.Property | None) -> exp.Expression | None:
    if not prop:
        return None
    return prop.args.get("value") or prop.args.get("expression")


def _extract_bloom_columns(value_expr: exp.Expression) -> list[str]:
    bloom_columns: list[str] = []
    if isinstance(value_expr, exp.Array):
        for item in value_expr.expressions:
            if isinstance(item, exp.Literal) and item.is_string:
                bloom_columns.append(item.this)
            elif isinstance(item, exp.Identifier):
                bloom_columns.append(item.name)
        return bloom_columns

    if isinstance(value_expr, exp.Literal) and value_expr.is_string:
        return [value_expr.this]

    return bloom_columns


def validate_parquet_bloom_filter_columns(create_table_stmt: str) -> list[str]:
    """
    Parses a CREATE TABLE statement and returns any parquet_bloom_filter_columns
    that are not present in the table schema.
    """
    create_expr = parse_one(create_table_stmt, read="trino")
    if not isinstance(create_expr, exp.Create):
        return []

    table_columns = _get_table_columns(create_expr)
    if not table_columns:
        return []

    properties = _get_properties(create_expr)
    bloom_property = next(
        (
            prop
            for prop in properties
            if isinstance(prop, exp.Property)
            and prop.name
            and prop.name.lower() == "parquet_bloom_filter_columns"
        ),
        None,
    )

    value_expr = _get_property_value(bloom_property)
    if not value_expr:
        return []

    bloom_columns = _extract_bloom_columns(value_expr)
    return [
        col for col in bloom_columns if col and col.lower() not in table_columns
    ]


def main() -> None:
    create_table_stmts = get_create_table_stmts()
    with STAGING_SCHEMA_FILE.open("w") as f:
        for stmt in create_table_stmts:
            formatted_stmt = transpile(stmt, read="trino", write="trino", pretty=True)[0]
            f.write(formatted_stmt + ";\n\n")

    with LOCAL_SCHEMA_FILE.open("w") as f:
        for stmt in create_table_stmts:
            local_stmt = to_local_create_table_stmt(stmt)
            formatted_stmt = transpile(local_stmt, read="trino", write="trino", pretty=True)[0]
            tbl_name = formatted_stmt[TBL_NAME_START:formatted_stmt.index("(")]
            invalid_bloom_columns = validate_parquet_bloom_filter_columns(formatted_stmt)
            if invalid_bloom_columns:
                print(
                    f"Warning: Table '{tbl_name}' has invalid parquet_bloom_filter_columns: "
                    f"{', '.join(invalid_bloom_columns)}"
                )
            f.write(formatted_stmt + ";\n\n")


if __name__ == "__main__":
    main()
