-- =============================================================
-- Script  : 06_users_dev.sql
-- Purpose : Create DEV service account users
-- Author  : EBS Migration Project
-- Run As  : USERADMIN
-- Note    : Key pair authentication only
--           No password set — enforces key pair security
-- =============================================================

USE ROLE USERADMIN;

-- -------------------------------------------------------------
-- SECTION 1: Create DEV Airflow service account
-- -------------------------------------------------------------

CREATE USER IF NOT EXISTS DEV_AIRFLOW_USER
    DEFAULT_ROLE      = DEV_AIRFLOW_ROLE
    DEFAULT_WAREHOUSE = EBS_DEV_AIRFLOW_WH
    COMMENT           = 'Service account for Airflow in DEV'
    DISABLED          = FALSE;

-- -------------------------------------------------------------
-- SECTION 2: Create DEV dbt service account
-- -------------------------------------------------------------

CREATE USER IF NOT EXISTS DEV_DBT_USER
    DEFAULT_ROLE      = DEV_DBT_ROLE
    DEFAULT_WAREHOUSE = EBS_DEV_DBT_WH
    COMMENT           = 'Service account for dbt Core in DEV'
    DISABLED          = FALSE;

-- -------------------------------------------------------------
-- SECTION 3: Assign roles to users
-- Use SECURITYADMIN for role assignments
-- -------------------------------------------------------------

USE ROLE SECURITYADMIN;

-- Airflow user
GRANT ROLE DEV_AIRFLOW_ROLE TO USER DEV_AIRFLOW_USER;

-- dbt user
GRANT ROLE DEV_DBT_ROLE TO USER DEV_DBT_USER;

-- -------------------------------------------------------------
-- VERIFICATION
-- -------------------------------------------------------------

SHOW USERS LIKE '%DEV%';
