## Anomaly Analysis

### Insert Anomaly
If a new product (e.g., product_id = P018) needs to be added but it has not been ordered yet, it cannot be inserted into the table because order_id is required that is because order entry needs to be created. 
It cannot be stored independently as product data depends on order existence.  

Example:
Columns that will be required : product_id, product_name, category, unit_price  
Issue: It cannot be stored independently as product data depends on order existence.  

---

### Update Anomaly
If a customer's city(e.g., customer_id = C003) changes from Bangalore to Hyderabad, the update must be required to be made in multiple rows where that customer will appear . 

Example:
Columns: customer_id, customer_city  
Issue:  Since customer data is repeated across multiple orders, failing to update all rows and if single row will be left to update, this can lead to inconsistency in data (some rows showing bangalore, others showing Hyderabad).  

---

### Delete Anomaly
If the only order containing a product details is deleted, all the product information will be lost i.e. Deleting one row deletes history. 

Example:
Columns: order_id, product_id, product_name  
If a row with a unique product is deleted → product details will be permanently lost.

## Normalization Justification

Although keeping all the data in a single table may appear simpler but it leads to several data integrity and maintenance issues. In the given dataset (orders_flat.csv), customer, product, and sales representative details are repeated across multiple rows. For example, the same customer_id that appears in multiple orders along with its city - If any single customer’s city changes (e.g., from Bangalore to Hyderabad), then we will have to update this change in every row where that customer will details will appear. Missing even single row will lead to inconsistent data, this shows that there is an update anomaly in the data. 

Similarly,the product details such as product_id, product_name, and unit_price is dependent on order records and for instance, If a new product needs to be added but it has not yet been ordered therefore it cannot be inserted into the table without creating a dummy order. This clearly shows an insert anomaly. Additionally, if the only order having a particular product detail is deleted, all the information about that product will be lost and that will result in a delete anomaly.

Normalization to Third Normal Form (3NF) will resolve all these issues by separating data into multiple related tables, e.g. customers, products, orders, and sales representative. Each table stores only relevant attributes, and relationships are maintained using foreign keys. This ensures consistency in data, and allows independent insertion, updating, and deletion of the data.

Therefore, normalization is not over-engineering but a necessary design approach to maintain accurate, scalable, and reliable database systems.