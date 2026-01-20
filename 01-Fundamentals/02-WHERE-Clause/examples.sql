-- WHERE Clause - Example Queries

-- Example 1: Simple equality
SELECT * FROM customers WHERE country = 'USA';

-- Example 2: Greater than
SELECT * FROM products WHERE price > 300;

-- Example 3: AND operator
SELECT * FROM products 
WHERE category = 'Electronics' AND price < 200;

-- Example 4: OR operator
SELECT * FROM customers 
WHERE city = 'New York' OR city = 'London';

-- Example 5: BETWEEN
SELECT * FROM products 
WHERE price BETWEEN 100 AND 500;

-- Example 6: IN operator
SELECT * FROM customers 
WHERE country IN ('USA', 'UK', 'Canada');

-- Example 7: LIKE with %
SELECT * FROM customers 
WHERE email LIKE '%@email.com';

-- Example 8: LIKE with starting pattern
SELECT * FROM products 
WHERE product_name LIKE 'L%';

-- Example 9: IS NULL
SELECT * FROM employees WHERE manager_id IS NULL;

-- Example 10: IS NOT NULL
SELECT * FROM employees WHERE manager_id IS NOT NULL;

-- Example 11: NOT operator
SELECT * FROM customers WHERE NOT country = 'USA';

-- Example 12: Complex conditions with parentheses
SELECT * FROM products 
WHERE (category = 'Electronics' AND price > 500) 
   OR (category = 'Furniture' AND price > 300);

-- Example 13: Multiple conditions
SELECT * FROM employees 
WHERE department = 'IT' 
  AND salary > 70000 
  AND hire_date > '2021-01-01';

-- Example 14: Text pattern matching
SELECT * FROM customers 
WHERE first_name LIKE 'J%' AND last_name LIKE '%son';
