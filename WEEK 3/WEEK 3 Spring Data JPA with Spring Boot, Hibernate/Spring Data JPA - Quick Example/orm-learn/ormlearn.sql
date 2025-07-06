CREATE SCHEMA ormlearn;
USE ormlearn;
CREATE TABLE country (
  co_code VARCHAR(2) PRIMARY KEY,
  co_name VARCHAR(50)
);
INSERT INTO country VALUES ('IN', 'India'), ('US', 'United States of America');