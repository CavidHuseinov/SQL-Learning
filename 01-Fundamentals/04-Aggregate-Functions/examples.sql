-- Aggregate Functions - Example Queries

-- Example 1: COUNT all rows
SELECT COUNT(*) AS total_customers FROM customers;

-- Example 2: COUNT specific column
SELECT COUNT(email) AS email_count FROM customers;

-- Example 3: COUNT DISTINCT
SELECT COUNT(DISTINCT country) AS unique_countries FROM customers;

-- Example 4: SUM function
SELECT SUM(price) AS total_price FROM products;

-- Example 5: AVG function
SELECT AVG(price) AS average_price FROM products;

-- Example 6: MIN function
SELECT MIN(price) AS lowest_price FROM products;

-- Example 7: MAX function
SELECT MAX(price) AS highest_price FROM products;

-- Example 8: Multiple aggregates together
SELECT 
    COUNT(*) AS total_products,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price,
    SUM(price) AS sum_price
FROM products;

-- Example 9: Aggregates with WHERE clause
SELECT 
    COUNT(*) AS electronics_count,
    AVG(price) AS avg_electronics_price
FROM products
WHERE category = 'Electronics';

-- Example 10: SUM with calculation
SELECT SUM(price * stock_quantity) AS total_inventory_value
FROM products;

-- Example 11: Count orders by status
SELECT COUNT(*) AS completed_orders
FROM orders
WHERE status = 'Completed';

-- Example 12: Department statistics
SELECT 
    COUNT(*) AS employee_count,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees
WHERE department = 'Sales';

-- Example 13: Date aggregates
SELECT 
    MIN(order_date) AS first_order,
    MAX(order_date) AS latest_order
FROM orders;

-- Example 14: COUNT with DISTINCT vs without
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT category) AS unique_categories
FROM products;
