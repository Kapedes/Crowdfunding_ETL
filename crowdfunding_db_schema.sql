-- Create category table with category_id as VARCHAR
CREATE TABLE category (
    category_id VARCHAR(255) PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Import CSV data into the category table
COPY category FROM 'C:/Users/jeong/Desktop/DA/Crowdfunding_ETL/Resources/category.csv' DELIMITER ',' CSV HEADER;

-- Verify the category table
SELECT * FROM category;



-- Create subcategory table with subcategory_id as VARCHAR
CREATE TABLE subcategory (
    subcategory_id VARCHAR(255) PRIMARY KEY,
    subcategory_name VARCHAR(255) NOT NULL
);

-- Import CSV data into the subcategory table
COPY subcategory FROM 'C:/Users/jeong/Desktop/DA/Crowdfunding_ETL/Resources/subcategory.csv' DELIMITER ',' CSV HEADER;

-- Verify the subcategory table
SELECT * FROM subcategory;



-- Create contacts table
CREATE TABLE contacts (
    contact_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255) NOT NULL
);

-- Import CSV data into the contacts table
COPY contacts FROM 'C:/Users/jeong/Desktop/DA/Crowdfunding_ETL/Resources/contacts.csv' DELIMITER ',' CSV HEADER;

-- Verify the contacts table
SELECT * FROM contacts;



-- Create Campaign table
CREATE TABLE campaign (
    cf_id SERIAL PRIMARY KEY,
    contact_id INT NOT NULL,
    company_name VARCHAR(255),
    description TEXT,
    goal FLOAT,
    pledged FLOAT,
    outcome VARCHAR(50),
    backers_count INT,
    country VARCHAR(50),
    currency VARCHAR(10),
    launch_date DATE,
    end_date DATE,
    category_id VARCHAR(255), -- Assuming category_id is VARCHAR
    subcategory_id VARCHAR(255), -- Assuming subcategory_id is VARCHAR
    CONSTRAINT fk_campaign_contact_id FOREIGN KEY (contact_id) REFERENCES contacts (contact_id),
    CONSTRAINT fk_campaign_category_id FOREIGN KEY (category_id) REFERENCES category (category_id),
    CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id)
);

-- Import CSV data into the campaign table
COPY campaign FROM 'C:/Users/jeong/Desktop/DA/Crowdfunding_ETL/Resources/campaign.csv' DELIMITER ',' CSV HEADER;

-- Verify the campaign table
SELECT * FROM campaign;
