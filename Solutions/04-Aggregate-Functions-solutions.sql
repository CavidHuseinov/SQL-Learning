-- Aggregate Functions - Solutions
-- Solutions to exercises in 01-Fundamentals/04-Aggregate-Functions/exercises.sql

-- EXERCISE 1: COUNT all rows
SELECT COUNT(*) AS total_customers FROM customers;

-- EXERCISE 2: COUNT with condition
SELECT COUNT(*) AS electronics_count 
FROM products 
WHERE category = 'Electronics';

-- EXERCISE 3: COUNT DISTINCT
SELECT COUNT(DISTINCT country) AS unique_countries FROM customers;

-- EXERCISE 4: SUM function
SELECT SUM(price * stock_quantity) AS total_inventory_value FROM products;

-- EXERCISE 5: AVG function
SELECT AVG(price) AS average_price FROM products;

-- EXERCISE 6: MIN function
SELECT MIN(price) AS lowest_price FROM products;

-- EXERCISE 7: MAX function
SELECT MAX(salary) AS highest_salary FROM employees;

-- EXERCISE 8: Multiple aggregates
SELECT 
    COUNT(*) AS total_products,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM products;

-- EXERCISE 9: SUM with WHERE
SELECT SUM(total_amount) AS total_completed 
FROM orders 
WHERE status = 'Completed';

-- EXERCISE 10: AVG with WHERE
SELECT AVG(salary) AS avg_sales_salary 
FROM employees 
WHERE department = 'Sales';

-- EXERCISE 11: COUNT with WHERE
SELECT COUNT(*) AS shipped_orders 
FROM orders 
WHERE status = 'Shipped';

-- EXERCISE 12: Complex aggregation
SELECT 
    COUNT(*) AS product_count,
    AVG(price) AS avg_price,
    SUM(price * stock_quantity) AS total_inventory_value
FROM products
WHERE category = 'Furniture';

-- EXERCISE 13: MIN and MAX dates
SELECT 
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM orders;

-- EXERCISE 14: COUNT DISTINCT categories
SELECT COUNT(DISTINCT category) AS unique_categories FROM products;

-- EXERCISE 15: Complete statistics
SELECT 
    COUNT(*) AS total_employees,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    SUM(salary) AS total_salary_expense
FROM employees;
