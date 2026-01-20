-- JOINS - Solutions  
-- Solutions to exercises in 02-Intermediate/01-JOINS/exercises.sql

-- EXERCISE 1: Simple INNER JOIN
SELECT 
    c.first_name,
    c.last_name,
    o.order_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- EXERCISE 2: INNER JOIN with WHERE
SELECT 
    c.first_name,
    c.last_name,
    o.order_id,
    o.status
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Completed';

-- EXERCISE 3: LEFT JOIN
SELECT 
    c.first_name,
    c.last_name,
    o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- EXERCISE 4: Three table JOIN
SELECT 
    c.first_name,
    c.last_name,
    o.order_id,
    oi.product_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id;

-- EXERCISE 5: JOIN with aggregates
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- EXERCISE 6: Multiple table JOIN with product details
SELECT 
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- EXERCISE 7: Self JOIN
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    m.first_name || ' ' || m.last_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- EXERCISE 8: LEFT JOIN to find customers without orders
SELECT 
    c.first_name,
    c.last_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- EXERCISE 9: Complex JOIN with calculations
SELECT 
    o.order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, c.first_name, c.last_name;

-- EXERCISE 10: JOIN with filtering
SELECT 
    c.first_name,
    c.last_name,
    o.order_id,
    p.product_name
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics';

-- EXERCISE 11: Multiple aggregates with JOIN
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- EXERCISE 12: JOIN with ORDER BY
SELECT 
    c.last_name,
    c.first_name,
    p.product_name,
    oi.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
ORDER BY c.last_name, p.product_name;
