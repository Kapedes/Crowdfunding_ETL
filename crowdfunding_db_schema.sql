-- drop tables if they exist

drop table if exists contacts;
drop table if exists category;
drop table if exists dsubcategory;
drop table if exists campaign;

-- create contacts table and set primary key

CREATE TABLE contacts (
    contact_id INT NOT NULL,
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    email VARCHAR (50) NOT NULL,
	primary key (contact_id)
);

-- create category table and set primary key

CREATE TABLE category (
    category_id VARCHAR (10) NOT NULL,
    category VARCHAR (20) NOT NULL,
	primary key (category_id)
);

-- create subcategory table and set primary key

CREATE TABLE subcategory (
    subcategory_id VARCHAR (10) NOT NULL,
    subcategory VARCHAR (20) NOT NULL,
	primary key (subcategory_id)
);
						 
-- create campaign table and set primary and foreign keys

CREATE TABLE campaign (
    cf_id INT NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR (50) NOT NULL,
    description VARCHAR (100) NOT NULL,
    goal FLOAT NOT NULL,
    pledged FLOAT NOT NULL,
    outcome CHAR (10) NOT NULL,
    backers_count INT NOT NULL,
    country CHAR (10) NOT NULL,
    currency CHAR (10) NOT NULL,
    launched_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR (10) NOT NULL,
    subcategory_id VARCHAR (10) NOT NULL,
	primary key (cf_id),
	foreign key (contact_id) references contacts(contact_id),
	foreign key (category_id) references category(category_id),
	foreign key (subcategory_id) references subcategory(subcategory_id)
);

select * from contacts
select * from category
select * from subcategory
select * from campaign