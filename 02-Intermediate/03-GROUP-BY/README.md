# GROUP BY

## Overview
GROUP BY clause groups rows with the same values in specified columns into summary rows. It's typically used with aggregate functions to perform calculations on each group.

## Basic Syntax
```sql
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1;
```

## Key Concepts

### 1. Simple GROUP BY
```sql
-- Count customers by country
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country;
```

### 2. GROUP BY with Multiple Columns
```sql
-- Count customers by country and city
SELECT country, city, COUNT(*) AS customer_count
FROM customers
GROUP BY country, city;
```

### 3. GROUP BY with Multiple Aggregates
```sql
-- Product statistics by category
SELECT 
    category,
    COUNT(*) AS product_count,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM products
GROUP BY category;
```

### 4. HAVING Clause
HAVING filters groups after GROUP BY (WHERE filters rows before GROUP BY).

```sql
-- Categories with average price > 200
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 200;
```

### 5. GROUP BY with JOIN
```sql
-- Order count per customer
SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

### 6. GROUP BY with ORDER BY
```sql
-- Top departments by average salary
SELECT 
    department,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;
```

## Important Rules
1. Every column in SELECT must be either:
   - In the GROUP BY clause, OR
   - Inside an aggregate function

2. WHERE filters before grouping, HAVING filters after grouping

3. Execution order: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY

## Common Patterns
```sql
-- Find duplicates
SELECT email, COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- Top N groups
SELECT category, COUNT(*) AS count
FROM products
GROUP BY category
ORDER BY count DESC
LIMIT 3;
```

## Practice Tips
- Start with single column GROUP BY
- Practice combining GROUP BY with different aggregate functions
- Master the difference between WHERE and HAVING
- Try GROUP BY with JOINs
- Use ORDER BY to sort your grouped results

## Next Steps
After mastering GROUP BY, move on to Advanced topics including Data Modification operations.
