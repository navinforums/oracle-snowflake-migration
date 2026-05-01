-- =============================================================
-- Script  : 01_roles_dev.sql
-- Purpose : Create Tier 1 and Tier 2 roles for DEV environment
-- Author  : EBS Migration Project
-- Run As  : USERADMIN
-- =============================================================

USE ROLE USERADMIN;

-- -------------------------------------------------------------
-- SECTION 1: Tier 1 — DEV Platform Roles
-- -------------------------------------------------------------

-- Sysadmin role for DEV
CREATE ROLE IF NOT EXISTS DEV_SYSADMIN_ROLE
    COMMENT = 'Owns all objects in DEV environment';

-- Pipeline service roles
CREATE ROLE IF NOT EXISTS DEV_DBT_ROLE
    COMMENT = 'Service role for dbt runs in DEV';

CREATE ROLE IF NOT EXISTS DEV_AIRFLOW_ROLE
    COMMENT = 'Service role for Airflow pipeline in DEV';

CREATE ROLE IF NOT EXISTS DEV_SNOWPIPE_ROLE
    COMMENT = 'Service role for Snowpipe ingestion in DEV';

-- Technical user roles
CREATE ROLE IF NOT EXISTS DEV_DATA_ENGINEER_ROLE
    COMMENT = 'Full access to all layers in DEV environment';

CREATE ROLE IF NOT EXISTS DEV_SR_ANALYST_ROLE
    COMMENT = 'Read access to Silver and Gold in DEV';

CREATE ROLE IF NOT EXISTS DEV_ANALYST_ROLE
    COMMENT = 'Read access to Gold only in DEV';

-- -------------------------------------------------------------
-- SECTION 2: Tier 2 — DEV Source Specific Roles (EBS)
-- -------------------------------------------------------------

-- EBS source roles inherit from Tier 1
CREATE ROLE IF NOT EXISTS EBS_DEV_DATA_ENGINEER_ROLE
    COMMENT = 'EBS specific data engineer role in DEV';

CREATE ROLE IF NOT EXISTS EBS_DEV_SR_ANALYST_ROLE
    COMMENT = 'EBS specific senior analyst role in DEV';

CREATE ROLE IF NOT EXISTS EBS_DEV_ANALYST_ROLE
    COMMENT = 'EBS specific analyst role in DEV';

-- -------------------------------------------------------------
-- SECTION 3: Role Hierarchy — Tier 2 inherits from Tier 1
-- Use SECURITYADMIN for role grants
-- -------------------------------------------------------------

USE ROLE SECURITYADMIN;

-- EBS roles inherit platform roles
GRANT ROLE DEV_DATA_ENGINEER_ROLE TO ROLE EBS_DEV_DATA_ENGINEER_ROLE;
GRANT ROLE DEV_SR_ANALYST_ROLE    TO ROLE EBS_DEV_SR_ANALYST_ROLE;
GRANT ROLE DEV_ANALYST_ROLE       TO ROLE EBS_DEV_ANALYST_ROLE;

-- -------------------------------------------------------------
-- SECTION 4: Grant all DEV roles up to SYSADMIN
-- Ensures SYSADMIN can manage all objects owned by these roles
-- -------------------------------------------------------------

GRANT ROLE DEV_SYSADMIN_ROLE          TO ROLE SYSADMIN;
GRANT ROLE DEV_DBT_ROLE               TO ROLE SYSADMIN;
GRANT ROLE DEV_AIRFLOW_ROLE           TO ROLE SYSADMIN;
GRANT ROLE DEV_SNOWPIPE_ROLE          TO ROLE SYSADMIN;
GRANT ROLE DEV_DATA_ENGINEER_ROLE     TO ROLE SYSADMIN;
GRANT ROLE DEV_SR_ANALYST_ROLE        TO ROLE SYSADMIN;
GRANT ROLE DEV_ANALYST_ROLE           TO ROLE SYSADMIN;
GRANT ROLE EBS_DEV_DATA_ENGINEER_ROLE TO ROLE SYSADMIN;
GRANT ROLE EBS_DEV_SR_ANALYST_ROLE    TO ROLE SYSADMIN;
GRANT ROLE EBS_DEV_ANALYST_ROLE       TO ROLE SYSADMIN;

-- -------------------------------------------------------------
-- VERIFICATION
-- Run after execution to confirm roles created correctly
-- -------------------------------------------------------------

SHOW ROLES LIKE '%DEV%';
