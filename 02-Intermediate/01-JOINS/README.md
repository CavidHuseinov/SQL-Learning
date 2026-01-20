# JOINS

## Overview
JOINs are used to combine rows from two or more tables based on a related column between them. Understanding JOINs is crucial for working with relational databases.

## Types of JOINS

### 1. INNER JOIN
Returns only matching rows from both tables.

```sql
SELECT customers.first_name, orders.order_id, orders.total_amount
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;
```

### 2. LEFT JOIN (LEFT OUTER JOIN)
Returns all rows from the left table and matching rows from the right table. NULL for non-matching right table rows.

```sql
SELECT customers.first_name, orders.order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
```

### 3. RIGHT JOIN (RIGHT OUTER JOIN)
Returns all rows from the right table and matching rows from the left table. NULL for non-matching left table rows.

```sql
SELECT customers.first_name, orders.order_id
FROM customers
RIGHT JOIN orders ON customers.customer_id = orders.customer_id;
```

### 4. FULL OUTER JOIN
Returns all rows when there is a match in either table. NULL for non-matching rows.

```sql
SELECT customers.first_name, orders.order_id
FROM customers
FULL OUTER JOIN orders ON customers.customer_id = orders.customer_id;
```

## Multiple Table JOINs
```sql
SELECT 
    c.first_name,
    o.order_id,
    p.product_name,
    oi.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;
```

## Self JOIN
Joining a table to itself.

```sql
-- Find employees and their managers
SELECT 
    e.first_name AS employee,
    m.first_name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
```

## Table Aliases
```sql
SELECT c.first_name, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
```

## Practice Tips
- Start with INNER JOIN, then practice LEFT JOIN
- Draw Venn diagrams to visualize different JOIN types
- Always specify the JOIN condition with ON clause
- Use table aliases for cleaner, shorter queries
- Practice joining more than 2 tables

## Next Steps
After mastering JOINs, move on to Subqueries for nested queries.
