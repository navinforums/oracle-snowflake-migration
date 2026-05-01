-- =============================================================
-- Script  : 04_schemas_dev.sql
-- Purpose : Create DEV environment schemas
-- Author  : EBS Migration Project
-- Run As  : SYSADMIN
-- =============================================================

USE ROLE SYSADMIN;
USE DATABASE DEV_DB;

-- -------------------------------------------------------------
-- SECTION 1: EBS Source Schemas
-- Transient schemas for DEV — no fail-safe, lower storage cost
-- Naming convention: {SOURCE}_{LAYER}
-- -------------------------------------------------------------

CREATE TRANSIENT SCHEMA IF NOT EXISTS EBS_BRONZE
    DATA_RETENTION_TIME_IN_DAYS = 0
    COMMENT = 'DEV Bronze layer — raw EBS source data';

CREATE TRANSIENT SCHEMA IF NOT EXISTS EBS_SILVER
    DATA_RETENTION_TIME_IN_DAYS = 0
    COMMENT = 'DEV Silver layer — cleansed and conformed EBS data';

CREATE TRANSIENT SCHEMA IF NOT EXISTS EBS_GOLD
    DATA_RETENTION_TIME_IN_DAYS = 0
    COMMENT = 'DEV Gold layer — business ready EBS data';

-- -------------------------------------------------------------
-- VERIFICATION
-- -------------------------------------------------------------

SHOW SCHEMAS IN DATABASE DEV_DB;
