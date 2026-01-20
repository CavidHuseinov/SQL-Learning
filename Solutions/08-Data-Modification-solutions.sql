-- Data Modification - Solutions
-- Solutions to exercises in 03-Advanced/01-Data-Modification/exercises.sql
-- CAUTION: These modify data. Use in test environment only!

-- EXERCISE 1: Simple INSERT
INSERT INTO customers (customer_id, first_name, last_name, email, city, country, registration_date)
VALUES (10, 'Alex', 'Thompson', 'alex.t@email.com', 'Seattle', 'USA', '2024-10-20');

-- EXERCISE 2: INSERT multiple rows
INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (14, 'Tablet', 'Electronics', 399.99, 80),
    (15, 'Smart Watch', 'Electronics', 299.99, 100),
    (16, 'Office Chair', 'Furniture', 249.99, 60);

-- EXERCISE 3: Simple UPDATE
UPDATE customers
SET city = 'San Francisco'
WHERE customer_id = 1;

-- EXERCISE 4: UPDATE with calculation
UPDATE products
SET price = price * 1.05
WHERE category = 'Furniture';

-- EXERCISE 5: UPDATE multiple columns
UPDATE products
SET price = 649.99, stock_quantity = 120
WHERE product_id = 2;

-- EXERCISE 6: Conditional UPDATE
UPDATE orders
SET status = 'Delivered'
WHERE status = 'Shipped' 
  AND order_date BETWEEN '2024-09-01' AND '2024-09-30';

-- EXERCISE 7: Simple DELETE
DELETE FROM customers
WHERE customer_id = 10;

-- EXERCISE 8: Conditional DELETE
DELETE FROM products
WHERE stock_quantity = 0;

-- EXERCISE 9: INSERT from SELECT
-- First create the table
CREATE TABLE high_value_orders AS
SELECT * FROM orders WHERE 1=0;

-- Then insert data
INSERT INTO high_value_orders
SELECT * FROM orders
WHERE total_amount > 1000;

-- EXERCISE 10: Complex UPDATE
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'Sales' 
  AND hire_date < '2022-01-01';

-- EXERCISE 11: UPDATE with JOIN (PostgreSQL/MySQL syntax)
-- Note: Syntax varies by database
UPDATE products p
SET stock_quantity = stock_quantity - (
    SELECT quantity 
    FROM order_items oi 
    WHERE oi.product_id = p.product_id 
      AND oi.order_id = 1
)
WHERE product_id IN (
    SELECT product_id FROM order_items WHERE order_id = 1
);

-- EXERCISE 12: Safe DELETE practice
-- First: SELECT to see what would be deleted
SELECT * FROM orders WHERE status = 'Cancelled';

-- Then: DELETE if results look correct
DELETE FROM orders WHERE status = 'Cancelled';

-- Note: Always test with SELECT before DELETE/UPDATE!
