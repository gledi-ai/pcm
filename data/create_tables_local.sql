CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.asset_class_annex (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  asset_class INTEGER,
  annex_name INTEGER,
  annex_type INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/asset_class_annex',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.asset_collections_timeline (
  originator_id VARCHAR,
  originator_identifier VARCHAR,
  originator_name VARCHAR,
  spv_id VARCHAR,
  spv_identifier VARCHAR,
  spv_name VARCHAR,
  asset_id VARCHAR,
  asset_identifier VARCHAR,
  payment_date DATE,
  cash_flow_type INTEGER,
  realized_amount DECIMAL(30, 6),
  converted_realized_amount DECIMAL(30, 6),
  expected_amount DECIMAL(30, 6),
  converted_expected_amount DECIMAL(30, 6),
  monthly_period_start_date DATE,
  weekly_period_start_date DATE,
  reporting_date DATE,
  synchronization_id VARCHAR,
  currency_abbreviation VARCHAR,
  currency_symbol VARCHAR,
  subscription_id VARCHAR,
  subscription_identifier VARCHAR,
  created_via_backfill BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/asset_collections_timeline',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'subscription_id', 'asset_id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'cash_flow_type', 'reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.asset_contractual_expected_cash_flows (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reference_date DATE,
  identifier VARCHAR,
  type INTEGER,
  asset_id VARCHAR,
  asset_modification_event_id VARCHAR,
  amount DECIMAL(20, 6),
  valid_from DATE,
  valid_until DATE,
  currency_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  converted_amount DECIMAL(20, 6),
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/asset_contractual_expected_cash_flows',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.asset_extended_periodic_reports (
  asset_id VARCHAR,
  asset_class INTEGER,
  asset_role VARCHAR,
  issue_amount DECIMAL(20, 6),
  converted_issue_amount DECIMAL(20, 6),
  is_syndicated BOOLEAN,
  are_payments_in_kind BOOLEAN,
  guarantee_coverage_percent DOUBLE,
  date_activation_guarantee DATE,
  guarantee_requested_amount DECIMAL(20, 6),
  disputed BOOLEAN,
  last_disputed_date DATE,
  rejection_date DATE,
  loan_purpose INTEGER,
  interest_rate_type INTEGER,
  scheduled_principal_payment_frequency INTEGER,
  scheduled_interest_payment_frequency INTEGER,
  interest_rate_floor DECIMAL(7, 6),
  pik_type INTEGER,
  pik_in_cash DECIMAL(20, 6),
  pik_cumulated DECIMAL(20, 6),
  committed_amount DECIMAL(20, 6),
  ballon_amount DECIMAL(20, 6),
  cumulated_recovery DECIMAL(20, 6),
  deferred_security BOOLEAN,
  trade_status INTEGER,
  trade_date DATE,
  exp_settlement_date DATE,
  global_amount DECIMAL(20, 6),
  seniority_type INTEGER,
  spv_id VARCHAR,
  originator_id VARCHAR,
  synchronization_reporting_date DATE,
  synchronization_id VARCHAR,
  asset_type INTEGER,
  seller_id VARCHAR,
  debtor_company_id VARCHAR,
  debtor_individual_id VARCHAR,
  asset_currency_id VARCHAR,
  asset_currency_name VARCHAR,
  asset_currency_abbreviation VARCHAR,
  asset_currency_symbol VARCHAR,
  asset_identifier VARCHAR,
  issue_date DATE,
  debtor_identifier VARCHAR,
  borrower_name VARCHAR,
  borrower_vat VARCHAR,
  geography_id VARCHAR,
  sector_id VARCHAR,
  probability_of_default DECIMAL(20, 6),
  regulatory_status INTEGER,
  fico_score INTEGER,
  pti DECIMAL(7, 6),
  dti DOUBLE,
  debtor_custom_fields MAP(VARCHAR, VARCHAR),
  employer_name VARCHAR,
  home_ownership INTEGER,
  bankruptcy_status INTEGER,
  bankruptcy_chapter INTEGER,
  bankruptcy_date DATE,
  current_debtor_log_id VARCHAR,
  seller_name VARCHAR,
  seller_vat VARCHAR,
  borrower_sector_name VARCHAR,
  borrower_sector_code VARCHAR,
  borrower_sector_standard INTEGER,
  borrower_macro_sector_name VARCHAR,
  borrower_macro_sector_code VARCHAR,
  borrower_macro_sector_standard INTEGER,
  borrower_country_name VARCHAR,
  borrower_region_name VARCHAR,
  borrower_city_name VARCHAR,
  nr_of_modifications BIGINT,
  asset_modification_date DATE,
  asset_modification_type VARCHAR,
  asset_modification_reason VARCHAR,
  asset_modification_end_date DATE,
  created_via_backfill BOOLEAN,
  contractual_principal_payment_amount_current DECIMAL(20, 6),
  downpayment_amount DECIMAL(20, 6),
  development_status INTEGER,
  current_noi DECIMAL(20, 6),
  stabilized_noi DECIMAL(20, 6),
  elevators INTEGER,
  energy_efficiency_grade VARCHAR,
  energy_grade_jurisdiction VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/asset_extended_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'asset_id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'synchronization_reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.asset_modification_events (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  asset_id VARCHAR,
  synchronization_id VARCHAR,
  reference_date DATE,
  type VARCHAR,
  by_law BOOLEAN,
  forbearance BOOLEAN,
  details VARCHAR,
  modification_end_date DATE,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/asset_modification_events',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.asset_realized_cash_flows (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reference_date DATE,
  identifier VARCHAR,
  type INTEGER,
  asset_id VARCHAR,
  effective_amount DECIMAL(20, 6),
  details VARCHAR,
  recovery_source VARCHAR,
  currency_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  converted_effective_amount DECIMAL(20, 6),
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/asset_realized_cash_flows',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.asset_table_results (
  asset_identifier VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  id VARCHAR,
  proposal_id VARCHAR,
  results VARCHAR,
  section_id VARCHAR,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  waived BOOLEAN,
  row_order INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/asset_table_results',
  max_commit_retry=10,
  partitioning=ARRAY['proposal_id', 'section_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.assets (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  originator_identifier VARCHAR,
  originator_id VARCHAR,
  seller_company_id VARCHAR,
  debtor_company_id VARCHAR,
  debtor_individual_id VARCHAR,
  currency_id VARCHAR,
  issue_date DATE,
  type INTEGER,
  asset_actual_return DECIMAL(20, 6),
  asset_repayment_status VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  custom_originator_name VARCHAR,
  is_syndicated BOOLEAN,
  syndicated_percentage DECIMAL(20, 6),
  asset_value DECIMAL(20, 6),
  other_balance DECIMAL(20, 6),
  is_fraud BOOLEAN,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.backing_history (
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  id VARCHAR,
  backing_id VARCHAR,
  synchronization_id VARCHAR,
  max_amount_covered DECIMAL(20, 6),
  charge_type VARCHAR,
  lien INTEGER,
  is_primary_collateral BOOLEAN,
  valid_until DATE,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/backing_history',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.backings (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  investment_id VARCHAR,
  collateral_id VARCHAR,
  max_amount_covered DECIMAL(20, 6),
  charge_type VARCHAR,
  lien INTEGER,
  is_primary_collateral BOOLEAN,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  valid_from DATE,
  valid_until DATE,
  is_real_backing BOOLEAN,
  mortgage_id VARCHAR,
  mortgage_description VARCHAR,
  mortgage_pool BOOLEAN,
  mortgage_pool_percentage DECIMAL(20, 6),
  mortgage_type INTEGER,
  mortgage_date DATE,
  mortgage_end_date DATE,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/backings',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.business_plans (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  identifier VARCHAR,
  name VARCHAR,
  investment_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/business_plans',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.cluster_configurations (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  cluster_category VARCHAR,
  recovery_rate DECIMAL(7, 6),
  recovery_lag INTEGER,
  default_rate ARRAY(DECIMAL(7, 6)),
  default_rate_method INTEGER,
  default_rate_frequency INTEGER,
  default_rate_cardoai_model BOOLEAN,
  prepayment_rate ARRAY(DECIMAL(7, 6)),
  prepayment_rate_method INTEGER,
  prepayment_rate_cardoai_model BOOLEAN,
  prepayment_rate_frequency INTEGER,
  simulation_job_id VARCHAR,
  delinquency_rate ARRAY(DECIMAL(7, 6)),
  delinquency_rate_frequency INTEGER,
  delinquency_lag INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/cluster_configurations',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.collateral_cash_flows (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reference_date DATE,
  identifier VARCHAR,
  type INTEGER,
  collateral_id VARCHAR,
  amount DECIMAL(20, 6),
  currency_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/collateral_cash_flows',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.collateral_daily_reports (
  investment_id VARCHAR,
  collateral_id VARCHAR,
  asset_id VARCHAR,
  investment_asset_id VARCHAR,
  collateral_asset_id VARCHAR,
  reporting_date DATE,
  originator_id VARCHAR,
  spv_id VARCHAR,
  synchronization_id VARCHAR,
  reporting_year INTEGER,
  reporting_month INTEGER,
  created_via_backfill BOOLEAN,
  synchronization_reporting_date DATE
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/collateral_daily_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'collateral_id', 'investment_id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.collateral_events (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  collateral_id VARCHAR,
  reference_date DATE,
  type VARCHAR,
  details VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/collateral_events',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.collateral_extended_periodic_reports (
  investment_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR,
  collateral_id VARCHAR,
  collateral_originator_identifier VARCHAR,
  current_valuation_amount DECIMAL(20, 6),
  is_primary_collateral BOOLEAN,
  investment_originator_identifier VARCHAR,
  spv_name VARCHAR,
  spv_demo_name VARCHAR,
  spv_identifier VARCHAR,
  originator_name VARCHAR,
  originator_identifier VARCHAR,
  original_valuation_date DATE,
  liquidation_date DATE,
  total_liquidation_amount DECIMAL(20, 6),
  original_valuation_amount DECIMAL(20, 6),
  investment_periodic_report_id VARCHAR,
  current_principal_balance DECIMAL(20, 6),
  converted_current_principal_balance DECIMAL(20, 6),
  purchased_principal_amount DECIMAL(20, 6),
  converted_purchased_principal_amount DECIMAL(20, 6),
  performance_status_contractual INTEGER,
  is_closed BOOLEAN,
  synchronization_reporting_date DATE,
  synchronization_id VARCHAR,
  is_proposed BOOLEAN,
  custom_fields MAP(VARCHAR, VARCHAR),
  created_via_backfill BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/collateral_extended_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'collateral_id', 'investment_id', 'investment_periodic_report_id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'synchronization_reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.collateral_periodic_reports (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  sale_price DECIMAL(20, 6),
  date_of_sale DATE,
  original_valuation_method INTEGER,
  original_valuation_date DATE,
  original_valuation_amount DECIMAL(20, 6),
  liquidation_date DATE,
  total_liquidation_amount DECIMAL(20, 6),
  total_liquidation_amount_capital DECIMAL(20, 6),
  total_liquidation_amount_interest DECIMAL(20, 6),
  collateral_id VARCHAR,
  number_auctions_failed INTEGER,
  last_auction_date DATE,
  last_auction_base_price DECIMAL(20, 6),
  last_auction_min_bid_price DECIMAL(20, 6),
  next_auction_date DATE,
  next_auction_base_price DECIMAL(20, 6),
  next_auction_min_bid_price DECIMAL(20, 6),
  asset_repossessed_date DATE,
  notes VARCHAR,
  reporting_date DATE,
  liquidation_resolution_date DATE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/collateral_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.collateral_valuations (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reference_date DATE,
  value DECIMAL(20, 6),
  type INTEGER,
  provider VARCHAR,
  is_after_repaired BOOLEAN,
  is_after_renovation BOOLEAN,
  collateral_id VARCHAR,
  valuation_method INTEGER,
  currency_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  spv_id VARCHAR,
  originator_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/collateral_valuations',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.collaterals (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  asset_id VARCHAR,
  originator_identifier VARCHAR,
  currency_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  last_periodic_report_id VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/collaterals',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.commercial_credit_asset_history (
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  issue_amount DECIMAL(20, 6),
  converted_issue_amount DECIMAL(20, 6),
  id VARCHAR,
  asset_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  valid_until DATE,
  originator_id VARCHAR,
  spv_id VARCHAR,
  asset_actual_return DECIMAL(20, 6),
  asset_repayment_status VARCHAR,
  asset_value DECIMAL(20, 6),
  other_balance DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/commercial_credit_asset_history',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.commercial_credit_assets (
  issue_amount DECIMAL(20, 6),
  converted_issue_amount DECIMAL(20, 6),
  id VARCHAR,
  asset_class INTEGER,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/commercial_credit_assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.companies (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  originator_id VARCHAR,
  vat VARCHAR,
  originator_identifier VARCHAR,
  group_identifier VARCHAR,
  name VARCHAR,
  category VARCHAR,
  basel_3_segment VARCHAR,
  zip_code VARCHAR,
  address VARCHAR,
  founding_date DATE,
  website VARCHAR,
  last_log_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  insurer_name VARCHAR,
  insurance_plafond VARCHAR,
  insurance_score VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  is_sole_proprietorship BOOLEAN,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/companies',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.company_logs (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  company_id VARCHAR,
  reference_date DATE,
  number_of_employees INTEGER,
  enterprise_size INTEGER,
  sales DECIMAL(20, 6),
  ebitda DECIMAL(20, 6),
  net_profit DECIMAL(20, 6),
  total_assets DECIMAL(20, 6),
  total_debt DECIMAL(20, 6),
  total_value DECIMAL(20, 6),
  enterprise_value DECIMAL(20, 6),
  free_cash_flow DECIMAL(20, 6),
  date_of_financials DATE,
  probability_of_default DECIMAL(20, 6),
  probability_of_default_source VARCHAR,
  risk_score VARCHAR,
  risk_score_source VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  regulatory_status INTEGER,
  originator_id VARCHAR,
  geography_id VARCHAR,
  sector_id VARCHAR,
  notes VARCHAR,
  annual_recurring_revenue DECIMAL(20, 6),
  liquidity DECIMAL(20, 6),
  interest_coverage DECIMAL(25, 15),
  debt_coverage DECIMAL(25, 15),
  total_debt_to_ebitda DECIMAL(25, 15),
  senior_debt_to_ebitda DECIMAL(25, 15),
  ltm_ebitda DECIMAL(20, 6),
  custom_fields MAP(VARCHAR, VARCHAR),
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/company_logs',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.construction_project_milestones (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  construction_project_id VARCHAR,
  milestone_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/construction_project_milestones',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.construction_project_periodic_reports (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  construction_project_id VARCHAR,
  reporting_date DATE,
  completion_date_actual DATE,
  hard_cost_current DECIMAL(20, 6),
  soft_cost_current DECIMAL(20, 6),
  land_cost_current DECIMAL(20, 6),
  owner_hard_cost_contingency DECIMAL(20, 6),
  gc_cost_contingency DECIMAL(20, 6),
  required_owner_contingency DECIMAL(20, 6),
  total_draw_amount DECIMAL(20, 6),
  hard_costs_requested DECIMAL(20, 6),
  hard_costs_recommended DECIMAL(20, 6),
  construction_contract_pct_funded DECIMAL(7, 6),
  retention_withheld DECIMAL(20, 6),
  current_period_change_order_value DECIMAL(20, 6),
  cumulative_change_order_value DECIMAL(20, 6),
  pending_change_order_value DECIMAL(20, 6),
  potential_change_order_value DECIMAL(20, 6),
  project_pct_complete DECIMAL(7, 6),
  days_behind_schedule INTEGER,
  milestones_met BOOLEAN,
  last_site_visit_date DATE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/construction_project_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.construction_projects (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  project_name VARCHAR,
  sponsor VARCHAR,
  contractor_name VARCHAR,
  project_start_date DATE,
  completion_date_original DATE,
  hard_cost_original DECIMAL(20, 6),
  soft_cost_original DECIMAL(20, 6),
  land_cost_original DECIMAL(20, 6),
  buyout_target_pct DECIMAL(7, 6),
  last_periodic_report_id VARCHAR,
  spv_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/construction_projects',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.currency (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  abbreviation VARCHAR,
  symbol VARCHAR,
  flag_url VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/currency',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.demo_table_results (
  asset_identifier VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  id VARCHAR,
  proposal_id VARCHAR,
  results VARCHAR,
  section_id VARCHAR,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  waived BOOLEAN,
  row_order INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/demo_table_results',
  max_commit_retry=10,
  partitioning=ARRAY['proposal_id', 'section_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.dhc_results (
  external_job_id VARCHAR,
  blocking_errors INTEGER,
  warning_errors INTEGER,
  successful_checks INTEGER,
  sync_job_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/dhc_results',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['external_job_id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.enforcement_procedure_periodic_reports (
  id VARCHAR,
  reporting_date DATE,
  enforcement_procedure_id VARCHAR,
  legal_actions_completed VARCHAR,
  date_of_last_contact DATE,
  procedure_stage INTEGER,
  procedure_stage_starting_date DATE,
  legal_fees_accrued INTEGER,
  notes VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/enforcement_procedure_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.enforcement_procedures (
  id VARCHAR,
  identifier VARCHAR,
  procedure_id VARCHAR,
  strategy_type INTEGER,
  art_41 BOOLEAN,
  legal_procedure_type INTEGER,
  commencement_date_legal_procedure DATE,
  rge_identifier VARCHAR,
  court VARCHAR,
  seniority_legal_procedure INTEGER,
  governing_law VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  last_periodic_report_id VARCHAR,
  expected_legal_end_date DATE,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/enforcement_procedures',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.equipment_asset_history (
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  valid_until DATE,
  id VARCHAR,
  asset_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR,
  asset_actual_return DECIMAL(20, 6),
  asset_repayment_status VARCHAR,
  asset_value DECIMAL(20, 6),
  other_balance DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/equipment_asset_history',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.equipment_assets (
  id VARCHAR,
  asset_class INTEGER,
  oem VARCHAR,
  oem_identifier VARCHAR,
  condition INTEGER,
  description VARCHAR,
  category INTEGER,
  sub_category VARCHAR,
  manufacture_year VARCHAR,
  initial_purchase_price DECIMAL(20, 6),
  purchase_currency_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/equipment_assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.external_validations (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  custom_fields MAP(VARCHAR, VARCHAR),
  spv_id VARCHAR,
  reference_date DATE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  identifier VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/external_validations',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.financial_credit_asset_history (
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  interest_rate_type INTEGER,
  financing_purpose INTEGER,
  issue_amount DECIMAL(20, 6),
  interest_rate_floor DECIMAL(7, 6),
  interest_rate_cap DECIMAL(7, 6),
  scheduled_principal_payment_frequency INTEGER,
  scheduled_interest_payment_frequency INTEGER,
  credit_limit DECIMAL(20, 6),
  commitment_fees DECIMAL(7, 6),
  are_payments_in_kind BOOLEAN,
  seniority VARCHAR,
  isin VARCHAR,
  upfront_fees DECIMAL(20, 6),
  oid DOUBLE,
  asset_expected_return DECIMAL(20, 6),
  converted_issue_amount DECIMAL(20, 6),
  id VARCHAR,
  asset_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  valid_until DATE,
  originator_id VARCHAR,
  spv_id VARCHAR,
  pik_type INTEGER,
  pik_in_cash DECIMAL(20, 6),
  pik_cumulated DECIMAL(20, 6),
  committed_amount DECIMAL(20, 6),
  ballon_amount DECIMAL(20, 6),
  cumulated_recovery DECIMAL(20, 6),
  deferred_security BOOLEAN,
  trade_status INTEGER,
  trade_date DATE,
  exp_settlement_date DATE,
  global_amount DECIMAL(20, 6),
  seniority_type INTEGER,
  origination_fee_percentage DECIMAL(7, 6),
  first_expected_payment_date DATE,
  days_count_convention INTEGER,
  interest_only_period INTEGER,
  growth_rate DECIMAL(20, 6),
  growth_interval_months INTEGER,
  deferred_period INTEGER,
  capitalized_interest_percentage DECIMAL(20, 6),
  negative_amortization_cap DECIMAL(20, 6),
  principal_repayment_percentage_assumption INTEGER,
  number_of_installments INTEGER,
  down_payment DECIMAL(20, 6),
  first_payment_date DATE,
  minimum_periodic_payment_percentage DECIMAL(20, 6),
  minimum_periodic_payment_amount DECIMAL(20, 6),
  contractual_payment_amount_original DECIMAL(20, 6),
  contractual_payment_amount_current DECIMAL(20, 6),
  is_autopay BOOLEAN,
  is_scra BOOLEAN,
  asset_actual_return DECIMAL(20, 6),
  asset_repayment_status VARCHAR,
  asset_value DECIMAL(20, 6),
  other_balance DECIMAL(20, 6),
  contractual_principal_payment_amount_current DECIMAL(20, 6),
  downpayment_amount DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/financial_credit_asset_history',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.financial_credit_assets (
  interest_rate_type INTEGER,
  financing_purpose INTEGER,
  issue_amount DECIMAL(20, 6),
  interest_rate_floor DECIMAL(7, 6),
  interest_rate_cap DECIMAL(7, 6),
  scheduled_principal_payment_frequency INTEGER,
  scheduled_interest_payment_frequency INTEGER,
  credit_limit DECIMAL(20, 6),
  commitment_fees DECIMAL(7, 6),
  are_payments_in_kind BOOLEAN,
  seniority VARCHAR,
  isin VARCHAR,
  upfront_fees DECIMAL(20, 6),
  oid DOUBLE,
  asset_expected_return DECIMAL(20, 6),
  converted_issue_amount DECIMAL(20, 6),
  id VARCHAR,
  asset_class INTEGER,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  pik_type INTEGER,
  pik_in_cash DECIMAL(20, 6),
  pik_cumulated DECIMAL(20, 6),
  committed_amount DECIMAL(20, 6),
  ballon_amount DECIMAL(20, 6),
  cumulated_recovery DECIMAL(20, 6),
  deferred_security BOOLEAN,
  trade_status INTEGER,
  trade_date DATE,
  exp_settlement_date DATE,
  global_amount DECIMAL(20, 6),
  seniority_type INTEGER,
  origination_fee_percentage DECIMAL(7, 6),
  first_expected_payment_date DATE,
  is_dpa BOOLEAN,
  days_count_convention INTEGER,
  interest_only_period INTEGER,
  growth_rate DECIMAL(20, 6),
  growth_interval_months INTEGER,
  deferred_period INTEGER,
  capitalized_interest_percentage DECIMAL(20, 6),
  negative_amortization_cap DECIMAL(20, 6),
  principal_repayment_percentage_assumption INTEGER,
  number_of_installments INTEGER,
  down_payment DECIMAL(20, 6),
  first_payment_date DATE,
  minimum_periodic_payment_percentage DECIMAL(20, 6),
  minimum_periodic_payment_amount DECIMAL(20, 6),
  amortization_type INTEGER,
  contractual_payment_amount_original DECIMAL(20, 6),
  contractual_payment_amount_current DECIMAL(20, 6),
  is_autopay BOOLEAN,
  is_scra BOOLEAN,
  spv_id VARCHAR,
  contractual_principal_payment_amount_current DECIMAL(20, 6),
  downpayment_amount DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/financial_credit_assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.fund_assets (
  id VARCHAR,
  asset_class INTEGER,
  fund_asset_specific VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/fund_assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.geography (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  continent VARCHAR,
  level INTEGER,
  iso_code VARCHAR,
  original_name VARCHAR,
  en_name VARCHAR,
  nuts_code VARCHAR,
  parent_id VARCHAR,
  top_parent_id VARCHAR,
  alpha_2 VARCHAR,
  alpha_3 VARCHAR,
  italian_province_code VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/geography',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.geography_info (
  id VARCHAR,
  borrower_country_name VARCHAR,
  borrower_macro_region_name VARCHAR,
  borrower_region_name VARCHAR,
  borrower_city_name VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/geography_info',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.guarantee_asset_history (
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  id VARCHAR,
  asset_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  valid_until DATE,
  guarantee_coverage_percent DOUBLE,
  date_activation_guarantee DATE,
  date_approval_guarantee DATE,
  guarantee_requested_amount DECIMAL(20, 6),
  disputed BOOLEAN,
  last_disputed_date DATE,
  rejection_date DATE,
  guarantor_country VARCHAR,
  further_obligations BOOLEAN,
  obligations_fulfillment_date DATE,
  guarantee_end_date DATE,
  originator_id VARCHAR,
  spv_id VARCHAR,
  asset_actual_return DECIMAL(20, 6),
  asset_repayment_status VARCHAR,
  asset_value DECIMAL(20, 6),
  other_balance DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/guarantee_asset_history',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.guarantee_assets (
  id VARCHAR,
  asset_class INTEGER,
  guarantee_coverage_percent DOUBLE,
  date_activation_guarantee DATE,
  date_approval_guarantee DATE,
  guarantee_requested_amount DECIMAL(20, 6),
  disputed BOOLEAN,
  last_disputed_date DATE,
  rejection_date DATE,
  guarantor_country VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  further_obligations BOOLEAN,
  obligations_fulfillment_date DATE,
  guarantee_end_date DATE,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/guarantee_assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.individual_logs (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  individual_id VARCHAR,
  reference_date DATE,
  employment_status INTEGER,
  employment_title VARCHAR,
  employment_duration INTEGER,
  primary_income_type INTEGER,
  primary_income_amount DECIMAL(20, 6),
  primary_income_verification INTEGER,
  originator_score VARCHAR,
  dti DOUBLE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  geography_id VARCHAR,
  notes VARCHAR,
  fico_score INTEGER,
  pti DECIMAL(7, 6),
  employer_name VARCHAR,
  home_ownership INTEGER,
  bankruptcy_status INTEGER,
  bankruptcy_chapter INTEGER,
  bankruptcy_date DATE,
  bankruptcy_flag BOOLEAN,
  income_insight VARCHAR,
  total_debt DECIMAL(20, 6),
  custom_fields MAP(VARCHAR, VARCHAR),
  spv_id VARCHAR,
  vantage_score VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/individual_logs',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.individuals (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  originator_identifier VARCHAR,
  originator_id VARCHAR,
  name VARCHAR,
  gender INTEGER,
  birth_year INTEGER,
  total_debt DECIMAL(20, 6),
  fiscal_code VARCHAR,
  is_deceased BOOLEAN,
  deceased_date DATE,
  last_log_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  original_dti DECIMAL(20, 6),
  original_fico_score DECIMAL(20, 6),
  original_pti DECIMAL(20, 6),
  total_debt_original DECIMAL(20, 6),
  spv_id VARCHAR,
  zip_code VARCHAR,
  vantage_score_original VARCHAR,
  originator_score_original VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/individuals',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_daily_reports (
  investment_id VARCHAR,
  reporting_date DATE,
  investment_periodic_report_id VARCHAR,
  asset_id VARCHAR,
  synchronization_id VARCHAR,
  spv_id VARCHAR,
  originator_id VARCHAR,
  residual_weighted_average_maturity DECIMAL(38, 6),
  asset_age DOUBLE,
  quarterly_prepayment_collections DECIMAL(30, 6),
  remaining_term DOUBLE,
  reporting_year INTEGER,
  reporting_month INTEGER,
  created_via_backfill BOOLEAN,
  synchronization_reporting_date DATE
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_daily_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'asset_id', 'investment_id', 'investment_periodic_report_id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_esma (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  standard VARCHAR,
  investment_id VARCHAR,
  amortisation_type INTEGER,
  customer_type INTEGER,
  origination_channel INTEGER,
  securitised_receivables INTEGER,
  put_date DATE,
  put_strike DECIMAL(20, 6),
  credit_empaired_obligor BOOLEAN,
  leveraged_transaction BOOLEAN,
  managed_by_clo BOOLEAN,
  special_scheme BOOLEAN,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  seniority INTEGER,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_esma',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_expected_cash_flows (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reference_date DATE,
  identifier VARCHAR,
  type INTEGER,
  investment_id VARCHAR,
  asset_modification_event_id VARCHAR,
  amount DECIMAL(20, 6),
  valid_from DATE,
  valid_until DATE,
  currency_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  converted_amount DECIMAL(20, 6),
  subscription_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR,
  business_plan_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_expected_cash_flows',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_extended_periodic_reports (
  investment_id VARCHAR,
  pool_addition_date DATE,
  investment_identifier VARCHAR,
  initial_expected_return DECIMAL(7, 6),
  number_of_payments_before_securitization INTEGER,
  original_maturity_date DATE,
  investment_type INTEGER,
  is_proposed BOOLEAN,
  investment_periodic_report_id VARCHAR,
  purchased_principal_amount DECIMAL(20, 6),
  current_principal_balance DECIMAL(20, 6),
  total_funding DECIMAL(25, 15),
  days_in_delay INTEGER,
  repurchase_date DATE,
  is_closed BOOLEAN,
  performance_status_contractual INTEGER,
  performance_status INTEGER,
  repayment_status INTEGER,
  dissesto BOOLEAN,
  investment_forecasted_return DECIMAL(20, 6),
  closing_date DATE,
  loss_given_default DECIMAL(20, 6),
  contractual_default_date DATE,
  contractual_defaulted_principal_amount DECIMAL(20, 6),
  converted_contractual_defaulted_principal_amount DECIMAL(20, 6),
  contractual_defaulted_interest_amount DECIMAL(20, 6),
  contractual_accrued_interest_amount_on_default DECIMAL(20, 6),
  default_date DATE,
  defaulted_principal_amount DECIMAL(20, 6),
  converted_defaulted_principal_amount DECIMAL(20, 6),
  defaulted_interest_amount DECIMAL(20, 6),
  write_off_date DATE,
  write_off_amount DECIMAL(20, 6),
  gross_recovered_amount DECIMAL(20, 6),
  net_recovered_amount DECIMAL(20, 6),
  accrued_interest_amount DECIMAL(20, 6),
  accrued_interests_at_pool_addition_date DECIMAL(20, 6),
  purchase_price DECIMAL(25, 15),
  realized_term INTEGER,
  last_payment_date DATE,
  maturity_date DATE,
  first_delay_date DATE,
  last_delay_date DATE,
  principal_in_delay DECIMAL(20, 6),
  interest_in_delay DECIMAL(20, 6),
  prepaid_principal_amount DECIMAL(20, 6),
  investment_actual_return DECIMAL(8, 6),
  current_interest_rate_index INTEGER,
  current_interest_rate_index_tenor INTEGER,
  index_valuation_date DATE,
  current_index DECIMAL(7, 6),
  current_interest_rate_margin DECIMAL(7, 6),
  current_interest_rate DECIMAL(7, 6),
  market_value DECIMAL(20, 6),
  prepaid_date DATE,
  is_prepaid BOOLEAN,
  converted_current_principal_balance DECIMAL(20, 6),
  initial_weighted_average_maturity DECIMAL(20, 6),
  converted_purchased_principal_amount DECIMAL(20, 6),
  converted_accrued_interest_amount DECIMAL(20, 6),
  converted_total_funding DECIMAL(25, 15),
  is_secured BOOLEAN,
  current_valuation_amount DECIMAL(20, 6),
  days_in_stock INTEGER,
  depreciation DECIMAL(20, 6),
  is_sold BOOLEAN,
  last_market_valuation DECIMAL(20, 6),
  number_of_subscriptions INTEGER,
  roi DECIMAL(20, 6),
  total_asset_inflow_lifetime DECIMAL(20, 6),
  apr DECIMAL(7, 6),
  write_off_principal_amount DECIMAL(20, 6),
  remaining_term INTEGER,
  next_payment_date DATE,
  accrual_start_date DATE,
  forgiven_amount DECIMAL(20, 6),
  disputed_amount DECIMAL(20, 6),
  synchronization_id VARCHAR,
  synchronization_reporting_date DATE,
  spv_id VARCHAR,
  spv_demo_name VARCHAR,
  spv_name VARCHAR,
  spv_identifier VARCHAR,
  originator_id VARCHAR,
  originator_name VARCHAR,
  originator_identifier VARCHAR,
  initial_rating_1 VARCHAR,
  initial_rating_2 VARCHAR,
  initial_rating_3 VARCHAR,
  current_rating_1 VARCHAR,
  current_rating_2 VARCHAR,
  current_rating_3 VARCHAR,
  realized_net_collections DECIMAL(30, 6),
  realized_recovery_collections DECIMAL(30, 6),
  cumulated_realized_principal DECIMAL(30, 6),
  cumulated_gross_realized_principal DECIMAL(30, 6),
  cumulated_realized_interest DECIMAL(30, 6),
  cumulated_gross_realized_interest DECIMAL(30, 6),
  managed_by_clo BOOLEAN,
  amortisation_type INTEGER,
  recourse BOOLEAN,
  higher_ranking_loan DECIMAL(20, 6),
  liens VARCHAR,
  max_amount_covered DECIMAL(20, 6),
  initial_re_collateral_count INTEGER,
  initial_re_collateral_value DECIMAL(20, 6),
  current_re_collateral_count INTEGER,
  current_re_collateral_value DECIMAL(20, 6),
  ranking_in_spv INTEGER,
  valuation_ranking_in_spv INTEGER,
  custom_fields MAP(VARCHAR, VARCHAR),
  initial_investment_valuation_id VARCHAR,
  current_investment_valuation_id VARCHAR,
  post_renovation_valuation_id VARCHAR,
  after_repaired_valuation_id VARCHAR,
  days_since_acquisition INTEGER,
  created_via_backfill BOOLEAN,
  hardship_amount DECIMAL(20, 6),
  hardship_first_payment_date DATE,
  hardship_flag BOOLEAN,
  hardship_last_payment_date DATE,
  periodical_prepaid_amount DOUBLE
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_extended_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'investment_id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'synchronization_reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_periodic_report_esma (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  investment_periodic_report_id VARCHAR,
  account_status INTEGER,
  prior_principal_balances DECIMAL(20, 6),
  reason_for_default_or_foreclosure INTEGER,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_periodic_report_esma',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_periodic_report_reported_ratings (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  investment_periodic_report_id VARCHAR,
  rating VARCHAR,
  source VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  rank INTEGER,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_periodic_report_reported_ratings',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_periodic_reports (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reporting_date DATE,
  investment_id VARCHAR,
  purchased_principal_amount DECIMAL(20, 6),
  current_principal_balance DECIMAL(20, 6),
  total_funding DECIMAL(25, 15),
  days_in_delay INTEGER,
  repurchase_date DATE,
  is_closed BOOLEAN,
  performance_status_contractual INTEGER,
  performance_status INTEGER,
  repayment_status INTEGER,
  dissesto BOOLEAN,
  investment_forecasted_return DECIMAL(20, 6),
  closing_date DATE,
  loss_given_default DECIMAL(20, 6),
  contractual_default_date DATE,
  contractual_defaulted_principal_amount DECIMAL(20, 6),
  converted_contractual_defaulted_principal_amount DECIMAL(20, 6),
  contractual_defaulted_interest_amount DECIMAL(20, 6),
  contractual_accrued_interest_amount_on_default DECIMAL(20, 6),
  default_date DATE,
  defaulted_principal_amount DECIMAL(20, 6),
  converted_defaulted_principal_amount DECIMAL(20, 6),
  defaulted_interest_amount DECIMAL(20, 6),
  write_off_date DATE,
  write_off_amount DECIMAL(20, 6),
  gross_recovered_amount DECIMAL(20, 6),
  net_recovered_amount DECIMAL(20, 6),
  accrued_interest_amount DECIMAL(20, 6),
  accrued_interests_at_pool_addition_date DECIMAL(20, 6),
  purchase_price DECIMAL(25, 15),
  remaining_term INTEGER,
  asset_age INTEGER,
  realized_term INTEGER,
  last_payment_date DATE,
  maturity_date DATE,
  residual_weighted_average_maturity DECIMAL(20, 6),
  first_delay_date DATE,
  last_delay_date DATE,
  principal_in_delay DECIMAL(20, 6),
  interest_in_delay DECIMAL(20, 6),
  prepaid_principal_amount DECIMAL(20, 6),
  investment_actual_return DECIMAL(8, 6),
  current_interest_rate_index INTEGER,
  current_interest_rate_index_tenor INTEGER,
  index_valuation_date DATE,
  current_index DECIMAL(7, 6),
  current_interest_rate_margin DECIMAL(7, 6),
  current_interest_rate DECIMAL(7, 6),
  market_value DECIMAL(20, 6),
  prepaid_date DATE,
  is_prepaid BOOLEAN,
  converted_current_principal_balance DECIMAL(20, 6),
  initial_weighted_average_maturity DECIMAL(20, 6),
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  converted_purchased_principal_amount DECIMAL(20, 6),
  converted_accrued_interest_amount DECIMAL(20, 6),
  converted_total_funding DECIMAL(25, 15),
  is_secured BOOLEAN,
  current_valuation_amount DECIMAL(20, 6),
  days_in_stock INTEGER,
  depreciation DECIMAL(20, 6),
  is_sold BOOLEAN,
  last_market_valuation DECIMAL(20, 6),
  number_of_subscriptions INTEGER,
  roi DECIMAL(20, 6),
  total_asset_inflow_lifetime DECIMAL(20, 6),
  originator_id VARCHAR,
  spv_id VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  apr DECIMAL(7, 6),
  prepayment_lock_out_end_date DATE,
  interest_revision_date DATE,
  interest_rate_after_revision DECIMAL(7, 6),
  ltv DECIMAL(7, 6),
  sale_currency_id VARCHAR,
  sale_price DECIMAL(20, 6),
  sale_date DATE,
  vat_at_sale DECIMAL(20, 6),
  fees_on_sale DECIMAL(20, 6),
  vat_at_purchase DECIMAL(20, 6),
  fees_on_purchase DECIMAL(20, 6),
  closing_cost_on_purchase DECIMAL(20, 6),
  credit_repair_fee DECIMAL(20, 6),
  seller_credit DECIMAL(20, 6),
  sale_costs DECIMAL(20, 6),
  rank DECIMAL(7, 6),
  created_via_backfill BOOLEAN,
  write_off_principal_amount DECIMAL(20, 6),
  write_off_interest_amount DECIMAL(20, 6),
  hardship_amount DECIMAL(20, 6),
  hardship_first_payment_date DATE,
  hardship_flag BOOLEAN,
  hardship_last_payment_date DATE,
  write_off_reason VARCHAR,
  current_principal_interest_bearing_amount DECIMAL(20, 6),
  current_purchase_principal_amount DECIMAL(20, 6),
  current_cash_advance_principal_amount DECIMAL(20, 6),
  current_balance_transfer_principal_amount DECIMAL(20, 6),
  accrued_purchase_interest_amount DECIMAL(20, 6),
  accrued_cash_advance_interest_amount DECIMAL(20, 6),
  accrued_balance_transfer_amount DECIMAL(20, 6),
  accrued_annual_fees DECIMAL(20, 6),
  accrued_late_fees DECIMAL(20, 6),
  accrued_other_fees DECIMAL(20, 6),
  contractual_defaulted_fees_amount DECIMAL(20, 6),
  fees_in_delay DECIMAL(20, 6),
  current_cash_advance_interest_rate DECIMAL(20, 6),
  current_balance_transfer_interest_rate DECIMAL(20, 6),
  next_payment_date DATE,
  accrual_start_date DATE,
  forgiven_amount DECIMAL(20, 6),
  disputed_amount DECIMAL(20, 6),
  hardship_details VARCHAR,
  periodical_prepaid_amount DOUBLE
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['created_via_backfill', 'originator_id', 'spv_id', 'reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_realized_cash_flows (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reference_date DATE,
  identifier VARCHAR,
  type INTEGER,
  synchronization_id VARCHAR,
  investment_id VARCHAR,
  effective_amount DECIMAL(20, 6),
  details VARCHAR,
  recovery_source VARCHAR,
  currency_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  converted_effective_amount DECIMAL(20, 6),
  subscription_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_realized_cash_flows',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investment_valuations (
  investment_id VARCHAR,
  spv_id VARCHAR,
  originator_id VARCHAR,
  id VARCHAR,
  reference_date DATE,
  value DECIMAL(20, 6),
  type INTEGER,
  provider VARCHAR,
  is_after_repaired BOOLEAN,
  is_after_renovation BOOLEAN,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  currency_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investment_valuations',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investments (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  asset_id VARCHAR,
  spv_id VARCHAR,
  last_periodic_report_id VARCHAR,
  pool_addition_date DATE,
  originator_identifier VARCHAR,
  initial_expected_return DECIMAL(7, 6),
  number_of_payments_before_securitization INTEGER,
  original_maturity_date DATE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  investment_type INTEGER,
  is_proposed BOOLEAN,
  asset_manager VARCHAR,
  reference_asset VARCHAR,
  originator_id VARCHAR,
  original_ltv DECIMAL(20, 6),
  first_realized_payment_date DATE,
  custom_fields MAP(VARCHAR, VARCHAR),
  original_term_months INTEGER,
  construction_project_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investments',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.investments_enforcement_procedures (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  investment_id VARCHAR,
  enforcement_procedure_id VARCHAR,
  synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/investments_enforcement_procedures',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.migration_history (
  name VARCHAR,
  applied_at TIMESTAMP(6) WITH TIME ZONE
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/migration_history',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.milestones (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  milestone_name VARCHAR,
  expected_date_original DATE,
  expected_date_current DATE,
  completion_date DATE,
  description VARCHAR,
  number_revisions INTEGER,
  spv_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/milestones',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.originators (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  legal_entity_identifier VARCHAR,
  identifier VARCHAR,
  synced_through_mercury BOOLEAN,
  originator_icon VARCHAR,
  establishment_country_id VARCHAR,
  full_name VARCHAR,
  contact_emails ARRAY(VARCHAR),
  synced_through_oxygen BOOLEAN,
  oxygen_identifier VARCHAR,
  supports_new_asset_integration BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/originators',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.other_creditors_prior_liens (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  collateral_id VARCHAR,
  lien INTEGER,
  higher_ranking_underlying_exposure DECIMAL(20, 6),
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/other_creditors_prior_liens',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.proposals (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  status INTEGER,
  proposed_date TIMESTAMP(6) WITH TIME ZONE,
  approval_date TIMESTAMP(6) WITH TIME ZONE,
  funding_date TIMESTAMP(6) WITH TIME ZONE,
  funding_amount DECIMAL(20, 6),
  sync_job_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR,
  waterfall_execution_id VARCHAR,
  applied_row_level INTEGER,
  statistics MAP(VARCHAR, VARCHAR)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/proposals',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.real_estate_asset_history (
  id VARCHAR,
  asset_id VARCHAR,
  property_type INTEGER,
  property_address VARCHAR,
  property_postal_code VARCHAR,
  source_type INTEGER,
  year_built INTEGER,
  cadastrial_type VARCHAR,
  cadastrial_sheet VARCHAR,
  cadastrial_map VARCHAR,
  cadastrial_data VARCHAR,
  value_of_energy_performance_certificate ARRAY(INTEGER),
  provider_of_energy_performance_certificate VARCHAR,
  year_initial_renovated INTEGER,
  year_last_renovated INTEGER,
  rooms INTEGER,
  beds INTEGER,
  baths INTEGER,
  interior_level INTEGER,
  nr_units INTEGER,
  area_unit INTEGER,
  total_surface DECIMAL(20, 6),
  commercial_area DECIMAL(20, 6),
  residential_area DECIMAL(20, 6),
  external_area DECIMAL(20, 6),
  occupied_area DECIMAL(20, 6),
  is_net_internal_floor_area_validated BOOLEAN,
  geography_id VARCHAR,
  property_description VARCHAR,
  re_asset_status INTEGER,
  occupancy_type INTEGER,
  property_condition INTEGER,
  start_date_of_lease DATE,
  end_date_of_lease DATE,
  lease_break_option BOOLEAN,
  lease_type INTEGER,
  current_annual_passing_rent DECIMAL(20, 6),
  last_rent_review_date DATE,
  next_rent_review_date DATE,
  estimated_capex_costs DECIMAL(20, 6),
  renovation_starting_date DATE,
  renovation_completing_date DATE,
  actual_capex_costs DECIMAL(20, 6),
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  synchronization_id VARCHAR,
  is_broker_appointed BOOLEAN,
  broker_name VARCHAR,
  broker_date DATE,
  updated_by_synchronization_id VARCHAR,
  valid_until DATE,
  originator_id VARCHAR,
  spv_id VARCHAR,
  housing_type INTEGER,
  is_leased BOOLEAN,
  latitude DECIMAL(20, 15),
  longitude DECIMAL(20, 15),
  asset_actual_return DECIMAL(20, 6),
  asset_repayment_status VARCHAR,
  asset_value DECIMAL(20, 6),
  other_balance DECIMAL(20, 6),
  development_status INTEGER,
  current_noi DECIMAL(20, 6),
  stabilized_noi DECIMAL(20, 6),
  elevators INTEGER,
  energy_efficiency_grade VARCHAR,
  energy_grade_jurisdiction VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/real_estate_asset_history',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.real_estate_assets (
  asset_class INTEGER,
  id VARCHAR,
  asset_type INTEGER,
  property_type INTEGER,
  property_address VARCHAR,
  property_postal_code VARCHAR,
  source_type INTEGER,
  year_built INTEGER,
  cadastrial_type VARCHAR,
  cadastrial_sheet VARCHAR,
  cadastrial_map VARCHAR,
  cadastrial_data VARCHAR,
  value_of_energy_performance_certificate ARRAY(INTEGER),
  provider_of_energy_performance_certificate VARCHAR,
  year_initial_renovated INTEGER,
  year_last_renovated INTEGER,
  rooms INTEGER,
  beds INTEGER,
  baths INTEGER,
  interior_level INTEGER,
  nr_units INTEGER,
  area_unit INTEGER,
  total_surface DECIMAL(20, 6),
  commercial_area DECIMAL(20, 6),
  residential_area DECIMAL(20, 6),
  external_area DECIMAL(20, 6),
  occupied_area DECIMAL(20, 6),
  is_net_internal_floor_area_validated BOOLEAN,
  geography_id VARCHAR,
  property_description VARCHAR,
  re_asset_status INTEGER,
  occupancy_type INTEGER,
  property_condition INTEGER,
  start_date_of_lease DATE,
  end_date_of_lease DATE,
  lease_break_option BOOLEAN,
  lease_type INTEGER,
  current_annual_passing_rent DECIMAL(20, 6),
  last_rent_review_date DATE,
  next_rent_review_date DATE,
  estimated_capex_costs DECIMAL(20, 6),
  renovation_starting_date DATE,
  renovation_completing_date DATE,
  actual_capex_costs DECIMAL(20, 6),
  is_broker_appointed BOOLEAN,
  broker_name VARCHAR,
  broker_date DATE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  housing_type INTEGER,
  is_leased BOOLEAN,
  latitude DECIMAL(20, 15),
  longitude DECIMAL(20, 15),
  spv_id VARCHAR,
  development_status INTEGER,
  current_noi DECIMAL(20, 6),
  stabilized_noi DECIMAL(20, 6),
  elevators INTEGER,
  energy_efficiency_grade VARCHAR,
  energy_grade_jurisdiction VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/real_estate_assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.real_estate_extended_assets (
  real_estate_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR,
  debtor_id VARCHAR,
  real_estate_identifier VARCHAR,
  lien VARCHAR,
  rge_identifiers VARCHAR,
  asset_manager VARCHAR,
  deadline_mortgage DATE,
  city_name VARCHAR,
  region_name VARCHAR,
  country_name VARCHAR,
  synchronization_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/real_estate_extended_assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'real_estate_id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.real_estate_extended_periodic_reports (
  real_estate_id VARCHAR,
  collateral_periodic_report_id VARCHAR,
  synchronization_reporting_date DATE,
  spv_id VARCHAR,
  spv_identifier VARCHAR,
  originator_id VARCHAR,
  acts_as_collateral BOOLEAN,
  acts_as_investment BOOLEAN,
  nr_initial_assets_covered_by_re_collateral INTEGER,
  initial_re_collateral_value DECIMAL(20, 6),
  re_purchased_principal_amount DECIMAL(20, 6),
  re_current_principal_balance DECIMAL(20, 6),
  initial_re_valuation_date DATE,
  nr_current_assets_covered_by_re_collateral INTEGER,
  current_re_collateral_value DECIMAL(20, 6),
  current_re_valuation_date DATE,
  initial_re_valuation_type INTEGER,
  current_re_valuation_type INTEGER,
  open_market_value DECIMAL(20, 6),
  judicial_market_value DECIMAL(20, 6),
  market_value_provider VARCHAR,
  ctu_amount DECIMAL(20, 6),
  ctu_date DATE,
  property_description VARCHAR,
  re_asset_status INTEGER,
  property_condition INTEGER,
  occupancy_type INTEGER,
  start_date_of_lease DATE,
  end_date_of_lease DATE,
  lease_break_option BOOLEAN,
  current_annual_passing_rent DECIMAL(20, 6),
  current_capex DECIMAL(20, 6),
  current_opex DECIMAL(20, 6),
  acquisition_fees DECIMAL(20, 6),
  acquisition_closing_costs DECIMAL(20, 6),
  expected_renovation_costs DECIMAL(20, 6),
  realized_renovation_costs DECIMAL(20, 6),
  enforcement_primary_investment_id VARCHAR,
  procedure_stage INTEGER,
  synchronization_id VARCHAR,
  is_leased BOOLEAN,
  estimated_sale_date DATE,
  created_via_backfill BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/real_estate_extended_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'real_estate_id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'synchronization_reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.results (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  spv_id VARCHAR,
  section_id VARCHAR,
  proposal_id VARCHAR,
  query_id VARCHAR,
  configuration_id VARCHAR,
  asset_identifier VARCHAR,
  value VARCHAR,
  waived BOOLEAN,
  eligible BOOLEAN,
  version INTEGER,
  _ordering_id INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/results',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id', 'section_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.retrieve_results (
  external_job_id VARCHAR,
  results VARCHAR,
  sync_job_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/retrieve_results',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['external_job_id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.sector (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  standard INTEGER,
  level INTEGER,
  standard_label VARCHAR,
  english_label VARCHAR,
  code VARCHAR,
  parent_id VARCHAR,
  top_parent_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/sector',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.sector_info (
  id VARCHAR,
  borrower_sector_name VARCHAR,
  borrower_sector_code VARCHAR,
  borrower_sector_standard INTEGER,
  borrower_macro_sector_name VARCHAR,
  borrower_macro_sector_code VARCHAR,
  borrower_macro_sector_standard INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/sector_info',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.sector_relation (
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  id VARCHAR,
  from_sector_id VARCHAR,
  to_sector_id VARCHAR,
  to_standard INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/sector_relation',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.simulation_output (
  reference_date DATE,
  principal DECIMAL(20, 6),
  interest DECIMAL(20, 6),
  prepayment DECIMAL(20, 6),
  recovery DECIMAL(20, 6),
  default DECIMAL(20, 6),
  write_off DECIMAL(20, 6),
  delinquent_principal DECIMAL(20, 6),
  delinquent_interest DECIMAL(20, 6),
  total_principal DECIMAL(20, 6),
  call_option_redemption DECIMAL(20, 6),
  simulation_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/simulation_output',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id', 'simulation_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_cash_account_periodic_reports (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reporting_date DATE,
  cash_account_id VARCHAR,
  current_amount DECIMAL(20, 6),
  converted_current_amount DECIMAL(20, 6),
  required_amount DECIMAL(20, 6),
  converted_required_amount DECIMAL(20, 6),
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  balance_reference_date DATE,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_cash_account_periodic_reports',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_cash_accounts (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  spv_id VARCHAR,
  identifier VARCHAR,
  type INTEGER,
  cover_type INTEGER,
  rank INTEGER,
  currency_id VARCHAR,
  description VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  last_periodic_report_id VARCHAR,
  amortising_account BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_cash_accounts',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_cash_flows (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reference_date DATE,
  identifier VARCHAR,
  spv_id VARCHAR,
  type INTEGER,
  effective_amount DECIMAL(20, 6),
  converted_effective_amount DECIMAL(20, 6),
  details VARCHAR,
  liability_id VARCHAR,
  cash_account_id VARCHAR,
  currency_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  esma_cashflow_id VARCHAR,
  waterfall_execution_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_cash_flows',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_counterparties (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  legal_entity_identifier VARCHAR,
  spv_id VARCHAR,
  establishment_country_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  last_log_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_counterparties',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_counterparty_logs (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  custom_fields MAP(VARCHAR, VARCHAR),
  counterparty_id VARCHAR,
  reference_date DATE,
  name VARCHAR,
  legal_entity_identifier VARCHAR,
  establishment_country_id VARCHAR,
  notes VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_counterparty_logs',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_counterparty_roles (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  spv_counterparty_id VARCHAR,
  type INTEGER,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_counterparty_roles',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_liabilities (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  spv_id VARCHAR,
  identifier VARCHAR,
  type INTEGER,
  name VARCHAR,
  currency_id VARCHAR,
  seniority INTEGER,
  rank INTEGER,
  issue_date DATE,
  max_amount DECIMAL(20, 6),
  maturity_date DATE,
  coupon_type INTEGER,
  year_base INTEGER,
  amortization_type INTEGER,
  description VARCHAR,
  isin_code VARCHAR,
  interest_rate_index INTEGER,
  interest_rate_index_tenor INTEGER,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  last_periodic_report_id VARCHAR,
  class_name VARCHAR,
  settlement_convention INTEGER,
  custom_fields MAP(VARCHAR, VARCHAR),
  deal_structure_id VARCHAR,
  margin DECIMAL(7, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_liabilities',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_liability_periodic_reports (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reporting_date DATE,
  liability_id VARCHAR,
  outstanding_principal_amount DECIMAL(20, 6),
  converted_outstanding_principal_amount DECIMAL(20, 6),
  current_interest_rate DECIMAL(7, 6),
  accrued_interest_amount DECIMAL(20, 6),
  cumulated_unpaid_interest_amount DECIMAL(20, 6),
  current_oc DECIMAL(10, 6),
  current_interest_rate_margin DECIMAL(7, 6),
  fx_to_base DOUBLE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  attachment_point DECIMAL(7, 6),
  detachment_point DECIMAL(7, 6),
  rating VARCHAR,
  current_interest_rate_index_value DECIMAL(7, 6),
  accrued_principal_amount DECIMAL(20, 6),
  spv_id VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  current_maturity_date DATE,
  current_interest_rate_index INTEGER,
  price DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_liability_periodic_reports',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_monthly_performance (
  spv_id VARCHAR,
  spv_identifier VARCHAR,
  period_start DATE,
  period_end DATE,
  standard_performing_assets INTEGER,
  standard_delinquent_assets INTEGER,
  standard_default_assets INTEGER,
  standard_other_assets INTEGER,
  contractual_performing_assets INTEGER,
  contractual_delinquent_assets INTEGER,
  contractual_default_assets INTEGER,
  contractual_other_assets INTEGER,
  total_asset_count INTEGER,
  periodic_prepaid_amount DECIMAL(20, 6),
  cumulative_prepaid_amount DECIMAL(20, 6),
  annualized_cpr DECIMAL(20, 6),
  delinquent_balance_1_29 DECIMAL(20, 6),
  delinquent_balance_30_59 DECIMAL(20, 6),
  delinquent_balance_60_89 DECIMAL(20, 6),
  delinquent_balance_90_119 DECIMAL(20, 6),
  delinquent_balance_120_up DECIMAL(20, 6),
  standard_performing_balance DECIMAL(20, 6),
  standard_delinquent_balance DECIMAL(20, 6),
  standard_default_balance DECIMAL(20, 6),
  standard_other_balance DECIMAL(20, 6),
  contractual_performing_balance DECIMAL(20, 6),
  contractual_delinquent_balance DECIMAL(20, 6),
  contractual_default_balance DECIMAL(20, 6),
  contractual_other_balance DECIMAL(20, 6),
  balance_in_delay DECIMAL(20, 6),
  balance_in_delay_1_29 DECIMAL(20, 6),
  balance_in_delay_30_59 DECIMAL(20, 6),
  balance_in_delay_60_89 DECIMAL(20, 6),
  balance_in_delay_90_119 DECIMAL(20, 6),
  balance_in_delay_120_up DECIMAL(20, 6),
  total_current_balance DECIMAL(20, 6),
  cumulative_contractual_default_amount DECIMAL(20, 6),
  cumulative_standard_default_amount DECIMAL(20, 6),
  purchased_principal_amount DECIMAL(20, 6),
  periodic_contractual_default_amount DECIMAL(20, 6),
  periodic_standard_default_amount DECIMAL(20, 6),
  contractual_non_defaulted_principal_balance DECIMAL(20, 6),
  standard_non_defaulted_principal_balance DECIMAL(20, 6),
  contractual_annualized_cdr DECIMAL(20, 6),
  standard_annualized_cdr DECIMAL(20, 6),
  converted_standard_performing_balance DECIMAL(20, 6),
  converted_standard_delinquent_balance DECIMAL(20, 6),
  converted_standard_default_balance DECIMAL(20, 6),
  converted_standard_other_balance DECIMAL(20, 6),
  converted_contractual_performing_balance DECIMAL(20, 6),
  converted_contractual_delinquent_balance DECIMAL(20, 6),
  converted_contractual_default_balance DECIMAL(20, 6),
  converted_contractual_other_balance DECIMAL(20, 6),
  converted_balance_in_delay DECIMAL(20, 6),
  converted_balance_in_delay_1_29 DECIMAL(20, 6),
  converted_balance_in_delay_30_59 DECIMAL(20, 6),
  converted_balance_in_delay_60_89 DECIMAL(20, 6),
  converted_balance_in_delay_90_119 DECIMAL(20, 6),
  converted_balance_in_delay_120_up DECIMAL(20, 6),
  converted_total_current_balance DECIMAL(20, 6),
  converted_cumulative_contractual_default_amount DECIMAL(20, 6),
  converted_cumulative_standard_default_amount DECIMAL(20, 6),
  converted_purchased_principal_amount DECIMAL(20, 6),
  converted_periodic_contractual_default_amount DECIMAL(20, 6),
  converted_periodic_standard_default_amount DECIMAL(20, 6),
  converted_contractual_non_defaulted_principal_balance DECIMAL(20, 6),
  converted_standard_non_defaulted_principal_balance DECIMAL(20, 6),
  converted_contractual_annualized_cdr DECIMAL(20, 6),
  converted_standard_annualized_cdr DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_monthly_performance',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_periodic_reports (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reporting_date DATE,
  spv_id VARCHAR,
  collection_period_start_date DATE,
  collection_period_end_date DATE,
  notes_collateral_delta DECIMAL(8, 6),
  current_waterfall_type INTEGER,
  collections_and_recoveries DECIMAL(20, 6),
  amortizing_fees DECIMAL(20, 6),
  total_costs DECIMAL(20, 6),
  interest_period_start_date DATE,
  interest_period_end_date DATE,
  trigger_ratios BOOLEAN,
  drawing_under_liquidity_facility BOOLEAN,
  excess_spread DECIMAL(20, 6),
  excess_spread_trapping_mechanism BOOLEAN,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  issuer_available_fund DECIMAL(20, 6),
  extension_clause INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_periodic_reports',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_quarterly_performance (
  spv_id VARCHAR,
  spv_identifier VARCHAR,
  period_start DATE,
  period_end DATE,
  standard_performing_assets INTEGER,
  standard_delinquent_assets INTEGER,
  standard_default_assets INTEGER,
  standard_other_assets INTEGER,
  contractual_performing_assets INTEGER,
  contractual_delinquent_assets INTEGER,
  contractual_default_assets INTEGER,
  contractual_other_assets INTEGER,
  total_asset_count INTEGER,
  periodic_prepaid_amount DECIMAL(20, 6),
  cumulative_prepaid_amount DECIMAL(20, 6),
  annualized_cpr DECIMAL(20, 6),
  delinquent_balance_1_29 DECIMAL(20, 6),
  delinquent_balance_30_59 DECIMAL(20, 6),
  delinquent_balance_60_89 DECIMAL(20, 6),
  delinquent_balance_90_119 DECIMAL(20, 6),
  delinquent_balance_120_up DECIMAL(20, 6),
  standard_performing_balance DECIMAL(20, 6),
  standard_delinquent_balance DECIMAL(20, 6),
  standard_default_balance DECIMAL(20, 6),
  standard_other_balance DECIMAL(20, 6),
  contractual_performing_balance DECIMAL(20, 6),
  contractual_delinquent_balance DECIMAL(20, 6),
  contractual_default_balance DECIMAL(20, 6),
  contractual_other_balance DECIMAL(20, 6),
  balance_in_delay DECIMAL(20, 6),
  balance_in_delay_1_29 DECIMAL(20, 6),
  balance_in_delay_30_59 DECIMAL(20, 6),
  balance_in_delay_60_89 DECIMAL(20, 6),
  balance_in_delay_90_119 DECIMAL(20, 6),
  balance_in_delay_120_up DECIMAL(20, 6),
  total_current_balance DECIMAL(20, 6),
  cumulative_contractual_default_amount DECIMAL(20, 6),
  cumulative_standard_default_amount DECIMAL(20, 6),
  purchased_principal_amount DECIMAL(20, 6),
  periodic_contractual_default_amount DECIMAL(20, 6),
  periodic_standard_default_amount DECIMAL(20, 6),
  contractual_non_defaulted_principal_balance DECIMAL(20, 6),
  standard_non_defaulted_principal_balance DECIMAL(20, 6),
  contractual_annualized_cdr DECIMAL(20, 6),
  standard_annualized_cdr DECIMAL(20, 6),
  converted_standard_performing_balance DECIMAL(20, 6),
  converted_standard_delinquent_balance DECIMAL(20, 6),
  converted_standard_default_balance DECIMAL(20, 6),
  converted_standard_other_balance DECIMAL(20, 6),
  converted_contractual_performing_balance DECIMAL(20, 6),
  converted_contractual_delinquent_balance DECIMAL(20, 6),
  converted_contractual_default_balance DECIMAL(20, 6),
  converted_contractual_other_balance DECIMAL(20, 6),
  converted_balance_in_delay DECIMAL(20, 6),
  converted_balance_in_delay_1_29 DECIMAL(20, 6),
  converted_balance_in_delay_30_59 DECIMAL(20, 6),
  converted_balance_in_delay_60_89 DECIMAL(20, 6),
  converted_balance_in_delay_90_119 DECIMAL(20, 6),
  converted_balance_in_delay_120_up DECIMAL(20, 6),
  converted_total_current_balance DECIMAL(20, 6),
  converted_cumulative_contractual_default_amount DECIMAL(20, 6),
  converted_cumulative_standard_default_amount DECIMAL(20, 6),
  converted_purchased_principal_amount DECIMAL(20, 6),
  converted_periodic_contractual_default_amount DECIMAL(20, 6),
  converted_periodic_standard_default_amount DECIMAL(20, 6),
  converted_contractual_non_defaulted_principal_balance DECIMAL(20, 6),
  converted_standard_non_defaulted_principal_balance DECIMAL(20, 6),
  converted_contractual_annualized_cdr DECIMAL(20, 6),
  converted_standard_annualized_cdr DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_quarterly_performance',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_trigger_periodic_reports (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reporting_date DATE,
  trigger_id VARCHAR,
  current_value DOUBLE,
  executed BOOLEAN,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_trigger_periodic_reports',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_triggers (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  spv_id VARCHAR,
  identifier VARCHAR,
  parameter_type INTEGER,
  parameter_description VARCHAR,
  threshold DOUBLE,
  trigger_consequence INTEGER,
  cure_period INTEGER,
  calculation_frequency INTEGER,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  last_periodic_report_id VARCHAR,
  esma_identifier VARCHAR,
  name VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_triggers',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spv_yearly_performance (
  spv_id VARCHAR,
  spv_identifier VARCHAR,
  period_start DATE,
  period_end DATE,
  standard_performing_assets INTEGER,
  standard_delinquent_assets INTEGER,
  standard_default_assets INTEGER,
  standard_other_assets INTEGER,
  contractual_performing_assets INTEGER,
  contractual_delinquent_assets INTEGER,
  contractual_default_assets INTEGER,
  contractual_other_assets INTEGER,
  total_asset_count INTEGER,
  periodic_prepaid_amount DECIMAL(20, 6),
  cumulative_prepaid_amount DECIMAL(20, 6),
  annualized_cpr DECIMAL(20, 6),
  delinquent_balance_1_29 DECIMAL(20, 6),
  delinquent_balance_30_59 DECIMAL(20, 6),
  delinquent_balance_60_89 DECIMAL(20, 6),
  delinquent_balance_90_119 DECIMAL(20, 6),
  delinquent_balance_120_up DECIMAL(20, 6),
  standard_performing_balance DECIMAL(20, 6),
  standard_delinquent_balance DECIMAL(20, 6),
  standard_default_balance DECIMAL(20, 6),
  standard_other_balance DECIMAL(20, 6),
  contractual_performing_balance DECIMAL(20, 6),
  contractual_delinquent_balance DECIMAL(20, 6),
  contractual_default_balance DECIMAL(20, 6),
  contractual_other_balance DECIMAL(20, 6),
  balance_in_delay DECIMAL(20, 6),
  balance_in_delay_1_29 DECIMAL(20, 6),
  balance_in_delay_30_59 DECIMAL(20, 6),
  balance_in_delay_60_89 DECIMAL(20, 6),
  balance_in_delay_90_119 DECIMAL(20, 6),
  balance_in_delay_120_up DECIMAL(20, 6),
  total_current_balance DECIMAL(20, 6),
  cumulative_contractual_default_amount DECIMAL(20, 6),
  cumulative_standard_default_amount DECIMAL(20, 6),
  purchased_principal_amount DECIMAL(20, 6),
  periodic_contractual_default_amount DECIMAL(20, 6),
  periodic_standard_default_amount DECIMAL(20, 6),
  contractual_non_defaulted_principal_balance DECIMAL(20, 6),
  standard_non_defaulted_principal_balance DECIMAL(20, 6),
  contractual_annualized_cdr DECIMAL(20, 6),
  standard_annualized_cdr DECIMAL(20, 6),
  converted_standard_performing_balance DECIMAL(20, 6),
  converted_standard_delinquent_balance DECIMAL(20, 6),
  converted_standard_default_balance DECIMAL(20, 6),
  converted_standard_other_balance DECIMAL(20, 6),
  converted_contractual_performing_balance DECIMAL(20, 6),
  converted_contractual_delinquent_balance DECIMAL(20, 6),
  converted_contractual_default_balance DECIMAL(20, 6),
  converted_contractual_other_balance DECIMAL(20, 6),
  converted_balance_in_delay DECIMAL(20, 6),
  converted_balance_in_delay_1_29 DECIMAL(20, 6),
  converted_balance_in_delay_30_59 DECIMAL(20, 6),
  converted_balance_in_delay_60_89 DECIMAL(20, 6),
  converted_balance_in_delay_90_119 DECIMAL(20, 6),
  converted_balance_in_delay_120_up DECIMAL(20, 6),
  converted_total_current_balance DECIMAL(20, 6),
  converted_cumulative_contractual_default_amount DECIMAL(20, 6),
  converted_cumulative_standard_default_amount DECIMAL(20, 6),
  converted_purchased_principal_amount DECIMAL(20, 6),
  converted_periodic_contractual_default_amount DECIMAL(20, 6),
  converted_periodic_standard_default_amount DECIMAL(20, 6),
  converted_contractual_non_defaulted_principal_balance DECIMAL(20, 6),
  converted_standard_non_defaulted_principal_balance DECIMAL(20, 6),
  converted_contractual_annualized_cdr DECIMAL(20, 6),
  converted_standard_annualized_cdr DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spv_yearly_performance',
  max_commit_retry=10,
  partitioning=ARRAY['spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.spvs (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  identifier VARCHAR,
  asset_class INTEGER,
  contains_npl BOOLEAN,
  reference_currency_id VARCHAR,
  contractual_payment_frequency INTEGER,
  esma_identifier VARCHAR,
  reporting_entity_name VARCHAR,
  reporting_entity_contact_person VARCHAR,
  reporting_entity_contact_telephone VARCHAR,
  reporting_entity_contact_emails VARCHAR,
  risk_transfer_method BOOLEAN,
  risk_weight_approach INTEGER,
  risk_retention_method INTEGER,
  risk_retention_holder INTEGER,
  revolving_period_end DATE,
  last_reported_on DATE,
  initial_oc DECIMAL(20, 6),
  last_periodic_report_id VARCHAR,
  documents_identifier VARCHAR,
  limits_identifier VARCHAR,
  demo_name VARCHAR,
  monthly_limits BOOLEAN,
  securitisation_name VARCHAR,
  perfection_of_sale BOOLEAN,
  current_equalizer_vehicle_id INTEGER,
  esma_required BOOLEAN,
  annex_14 BOOLEAN,
  data_surveillance_identifier VARCHAR,
  first_payment_date DATE,
  first_collection_period_end_date DATE,
  supports_subscription BOOLEAN,
  supports_transaction_manager BOOLEAN,
  contains_re_collaterals BOOLEAN,
  strategy VARCHAR,
  structure VARCHAR,
  risk_transfer VARCHAR,
  contact_email VARCHAR,
  ramp_up_period_end DATE,
  next_payment_date DATE,
  supporting_configs MAP(VARCHAR, VARCHAR),
  supports_waterfall BOOLEAN,
  description VARCHAR,
  supported_reports ARRAY(INTEGER),
  investment_asset_types ARRAY(INTEGER),
  collateral_asset_types ARRAY(INTEGER),
  investment_types ARRAY(INTEGER),
  abbreviation VARCHAR,
  parent_id VARCHAR,
  material_contractual_amendment VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  supports_transaction BOOLEAN,
  asset_table_results_created BOOLEAN,
  demo_asset_table_results_created BOOLEAN,
  simulation_model INTEGER,
  supports_amortization_plan_updates BOOLEAN,
  is_pre_deal BOOLEAN,
  latest_asset_synchronization_date DATE,
  latest_payment_report_synchronization_date DATE,
  establishment_date DATE,
  termination_date DATE,
  realized_cash_flow_amount DECIMAL(20, 6),
  waterfall_template_id VARCHAR,
  index_tenor_interest ARRAY(VARCHAR),
  amortization_types ARRAY(INTEGER),
  should_compute_amortization_plan BOOLEAN,
  defaulted_principal_amount DECIMAL(20, 6),
  performing_principal_amount DECIMAL(20, 6),
  purchase_principal_amount DECIMAL(20, 6),
  issue_amount DECIMAL(20, 6),
  table_names ARRAY(VARCHAR)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/spvs',
  max_commit_retry=10,
  partitioning=ARRAY['id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.standardization_results (
  external_job_id VARCHAR,
  results VARCHAR,
  sync_job_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/standardization_results',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['external_job_id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.subscription_allocations (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  investment_id VARCHAR,
  subscription_id VARCHAR,
  synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/subscription_allocations',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.subscription_daily_reports (
  subscription_id VARCHAR,
  reporting_date DATE,
  subscription_periodic_report_id VARCHAR,
  synchronization_id VARCHAR,
  spv_id VARCHAR,
  originator_id VARCHAR,
  reporting_year INTEGER,
  reporting_month INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/subscription_daily_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['synchronization_id', 'subscription_id', 'subscription_periodic_report_id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.subscription_periodic_reports (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  reporting_date DATE,
  subscription_id VARCHAR,
  revenue_paid DECIMAL(20, 6),
  subscription_amount DECIMAL(20, 6),
  other_revenue_paid DECIMAL(20, 6),
  maturity_date DATE,
  committed_duration INTEGER,
  current_duration INTEGER,
  effective_duration INTEGER,
  remaining_duration INTEGER,
  revenue_due DECIMAL(20, 6),
  revenue_due_total DECIMAL(20, 6),
  committed_subscription_value DECIMAL(20, 6),
  current_principal_balance DECIMAL(20, 6),
  performance_status INTEGER,
  days_in_delay INTEGER,
  customer_type INTEGER,
  customer_acquisition_channel VARCHAR,
  is_prepaid BOOLEAN,
  is_closed BOOLEAN,
  remaining_term INTEGER,
  realized_term INTEGER,
  last_payment_date DATE,
  contractual_default_principal_amount DECIMAL(20, 6),
  contractual_default_interest_amount DECIMAL(20, 6),
  default_principal_amount DECIMAL(20, 6),
  default_interest_amount DECIMAL(20, 6),
  default_date DATE,
  write_off_amount DECIMAL(20, 6),
  write_off_date DATE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR,
  expenses_due DECIMAL(20, 6),
  expenses_due_total DECIMAL(20, 6),
  ending_expiration_date DATE,
  renewal_period VARCHAR,
  expenses_paid DECIMAL(20, 6),
  closing_date DATE,
  custom_fields MAP(VARCHAR, VARCHAR),
  escalation_percentage DECIMAL(7, 6),
  escalation_frequency INTEGER,
  next_escalation_date DATE,
  renewal_date DATE,
  renewal_frequency INTEGER,
  prepaid_date DATE,
  prepaid_amount DECIMAL(20, 6),
  market_rent DECIMAL(20, 6),
  billing_cycle_start_date DATE,
  billing_cycle_end_date DATE,
  move_in_date DATE,
  move_out_date DATE,
  annualized_revenues DECIMAL(20, 6),
  annualized_expenses DECIMAL(20, 6),
  base_lease_amount DECIMAL(20, 6),
  free_rent_months INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/subscription_periodic_reports',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id', 'reporting_date']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.subscriptions (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  originator_identifier VARCHAR,
  currency_id VARCHAR,
  type INTEGER,
  start_date DATE,
  plan VARCHAR,
  committed_duration INTEGER,
  committed_subscription_value DECIMAL(20, 6),
  debtor_company_id VARCHAR,
  debtor_individual_id VARCHAR,
  last_periodic_report_id VARCHAR,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR,
  custom_fields MAP(VARCHAR, VARCHAR),
  floorplan VARCHAR,
  unit_identifier VARCHAR,
  lessee VARCHAR,
  lessor VARCHAR,
  escalation_date_original DATE
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/subscriptions',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.sync_job_resources (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  sync_job_id VARCHAR,
  sync_resource_id VARCHAR,
  path VARCHAR,
  original_file_name VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/sync_job_resources',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.sync_jobs (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  synchronization_account_id VARCHAR,
  created_by_id VARCHAR,
  sync_type INTEGER,
  reference_date DATE,
  step INTEGER,
  status INTEGER,
  completed_at TIMESTAMP(6) WITH TIME ZONE,
  error_message VARCHAR,
  execute_automatically_on_dhc_success BOOLEAN,
  waterfall_execution_id VARCHAR,
  created_via_backfill BOOLEAN,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/sync_jobs',
  max_commit_retry=10,
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.synchronization_accounts (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  spv_id VARCHAR,
  sync_type INTEGER,
  originator_id VARCHAR,
  estimated_sync_time DOUBLE,
  estimated_data_health_check_time DOUBLE,
  retriever_identifier VARCHAR,
  dhc_identifier VARCHAR,
  standardization_identifier VARCHAR,
  sync_automatically BOOLEAN,
  retriever_job_parameters VARCHAR,
  minute_of_the_hour VARCHAR,
  hour_of_the_day VARCHAR,
  day_of_the_month VARCHAR,
  day_of_the_week VARCHAR,
  month_of_the_year VARCHAR,
  mercury_originator_instance_id INTEGER,
  automatic_sync_frequency INTEGER,
  contact_emails ARRAY(VARCHAR),
  notify_on_dhc_failure BOOLEAN,
  in_jobs_rollback BOOLEAN,
  rolling_back_to_sync_job_id VARCHAR,
  has_single_sync_job BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/synchronization_accounts',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.user_input_results (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  value VARCHAR,
  proposal_id VARCHAR,
  user_input_id VARCHAR,
  sync_job_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/user_input_results',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.user_inputs (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  identifier VARCHAR,
  "order" INTEGER,
  description VARCHAR,
  data_type INTEGER,
  section_id VARCHAR,
  suggestion_query_id VARCHAR,
  action_type INTEGER,
  optimize_query_id VARCHAR,
  initial_value_query_id VARCHAR,
  optimization_target DOUBLE
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/user_inputs',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.vehicle_asset_history (
  id VARCHAR,
  asset_id VARCHAR,
  book_value DECIMAL(20, 6),
  distance INTEGER,
  asset_depreciation DECIMAL(20, 6),
  depreciation_frequency INTEGER,
  depreciation_percentage DECIMAL(7, 6),
  fuel_type INTEGER,
  vehicle_color VARCHAR,
  registration_date DATE,
  energy_performance_certificate_value INTEGER,
  energy_performance_certificate_provider_name VARCHAR,
  valid_until DATE,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  originator_id VARCHAR,
  spv_id VARCHAR,
  asset_actual_return DECIMAL(20, 6),
  asset_repayment_status VARCHAR,
  asset_value DECIMAL(20, 6),
  other_balance DECIMAL(20, 6)
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/vehicle_asset_history',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.vehicle_assets (
  id VARCHAR,
  originator_id VARCHAR,
  asset_class INTEGER,
  oem_identifier VARCHAR,
  oem VARCHAR,
  vehicle_identification_number VARCHAR,
  model VARCHAR,
  year_of_registration INTEGER,
  condition INTEGER,
  measurement_unit INTEGER,
  distance_at_purchase INTEGER,
  category INTEGER,
  product_type INTEGER,
  original_residual_value_of_vehicle DECIMAL(20, 6),
  option_to_buy_price DECIMAL(20, 6),
  book_value DECIMAL(20, 6),
  distance INTEGER,
  asset_depreciation DECIMAL(20, 6),
  depreciation_frequency INTEGER,
  depreciation_percentage DECIMAL(7, 6),
  fuel_type INTEGER,
  vehicle_color VARCHAR,
  registration_date DATE,
  energy_performance_certificate_value INTEGER,
  energy_performance_certificate_provider_name VARCHAR,
  number_of_leases INTEGER,
  synchronization_id VARCHAR,
  updated_by_synchronization_id VARCHAR,
  book_value_at_purchase DECIMAL(20, 6),
  spv_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/vehicle_assets',
  max_commit_retry=10,
  parquet_bloom_filter_columns=ARRAY['id'],
  partitioning=ARRAY['originator_id', 'spv_id']
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_available_funds (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  formula VARCHAR,
  simulation_formula VARCHAR,
  parent_id VARCHAR,
  identifier VARCHAR,
  total_amount DECIMAL(25, 15),
  spv_cash_account_id VARCHAR,
  last_result_id VARCHAR,
  currency_id VARCHAR,
  description VARCHAR,
  last_simulation_result_id VARCHAR,
  is_deleted BOOLEAN,
  "order" INTEGER,
  payment_section_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_available_funds',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_available_funds_history (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  valid_until DATE,
  name VARCHAR,
  formula VARCHAR,
  available_funds_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_available_funds_history',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_available_funds_results (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  available_funds_id VARCHAR,
  waterfall_execution_id VARCHAR,
  name VARCHAR,
  amount DECIMAL(25, 15),
  is_overridden BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_available_funds_results',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_executions (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  waterfall_id VARCHAR,
  spv_id VARCHAR,
  reference_date DATE,
  step INTEGER,
  status INTEGER,
  collection_period_start_date DATE,
  collection_period_end_date DATE,
  created_by_id VARCHAR,
  simulation_job_id VARCHAR,
  error_message VARCHAR,
  sync_type INTEGER,
  interest_period_start_date DATE,
  interest_period_end_date DATE,
  context VARCHAR,
  payment_date DATE,
  simulation_id VARCHAR,
  execution_trigger_id VARCHAR,
  async_status INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_executions',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_input_component_results (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  value VARCHAR,
  input_component_id VARCHAR,
  waterfall_execution_id VARCHAR,
  overriden_value VARCHAR,
  override_reason VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_input_component_results',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_input_components (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  spv_id VARCHAR,
  name VARCHAR,
  identifier VARCHAR,
  description VARCHAR,
  test_value VARCHAR,
  value_type INTEGER,
  formula VARCHAR,
  simulation_formula VARCHAR,
  last_result_id VARCHAR,
  cumulative_inclusion BOOLEAN,
  last_simulation_result_id VARCHAR,
  is_deleted BOOLEAN,
  template_id VARCHAR,
  waterfall_structure_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_input_components',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_payment_results (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  payment_id VARCHAR,
  waterfall_execution_id VARCHAR,
  reference_date DATE,
  name VARCHAR,
  amount_due DECIMAL(25, 15),
  amount_paid DECIMAL(25, 15),
  amount_carried_forward DECIMAL(25, 15),
  available_funds DECIMAL(25, 15),
  is_overridden BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_payment_results',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_payment_sections (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  identifier VARCHAR,
  "order" INTEGER,
  currency_id VARCHAR,
  waterfall_id VARCHAR,
  description VARCHAR,
  is_deleted BOOLEAN
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_payment_sections',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_payment_sections_history (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  valid_until DATE,
  name VARCHAR,
  description VARCHAR,
  payment_section_id VARCHAR,
  waterfall_id VARCHAR,
  currency_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_payment_sections_history',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_payments (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  name VARCHAR,
  "order" INTEGER,
  formula VARCHAR,
  simulation_formula VARCHAR,
  parent_id VARCHAR,
  payment_section_id VARCHAR,
  spv_liability_id VARCHAR,
  distribution_method INTEGER,
  spv_cash_account_id VARCHAR,
  identifier VARCHAR,
  cash_flow_type INTEGER,
  amount_due DECIMAL(25, 15),
  currency_id VARCHAR,
  last_result_id VARCHAR,
  description VARCHAR,
  last_simulation_result_id VARCHAR,
  is_deleted BOOLEAN,
  exclude_amount_carried_forward BOOLEAN,
  simulation_exclude_amount_carried_forward BOOLEAN,
  pcm_identifier VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_payments',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfall_payments_history (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  valid_until DATE,
  name VARCHAR,
  formula VARCHAR,
  payment_id VARCHAR
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfall_payments_history',
  max_commit_retry=10
);

CREATE TABLE IF NOT EXISTS "local-equalizer".cardoai_local_equalizer.waterfalls (
  id VARCHAR,
  created_at TIMESTAMP(6) WITH TIME ZONE,
  updated_at TIMESTAMP(6) WITH TIME ZONE,
  spv_id VARCHAR,
  name VARCHAR,
  condition_formula VARCHAR,
  formula_type INTEGER,
  is_deleted BOOLEAN,
  template_id VARCHAR,
  waterfall_structure_id VARCHAR,
  "order" INTEGER
)
WITH (
  compression_codec='ZSTD',
  format='PARQUET',
  format_version=2,
  LOCATION='s3://warehouse/cardoai_local_equalizer/waterfalls',
  max_commit_retry=10
);

