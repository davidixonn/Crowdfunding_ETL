-- Create Schema
CREATE SCHEMA IF NOT EXISTS crowdfunding_db;

-- Add tables

CREATE TABLE if not exists crowdfunding_db.Category (
	category_id varchar NOT NULL UNIQUE,
	category varchar,
	PRIMARY KEY (category_id)
);

CREATE TABLE if not exists crowdfunding_db.Subcategory (
	subcategory_id varchar NOT NULL UNIQUE,
	subcategory varchar,
	PRIMARY KEY (subcategory_id)
);

CREATE TABLE if not exists crowdfunding_db.Contacts (
	contact_id INT NOT NULL UNIQUE,
	first_name varchar,
	last_name varchar,
	email varchar,
	PRIMARY KEY (contact_id)
);

CREATE TABLE if not exists crowdfunding_db.Campaign (
	cf_id int NOT NULL UNIQUE,
	contact_id int,
	company_name varchar,
	blurb varchar,
	goal float,
	pledged float,
	outcome varchar,
	backers_count int,
	country char(2),
	currency char(3),
	launch_date int,
	end_date int,
	category_id varchar,
	subcategory_id varchar,
	PRIMARY KEY (cf_id),
	FOREIGN KEY (contact_id) REFERENCES crowdfunding_db.Contacts(contact_id),
	FOREIGN KEY (subcategory_id) REFERENCES crowdfunding_db.Subcategory(subcategory_id),
	FOREIGN KEY (category_id) REFERENCES crowdfunding_db.Category(category_id)
);