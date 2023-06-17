# Crowdfunding_ETL
---

### Project 2 Group Members
* Mary Oakley
* Michael Naffziger

### Repo contains
* ETL jupyter notebook
* ERD diagram
* Database schema

### Source files
Located in '/Resources' folder files:
* contacts.xlsx
* crowdfunding.xlxs

### Files Generated
Output in to '/Resources' directory
* campaign.csv
* category.csv
* contacts.csv
* subcategory.csv

### SQL Server
* ERD gererated in / exported from QuickDBD.  Schema generated from QuickDBD ERD was editied in VScode and copied into postgres utilizing pdAdmin4 to query the crowdfunding_db.
* Postgres server was created on a Mac, and ran into several security/permission errors when importing files with COPY FROM
* Table imports work fine when using client side psql \copy or from pgAdmin UI
* Ultimatly copied csv files into postgres's 'Data' directory to utilize server side queries
