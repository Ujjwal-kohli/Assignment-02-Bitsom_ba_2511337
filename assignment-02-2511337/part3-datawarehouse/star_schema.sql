-- ======================
-- DIMENSION TABLES
-- ======================

CREATE TABLE dim_date (date_id DATE PRIMARY KEY, month INT, year INT);

CREATE TABLE dim_store (store_id VARCHAR(10) PRIMARY KEY, store_name VARCHAR(100), city VARCHAR(50));

CREATE TABLE dim_product (product_id VARCHAR(10) PRIMARY KEY, product_name VARCHAR(100), category VARCHAR(50));

-- ======================
-- FACT TABLE
-- ======================

CREATE TABLE fact_sales (sales_id INT PRIMARY KEY, date_id DATE, store_id VARCHAR(10), product_id VARCHAR(10),
 quantity INT, revenue DECIMAL(10,2), FOREIGN KEY (date_id) REFERENCES dim_date(date_id), FOREIGN KEY (store_id)
  REFERENCES dim_store(store_id), FOREIGN KEY (product_id) REFERENCES dim_product(product_id));

--Insert sample data into dimension tables
-- dim_date
INSERT INTO dim_date VALUES
('2024-01-01',1,2024),
('2024-01-02',1,2024),
('2024-01-03',1,2024),
('2024-02-01',2,2024),
('2024-02-02',2,2024);

-- dim_store
INSERT INTO dim_store VALUES
('S1','Reliance Store','Mumbai'),
('S2','Big Bazaar','Delhi'),
('S3','D-Mart','Pune');

-- dim_product
INSERT INTO dim_product VALUES
('P1','Laptop','Electronics'),
('P2','T-Shirt','Clothing'),
('P3','Rice','Groceries');

-- fact_sales (at least 10 rows)
INSERT INTO fact_sales VALUES
(1,'2024-01-01','S1','P1',1,50000),
(2,'2024-01-01','S2','P2',3,3000),
(3,'2024-01-02','S3','P3',5,2500),
(4,'2024-01-03','S1','P2',2,2000),
(5,'2024-02-01','S2','P1',1,52000),
(6,'2024-02-02','S3','P3',4,2000),
(7,'2024-02-02','S1','P3',6,3000),
(8,'2024-01-02','S2','P1',1,48000),
(9,'2024-01-03','S3','P2',2,2200),
(10,'2024-02-01','S1','P1',1,51000);