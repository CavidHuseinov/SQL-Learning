-- Subqueries - Example Queries

-- Example 1: Simple subquery - products above average price
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Example 2: Subquery with IN operator
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- Example 3: Subquery with NOT IN
SELECT first_name, last_name
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders WHERE customer_id IS NOT NULL);

-- Example 4: Scalar subquery in SELECT clause
SELECT 
    first_name,
    last_name,
    (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;

-- Example 5: Find maximum value
SELECT product_name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- Example 6: Correlated subquery
SELECT p1.product_name, p1.category, p1.price
FROM products p1
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category = p1.category
);

-- Example 7: EXISTS operator
SELECT first_name, last_name
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- Example 8: NOT EXISTS operator
SELECT first_name, last_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- Example 9: Subquery in FROM clause
SELECT *
FROM (
    SELECT category, AVG(price) AS avg_price
    FROM products
    GROUP BY category
) AS category_avg
WHERE avg_price > 200;

-- Example 10: Multiple conditions with subqueries
SELECT product_name, price, category
FROM products
WHERE price > (SELECT AVG(price) FROM products)
  AND category IN (
      SELECT category 
      FROM products 
      GROUP BY category 
      HAVING COUNT(*) > 2
  );

-- Example 11: Complex aggregation with subquery
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
WHERE customer_total > (
    SELECT AVG(total_amount) FROM orders
);
