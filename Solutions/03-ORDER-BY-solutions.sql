-- ORDER BY - Solutions
-- Solutions to exercises in 01-Fundamentals/03-ORDER-BY/exercises.sql

-- EXERCISE 1: Simple ascending sort
SELECT * FROM products ORDER BY product_name ASC;

-- EXERCISE 2: Descending sort
SELECT * FROM products ORDER BY price DESC;

-- EXERCISE 3: Sort by date
SELECT * FROM customers ORDER BY registration_date ASC;

-- EXERCISE 4: Multiple column sort
SELECT * FROM customers ORDER BY country ASC, city ASC;

-- EXERCISE 5: Mixed sort directions
SELECT * FROM employees ORDER BY department ASC, salary DESC;

-- EXERCISE 6: Sort with WHERE clause
SELECT * FROM products 
WHERE category = 'Electronics' 
ORDER BY price DESC;

-- EXERCISE 7: Sort by calculated column
SELECT 
    product_name, 
    price, 
    stock_quantity,
    price * stock_quantity AS inventory_value
FROM products
ORDER BY price * stock_quantity DESC;

-- EXERCISE 8: Latest orders first
SELECT * FROM orders ORDER BY order_date DESC;

-- EXERCISE 9: Alphabetical customer list
SELECT * FROM customers 
ORDER BY last_name ASC, first_name ASC;

-- EXERCISE 10: Highest paid employees
SELECT first_name, last_name, department, salary 
FROM employees 
ORDER BY salary DESC;

-- EXERCISE 11: Complex sorting
SELECT order_id, product_id, quantity, unit_price 
FROM order_items
ORDER BY order_id ASC, unit_price DESC;

-- EXERCISE 12: Sort with LIMIT
SELECT product_name, price 
FROM products 
ORDER BY price DESC 
LIMIT 5;
