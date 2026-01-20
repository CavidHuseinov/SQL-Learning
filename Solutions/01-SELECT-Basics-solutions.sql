-- SELECT Basics - Solutions
-- Solutions to exercises in 01-Fundamentals/01-SELECT-Basics/exercises.sql

-- EXERCISE 1: Select all data
SELECT * FROM customers;

-- EXERCISE 2: Select specific columns
SELECT first_name, email FROM customers;

-- EXERCISE 3: Select with calculation
SELECT 
    product_name, 
    price,
    price * 1.2 AS price_with_markup
FROM products;

-- EXERCISE 4: Select distinct values
SELECT DISTINCT city FROM customers;

-- EXERCISE 5: Select distinct countries
SELECT DISTINCT country FROM customers;

-- EXERCISE 6: Column aliases
SELECT 
    first_name AS "First Name",
    last_name AS "Last Name",
    email AS "Email Address"
FROM customers;

-- EXERCISE 7: All product information
SELECT * FROM products;

-- EXERCISE 8: Employee names
SELECT first_name, last_name, department FROM employees;

-- EXERCISE 9: Product categories
SELECT DISTINCT category FROM products;

-- EXERCISE 10: Price calculations
SELECT 
    product_name,
    price,
    price * 0.9 AS "Sale Price",
    price * 0.08 AS "Tax"
FROM products;
