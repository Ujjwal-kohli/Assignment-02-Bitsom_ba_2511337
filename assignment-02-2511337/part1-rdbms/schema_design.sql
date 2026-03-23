 -- CREATE TABLES 

 -- 1. Customer Details Table
CREATE TABLE customer_info (
    cust_id VARCHAR(10) PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    cust_city VARCHAR(50) NOT NULL
);

-- 2. Product Details Table
CREATE TABLE product_catalog (
    prod_id VARCHAR(10) PRIMARY KEY,
    prod_name VARCHAR(100) NOT NULL,
    prod_category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- 3.Sales Executive Table
CREATE TABLE sales_executive (
    rep_id VARCHAR(10) PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

-- 4. Orders Table
CREATE TABLE order_master (
    order_id VARCHAR(10) PRIMARY KEY,
    cust_id VARCHAR(10) NOT NULL,
    rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customer_info(cust_id),
    FOREIGN KEY (rep_id) REFERENCES sales_executive(rep_id)
);

-- 5. Order Details Table
CREATE TABLE order_details (
    order_id VARCHAR(10),
    prod_id VARCHAR(10),
    qty INT NOT NULL,
    PRIMARY KEY (order_id, prod_id),
    FOREIGN KEY (order_id) REFERENCES order_master(order_id),
    FOREIGN KEY (prod_id) REFERENCES product_catalog(prod_id)
);

-- INSERT SAMPLE DATA

-- 1. Customers
INSERT INTO customer_info VALUES
('CU101','Arjun Mehta','Bangalore'),
('CU102','Pooja Sharma','Delhi'),
('CU103','Vikas Gupta','Mumbai'),
('CU104','Neha Jain','Jaipur'),
('CU105','Rohan Das','Kolkata');

-- 2. Products
INSERT INTO product_catalog VALUES
('PR201','Tablet','Electronics',25000),
('PR202','Jeans','Clothing',1800),
('PR203','Rice Bag','Groceries',1200),
('PR204','Headphones','Electronics',3500),
('PR205','Shirt','Clothing',1500);

-- 3. Sales Executives
INSERT INTO sales_executive VALUES
('SE1','Manoj Kumar'),
('SE2','Anita Verma'),
('SE3','Suresh Patel'),
('SE4','Kavita Singh'),
('SE5','Deepak Yadav');

-- 4. Orders
INSERT INTO order_master VALUES
('ORD1','CU101','SE1','2024-02-01'),
('ORD2','CU102','SE2','2024-02-02'),
('ORD3','CU103','SE3','2024-02-03'),
('ORD4','CU104','SE4','2024-02-04'),
('ORD5','CU105','SE5','2024-02-05');

-- 5.Order Details
INSERT INTO order_details VALUES
('ORD1','PR201',1),
('ORD2','PR202',2),
('ORD3','PR203',3),
('ORD4','PR204',1),
('ORD5','PR205',2);