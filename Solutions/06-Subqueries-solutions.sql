-- Subqueries - Solutions
-- Solutions to exercises in 02-Intermediate/02-Subqueries/exercises.sql

-- EXERCISE 1: Simple subquery with comparison
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- EXERCISE 2: Subquery with IN
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- EXERCISE 3: Subquery with NOT IN
SELECT product_name
FROM products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id FROM order_items WHERE product_id IS NOT NULL
);

-- EXERCISE 4: Scalar subquery in SELECT
SELECT 
    first_name,
    last_name,
    (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;

-- EXERCISE 5: Subquery finding maximum
SELECT product_name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- EXERCISE 6: Correlated subquery
SELECT p1.product_name, p1.category, p1.price
FROM products p1
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category = p1.category
);

-- EXERCISE 7: EXISTS operator
SELECT first_name, last_name
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- EXERCISE 8: NOT EXISTS operator
SELECT first_name, last_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- EXERCISE 9: Subquery in FROM clause
SELECT *
FROM (
    SELECT order_id, total_amount
    FROM orders
) AS all_orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- EXERCISE 10: Multiple subqueries
SELECT product_name, price, category
FROM products
WHERE price > (SELECT AVG(price) FROM products)
  AND category IN (
      SELECT category 
      FROM products 
      GROUP BY category 
      HAVING COUNT(*) > 2
  );

-- EXERCISE 11: Subquery with aggregation
SELECT first_name, last_name, customer_total
FROM (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(o.total_amount) AS customer_total
    FROM customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS customer_totals
WHERE customer_total > (SELECT AVG(total_amount) FROM orders);

-- EXERCISE 12: Complex correlated subquery
SELECT 
    e.first_name,
    e.last_name,
    e.department,
    e.salary,
    CASE 
        WHEN e.salary > (
            SELECT AVG(e2.salary) 
            FROM employees e2 
            WHERE e2.department = e.department
        ) THEN 'Above Average'
        ELSE 'Below Average'
    END AS salary_status
FROM employees e;
