# ORDER BY

## Overview
The ORDER BY clause is used to sort the result set in ascending or descending order based on one or more columns.

## Basic Syntax
```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC];
```

## Key Concepts

### 1. Single Column Sorting
```sql
-- Ascending (default)
SELECT * FROM customers ORDER BY last_name;

-- Descending
SELECT * FROM products ORDER BY price DESC;
```

### 2. Multiple Column Sorting
```sql
-- Sort by country (ascending), then by city (ascending)
SELECT * FROM customers ORDER BY country, city;

-- Sort by department (ascending), then by salary (descending)
SELECT * FROM employees ORDER BY department ASC, salary DESC;
```

### 3. Sorting by Column Position
```sql
-- Sort by the 2nd column in the SELECT list
SELECT first_name, last_name, salary FROM employees ORDER BY 3 DESC;
```

### 4. Sorting with Expressions
```sql
-- Sort by calculated column
SELECT product_name, price, price * stock_quantity AS total_value
FROM products
ORDER BY total_value DESC;
```

## Important Notes
- ASC (ascending) is the default order
- DESC means descending order
- NULL values typically appear first in ascending order, last in descending order (database-dependent)
- You can combine WHERE and ORDER BY clauses

## Common Patterns
```sql
-- Top N results
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- Alphabetical listing
SELECT * FROM customers ORDER BY last_name, first_name;

-- Latest first
SELECT * FROM orders ORDER BY order_date DESC;
```

## Practice Tips
- Practice sorting on different data types (text, numbers, dates)
- Experiment with multiple column sorts
- Combine with WHERE clause for filtered and sorted results

## Next Steps
After mastering ORDER BY, move on to Aggregate Functions for data summarization.
