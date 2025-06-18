/*
--------------------------------------------------------------------------------
 Script Name   : init_database.sql
 Description   : This script creates a new database called 'DataWarehouse' and 
                 defines a multi-layer schema architecture (bronze, silver, gold).
                 If the 'DataWarehouse' database already exists, it will be dropped 
                 before creation to ensure a clean setup.

 WARNING       : This script will DROP the existing 'DataWarehouse' database 
                 if it already exists. All data within it will be permanently lost.
                 Use with caution in production or shared environments.

 Author        : Dagnachew Woldeyohannes
 Date Created  : 2025-06-18
--------------------------------------------------------------------------------
*/

-- Switch to the master database to manage other databases
USE master;
GO

-- Check if the DataWarehouse database already exists
IF DB_ID('DataWarehouse') IS NOT NULL
BEGIN
    -- Force all users off the database and rollback open transactions
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Drop the existing database
    DROP DATABASE DataWarehouse;
END
GO

-- Create a fresh instance of the DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the new DataWarehouse database
USE DataWarehouse;
GO

-- Create the 'bronze' schema for raw or staged data
CREATE SCHEMA bronze;
GO

-- Create the 'silver' schema for cleaned and conformed data
CREATE SCHEMA silver;
GO

-- Create the 'gold' schema for curated, business-ready data
CREATE SCHEMA gold;
GO
