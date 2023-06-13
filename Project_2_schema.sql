<<<<<<< HEAD:MRN_project_2_Starter_Files/Project_2_schema.sql
﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yv7BDi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--DROP TABLE category;
--DROP TABLE subcategory;
--DROP TABLE contacts;
--DROP TABLE campaign;

CREATE TABLE category (
    category_id varchar(10)   NOT NULL,
    category varchar(50)   NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY (
        category_id
     )
);

CREATE TABLE subcategory (
    subcategory_id varchar(10)   NOT NULL,
    subcategory varchar(50)   NOT NULL,
    CONSTRAINT pk_subcategory PRIMARY KEY (
        subcategory_id
     )
);

CREATE TABLE contacts (
    contact_id int   NOT NULL,
    first_name varchar(50)   NOT NULL,
    last_name varchar(50)   NOT NULL,
    email varchar(100)   NOT NULL,
    CONSTRAINT pk_contacts PRIMARY KEY (
        contact_id
     )
);

CREATE TABLE campaign (
    cf_id int   NOT NULL,
    contact_id int   NOT NULL,
    company_name varchar(100)   NOT NULL,
    description varchar(100)   NOT NULL,
    goal numeric   NOT NULL,
    pledged numeric   NOT NULL,
    outcome varchar(30)   NOT NULL,
    backers_count int   NOT NULL,
    country varchar(10)   NOT NULL,
    currency varchar(10)   NOT NULL,
    launched_date date   NOT NULL,
    end_date date   NOT NULL,
    category_id varchar(10)   NOT NULL,
    subcategory_id varchar(10)   NOT NULL,
    CONSTRAINT pk_campaign PRIMARY KEY (
        cf_id
     )
);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_contact_id FOREIGN KEY(contact_id)
REFERENCES contacts (contact_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_category_id FOREIGN KEY(category_id)
REFERENCES category (category_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY(subcategory_id)
REFERENCES subcategory (subcategory_id);

--used the following to import csv files into postgres:
-- --psql -d <table name>
=======
﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
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
>>>>>>> 0d1d83e60efe8e0d5d14979c1824bd1699d1096b:Project_2_schema.sql
-- --\copy <table name> FROM <csv file path> DELIMITER ',' CSV HEADER;