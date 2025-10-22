import re

from sqlglot import transpile
from trino.auth import BasicAuthentication
from trino.dbapi import connect

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
        CREATE TABLE IF NOT EXISTS ice.equalizer_data.

    And
        s3://cardoai-eu-st-s3-bucket-equalizer-data-lakehouse/iceberg_tables/
    with:
        s3://warehouse/equalizer_data/
    """
    modified_stmt = create_table_stmt.replace(
        'CREATE TABLE "staging-equalizer".cardoai_eu_st_glue_db_equalizer.',
        "CREATE TABLE IF NOT EXISTS ice.equalizer_data.",
    ).replace(
        "s3://cardoai-eu-st-s3-bucket-equalizer-data-lakehouse/iceberg_tables/",
        "s3://warehouse/equalizer_data/",
    )
    return modified_stmt


def main() -> None:
    create_table_stmts = get_create_table_stmts()
    with open("create_tables_original.sql", "w") as f:
        for stmt in create_table_stmts:
            formatted_stmt = transpile(stmt, read="trino", write="trino", pretty=True)[0]
            f.write(formatted_stmt + ";\n\n")

    with open("create_tables_local.sql", "w") as f:
        for stmt in create_table_stmts:
            local_stmt = to_local_create_table_stmt(stmt)
            formatted_stmt = transpile(local_stmt, read="trino", write="trino", pretty=True)[0]
            f.write(formatted_stmt + ";\n\n")


if __name__ == "__main__":
    main()
