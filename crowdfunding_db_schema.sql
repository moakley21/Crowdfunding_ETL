-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yv7BDi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE campaign;
DROP TABLE category;
DROP TABLE subcategory;
DROP TABLE contacts;


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

--***************************
--Using iOS, I am not able to easily set up a shared directory to allow postgres
-- accress to the csv files on the server side (COPY FROM).  Everything imported just fine using the client side psql \copy
-- commands, or with the pgAdmin UI.  So, I the required '/Resources/*.csv' files to the postgres "data" directory.  

--SHOW data_directory;

-- COPY category FROM '/Library/PostgreSQL/15/data/Resources/category.csv' DELIMITER ',' CSV HEADER;
-- COPY subcategory FROM '/Library/PostgreSQL/15/data/Resources/subcategory.csv' DELIMITER ',' CSV HEADER;
-- COPY contacts FROM '/Library/PostgreSQL/15/data/Resources/contacts.csv' DELIMITER ',' CSV HEADER;
-- COPY campaign FROM '/Library/PostgreSQL/15/data/Resources/campaign.csv' DELIMITER ',' CSV HEADER;

--***************************
-- The above COPY FROM works, but importing 4 files was on the knife edge of tedious
--  So I got cute and learned how to constrcut a FOR LOOP
-- -- ref: https://stackoverflow.com/questions/18533625/copy-multiple-csv-files-into-postgres
-- -- ref: https://www.geeksforgeeks.org/postgresql-for-loops/

DO $$
	DECLARE
		csv_names text[] := ARRAY['category.csv','subcategory.csv','contacts.csv','campaign.csv'];
		table_names text[] := ARRAY['category','subcategory','contacts','campaign'];
		
	--Change file path here
		csv_path text := '/Library/PostgreSQL/15/data/Resources/';
		
		file_name text;
		table_csv text;
		full_filename_path text;
		
	BEGIN
		FOR i IN 1..4
		LOOP
			file_name := csv_names[i];
			full_filename_path := csv_path || file_name;
			table_csv := table_names[i];
			
			EXECUTE format('COPY %I FROM %L CSV HEADER', table_csv, full_filename_path);
			RAISE NOTICE 'Successfully imported table: % into croudfunding_db!', table_csv;
		END LOOP;
END $$;

--***************************

SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM contacts;
SELECT * FROM campaign;

