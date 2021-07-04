#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    -- create database
    CREATE DATABASE "gh-reporting";
    
    -- restrict public access
    REVOKE CREATE ON SCHEMA public FROM PUBLIC;
    REVOKE ALL ON DATABASE "gh-reporting" FROM PUBLIC;
    
    -- create admin role
    CREATE ROLE admin;
    GRANT ALL PRIVILEGES ON DATABASE "gh-reporting" TO admin;
    
    -- create readonly role
    CREATE ROLE readonly;
    GRANT CONNECT ON DATABASE "gh-reporting" TO readonly;
    
    -- create readwrite role
    CREATE ROLE readwrite;
    GRANT CONNECT ON DATABASE "gh-reporting" TO readwrite;
    
    -- create admin users
    CREATE USER "gh-reporting" WITH PASSWORD 'gh-reporting';
    GRANT admin TO "gh-reporting";
    
    CREATE USER dbadmin WITH PASSWORD 'gh-reporting';
    GRANT admin TO dbadmin;
    
    -- create reader users
    CREATE USER dbreader WITH PASSWORD 'gh-reporting';
    GRANT readonly TO dbreader;
    
    -- create writer users
    CREATE USER dbwriter WITH PASSWORD 'gh-reporting';
    GRANT readwrite TO dbwriter;
EOSQL