-- WHERE Clause - Solutions
-- Solutions to exercises in 01-Fundamentals/02-WHERE-Clause/exercises.sql

-- EXERCISE 1: Simple equality
SELECT * FROM customers WHERE country = 'USA';

-- EXERCISE 2: Numeric comparison
SELECT * FROM products WHERE price > 200;

-- EXERCISE 3: AND operator
SELECT * FROM products 
WHERE category = 'Electronics' AND price < 500;

-- EXERCISE 4: OR operator
SELECT * FROM customers 
WHERE country = 'USA' OR country = 'UK';

-- EXERCISE 5: BETWEEN operator
SELECT * FROM products 
WHERE price BETWEEN 50 AND 300;

-- EXERCISE 6: IN operator
SELECT * FROM orders 
WHERE status IN ('Completed', 'Shipped');

-- EXERCISE 7: LIKE pattern matching
SELECT * FROM customers 
WHERE last_name LIKE 'W%';

-- EXERCISE 8: Email pattern
SELECT * FROM customers 
WHERE email LIKE '%@email.com';

-- EXERCISE 9: IS NULL
SELECT * FROM employees 
WHERE manager_id IS NULL;

-- EXERCISE 10: Complex conditions
SELECT * FROM products 
WHERE category = 'Furniture' 
   OR (category = 'Electronics' AND price > 500);

-- EXERCISE 11: NOT operator
SELECT * FROM customers 
WHERE NOT country = 'USA';
-- Alternative: WHERE country <> 'USA'

-- EXERCISE 12: Multiple AND conditions
SELECT * FROM employees 
WHERE department = 'Sales' AND salary > 60000;

-- EXERCISE 13: Date filtering
SELECT * FROM orders 
WHERE order_date BETWEEN '2024-09-01' AND '2024-09-30';

-- EXERCISE 14: NOT IN operator
SELECT * FROM products 
WHERE category NOT IN ('Electronics', 'Furniture');

-- EXERCISE 15: Complex combination
SELECT * FROM customers 
WHERE (city = 'New York' OR city = 'London') 
  AND registration_date > '2024-03-01';
