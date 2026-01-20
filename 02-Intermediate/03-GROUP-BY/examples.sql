-- GROUP BY - Example Queries

-- Example 1: Simple GROUP BY with COUNT
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country;

-- Example 2: GROUP BY with SUM
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category;

-- Example 3: GROUP BY with AVG
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- Example 4: Multiple aggregate functions
SELECT 
    category,
    COUNT(*) AS product_count,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM products
GROUP BY category;

-- Example 5: GROUP BY with HAVING
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 200;

-- Example 6: GROUP BY with JOIN
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Example 7: GROUP BY multiple columns
SELECT country, city, COUNT(*) AS customer_count
FROM customers
GROUP BY country, city
ORDER BY country, city;

-- Example 8: GROUP BY with ORDER BY
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY order_count DESC;

-- Example 9: HAVING with condition
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 1;

-- Example 10: Department statistics
SELECT 
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS avg_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- Example 11: GROUP BY with WHERE and HAVING
SELECT category, COUNT(*) AS product_count
FROM products
WHERE price < 500
GROUP BY category
HAVING COUNT(*) > 2;

-- Example 12: Complex aggregation with JOIN
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC;

-- Example 13: Revenue by category
SELECT 
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
