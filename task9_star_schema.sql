-- Task 9: Star Schema Design (Global Superstore2)

-- Dimension Tables
CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT,
    segment TEXT
);

CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    sub_category TEXT
);

CREATE TABLE dim_location (
    location_id SERIAL PRIMARY KEY,
    country TEXT,
    region TEXT,
    state TEXT,
    city TEXT
);

CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    order_date DATE,
    year INT,
    month INT,
    quarter INT
);

-- Fact Table
CREATE TABLE fact_sales (
    sales_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES dim_customer(customer_id),
    product_id INT REFERENCES dim_product(product_id),
    location_id INT REFERENCES dim_location(location_id),
    date_id INT REFERENCES dim_date(date_id),
    sales NUMERIC,
    profit NUMERIC,
    quantity INT,
    discount NUMERIC
);

-- Indexes for performance
CREATE INDEX idx_fact_customer ON fact_sales(customer_id);
CREATE INDEX idx_fact_product ON fact_sales(product_id);
CREATE INDEX idx_fact_location ON fact_sales(location_id);
CREATE INDEX idx_fact_date ON fact_sales(date_id);
