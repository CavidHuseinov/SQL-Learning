# Aggregate Functions

## Overview
Aggregate functions perform calculations on a set of values and return a single value. They are commonly used with GROUP BY clause but can also be used alone.

## Common Aggregate Functions

### 1. COUNT() - Count rows
```sql
-- Count all rows
SELECT COUNT(*) FROM customers;

-- Count non-null values in a column
SELECT COUNT(email) FROM customers;

-- Count distinct values
SELECT COUNT(DISTINCT country) FROM customers;
```

### 2. SUM() - Calculate total
```sql
-- Sum of all product prices
SELECT SUM(price) FROM products;

-- Sum with condition
SELECT SUM(total_amount) FROM orders WHERE status = 'Completed';
```

### 3. AVG() - Calculate average
```sql
-- Average product price
SELECT AVG(price) FROM products;

-- Average salary by department (with GROUP BY)
SELECT department, AVG(salary) FROM employees GROUP BY department;
```

### 4. MIN() - Find minimum value
```sql
-- Lowest price
SELECT MIN(price) FROM products;

-- Earliest hire date
SELECT MIN(hire_date) FROM employees;
```

### 5. MAX() - Find maximum value
```sql
-- Highest price
SELECT MAX(price) FROM products;

-- Most recent order date
SELECT MAX(order_date) FROM orders;
```

## Combining Aggregate Functions
```sql
SELECT 
    COUNT(*) AS total_products,
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price,
    AVG(price) AS average_price,
    SUM(stock_quantity) AS total_stock
FROM products;
```

## With WHERE Clause
```sql
-- Statistics for Electronics only
SELECT 
    COUNT(*) AS count,
    AVG(price) AS avg_price,
    MAX(price) AS max_price
FROM products
WHERE category = 'Electronics';
```

## Important Notes
- Aggregate functions ignore NULL values (except COUNT(*))
- Cannot mix aggregate functions with regular columns without GROUP BY
- Can use DISTINCT within aggregate functions: `COUNT(DISTINCT country)`
- Can combine with WHERE but not with GROUP BY results (use HAVING for that)

## Practice Tips
- Practice each function individually first
- Try combining multiple aggregate functions
- Experiment with COUNT vs COUNT(DISTINCT)
- Remember that aggregates work on filtered data if WHERE is used

## Next Steps
After mastering basic aggregate functions, learn GROUP BY to aggregate data by categories.
