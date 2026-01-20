# Subqueries

## Overview
A subquery is a query nested inside another query. Subqueries can be used in SELECT, FROM, WHERE, and HAVING clauses to solve complex problems.

## Types of Subqueries

### 1. Subquery in WHERE Clause
Most common use case - filtering based on results from another query.

```sql
-- Find products more expensive than average
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);
```

### 2. Subquery with IN Operator
```sql
-- Find customers who have placed orders
SELECT first_name, last_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);
```

### 3. Subquery in SELECT Clause
```sql
-- Show each customer with their total number of orders
SELECT 
    first_name,
    last_name,
    (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;
```

### 4. Subquery in FROM Clause
```sql
-- Work with aggregated data
SELECT avg_price_by_category.category, avg_price_by_category.avg_price
FROM (
    SELECT category, AVG(price) AS avg_price
    FROM products
    GROUP BY category
) AS avg_price_by_category
WHERE avg_price_by_category.avg_price > 200;
```

### 5. Correlated Subquery
A subquery that references columns from the outer query.

```sql
-- Find products with price higher than average in their category
SELECT p1.product_name, p1.category, p1.price
FROM products p1
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category = p1.category
);
```

## Subquery Operators

### EXISTS / NOT EXISTS
```sql
-- Find customers who have placed at least one order
SELECT first_name, last_name
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);
```

### ANY / ALL
```sql
-- Find products cheaper than ALL Electronics products
SELECT product_name, price
FROM products
WHERE price < ALL (
    SELECT price FROM products WHERE category = 'Electronics'
);
```

## Important Notes
- Subqueries must return appropriate number of columns for their context
- Scalar subqueries (in WHERE with =) must return single value
- Subqueries can be slow; consider JOINs as alternative
- Always test subquery separately first

## Practice Tips
- Start with simple WHERE clause subqueries
- Practice both correlated and non-correlated subqueries
- Try converting JOINs to subqueries and vice versa
- Use EXISTS for better performance when checking existence

## Next Steps
After mastering Subqueries, learn GROUP BY with HAVING for advanced aggregation.
