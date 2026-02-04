
-- Day 01: Database & Table Creation
-- SQL Server (SSMS)


-- Create database
CREATE DATABASE zoho;
GO

-- Use database
USE zoho;
GO

-- Create staff table
CREATE TABLE staff (
    Id INT,
    Name VARCHAR(250),
    Age INT,
    Gender VARCHAR(50),
    Salary INT,
    Department VARCHAR(250),
    City VARCHAR(250)
);

-- View table data
SELECT * FROM staff;
