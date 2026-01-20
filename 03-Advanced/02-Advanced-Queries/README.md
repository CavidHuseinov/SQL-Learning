# Advanced Queries

## Overview
Advanced SQL techniques for solving complex problems using CTEs, window functions, and advanced pattern matching.

## Common Table Expressions (CTEs)

### 1. Simple CTE
```sql
WITH customer_orders AS (
    SELECT 
        customer_id,
        COUNT(*) AS order_count,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT 
    c.first_name,
    c.last_name,
    co.order_count,
    co.total_spent
FROM customers c
INNER JOIN customer_orders co ON c.customer_id = co.customer_id;
```

### 2. Multiple CTEs
```sql
WITH 
product_sales AS (
    SELECT product_id, SUM(quantity) AS total_sold
    FROM order_items
    GROUP BY product_id
),
product_revenue AS (
    SELECT product_id, SUM(quantity * unit_price) AS revenue
    FROM order_items
    GROUP BY product_id
)
SELECT 
    p.product_name,
    ps.total_sold,
    pr.revenue
FROM products p
INNER JOIN product_sales ps ON p.product_id = ps.product_id
INNER JOIN product_revenue pr ON p.product_id = pr.product_id;
```

### 3. Recursive CTE
```sql
-- Employee hierarchy
WITH RECURSIVE employee_hierarchy AS (
    -- Base case: Top-level managers
    SELECT employee_id, first_name, last_name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive case: Employees with managers
    SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, eh.level + 1
    FROM employees e
    INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT * FROM employee_hierarchy ORDER BY level, last_name;
```

## Window Functions

### 1. ROW_NUMBER()
```sql
-- Rank products by price within each category
SELECT 
    product_name,
    category,
    price,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS rank
FROM products;
```

### 2. RANK() and DENSE_RANK()
```sql
SELECT 
    first_name,
    last_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM employees;
```

### 3. Aggregate Window Functions
```sql
-- Running total of orders
SELECT 
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;
```

### 4. LAG() and LEAD()
```sql
-- Compare each order with previous order
SELECT 
    order_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (ORDER BY order_date) AS prev_order_amount,
    LEAD(total_amount) OVER (ORDER BY order_date) AS next_order_amount
FROM orders;
```

## Advanced Techniques

### 1. CASE Expressions
```sql
SELECT 
    product_name,
    price,
    CASE 
        WHEN price < 100 THEN 'Budget'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_category
FROM products;
```

### 2. PIVOT-like Queries
```sql
SELECT 
    department,
    SUM(CASE WHEN salary < 60000 THEN 1 ELSE 0 END) AS low_salary,
    SUM(CASE WHEN salary BETWEEN 60000 AND 70000 THEN 1 ELSE 0 END) AS mid_salary,
    SUM(CASE WHEN salary > 70000 THEN 1 ELSE 0 END) AS high_salary
FROM employees
GROUP BY department;
```

### 3. String Functions
```sql
-- String manipulation
SELECT 
    first_name,
    last_name,
    UPPER(first_name) AS upper_name,
    LOWER(last_name) AS lower_name,
    CONCAT(first_name, ' ', last_name) AS full_name,
    LENGTH(email) AS email_length,
    SUBSTRING(email, 1, POSITION('@' IN email) - 1) AS username
FROM customers;
```

## Practice Tips
- Master CTEs before moving to window functions
- Practice window functions with different PARTITION BY and ORDER BY combinations
- Use CASE statements for conditional logic
- Recursive CTEs are powerful but complex - start simple

## Next Steps
Combine these advanced techniques with your fundamental knowledge to solve real-world complex queries!
