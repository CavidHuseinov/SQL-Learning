-- Advanced Queries - Solutions
-- Solutions to exercises in 03-Advanced/02-Advanced-Queries/exercises.sql

-- EXERCISE 1: Simple CTE
WITH high_spenders AS (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) > 500
)
SELECT 
    c.first_name,
    c.last_name,
    hs.total_spent
FROM customers c
INNER JOIN high_spenders hs ON c.customer_id = hs.customer_id;

-- EXERCISE 2: Multiple CTEs
WITH 
product_quantities AS (
    SELECT product_id, SUM(quantity) AS total_quantity
    FROM order_items
    GROUP BY product_id
),
product_revenues AS (
    SELECT product_id, SUM(quantity * unit_price) AS total_revenue
    FROM order_items
    GROUP BY product_id
)
SELECT 
    p.product_name,
    pq.total_quantity AS quantity_sold,
    pr.total_revenue AS revenue
FROM products p
LEFT JOIN product_quantities pq ON p.product_id = pq.product_id
LEFT JOIN product_revenues pr ON p.product_id = pr.product_id;

-- EXERCISE 3: ROW_NUMBER window function
SELECT 
    product_name,
    category,
    price,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS price_rank
FROM products;

-- EXERCISE 4: Running total
SELECT 
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date, order_id) AS running_total
FROM orders;

-- EXERCISE 5: CASE expression
SELECT 
    product_name,
    price,
    CASE 
        WHEN price < 100 THEN 'Budget'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_category
FROM products;

-- EXERCISE 6: LAG function
SELECT 
    order_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (ORDER BY order_date, order_id) AS previous_order_amount
FROM orders;

-- EXERCISE 7: RANK function
SELECT 
    first_name,
    last_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- EXERCISE 8: Partition by window function
SELECT 
    first_name,
    last_name,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS department_avg_salary
FROM employees;

-- EXERCISE 9: Complex CTE
WITH customer_spending AS (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),
average_spending AS (
    SELECT AVG(total_spent) AS avg_spent
    FROM customer_spending
)
SELECT 
    c.first_name,
    c.last_name,
    cs.total_spent
FROM customers c
INNER JOIN customer_spending cs ON c.customer_id = cs.customer_id
CROSS JOIN average_spending a
WHERE cs.total_spent > a.avg_spent;

-- EXERCISE 10: CASE with aggregation
SELECT 
    CASE 
        WHEN price < 100 THEN 'Budget'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_category,
    COUNT(*) AS product_count
FROM products
GROUP BY 
    CASE 
        WHEN price < 100 THEN 'Budget'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid-Range'
        ELSE 'Premium'
    END;

-- EXERCISE 11: String functions
-- Note: Syntax varies by database
-- PostgreSQL/SQLite version:
SELECT 
    email,
    SUBSTRING(email FROM 1 FOR POSITION('@' IN email) - 1) AS username
FROM customers;

-- Alternative for MySQL:
-- SELECT email, SUBSTRING(email, 1, LOCATE('@', email) - 1) AS username
-- FROM customers;

-- Alternative for SQL Server:
-- SELECT email, SUBSTRING(email, 1, CHARINDEX('@', email) - 1) AS username
-- FROM customers;

-- EXERCISE 12: Advanced window function
SELECT 
    product_name,
    category,
    price,
    RANK() OVER (PARTITION BY category ORDER BY price DESC) AS category_rank,
    AVG(price) OVER (PARTITION BY category) AS category_avg_price,
    price - AVG(price) OVER (PARTITION BY category) AS difference_from_avg
FROM products;
