-- =============================================================
-- Script  : 02_warehouses_dev.sql
-- Purpose : Create DEV environment warehouses
-- Author  : EBS Migration Project
-- Run As  : SYSADMIN
-- =============================================================

USE ROLE SYSADMIN;

-- -------------------------------------------------------------
-- SECTION 1: EBS DEV Warehouses
-- Size        : X-Small
-- Auto-suspend: 300 seconds (5 minutes)
-- Auto-resume : Enabled
-- -------------------------------------------------------------

-- dbt transformation runs
CREATE WAREHOUSE IF NOT EXISTS EBS_DEV_DBT_WH
    WAREHOUSE_SIZE   = 'X-SMALL'
    AUTO_SUSPEND     = 300
    AUTO_RESUME      = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT          = 'DEV warehouse for dbt model runs';

-- Airflow pipeline orchestration
CREATE WAREHOUSE IF NOT EXISTS EBS_DEV_AIRFLOW_WH
    WAREHOUSE_SIZE   = 'X-SMALL'
    AUTO_SUSPEND     = 300
    AUTO_RESUME      = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT          = 'DEV warehouse for Airflow pipeline jobs';

-- Snowpipe auto-ingestion
CREATE WAREHOUSE IF NOT EXISTS EBS_DEV_SNOWPIPE_WH
    WAREHOUSE_SIZE   = 'X-SMALL'
    AUTO_SUSPEND     = 300
    AUTO_RESUME      = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT          = 'DEV warehouse for Snowpipe ingestion';

-- Analyst ad-hoc queries
CREATE WAREHOUSE IF NOT EXISTS EBS_DEV_ANALYST_WH
    WAREHOUSE_SIZE   = 'X-SMALL'
    AUTO_SUSPEND     = 300
    AUTO_RESUME      = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT          = 'DEV warehouse for analyst ad-hoc queries';

-- Data engineer ad-hoc and debugging
CREATE WAREHOUSE IF NOT EXISTS EBS_DEV_DATA_ENGINEER_WH
    WAREHOUSE_SIZE   = 'X-SMALL'
    AUTO_SUSPEND     = 300
    AUTO_RESUME      = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT          = 'DEV warehouse for data engineer queries and debugging';

-- -------------------------------------------------------------
-- VERIFICATION
-- -------------------------------------------------------------

SHOW WAREHOUSES LIKE '%EBS_DEV%';
