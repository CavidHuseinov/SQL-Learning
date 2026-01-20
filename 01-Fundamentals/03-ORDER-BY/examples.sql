-- ORDER BY - Example Queries

-- Example 1: Simple ascending sort (default)
SELECT * FROM customers ORDER BY last_name;

-- Example 2: Explicit ascending
SELECT * FROM products ORDER BY price ASC;

-- Example 3: Descending sort
SELECT * FROM products ORDER BY price DESC;

-- Example 4: Multiple columns - same direction
SELECT * FROM customers ORDER BY country, city;

-- Example 5: Multiple columns - mixed directions
SELECT * FROM employees 
ORDER BY department ASC, salary DESC;

-- Example 6: Sort by date
SELECT * FROM orders ORDER BY order_date DESC;

-- Example 7: Sort with WHERE clause
SELECT * FROM products 
WHERE category = 'Electronics'
ORDER BY price DESC;

-- Example 8: Sort by calculated value
SELECT 
    product_name,
    price,
    stock_quantity,
    price * stock_quantity AS inventory_value
FROM products
ORDER BY inventory_value DESC;

-- Example 9: Sort by column position
SELECT first_name, last_name, salary 
FROM employees 
ORDER BY 3 DESC;  -- Sorts by the 3rd column (salary)

-- Example 10: Alphabetical listing
SELECT first_name, last_name, email
FROM customers
ORDER BY last_name, first_name;

-- Example 11: Top N with LIMIT
SELECT product_name, price 
FROM products 
ORDER BY price DESC 
LIMIT 5;

-- Example 12: Complex sort
SELECT 
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM orders o
WHERE o.status IN ('Completed', 'Shipped')
ORDER BY o.order_date DESC, o.total_amount DESC;
