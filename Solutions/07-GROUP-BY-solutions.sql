-- GROUP BY - Solutions
-- Solutions to exercises in 02-Intermediate/03-GROUP-BY/exercises.sql

-- EXERCISE 1: Simple GROUP BY
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country;

-- EXERCISE 2: GROUP BY with SUM
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category;

-- EXERCISE 3: GROUP BY with AVG
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- EXERCISE 4: Multiple aggregates
SELECT 
    category,
    COUNT(*) AS product_count,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM products
GROUP BY category;

-- EXERCISE 5: GROUP BY with HAVING
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 150;

-- EXERCISE 6: GROUP BY with JOIN
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- EXERCISE 7: GROUP BY multiple columns
SELECT country, city, COUNT(*) AS customer_count
FROM customers
GROUP BY country, city;

-- EXERCISE 8: GROUP BY with ORDER BY
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY order_count DESC;

-- EXERCISE 9: HAVING with COUNT
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 1;

-- EXERCISE 10: Complex aggregation
SELECT 
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS avg_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- EXERCISE 11: GROUP BY with WHERE and HAVING
SELECT category, COUNT(*) AS product_count
FROM products
WHERE price < 500
GROUP BY category
HAVING COUNT(*) > 2;

-- EXERCISE 12: GROUP BY with date functions
-- This varies by database, here's a common approach
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(*) AS order_count
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY order_month;

-- EXERCISE 13: Find duplicates
SELECT email, COUNT(*) AS count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- EXERCISE 14: Advanced JOIN with GROUP BY
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- EXERCISE 15: Multiple levels of aggregation
SELECT 
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
