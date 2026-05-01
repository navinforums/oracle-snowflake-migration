-- =============================================================
-- Script  : 03_databases.sql
-- Purpose : Create DEV database
-- Author  : EBS Migration Project
-- Run As  : SYSADMIN
-- =============================================================

USE ROLE SYSADMIN;

-- -------------------------------------------------------------
-- SECTION 1: DEV Database
-- One database per environment
-- Source separation handled at schema level
-- -------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS DEV_DB
    DATA_RETENTION_TIME_IN_DAYS = 1
    COMMENT = 'DEV environment database — all sources';

-- -------------------------------------------------------------
-- VERIFICATION
-- -------------------------------------------------------------

SHOW DATABASES LIKE '%DEV%';
