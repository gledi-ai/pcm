CREATE SCHEMA IF NOT EXISTS cardoai_local_db_equalizer WITH (
   location = 's3a://equalizer-datalake/delta_tables/'
);

CREATE TABLE asset_class_annex (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   asset_class smallint,
   annex_name smallint,
   annex_type smallint
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/asset_class_annex'
);

CREATE TABLE asset_collections_timeline (
   originator_id varchar,
   originator_identifier varchar,
   originator_name varchar,
   spv_id varchar,
   spv_identifier varchar,
   spv_name varchar,
   asset_id varchar,
   asset_identifier varchar,
   payment_date date,
   cash_flow_type smallint,
   realized_amount decimal(30, 6),
   converted_realized_amount decimal(30, 6),
   expected_amount decimal(30, 6),
   converted_expected_amount decimal(30, 6),
   monthly_period_start_date date,
   weekly_period_start_date date,
   reporting_date date,
   synchronization_id varchar,
   currency_abbreviation varchar,
   currency_symbol varchar,
   subscription_id varchar,
   subscription_identifier varchar,
   created_via_backfill boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/asset_collections_timeline',
   partitioned_by = ARRAY['originator_id','spv_id','reporting_date','cash_flow_type']
);

CREATE TABLE asset_contractual_expected_cash_flows (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reference_date date,
   identifier varchar,
   type smallint,
   asset_id varchar,
   asset_modification_event_id varchar,
   amount decimal(20, 6),
   valid_from date,
   valid_until date,
   currency_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   converted_amount decimal(20, 6),
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/asset_contractual_expected_cash_flows',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE asset_extended_periodic_reports (
   asset_id varchar,
   asset_class smallint,
   asset_role varchar,
   issue_amount decimal(20, 6),
   converted_issue_amount decimal(20, 6),
   is_syndicated boolean,
   are_payments_in_kind boolean,
   guarantee_coverage_percent double,
   date_activation_guarantee date,
   guarantee_requested_amount decimal(20, 6),
   disputed boolean,
   last_disputed_date date,
   rejection_date date,
   loan_purpose smallint,
   interest_rate_type smallint,
   scheduled_principal_payment_frequency smallint,
   scheduled_interest_payment_frequency smallint,
   interest_rate_floor decimal(7, 6),
   pik_type smallint,
   pik_in_cash decimal(20, 6),
   pik_cumulated decimal(20, 6),
   committed_amount decimal(20, 6),
   ballon_amount decimal(20, 6),
   cumulated_recovery decimal(20, 6),
   deferred_security boolean,
   trade_status smallint,
   trade_date date,
   exp_settlement_date date,
   global_amount decimal(20, 6),
   seniority_type smallint,
   spv_id varchar,
   originator_id varchar,
   synchronization_reporting_date date,
   synchronization_id varchar,
   asset_type smallint,
   seller_id varchar,
   debtor_company_id varchar,
   debtor_individual_id varchar,
   asset_currency_id varchar,
   asset_currency_name varchar,
   asset_currency_abbreviation varchar,
   asset_currency_symbol varchar,
   asset_identifier varchar,
   issue_date date,
   debtor_identifier varchar,
   borrower_name varchar,
   borrower_vat varchar,
   geography_id varchar,
   sector_id varchar,
   probability_of_default decimal(20, 6),
   regulatory_status smallint,
   fico_score smallint,
   pti decimal(7, 6),
   dti double,
   debtor_custom_fields map(varchar, varchar),
   employer_name varchar,
   home_ownership smallint,
   bankruptcy_status smallint,
   bankruptcy_chapter smallint,
   bankruptcy_date date,
   current_debtor_log_id varchar,
   seller_name varchar,
   seller_vat varchar,
   borrower_sector_name varchar,
   borrower_sector_code varchar,
   borrower_sector_standard smallint,
   borrower_macro_sector_name varchar,
   borrower_macro_sector_code varchar,
   borrower_macro_sector_standard smallint,
   borrower_country_name varchar,
   borrower_region_name varchar,
   borrower_city_name varchar,
   nr_of_modifications bigint,
   asset_modification_date date,
   asset_modification_type varchar,
   asset_modification_reason varchar,
   asset_modification_end_date date,
   created_via_backfill boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/asset_extended_periodic_reports',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE asset_modification_events (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   asset_id varchar,
   synchronization_id varchar,
   reference_date date,
   type varchar,
   by_law boolean,
   forbearance boolean,
   details varchar,
   modification_end_date date,
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/asset_modification_events',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE asset_realized_cash_flows (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reference_date date,
   identifier varchar,
   type smallint,
   asset_id varchar,
   effective_amount decimal(20, 6),
   details varchar,
   recovery_source varchar,
   currency_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   converted_effective_amount decimal(20, 6),
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/asset_realized_cash_flows',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE asset_table_results (
   asset_identifier varchar,
   created_at timestamp(3) with time zone,
   id varchar,
   proposal_id varchar,
   results varchar,
   section_id varchar,
   updated_at timestamp(3) with time zone,
   waived boolean,
   row_order integer
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/asset_table_results',
   partitioned_by = ARRAY['proposal_id','section_id']
);

CREATE TABLE asset_table_results_25194135af8b44dcaed979e595d040ba (
   asset_identifier varchar,
   created_at timestamp(3) with time zone,
   id varchar,
   proposal_id varchar,
   results varchar,
   section_id varchar,
   updated_at timestamp(3) with time zone,
   waived boolean,
   row_order integer
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/asset_table_results_25194135af8b44dcaed979e595d040ba',
   partitioned_by = ARRAY['proposal_id','section_id']
);

CREATE TABLE assets (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   originator_identifier varchar,
   originator_id varchar,
   seller_company_id varchar,
   debtor_company_id varchar,
   debtor_individual_id varchar,
   currency_id varchar,
   issue_date date,
   type smallint,
   asset_actual_return decimal(20, 6),
   asset_repayment_status varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   custom_originator_name varchar,
   is_syndicated boolean,
   syndicated_percentage decimal(20, 6),
   asset_value decimal(20, 6),
   other_balance decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/assets',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE backing_history (
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   id varchar,
   backing_id varchar,
   synchronization_id varchar,
   max_amount_covered decimal(20, 6),
   charge_type varchar,
   lien integer,
   is_primary_collateral boolean,
   valid_until date,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/backing_history',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE backings (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   investment_id varchar,
   investment_collateral_id varchar,
   max_amount_covered decimal(20, 6),
   charge_type varchar,
   lien integer,
   is_primary_collateral boolean,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   valid_from date,
   valid_until date,
   is_real_backing boolean,
   mortgage_id varchar,
   mortgage_description varchar,
   mortgage_pool boolean,
   mortgage_pool_percentage decimal(20, 6),
   mortgage_type smallint,
   mortgage_date date,
   mortgage_end_date date,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/backings',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE business_plans (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   identifier varchar,
   name varchar,
   investment_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/business_plans',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE cluster_configurations (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   cluster_category varchar,
   recovery_rate decimal(7, 6),
   recovery_lag integer,
   default_rate array(decimal(7, 6)),
   default_rate_method smallint,
   default_rate_frequency smallint,
   default_rate_cardoai_model boolean,
   prepayment_rate array(decimal(7, 6)),
   prepayment_rate_method smallint,
   prepayment_rate_cardoai_model boolean,
   prepayment_rate_frequency smallint,
   simulation_job_id varchar,
   delinquency_rate array(decimal(7, 6)),
   delinquency_rate_frequency smallint,
   delinquency_lag integer
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/cluster_configurations'
);

CREATE TABLE collateral_cash_flows (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reference_date date,
   identifier varchar,
   type smallint,
   collateral_id varchar,
   amount decimal(20, 6),
   currency_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/collateral_cash_flows',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE collateral_daily_reports (
   investment_id varchar,
   investment_collateral_id varchar,
   collateral_id varchar,
   asset_id varchar,
   investment_asset_id varchar,
   collateral_asset_id varchar,
   reporting_date date,
   originator_id varchar,
   spv_id varchar,
   synchronization_id varchar,
   reporting_year integer,
   reporting_month integer,
   created_via_backfill boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/collateral_daily_reports',
   partitioned_by = ARRAY['originator_id','spv_id','reporting_year','reporting_month']
);

CREATE TABLE collateral_events (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   collateral_id varchar,
   reference_date date,
   type varchar,
   details varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/collateral_events',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE collateral_extended_periodic_reports (
   investment_id varchar,
   originator_id varchar,
   spv_id varchar,
   investment_collateral_id varchar,
   collateral_id varchar,
   collateral_originator_identifier varchar,
   current_valuation_amount decimal(20, 6),
   is_primary_collateral boolean,
   investment_originator_identifier varchar,
   spv_name varchar,
   spv_demo_name varchar,
   spv_identifier varchar,
   originator_name varchar,
   originator_identifier varchar,
   original_valuation_date date,
   liquidation_date date,
   total_liquidation_amount decimal(20, 6),
   original_valuation_amount decimal(20, 6),
   investment_periodic_report_id varchar,
   current_principal_balance decimal(20, 6),
   converted_current_principal_balance decimal(20, 6),
   purchased_principal_amount decimal(20, 6),
   converted_purchased_principal_amount decimal(20, 6),
   performance_status_contractual smallint,
   is_closed boolean,
   synchronization_reporting_date date,
   synchronization_id varchar,
   is_proposed boolean,
   custom_fields map(varchar, varchar),
   created_via_backfill boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/collateral_extended_periodic_reports',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE collateral_periodic_reports (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   sale_price decimal(20, 6),
   date_of_sale date,
   original_valuation_method smallint,
   original_valuation_date date,
   original_valuation_amount decimal(20, 6),
   liquidation_date date,
   total_liquidation_amount decimal(20, 6),
   total_liquidation_amount_capital decimal(20, 6),
   total_liquidation_amount_interest decimal(20, 6),
   collateral_id varchar,
   number_auctions_failed integer,
   last_auction_date date,
   last_auction_base_price decimal(20, 6),
   last_auction_min_bid_price decimal(20, 6),
   next_auction_date date,
   next_auction_base_price decimal(20, 6),
   next_auction_min_bid_price decimal(20, 6),
   asset_repossessed_date date,
   notes varchar,
   reporting_date date,
   liquidation_resolution_date date,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   custom_fields map(varchar, varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/collateral_periodic_reports',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE collaterals (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   asset_id varchar,
   originator_identifier varchar,
   currency_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   last_periodic_report_id varchar,
   custom_fields map(varchar, varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/collaterals',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE commercial_credit_asset_history (
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   issue_amount decimal(20, 6),
   converted_issue_amount decimal(20, 6),
   id varchar,
   asset_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   valid_until date,
   originator_id varchar,
   spv_id varchar,
   asset_actual_return decimal(20, 6),
   asset_repayment_status varchar,
   asset_value decimal(20, 6),
   other_balance decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/commercial_credit_asset_history',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE commercial_credit_assets (
   issue_amount decimal(20, 6),
   converted_issue_amount decimal(20, 6),
   id varchar,
   asset_class smallint,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/commercial_credit_assets',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE companies (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   originator_id varchar,
   vat varchar,
   originator_identifier varchar,
   group_identifier varchar,
   name varchar,
   category varchar,
   basel_3_segment varchar,
   zip_code varchar,
   address varchar,
   founding_date date,
   website varchar,
   last_log_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   insurer_name varchar,
   insurance_plafond varchar,
   insurance_score varchar,
   custom_fields map(varchar, varchar),
   is_sole_proprietorship boolean,
   spv_ids array(varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/companies',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE company_logs (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   company_id varchar,
   reference_date date,
   number_of_employees smallint,
   enterprise_size smallint,
   sales decimal(20, 6),
   ebitda decimal(20, 6),
   net_profit decimal(20, 6),
   total_assets decimal(20, 6),
   total_debt decimal(20, 6),
   total_value decimal(20, 6),
   enterprise_value decimal(20, 6),
   free_cash_flow decimal(20, 6),
   date_of_financials date,
   probability_of_default decimal(20, 6),
   probability_of_default_source varchar,
   risk_score varchar,
   risk_score_source varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   regulatory_status smallint,
   originator_id varchar,
   geography_id varchar,
   sector_id varchar,
   notes varchar,
   annual_recurring_revenue decimal(20, 6),
   liquidity decimal(20, 6),
   interest_coverage decimal(7, 6),
   debt_coverage decimal(7, 6),
   total_debt_to_ebitda decimal(7, 6),
   senior_debt_to_ebitda decimal(7, 6),
   ltm_ebitda decimal(20, 6),
   custom_fields map(varchar, varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/company_logs',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE currency (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   abbreviation varchar,
   symbol varchar,
   flag_url varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/currency'
);

CREATE TABLE demo_table_results (
   asset_identifier varchar,
   created_at timestamp(3) with time zone,
   id varchar,
   proposal_id varchar,
   results varchar,
   section_id varchar,
   updated_at timestamp(3) with time zone,
   waived boolean,
   row_order integer
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/demo_table_results',
   partitioned_by = ARRAY['proposal_id','section_id']
);

CREATE TABLE dhc_results (
   external_job_id varchar,
   blocking_errors integer,
   warning_errors integer,
   successful_checks integer,
   sync_job_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/dhc_results',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE enforcement_procedure_periodic_reports (
   id varchar,
   reporting_date date,
   enforcement_procedure_id varchar,
   legal_actions_completed varchar,
   date_of_last_contact date,
   procedure_stage smallint,
   procedure_stage_starting_date date,
   legal_fees_accrued smallint,
   notes varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/enforcement_procedure_periodic_reports',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE enforcement_procedures (
   id varchar,
   identifier varchar,
   procedure_id varchar,
   strategy_type smallint,
   art_41 boolean,
   legal_procedure_type smallint,
   commencement_date_legal_procedure date,
   rge_identifier varchar,
   court varchar,
   seniority_legal_procedure smallint,
   governing_law varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   last_periodic_report_id varchar,
   expected_legal_end_date date,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/enforcement_procedures',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE equipment_asset_history (
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   valid_until date,
   id varchar,
   asset_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   spv_id varchar,
   asset_actual_return decimal(20, 6),
   asset_repayment_status varchar,
   asset_value decimal(20, 6),
   other_balance decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/equipment_asset_history',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE equipment_assets (
   id varchar,
   asset_class smallint,
   oem varchar,
   oem_identifier varchar,
   condition smallint,
   description varchar,
   category smallint,
   sub_category varchar,
   manufacture_year varchar,
   initial_purchase_price decimal(20, 6),
   purchase_currency_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/equipment_assets',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE external_validations (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   custom_fields map(varchar, varchar),
   spv_id varchar,
   reference_date date,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   identifier varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/external_validations'
);

CREATE TABLE financial_credit_asset_history (
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   interest_rate_type smallint,
   financing_purpose smallint,
   issue_amount decimal(20, 6),
   interest_rate_floor decimal(7, 6),
   interest_rate_cap decimal(7, 6),
   scheduled_principal_payment_frequency smallint,
   scheduled_interest_payment_frequency smallint,
   credit_limit decimal(20, 6),
   commitment_fees decimal(7, 6),
   are_payments_in_kind boolean,
   seniority varchar,
   isin varchar,
   upfront_fees decimal(20, 6),
   oid double,
   asset_expected_return decimal(20, 6),
   converted_issue_amount decimal(20, 6),
   id varchar,
   asset_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   valid_until date,
   originator_id varchar,
   spv_id varchar,
   pik_type smallint,
   pik_in_cash decimal(20, 6),
   pik_cumulated decimal(20, 6),
   committed_amount decimal(20, 6),
   ballon_amount decimal(20, 6),
   cumulated_recovery decimal(20, 6),
   deferred_security boolean,
   trade_status smallint,
   trade_date date,
   exp_settlement_date date,
   global_amount decimal(20, 6),
   seniority_type smallint,
   origination_fee_percentage decimal(7, 6),
   first_expected_payment_date date,
   days_count_convention integer,
   interest_only_period integer,
   growth_rate decimal(20, 6),
   growth_interval_months integer,
   deferred_period integer,
   capitalized_interest_percentage decimal(20, 6),
   negative_amortization_cap decimal(20, 6),
   principal_repayment_percentage_assumption integer,
   number_of_installments integer,
   down_payment decimal(20, 6),
   first_payment_date date,
   minimum_periodic_payment_percentage decimal(20, 6),
   minimum_periodic_payment_amount decimal(20, 6),
   amortization_type integer,
   asset_actual_return decimal(20, 6),
   asset_repayment_status varchar,
   asset_value decimal(20, 6),
   other_balance decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/financial_credit_asset_history',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE financial_credit_assets (
   interest_rate_type smallint,
   financing_purpose smallint,
   issue_amount decimal(20, 6),
   interest_rate_floor decimal(7, 6),
   interest_rate_cap decimal(7, 6),
   scheduled_principal_payment_frequency smallint,
   scheduled_interest_payment_frequency smallint,
   credit_limit decimal(20, 6),
   commitment_fees decimal(7, 6),
   are_payments_in_kind boolean,
   seniority varchar,
   isin varchar,
   upfront_fees decimal(20, 6),
   oid double,
   asset_expected_return decimal(20, 6),
   converted_issue_amount decimal(20, 6),
   id varchar,
   asset_class smallint,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   original_lender_id varchar,
   is_syndicated boolean,
   pik_type smallint,
   pik_in_cash decimal(20, 6),
   pik_cumulated decimal(20, 6),
   committed_amount decimal(20, 6),
   ballon_amount decimal(20, 6),
   cumulated_recovery decimal(20, 6),
   deferred_security boolean,
   trade_status smallint,
   trade_date date,
   exp_settlement_date date,
   global_amount decimal(20, 6),
   seniority_type smallint,
   origination_fee_percentage decimal(7, 6),
   first_expected_payment_date date,
   is_dpa boolean,
   days_count_convention integer,
   interest_only_period integer,
   growth_rate decimal(20, 6),
   growth_interval_months integer,
   deferred_period integer,
   capitalized_interest_percentage decimal(20, 6),
   negative_amortization_cap decimal(20, 6),
   principal_repayment_percentage_assumption integer,
   number_of_installments integer,
   down_payment decimal(20, 6),
   first_payment_date date,
   minimum_periodic_payment_percentage decimal(20, 6),
   minimum_periodic_payment_amount decimal(20, 6),
   amortization_type integer
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/financial_credit_assets',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE fund_assets (
   id varchar,
   asset_class smallint,
   fund_asset_specific varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/fund_assets',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE geography (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   continent varchar,
   level smallint,
   iso_code varchar,
   original_name varchar,
   en_name varchar,
   nuts_code varchar,
   parent_id varchar,
   top_parent_id varchar,
   alpha_2 varchar,
   alpha_3 varchar,
   italian_province_code varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/geography'
);

CREATE TABLE geography_info (
   id varchar,
   borrower_country_name varchar,
   borrower_macro_region_name varchar,
   borrower_region_name varchar,
   borrower_city_name varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/geography_info'
);

CREATE TABLE guarantee_asset_history (
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   id varchar,
   asset_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   valid_until date,
   guarantee_coverage_percent double,
   date_activation_guarantee date,
   date_approval_guarantee date,
   guarantee_requested_amount decimal(20, 6),
   disputed boolean,
   last_disputed_date date,
   rejection_date date,
   guarantor_country varchar,
   further_obligations boolean,
   obligations_fulfillment_date date,
   guarantee_end_date date,
   originator_id varchar,
   spv_id varchar,
   asset_actual_return decimal(20, 6),
   asset_repayment_status varchar,
   asset_value decimal(20, 6),
   other_balance decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/guarantee_asset_history',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE guarantee_assets (
   id varchar,
   asset_class smallint,
   guarantee_coverage_percent double,
   date_activation_guarantee date,
   date_approval_guarantee date,
   guarantee_requested_amount decimal(20, 6),
   disputed boolean,
   last_disputed_date date,
   rejection_date date,
   guarantor_country varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   further_obligations boolean,
   obligations_fulfillment_date date,
   guarantee_end_date date
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/guarantee_assets',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE individual_logs (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   individual_id varchar,
   reference_date date,
   employment_status smallint,
   employment_title varchar,
   employment_duration smallint,
   primary_income_type smallint,
   primary_income_amount decimal(20, 6),
   primary_income_verification smallint,
   score varchar,
   dti double,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   geography_id varchar,
   notes varchar,
   fico_score smallint,
   pti decimal(7, 6),
   employer_name varchar,
   home_ownership smallint,
   bankruptcy_status smallint,
   bankruptcy_chapter smallint,
   bankruptcy_date date,
   bankruptcy_flag boolean,
   income_insight varchar,
   custom_fields map(varchar, varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/individual_logs',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE individuals (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   originator_identifier varchar,
   originator_id varchar,
   name varchar,
   gender smallint,
   birth_year smallint,
   total_debt decimal(20, 6),
   fiscal_code varchar,
   is_deceased boolean,
   deceased_date date,
   last_log_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   custom_fields map(varchar, varchar),
   spv_ids array(varchar),
   original_dti decimal(20, 6),
   original_fico_score decimal(20, 6),
   original_pti decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/individuals',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE investment_collateral_valuations (
   investment_collateral_id varchar,
   valuation_method smallint,
   spv_id varchar,
   originator_id varchar,
   id varchar,
   reference_date date,
   value decimal(20, 6),
   type smallint,
   provider varchar,
   is_after_repaired boolean,
   is_after_renovation boolean,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   currency_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_collateral_valuations',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investment_collaterals (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   collateral_id varchar,
   spv_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_collaterals',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investment_daily_reports (
   investment_id varchar,
   reporting_date date,
   investment_periodic_report_id varchar,
   asset_id varchar,
   synchronization_id varchar,
   spv_id varchar,
   originator_id varchar,
   residual_weighted_average_maturity decimal(38, 6),
   asset_age double,
   quarterly_prepayment_collections decimal(30, 6),
   remaining_term double,
   reporting_year integer,
   reporting_month integer,
   created_via_backfill boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_daily_reports',
   partitioned_by = ARRAY['originator_id','spv_id','reporting_year','reporting_month']
);

CREATE TABLE investment_esma (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   standard varchar,
   investment_id varchar,
   amortisation_type smallint,
   customer_type smallint,
   origination_channel smallint,
   securitised_receivables smallint,
   put_date date,
   put_strike decimal(20, 6),
   credit_empaired_obligor boolean,
   leveraged_transaction boolean,
   managed_by_clo boolean,
   special_scheme boolean,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   seniority smallint,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_esma',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investment_expected_cash_flows (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reference_date date,
   identifier varchar,
   type smallint,
   investment_id varchar,
   asset_modification_event_id varchar,
   amount decimal(20, 6),
   valid_from date,
   valid_until date,
   currency_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   converted_amount decimal(20, 6),
   subscription_id varchar,
   originator_id varchar,
   spv_id varchar,
   business_plan_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_expected_cash_flows',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investment_extended_periodic_reports (
   investment_id varchar,
   pool_addition_date date,
   investment_identifier varchar,
   initial_expected_return decimal(7, 6),
   number_of_payments_before_securitization integer,
   original_maturity_date date,
   investment_type smallint,
   is_proposed boolean,
   investment_periodic_report_id varchar,
   purchased_principal_amount decimal(20, 6),
   current_principal_balance decimal(20, 6),
   total_funding decimal(25, 15),
   days_in_delay integer,
   repurchase_date date,
   is_closed boolean,
   performance_status_contractual smallint,
   performance_status smallint,
   repayment_status smallint,
   dissesto boolean,
   investment_forecasted_return decimal(20, 6),
   closing_date date,
   loss_given_default decimal(20, 6),
   contractual_default_date date,
   contractual_defaulted_principal_amount decimal(20, 6),
   converted_contractual_defaulted_principal_amount decimal(20, 6),
   contractual_defaulted_interest_amount decimal(20, 6),
   contractual_accrued_interest_amount_on_default decimal(20, 6),
   default_date date,
   defaulted_principal_amount decimal(20, 6),
   converted_defaulted_principal_amount decimal(20, 6),
   defaulted_interest_amount decimal(20, 6),
   write_off_date date,
   write_off_amount decimal(20, 6),
   gross_recovered_amount decimal(20, 6),
   net_recovered_amount decimal(20, 6),
   accrued_interest_amount decimal(20, 6),
   accrued_interests_at_pool_addition_date decimal(20, 6),
   purchase_price decimal(25, 15),
   realized_term integer,
   last_payment_date date,
   maturity_date date,
   first_delay_date date,
   last_delay_date date,
   principal_in_delay decimal(20, 6),
   interest_in_delay decimal(20, 6),
   prepaid_principal_amount decimal(20, 6),
   investment_actual_return decimal(8, 6),
   current_interest_rate_index smallint,
   current_interest_rate_index_tenor smallint,
   index_valuation_date date,
   current_index decimal(7, 6),
   current_interest_rate_margin decimal(7, 6),
   current_interest_rate decimal(7, 6),
   market_value decimal(20, 6),
   prepaid_date date,
   is_prepaid boolean,
   converted_current_principal_balance decimal(20, 6),
   initial_weighted_average_maturity decimal(20, 6),
   converted_purchased_principal_amount decimal(20, 6),
   converted_accrued_interest_amount decimal(20, 6),
   converted_total_funding decimal(25, 15),
   is_secured boolean,
   current_valuation_amount decimal(20, 6),
   days_in_stock smallint,
   depreciation decimal(20, 6),
   is_sold boolean,
   last_market_valuation decimal(20, 6),
   number_of_subscriptions smallint,
   roi decimal(20, 6),
   total_asset_inflow_lifetime decimal(20, 6),
   synchronization_id varchar,
   synchronization_reporting_date date,
   spv_id varchar,
   spv_demo_name varchar,
   spv_name varchar,
   spv_identifier varchar,
   originator_id varchar,
   originator_name varchar,
   originator_identifier varchar,
   initial_rating_1 varchar,
   initial_rating_2 varchar,
   initial_rating_3 varchar,
   current_rating_1 varchar,
   current_rating_2 varchar,
   current_rating_3 varchar,
   realized_net_collections decimal(30, 6),
   realized_recovery_collections decimal(30, 6),
   cumulated_realized_principal decimal(30, 6),
   cumulated_gross_realized_principal decimal(30, 6),
   cumulated_realized_interest decimal(30, 6),
   cumulated_gross_realized_interest decimal(30, 6),
   managed_by_clo boolean,
   amortisation_type smallint,
   recourse boolean,
   higher_ranking_loan decimal(20, 6),
   liens varchar,
   max_amount_covered decimal(20, 6),
   initial_re_collateral_count smallint,
   initial_re_collateral_value decimal(20, 6),
   current_re_collateral_count smallint,
   current_re_collateral_value decimal(20, 6),
   ranking_in_spv integer,
   valuation_ranking_in_spv integer,
   custom_fields map(varchar, varchar),
   initial_investment_valuation_id varchar,
   current_investment_valuation_id varchar,
   post_renovation_valuation_id varchar,
   after_repaired_valuation_id varchar,
   days_since_acquisition smallint,
   created_via_backfill boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_extended_periodic_reports',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investment_periodic_report_esma (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   investment_periodic_report_id varchar,
   account_status smallint,
   prior_principal_balances decimal(20, 6),
   reason_for_default_or_foreclosure smallint,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_periodic_report_esma',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investment_periodic_report_reported_ratings (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   investment_periodic_report_id varchar,
   rating varchar,
   source varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   rank smallint,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_periodic_report_reported_ratings',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investment_periodic_reports (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reporting_date date,
   investment_id varchar,
   purchased_principal_amount decimal(20, 6),
   current_principal_balance decimal(20, 6),
   total_funding decimal(25, 15),
   days_in_delay integer,
   repurchase_date date,
   is_closed boolean,
   performance_status_contractual smallint,
   performance_status smallint,
   repayment_status smallint,
   dissesto boolean,
   investment_forecasted_return decimal(20, 6),
   closing_date date,
   loss_given_default decimal(20, 6),
   contractual_default_date date,
   contractual_defaulted_principal_amount decimal(20, 6),
   converted_contractual_defaulted_principal_amount decimal(20, 6),
   contractual_defaulted_interest_amount decimal(20, 6),
   contractual_accrued_interest_amount_on_default decimal(20, 6),
   default_date date,
   defaulted_principal_amount decimal(20, 6),
   converted_defaulted_principal_amount decimal(20, 6),
   defaulted_interest_amount decimal(20, 6),
   write_off_date date,
   write_off_amount decimal(20, 6),
   gross_recovered_amount decimal(20, 6),
   net_recovered_amount decimal(20, 6),
   accrued_interest_amount decimal(20, 6),
   accrued_interests_at_pool_addition_date decimal(20, 6),
   purchase_price decimal(25, 15),
   remaining_term integer,
   asset_age integer,
   realized_term integer,
   last_payment_date date,
   maturity_date date,
   residual_weighted_average_maturity decimal(20, 6),
   first_delay_date date,
   last_delay_date date,
   principal_in_delay decimal(20, 6),
   interest_in_delay decimal(20, 6),
   prepaid_principal_amount decimal(20, 6),
   investment_actual_return decimal(8, 6),
   current_interest_rate_index smallint,
   current_interest_rate_index_tenor smallint,
   index_valuation_date date,
   current_index decimal(7, 6),
   current_interest_rate_margin decimal(7, 6),
   current_interest_rate decimal(7, 6),
   market_value decimal(20, 6),
   prepaid_date date,
   is_prepaid boolean,
   converted_current_principal_balance decimal(20, 6),
   initial_weighted_average_maturity decimal(20, 6),
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   converted_purchased_principal_amount decimal(20, 6),
   converted_accrued_interest_amount decimal(20, 6),
   converted_total_funding decimal(25, 15),
   is_secured boolean,
   current_valuation_amount decimal(20, 6),
   days_in_stock smallint,
   depreciation decimal(20, 6),
   is_sold boolean,
   last_market_valuation decimal(20, 6),
   number_of_subscriptions smallint,
   roi decimal(20, 6),
   total_asset_inflow_lifetime decimal(20, 6),
   originator_id varchar,
   spv_id varchar,
   custom_fields map(varchar, varchar),
   apr decimal(7, 6),
   prepayment_lock_out_end_date date,
   interest_revision_date date,
   interest_rate_after_revision decimal(7, 6),
   ltv decimal(7, 6),
   sale_currency_id varchar,
   sale_price decimal(20, 6),
   sale_date date,
   vat_at_sale decimal(20, 6),
   fees_on_sale decimal(20, 6),
   vat_at_purchase decimal(20, 6),
   fees_on_purchase decimal(20, 6),
   closing_cost_on_purchase decimal(20, 6),
   credit_repair_fee decimal(20, 6),
   seller_credit decimal(20, 6),
   sale_costs decimal(20, 6),
   rank decimal(7, 6),
   created_via_backfill boolean,
   write_off_principal_amount decimal(20, 6),
   write_off_interest_amount decimal(20, 6),
   hardship_amount decimal(20, 6),
   hardship_first_payment_date date,
   hardship_flag boolean,
   hardship_last_payment_date date,
   write_off_reason varchar,
   current_principal_interest_bearing_amount decimal(20, 6),
   current_purchase_principal_amount decimal(20, 6),
   current_cash_advance_principal_amount decimal(20, 6),
   current_balance_transfer_principal_amount decimal(20, 6),
   accrued_purchase_interest_amount decimal(20, 6),
   accrued_cash_advance_interest_amount decimal(20, 6),
   accrued_balance_transfer_amount decimal(20, 6),
   accrued_annual_fees decimal(20, 6),
   accrued_late_fees decimal(20, 6),
   accrued_other_fees decimal(20, 6),
   contractual_defaulted_fees_amount decimal(20, 6),
   fees_in_delay decimal(20, 6),
   current_cash_advance_interest_rate decimal(20, 6),
   current_balance_transfer_interest_rate decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_periodic_reports',
   partitioned_by = ARRAY['created_via_backfill','originator_id','spv_id']
);

CREATE TABLE investment_realized_cash_flows (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reference_date date,
   identifier varchar,
   type smallint,
   synchronization_id varchar,
   investment_id varchar,
   effective_amount decimal(20, 6),
   details varchar,
   recovery_source varchar,
   currency_id varchar,
   updated_by_synchronization_id varchar,
   converted_effective_amount decimal(20, 6),
   subscription_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_realized_cash_flows',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investment_valuations (
   investment_id varchar,
   spv_id varchar,
   originator_id varchar,
   id varchar,
   reference_date date,
   value decimal(20, 6),
   type smallint,
   provider varchar,
   is_after_repaired boolean,
   is_after_renovation boolean,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   currency_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investment_valuations',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investments (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   asset_id varchar,
   spv_id varchar,
   last_periodic_report_id varchar,
   pool_addition_date date,
   originator_identifier varchar,
   initial_expected_return decimal(7, 6),
   number_of_payments_before_securitization integer,
   original_maturity_date date,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   investment_type smallint,
   is_proposed boolean,
   asset_manager varchar,
   reference_asset varchar,
   originator_id varchar,
   original_ltv decimal(20, 6),
   first_realized_payment_date date,
   custom_fields map(varchar, varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investments',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE investments_enforcement_procedures (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   investment_id varchar,
   enforcement_procedure_id varchar,
   synchronization_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/investments_enforcement_procedures',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE lenders (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   legal_entity_identifier varchar,
   establishment_country_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/lenders',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE originators (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   legal_entity_identifier varchar,
   identifier varchar,
   synced_through_mercury boolean,
   originator_icon varchar,
   establishment_country_id varchar,
   full_name varchar,
   contact_emails array(varchar),
   synced_through_oxygen boolean,
   oxygen_identifier varchar,
   supports_new_asset_integration boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/originators'
);

CREATE TABLE other_creditors_prior_liens (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   collateral_id varchar,
   lien smallint,
   higher_ranking_underlying_exposure decimal(20, 6),
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/other_creditors_prior_liens',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE proposals (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   status smallint,
   proposed_date timestamp(3) with time zone,
   approval_date timestamp(3) with time zone,
   funding_date timestamp(3) with time zone,
   funding_amount decimal(20, 6),
   sync_job_id varchar,
   waterfall_execution_id varchar,
   error_message varchar,
   applied_row_level integer,
   spv_id varchar,
   statistics map(varchar, varchar),
   created_by_id varchar,
   running_status smallint,
   originator_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/proposals',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE real_estate_asset_history (
   id varchar,
   asset_id varchar,
   property_type smallint,
   property_address varchar,
   property_postal_code varchar,
   source_type smallint,
   year_built integer,
   cadastrial_type varchar,
   cadastrial_sheet varchar,
   cadastrial_map varchar,
   cadastrial_data varchar,
   value_of_energy_performance_certificate array(smallint),
   provider_of_energy_performance_certificate varchar,
   year_initial_renovated integer,
   year_last_renovated integer,
   rooms integer,
   beds integer,
   baths integer,
   interior_level smallint,
   nr_units integer,
   area_unit smallint,
   total_surface decimal(20, 6),
   commercial_area decimal(20, 6),
   residential_area decimal(20, 6),
   external_area decimal(20, 6),
   occupied_area decimal(20, 6),
   is_net_internal_floor_area_validated boolean,
   geography_id varchar,
   property_description varchar,
   re_asset_status smallint,
   occupancy_type smallint,
   property_condition smallint,
   start_date_of_lease date,
   end_date_of_lease date,
   lease_break_option boolean,
   lease_type smallint,
   current_annual_passing_rent decimal(20, 6),
   last_rent_review_date date,
   next_rent_review_date date,
   estimated_capex_costs decimal(20, 6),
   renovation_starting_date date,
   renovation_completing_date date,
   actual_capex_costs decimal(20, 6),
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   synchronization_id varchar,
   is_broker_appointed boolean,
   broker_name varchar,
   broker_date date,
   updated_by_synchronization_id varchar,
   valid_until date,
   originator_id varchar,
   spv_id varchar,
   housing_type smallint,
   is_leased boolean,
   latitude decimal(20, 15),
   longitude decimal(20, 15),
   asset_actual_return decimal(20, 6),
   asset_repayment_status varchar,
   asset_value decimal(20, 6),
   other_balance decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/real_estate_asset_history',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE real_estate_assets (
   asset_class smallint,
   id varchar,
   asset_type smallint,
   property_type smallint,
   property_address varchar,
   property_postal_code varchar,
   source_type smallint,
   year_built integer,
   cadastrial_type varchar,
   cadastrial_sheet varchar,
   cadastrial_map varchar,
   cadastrial_data varchar,
   value_of_energy_performance_certificate array(smallint),
   provider_of_energy_performance_certificate varchar,
   year_initial_renovated integer,
   year_last_renovated integer,
   rooms integer,
   beds integer,
   baths integer,
   interior_level smallint,
   nr_units integer,
   area_unit smallint,
   total_surface decimal(20, 6),
   commercial_area decimal(20, 6),
   residential_area decimal(20, 6),
   external_area decimal(20, 6),
   occupied_area decimal(20, 6),
   is_net_internal_floor_area_validated boolean,
   geography_id varchar,
   property_description varchar,
   re_asset_status smallint,
   occupancy_type smallint,
   property_condition smallint,
   start_date_of_lease date,
   end_date_of_lease date,
   lease_break_option boolean,
   lease_type smallint,
   current_annual_passing_rent decimal(20, 6),
   last_rent_review_date date,
   next_rent_review_date date,
   estimated_capex_costs decimal(20, 6),
   renovation_starting_date date,
   renovation_completing_date date,
   actual_capex_costs decimal(20, 6),
   is_broker_appointed boolean,
   broker_name varchar,
   broker_date date,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   housing_type smallint,
   is_leased boolean,
   latitude decimal(20, 15),
   longitude decimal(20, 15)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/real_estate_assets',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE real_estate_extended_assets (
   real_estate_id varchar,
   originator_id varchar,
   spv_id varchar,
   debtor_id varchar,
   real_estate_identifier varchar,
   lien varchar,
   rge_identifiers varchar,
   asset_manager varchar,
   deadline_mortgage date,
   city_name varchar,
   region_name varchar,
   country_name varchar,
   synchronization_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/real_estate_extended_assets',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE real_estate_extended_periodic_reports (
   real_estate_id varchar,
   collateral_periodic_report_id varchar,
   synchronization_reporting_date date,
   spv_id varchar,
   spv_identifier varchar,
   originator_id varchar,
   acts_as_collateral boolean,
   acts_as_investment boolean,
   nr_initial_assets_covered_by_re_collateral integer,
   initial_re_collateral_value decimal(20, 6),
   re_purchased_principal_amount decimal(20, 6),
   re_current_principal_balance decimal(20, 6),
   initial_re_valuation_date date,
   nr_current_assets_covered_by_re_collateral integer,
   current_re_collateral_value decimal(20, 6),
   current_re_valuation_date date,
   initial_re_valuation_type smallint,
   current_re_valuation_type smallint,
   open_market_value decimal(20, 6),
   judicial_market_value decimal(20, 6),
   market_value_provider varchar,
   ctu_amount decimal(20, 6),
   ctu_date date,
   property_description varchar,
   re_asset_status smallint,
   property_condition smallint,
   occupancy_type smallint,
   start_date_of_lease date,
   end_date_of_lease date,
   lease_break_option boolean,
   current_annual_passing_rent decimal(20, 6),
   current_capex decimal(20, 6),
   current_opex decimal(20, 6),
   acquisition_fees decimal(20, 6),
   acquisition_closing_costs decimal(20, 6),
   expected_renovation_costs decimal(20, 6),
   realized_renovation_costs decimal(20, 6),
   enforcement_primary_investment_id varchar,
   procedure_stage smallint,
   synchronization_id varchar,
   is_leased boolean,
   estimated_sale_date date,
   created_via_backfill boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/real_estate_extended_periodic_reports',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE retrieve_results (
   external_job_id varchar,
   results varchar,
   sync_job_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/retrieve_results',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE sector (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   standard smallint,
   level smallint,
   standard_label varchar,
   english_label varchar,
   code varchar,
   parent_id varchar,
   top_parent_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/sector'
);

CREATE TABLE sector_info (
   id varchar,
   borrower_sector_name varchar,
   borrower_sector_code varchar,
   borrower_sector_standard smallint,
   borrower_macro_sector_name varchar,
   borrower_macro_sector_code varchar,
   borrower_macro_sector_standard smallint
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/sector_info'
);

CREATE TABLE sector_relation (
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   id varchar,
   from_sector_id varchar,
   to_sector_id varchar,
   to_standard integer
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/sector_relation'
);

CREATE TABLE simulation_job (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   simulation_name varchar,
   reference_date date,
   cluster_type smallint,
   interest_rate_curve array(decimal(7, 6)),
   interest_rate_frequency smallint,
   deleted boolean,
   spv_id varchar,
   step smallint,
   status smallint,
   error_message varchar,
   start_period smallint,
   created_by_id varchar,
   realized_cash_flow_amount decimal(20, 6),
   notes_interest_rate array(decimal(7, 6)),
   notes_discount_rate array(decimal(7, 6)),
   notes_reference_date date,
   organization_name varchar,
   liabilities_inputs varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/simulation_job'
);

CREATE TABLE simulation_job_statistics (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reference_date date,
   portfolio_expected_cash_flow decimal(20, 6),
   portfolio_expected_installment_cash_flow decimal(20, 6),
   portfolio_expected_recovery_cash_flow decimal(20, 6),
   portfolio_expected_prepayment_cash_flow decimal(20, 6),
   portfolio_expected_default_cash_flow decimal(20, 6),
   portfolio_expected_principal_cash_flow decimal(20, 6),
   portfolio_expected_interest_cash_flow decimal(20, 6),
   simulation_job_id varchar,
   portfolio_expected_total_principal_cash_flow decimal(20, 6),
   portfolio_exp_delinquency_cash_flow decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/simulation_job_statistics'
);

CREATE TABLE simulation_output (
   reference_date date,
   cash_flow decimal(20, 6),
   installment_cash_flow decimal(20, 6),
   recovery_cash_flow decimal(20, 6),
   prepayment_cash_flow decimal(20, 6),
   default_cash_flow decimal(20, 6),
   delinquency_cash_flow decimal(20, 6),
   principal_cash_flow decimal(20, 6),
   interest_cash_flow decimal(20, 6),
   total_principal_cash_flow decimal(20, 6),
   simulation_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/simulation_output',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_cash_account_periodic_reports (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reporting_date date,
   cash_account_id varchar,
   current_amount decimal(20, 6),
   converted_current_amount decimal(20, 6),
   required_amount decimal(20, 6),
   converted_required_amount decimal(20, 6),
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   balance_reference_date date,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_cash_account_periodic_reports',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_cash_accounts (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   spv_id varchar,
   identifier varchar,
   type smallint,
   cover_type smallint,
   rank smallint,
   currency_id varchar,
   description varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   last_periodic_report_id varchar,
   amortising_account boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_cash_accounts',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_cash_flows (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reference_date date,
   identifier varchar,
   spv_id varchar,
   type smallint,
   effective_amount decimal(20, 6),
   converted_effective_amount decimal(20, 6),
   details varchar,
   liability_id varchar,
   cash_account_id varchar,
   currency_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   esma_cashflow_id varchar,
   waterfall_execution_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_cash_flows',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_counterparties (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   legal_entity_identifier varchar,
   spv_id varchar,
   establishment_country_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   custom_fields map(varchar, varchar),
   last_log_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_counterparties',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_counterparty_logs (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   custom_fields map(varchar, varchar),
   counterparty_id varchar,
   reference_date date,
   name varchar,
   legal_entity_identifier varchar,
   establishment_country_id varchar,
   notes varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_counterparty_logs',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_counterparty_roles (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   spv_counterparty_id varchar,
   type smallint,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_counterparty_roles',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_liabilities (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   spv_id varchar,
   identifier varchar,
   type smallint,
   name varchar,
   currency_id varchar,
   seniority smallint,
   rank smallint,
   issue_date date,
   max_amount decimal(20, 6),
   maturity_date date,
   coupon_type smallint,
   year_base smallint,
   amortization_type smallint,
   description varchar,
   isin_code varchar,
   interest_rate_index smallint,
   interest_rate_index_tenor smallint,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   last_periodic_report_id varchar,
   class_name varchar,
   settlement_convention smallint,
   custom_fields map(varchar, varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_liabilities',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_liability_periodic_reports (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reporting_date date,
   liability_id varchar,
   outstanding_principal_amount decimal(20, 6),
   converted_outstanding_principal_amount decimal(20, 6),
   current_interest_rate decimal(7, 6),
   accrued_interest_amount decimal(20, 6),
   cumulated_unpaid_interest_amount decimal(20, 6),
   current_oc decimal(10, 6),
   current_interest_rate_margin decimal(7, 6),
   fx_to_base double,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   attachment_point decimal(7, 6),
   detachment_point decimal(7, 6),
   rating varchar,
   current_interest_rate_index_value decimal(7, 6),
   accrued_principal_amount decimal(20, 6),
   spv_id varchar,
   custom_fields map(varchar, varchar),
   current_maturity_date date,
   current_interest_rate_index smallint,
   price decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_liability_periodic_reports',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_monthly_performance (
   spv_id varchar,
   spv_identifier varchar,
   period_start date,
   period_end date,
   standard_performing_assets integer,
   standard_delinquent_assets integer,
   standard_default_assets integer,
   standard_other_assets integer,
   contractual_performing_assets integer,
   contractual_delinquent_assets integer,
   contractual_default_assets integer,
   contractual_other_assets integer,
   total_asset_count integer,
   periodic_prepaid_amount decimal(20, 6),
   cumulative_prepaid_amount decimal(20, 6),
   annualized_cpr decimal(20, 6),
   delinquent_balance_1_29 decimal(20, 6),
   delinquent_balance_30_59 decimal(20, 6),
   delinquent_balance_60_89 decimal(20, 6),
   delinquent_balance_90_119 decimal(20, 6),
   delinquent_balance_120_up decimal(20, 6),
   standard_performing_balance decimal(20, 6),
   standard_delinquent_balance decimal(20, 6),
   standard_default_balance decimal(20, 6),
   standard_other_balance decimal(20, 6),
   contractual_performing_balance decimal(20, 6),
   contractual_delinquent_balance decimal(20, 6),
   contractual_default_balance decimal(20, 6),
   contractual_other_balance decimal(20, 6),
   balance_in_delay decimal(20, 6),
   balance_in_delay_1_29 decimal(20, 6),
   balance_in_delay_30_59 decimal(20, 6),
   balance_in_delay_60_89 decimal(20, 6),
   balance_in_delay_90_119 decimal(20, 6),
   balance_in_delay_120_up decimal(20, 6),
   total_current_balance decimal(20, 6),
   cumulative_contractual_default_amount decimal(20, 6),
   cumulative_standard_default_amount decimal(20, 6),
   purchased_principal_amount decimal(20, 6),
   periodic_contractual_default_amount decimal(20, 6),
   periodic_standard_default_amount decimal(20, 6),
   contractual_non_defaulted_principal_balance decimal(20, 6),
   standard_non_defaulted_principal_balance decimal(20, 6),
   contractual_annualized_cdr decimal(20, 6),
   standard_annualized_cdr decimal(20, 6),
   converted_standard_performing_balance decimal(20, 6),
   converted_standard_delinquent_balance decimal(20, 6),
   converted_standard_default_balance decimal(20, 6),
   converted_standard_other_balance decimal(20, 6),
   converted_contractual_performing_balance decimal(20, 6),
   converted_contractual_delinquent_balance decimal(20, 6),
   converted_contractual_default_balance decimal(20, 6),
   converted_contractual_other_balance decimal(20, 6),
   converted_balance_in_delay decimal(20, 6),
   converted_balance_in_delay_1_29 decimal(20, 6),
   converted_balance_in_delay_30_59 decimal(20, 6),
   converted_balance_in_delay_60_89 decimal(20, 6),
   converted_balance_in_delay_90_119 decimal(20, 6),
   converted_balance_in_delay_120_up decimal(20, 6),
   converted_total_current_balance decimal(20, 6),
   converted_cumulative_contractual_default_amount decimal(20, 6),
   converted_cumulative_standard_default_amount decimal(20, 6),
   converted_purchased_principal_amount decimal(20, 6),
   converted_periodic_contractual_default_amount decimal(20, 6),
   converted_periodic_standard_default_amount decimal(20, 6),
   converted_contractual_non_defaulted_principal_balance decimal(20, 6),
   converted_standard_non_defaulted_principal_balance decimal(20, 6),
   converted_contractual_annualized_cdr decimal(20, 6),
   converted_standard_annualized_cdr decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_monthly_performance',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_periodic_reports (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reporting_date date,
   spv_id varchar,
   collection_period_start_date date,
   collection_period_end_date date,
   notes_collateral_delta decimal(8, 6),
   current_waterfall_type smallint,
   collections_and_recoveries decimal(20, 6),
   amortizing_fees decimal(20, 6),
   total_costs decimal(20, 6),
   interest_period_start_date date,
   interest_period_end_date date,
   trigger_ratios boolean,
   drawing_under_liquidity_facility boolean,
   excess_spread decimal(20, 6),
   excess_spread_trapping_mechanism boolean,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   issuer_available_fund decimal(20, 6),
   extension_clause smallint
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_periodic_reports',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_periodic_statistics (
   synchronization_id varchar,
   spv_id varchar,
   spv_identifier varchar,
   reporting_date date,
   cumulative_expected_amount decimal(30, 6),
   converted_cumulative_expected_amount decimal(30, 6),
   cumulative_realized_amount decimal(30, 6),
   converted_cumulative_realized_amount decimal(30, 6),
   future_expected_amount decimal(30, 6),
   future_expected_principal decimal(30, 6),
   future_expected_interest decimal(30, 6),
   realized_principal decimal(30, 6),
   realized_interest decimal(30, 6),
   realized_recovery decimal(30, 6),
   realized_other_amounts decimal(30, 6),
   avg_recovery_rate decimal(30, 6),
   avg_recovery_lag decimal(30, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_periodic_statistics',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_quarterly_performance (
   spv_id varchar,
   spv_identifier varchar,
   period_start date,
   period_end date,
   standard_performing_assets integer,
   standard_delinquent_assets integer,
   standard_default_assets integer,
   standard_other_assets integer,
   contractual_performing_assets integer,
   contractual_delinquent_assets integer,
   contractual_default_assets integer,
   contractual_other_assets integer,
   total_asset_count integer,
   periodic_prepaid_amount decimal(20, 6),
   cumulative_prepaid_amount decimal(20, 6),
   annualized_cpr decimal(20, 6),
   delinquent_balance_1_29 decimal(20, 6),
   delinquent_balance_30_59 decimal(20, 6),
   delinquent_balance_60_89 decimal(20, 6),
   delinquent_balance_90_119 decimal(20, 6),
   delinquent_balance_120_up decimal(20, 6),
   standard_performing_balance decimal(20, 6),
   standard_delinquent_balance decimal(20, 6),
   standard_default_balance decimal(20, 6),
   standard_other_balance decimal(20, 6),
   contractual_performing_balance decimal(20, 6),
   contractual_delinquent_balance decimal(20, 6),
   contractual_default_balance decimal(20, 6),
   contractual_other_balance decimal(20, 6),
   balance_in_delay decimal(20, 6),
   balance_in_delay_1_29 decimal(20, 6),
   balance_in_delay_30_59 decimal(20, 6),
   balance_in_delay_60_89 decimal(20, 6),
   balance_in_delay_90_119 decimal(20, 6),
   balance_in_delay_120_up decimal(20, 6),
   total_current_balance decimal(20, 6),
   cumulative_contractual_default_amount decimal(20, 6),
   cumulative_standard_default_amount decimal(20, 6),
   purchased_principal_amount decimal(20, 6),
   periodic_contractual_default_amount decimal(20, 6),
   periodic_standard_default_amount decimal(20, 6),
   contractual_non_defaulted_principal_balance decimal(20, 6),
   standard_non_defaulted_principal_balance decimal(20, 6),
   contractual_annualized_cdr decimal(20, 6),
   standard_annualized_cdr decimal(20, 6),
   converted_standard_performing_balance decimal(20, 6),
   converted_standard_delinquent_balance decimal(20, 6),
   converted_standard_default_balance decimal(20, 6),
   converted_standard_other_balance decimal(20, 6),
   converted_contractual_performing_balance decimal(20, 6),
   converted_contractual_delinquent_balance decimal(20, 6),
   converted_contractual_default_balance decimal(20, 6),
   converted_contractual_other_balance decimal(20, 6),
   converted_balance_in_delay decimal(20, 6),
   converted_balance_in_delay_1_29 decimal(20, 6),
   converted_balance_in_delay_30_59 decimal(20, 6),
   converted_balance_in_delay_60_89 decimal(20, 6),
   converted_balance_in_delay_90_119 decimal(20, 6),
   converted_balance_in_delay_120_up decimal(20, 6),
   converted_total_current_balance decimal(20, 6),
   converted_cumulative_contractual_default_amount decimal(20, 6),
   converted_cumulative_standard_default_amount decimal(20, 6),
   converted_purchased_principal_amount decimal(20, 6),
   converted_periodic_contractual_default_amount decimal(20, 6),
   converted_periodic_standard_default_amount decimal(20, 6),
   converted_contractual_non_defaulted_principal_balance decimal(20, 6),
   converted_standard_non_defaulted_principal_balance decimal(20, 6),
   converted_contractual_annualized_cdr decimal(20, 6),
   converted_standard_annualized_cdr decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_quarterly_performance',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_trigger_periodic_reports (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reporting_date date,
   trigger_id varchar,
   current_value double,
   executed boolean,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_trigger_periodic_reports',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_triggers (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   spv_id varchar,
   identifier varchar,
   parameter_type smallint,
   parameter_description varchar,
   threshold double,
   trigger_consequence smallint,
   cure_period smallint,
   calculation_frequency smallint,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   last_periodic_report_id varchar,
   esma_identifier varchar,
   name varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_triggers',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spv_yearly_performance (
   spv_id varchar,
   spv_identifier varchar,
   period_start date,
   period_end date,
   standard_performing_assets integer,
   standard_delinquent_assets integer,
   standard_default_assets integer,
   standard_other_assets integer,
   contractual_performing_assets integer,
   contractual_delinquent_assets integer,
   contractual_default_assets integer,
   contractual_other_assets integer,
   total_asset_count integer,
   periodic_prepaid_amount decimal(20, 6),
   cumulative_prepaid_amount decimal(20, 6),
   annualized_cpr decimal(20, 6),
   delinquent_balance_1_29 decimal(20, 6),
   delinquent_balance_30_59 decimal(20, 6),
   delinquent_balance_60_89 decimal(20, 6),
   delinquent_balance_90_119 decimal(20, 6),
   delinquent_balance_120_up decimal(20, 6),
   standard_performing_balance decimal(20, 6),
   standard_delinquent_balance decimal(20, 6),
   standard_default_balance decimal(20, 6),
   standard_other_balance decimal(20, 6),
   contractual_performing_balance decimal(20, 6),
   contractual_delinquent_balance decimal(20, 6),
   contractual_default_balance decimal(20, 6),
   contractual_other_balance decimal(20, 6),
   balance_in_delay decimal(20, 6),
   balance_in_delay_1_29 decimal(20, 6),
   balance_in_delay_30_59 decimal(20, 6),
   balance_in_delay_60_89 decimal(20, 6),
   balance_in_delay_90_119 decimal(20, 6),
   balance_in_delay_120_up decimal(20, 6),
   total_current_balance decimal(20, 6),
   cumulative_contractual_default_amount decimal(20, 6),
   cumulative_standard_default_amount decimal(20, 6),
   purchased_principal_amount decimal(20, 6),
   periodic_contractual_default_amount decimal(20, 6),
   periodic_standard_default_amount decimal(20, 6),
   contractual_non_defaulted_principal_balance decimal(20, 6),
   standard_non_defaulted_principal_balance decimal(20, 6),
   contractual_annualized_cdr decimal(20, 6),
   standard_annualized_cdr decimal(20, 6),
   converted_standard_performing_balance decimal(20, 6),
   converted_standard_delinquent_balance decimal(20, 6),
   converted_standard_default_balance decimal(20, 6),
   converted_standard_other_balance decimal(20, 6),
   converted_contractual_performing_balance decimal(20, 6),
   converted_contractual_delinquent_balance decimal(20, 6),
   converted_contractual_default_balance decimal(20, 6),
   converted_contractual_other_balance decimal(20, 6),
   converted_balance_in_delay decimal(20, 6),
   converted_balance_in_delay_1_29 decimal(20, 6),
   converted_balance_in_delay_30_59 decimal(20, 6),
   converted_balance_in_delay_60_89 decimal(20, 6),
   converted_balance_in_delay_90_119 decimal(20, 6),
   converted_balance_in_delay_120_up decimal(20, 6),
   converted_total_current_balance decimal(20, 6),
   converted_cumulative_contractual_default_amount decimal(20, 6),
   converted_cumulative_standard_default_amount decimal(20, 6),
   converted_purchased_principal_amount decimal(20, 6),
   converted_periodic_contractual_default_amount decimal(20, 6),
   converted_periodic_standard_default_amount decimal(20, 6),
   converted_contractual_non_defaulted_principal_balance decimal(20, 6),
   converted_standard_non_defaulted_principal_balance decimal(20, 6),
   converted_contractual_annualized_cdr decimal(20, 6),
   converted_standard_annualized_cdr decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spv_yearly_performance',
   partitioned_by = ARRAY['spv_id']
);

CREATE TABLE spvs (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   identifier varchar,
   asset_class smallint,
   contains_npl boolean,
   reference_currency_id varchar,
   contractual_payment_frequency smallint,
   esma_identifier varchar,
   reporting_entity_name varchar,
   reporting_entity_contact_person varchar,
   reporting_entity_contact_telephone varchar,
   reporting_entity_contact_emails varchar,
   risk_transfer_method boolean,
   risk_weight_approach smallint,
   risk_retention_method smallint,
   risk_retention_holder smallint,
   revolving_period_end date,
   last_reported_on date,
   initial_oc decimal(20, 6),
   last_periodic_report_id varchar,
   documents_identifier varchar,
   limits_identifier varchar,
   demo_name varchar,
   monthly_limits boolean,
   securitisation_name varchar,
   perfection_of_sale boolean,
   current_equalizer_vehicle_id integer,
   esma_required boolean,
   annex_14 boolean,
   data_surveillance_identifier varchar,
   first_payment_date date,
   first_collection_period_end_date date,
   supports_subscription boolean,
   supports_transaction_manager boolean,
   contains_re_collaterals boolean,
   strategy varchar,
   structure varchar,
   risk_transfer varchar,
   contact_email varchar,
   ramp_up_period_end date,
   next_payment_date date,
   supporting_configs map(varchar, varchar),
   supports_waterfall boolean,
   description varchar,
   supported_reports array(smallint),
   investment_asset_types array(smallint),
   collateral_asset_types array(smallint),
   investment_types array(smallint),
   abbreviation varchar,
   parent_id varchar,
   material_contractual_amendment varchar,
   custom_fields map(varchar, varchar),
   supports_transaction boolean,
   asset_table_results_created boolean,
   demo_asset_table_results_created boolean,
   simulation_model smallint,
   supports_amortization_plan_updates boolean,
   is_pre_deal boolean,
   reinvestment_settings map(varchar, varchar),
   ramp_up_settings map(varchar, varchar),
   latest_asset_synchronization_date date,
   latest_payment_report_synchronization_date date,
   establishment_date date,
   termination_date date,
   realized_cash_flow_amount decimal(20, 6),
   waterfall_template_id varchar,
   index_tenor_interest array(varchar),
   amortization_types array(smallint),
   should_recompute_amortization_plan boolean,
   defaulted_principal_amount decimal(20, 6),
   performing_principal_amount decimal(20, 6),
   purchase_principal_amount decimal(20, 6),
   issue_amount decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/spvs',
   partitioned_by = ARRAY['id']
);

CREATE TABLE standardization_results (
   external_job_id varchar,
   results varchar,
   sync_job_id varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/standardization_results',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE statistics_query_results (
   id varchar NOT NULL,
   proposal_id varchar NOT NULL,
   query_configuration_id varchar NOT NULL,
   results varchar NOT NULL,
   version integer NOT NULL,
   created_at timestamp(6) NOT NULL,
   updated_at timestamp(6) NOT NULL
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/statistics_query_results'
);

CREATE TABLE subscription_daily_reports (
   subscription_id varchar,
   reporting_date date,
   subscription_periodic_report_id varchar,
   synchronization_id varchar,
   spv_id varchar,
   originator_id varchar,
   reporting_year integer,
   reporting_month integer
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/subscription_daily_reports',
   partitioned_by = ARRAY['originator_id','spv_id','reporting_year','reporting_month']
);

CREATE TABLE subscription_periodic_reports (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   reporting_date date,
   subscription_id varchar,
   revenue_paid decimal(20, 6),
   subscription_amount decimal(20, 6),
   other_revenue_paid decimal(20, 6),
   maturity_date date,
   committed_duration smallint,
   current_duration smallint,
   effective_duration smallint,
   remaining_duration smallint,
   revenue_due decimal(20, 6),
   revenue_due_total decimal(20, 6),
   committed_subscription_value decimal(20, 6),
   current_principal_balance decimal(20, 6),
   performance_status smallint,
   days_in_delay integer,
   customer_type smallint,
   customer_acquisition_channel varchar,
   is_prepaid boolean,
   is_closed boolean,
   remaining_term smallint,
   realized_term smallint,
   last_payment_date date,
   contractual_default_principal_amount decimal(20, 6),
   contractual_default_interest_amount decimal(20, 6),
   default_principal_amount decimal(20, 6),
   default_interest_amount decimal(20, 6),
   default_date date,
   write_off_amount decimal(20, 6),
   write_off_date date,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   spv_id varchar,
   expenses_due decimal(20, 6),
   expenses_due_total decimal(20, 6),
   ending_expiration_date date,
   renewal_period varchar,
   expenses_paid decimal(20, 6),
   closing_date date,
   custom_fields map(varchar, varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/subscription_periodic_reports',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE subscriptions (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   investment_id varchar,
   originator_identifier varchar,
   currency_id varchar,
   type smallint,
   start_date date,
   plan varchar,
   committed_duration smallint,
   committed_subscription_value decimal(20, 6),
   debtor_company_id varchar,
   debtor_individual_id varchar,
   last_periodic_report_id varchar,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   spv_id varchar,
   custom_fields map(varchar, varchar)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/subscriptions',
   partitioned_by = ARRAY['spv_id','originator_id']
);

CREATE TABLE sync_job_resources (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   sync_job_id varchar,
   sync_resource_id varchar,
   path varchar,
   original_file_name varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/sync_job_resources'
);

CREATE TABLE sync_jobs (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   synchronization_account_id varchar,
   sync_type smallint,
   reference_date date,
   step smallint,
   status smallint,
   completed_at timestamp(3) with time zone,
   error_message varchar,
   created_by_id varchar,
   execute_automatically_on_dhc_success boolean,
   originator_id varchar,
   spv_id varchar,
   created_via_backfill boolean,
   waterfall_execution_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/sync_jobs',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE synchronization_accounts (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   spv_id varchar,
   sync_type smallint,
   originator_id varchar,
   estimated_sync_time double,
   estimated_data_health_check_time double,
   retriever_identifier varchar,
   dhc_identifier varchar,
   standardization_identifier varchar,
   sync_automatically boolean,
   retriever_job_parameters varchar,
   minute_of_the_hour varchar,
   hour_of_the_day varchar,
   day_of_the_month varchar,
   day_of_the_week varchar,
   month_of_the_year varchar,
   mercury_originator_instance_id integer,
   automatic_sync_frequency smallint,
   contact_emails array(varchar),
   notify_on_dhc_failure boolean,
   in_jobs_rollback boolean,
   rolling_back_to_sync_job_id varchar,
   has_single_sync_job boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/synchronization_accounts'
);

CREATE TABLE table_query_results (
   id varchar,
   proposal_id varchar,
   query_configuration_id varchar,
   version integer,
   results varchar,
   created_at timestamp(6),
   updated_at timestamp(6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/table_query_results'
);

CREATE TABLE user_input_results (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   value varchar,
   proposal_id varchar,
   user_input_id varchar,
   sync_job_id varchar,
   suggested_value varchar,
   originator_id varchar,
   spv_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/user_input_results',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE user_inputs (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   identifier varchar,
   "order" smallint,
   description varchar,
   data_type smallint,
   section_id varchar,
   suggestion_query_id varchar,
   action_type smallint
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/user_inputs'
);

CREATE TABLE vehicle_asset_history (
   id varchar,
   asset_id varchar,
   book_value decimal(20, 6),
   distance integer,
   asset_depreciation decimal(20, 6),
   depreciation_frequency smallint,
   depreciation_percentage decimal(7, 6),
   fuel_type smallint,
   vehicle_color varchar,
   registration_date date,
   energy_performance_certificate_value smallint,
   energy_performance_certificate_provider_name varchar,
   valid_until date,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   originator_id varchar,
   spv_id varchar,
   asset_actual_return decimal(20, 6),
   asset_repayment_status varchar,
   asset_value decimal(20, 6),
   other_balance decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/vehicle_asset_history',
   partitioned_by = ARRAY['originator_id','spv_id']
);

CREATE TABLE vehicle_assets (
   id varchar,
   originator_id varchar,
   asset_class smallint,
   oem_identifier varchar,
   oem varchar,
   vehicle_identification_number varchar,
   model varchar,
   year_of_registration integer,
   condition smallint,
   measurement_unit smallint,
   distance_at_purchase integer,
   category smallint,
   product_type smallint,
   original_residual_value_of_vehicle decimal(20, 6),
   option_to_buy_price decimal(20, 6),
   book_value decimal(20, 6),
   distance integer,
   asset_depreciation decimal(20, 6),
   depreciation_frequency smallint,
   depreciation_percentage decimal(7, 6),
   fuel_type smallint,
   vehicle_color varchar,
   registration_date date,
   energy_performance_certificate_value smallint,
   energy_performance_certificate_provider_name varchar,
   number_of_leases integer,
   synchronization_id varchar,
   updated_by_synchronization_id varchar,
   book_value_at_purchase decimal(20, 6)
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/vehicle_assets',
   partitioned_by = ARRAY['originator_id']
);

CREATE TABLE waterfall_available_funds (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   formula varchar,
   simulation_formula varchar,
   parent_id varchar,
   identifier varchar,
   total_amount decimal(25, 15),
   spv_cash_account_id varchar,
   last_result_id varchar,
   currency_id varchar,
   description varchar,
   last_simulation_result_id varchar,
   is_deleted boolean,
   "order" integer,
   payment_section_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_available_funds'
);

CREATE TABLE waterfall_available_funds_history (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   valid_until date,
   name varchar,
   formula varchar,
   available_funds_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_available_funds_history'
);

CREATE TABLE waterfall_available_funds_results (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   available_funds_id varchar,
   waterfall_execution_id varchar,
   name varchar,
   amount decimal(25, 15),
   is_overridden boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_available_funds_results'
);

CREATE TABLE waterfall_executions (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   waterfall_id varchar,
   spv_id varchar,
   reference_date date,
   step smallint,
   status smallint,
   collection_period_start_date date,
   collection_period_end_date date,
   created_by_id varchar,
   simulation_job_id varchar,
   error_message varchar,
   sync_type smallint,
   interest_period_start_date date,
   interest_period_end_date date,
   context varchar,
   payment_date date,
   simulation_id varchar,
   execution_trigger_id varchar,
   async_status smallint
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_executions'
);

CREATE TABLE waterfall_input_component_results (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   value varchar,
   input_component_id varchar,
   waterfall_execution_id varchar,
   overriden_value varchar,
   override_reason varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_input_component_results'
);

CREATE TABLE waterfall_input_components (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   spv_id varchar,
   name varchar,
   identifier varchar,
   description varchar,
   test_value varchar,
   value_type smallint,
   formula varchar,
   simulation_formula varchar,
   last_result_id varchar,
   cumulative_inclusion boolean,
   last_simulation_result_id varchar,
   is_deleted boolean,
   template_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_input_components'
);

CREATE TABLE waterfall_payment_results (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   payment_id varchar,
   waterfall_execution_id varchar,
   reference_date date,
   name varchar,
   amount_due decimal(25, 15),
   amount_paid decimal(25, 15),
   amount_carried_forward decimal(25, 15),
   available_funds decimal(25, 15),
   is_overridden boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_payment_results'
);

CREATE TABLE waterfall_payment_sections (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   identifier varchar,
   "order" integer,
   currency_id varchar,
   waterfall_id varchar,
   description varchar,
   is_deleted boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_payment_sections'
);

CREATE TABLE waterfall_payment_sections_history (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   valid_until date,
   name varchar,
   description varchar,
   payment_section_id varchar,
   waterfall_id varchar,
   currency_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_payment_sections_history'
);

CREATE TABLE waterfall_payments (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   name varchar,
   "order" integer,
   formula varchar,
   simulation_formula varchar,
   parent_id varchar,
   payment_section_id varchar,
   spv_liability_id varchar,
   distribution_method smallint,
   spv_cash_account_id varchar,
   identifier varchar,
   cash_flow_type smallint,
   amount_due decimal(25, 15),
   currency_id varchar,
   last_result_id varchar,
   description varchar,
   last_simulation_result_id varchar,
   is_deleted boolean,
   exclude_amount_carried_forward boolean,
   simulation_exclude_amount_carried_forward boolean
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_payments'
);

CREATE TABLE waterfall_payments_history (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   valid_until date,
   name varchar,
   formula varchar,
   payment_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfall_payments_history'
);

CREATE TABLE waterfalls (
   id varchar,
   created_at timestamp(3) with time zone,
   updated_at timestamp(3) with time zone,
   spv_id varchar,
   name varchar,
   condition_formula varchar,
   formula_type smallint,
   is_deleted boolean,
   template_id varchar
)
WITH (
   location = 's3a://equalizer-datalake/delta_tables/waterfalls'
)