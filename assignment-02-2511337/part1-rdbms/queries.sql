-- Q1: List all customers from Mumbai along with their total order value
SELECT ci.cust_name, SUM(pc.price * od.qty) AS total_value
FROM customer_info ci
JOIN order_master om ON ci.cust_id = om.cust_id
JOIN order_details od ON om.order_id = od.order_id
JOIN product_catalog pc ON od.prod_id = pc.prod_id
WHERE ci.cust_city = 'Mumbai'
GROUP BY ci.cust_name;


-- Q2: Find the top 3 products by total quantity sold
SELECT pc.prod_name, SUM(od.qty) AS total_sold
FROM product_catalog pc
JOIN order_details od ON pc.prod_id = od.prod_id
GROUP BY pc.prod_name
ORDER BY total_sold DESC
LIMIT 3;


-- Q3: List all sales representatives and the number of unique customers they have handled
SELECT se.rep_name, COUNT(DISTINCT om.cust_id) AS unique_customers
FROM sales_executive se
JOIN order_master om ON se.rep_id = om.rep_id
GROUP BY se.rep_name;


-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
SELECT om.order_id, SUM(pc.price * od.qty) AS total_value
FROM order_master om
JOIN order_details od ON om.order_id = od.order_id
JOIN product_catalog pc ON od.prod_id = pc.prod_id
GROUP BY om.order_id
HAVING total_value > 10000
ORDER BY total_value DESC;


-- Q5: Identify any products that have never been ordered
SELECT pc.prod_name
FROM product_catalog pc
LEFT JOIN order_details od ON pc.prod_id = od.prod_id
WHERE od.prod_id IS NULL;