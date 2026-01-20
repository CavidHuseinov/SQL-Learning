-- SELECT Basics - Example Queries

-- Example 1: Select all customers
SELECT * FROM customers;

-- Example 2: Select specific columns
SELECT first_name, last_name, email FROM customers;

-- Example 3: Select with DISTINCT
SELECT DISTINCT country FROM customers;

-- Example 4: Using column aliases
SELECT 
    product_name AS "Product",
    price AS "Original Price",
    price * 1.2 AS "Price with 20% Markup"
FROM products;

-- Example 5: Select from multiple calculations
SELECT 
    product_name,
    price,
    stock_quantity,
    price * stock_quantity AS "Total Inventory Value"
FROM products;

-- Example 6: Select distinct departments
SELECT DISTINCT department FROM employees;

-- Example 7: Simple employee information
SELECT 
    first_name || ' ' || last_name AS "Full Name",
    department,
    salary
FROM employees;

-- Example 8: Order information
SELECT 
    order_id,
    customer_id,
    order_date,
    status
FROM orders;
