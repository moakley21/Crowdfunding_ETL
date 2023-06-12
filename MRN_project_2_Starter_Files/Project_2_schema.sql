-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yv7BDi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--DROP TABLE category;
--DROP TABLE subcategory;
--DROP TABLE contacts;
--DROP TABLE campaign;

CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY NOT NULL,
    category VARCHAR(50)   NOT NULL
);

CREATE TABLE subcategory (
    subcategory_id VARCHAR(10) PRIMARY KEY NOT NULL,
    subcategory VARCHAR(50)   NOT NULL
);

CREATE TABLE contacts (
    contact_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    email VARCHAR(100)   NOT NULL
);

CREATE TABLE campaign (
    cf_id INT   PRIMARY KEY NOT NULL,
    contact_id INT REFERENCES contacts(contact_id),
    company_name VARCHAR(100)   NOT NULL,
    description VARCHAR(100)   NOT NULL,
    goal NUMERIC   NOT NULL,
    pledged NUMERIC   NOT NULL,
    outcome VARCHAR(30)   NOT NULL,
    backers_count INT   NOT NULL,
    country VARCHAR(2)   NOT NULL,
    currency VARCHAR(3)   NOT NULL,
    launched_date DATE   NOT NULL,
    end_date DATE   NOT NULL,
    category_id VARCHAR(10) REFERENCES category(category_id)  NOT NULL,
    subcategory_id VARCHAR(10) REFERENCES subcategory(subcategory_id)   NOT NULL 
);

--used the following to import csv files into postgres:
-- --psql -d <table name>
-- --\copy <table name> FROM <csv file path> DELIMITER ',' CSV HEADER;