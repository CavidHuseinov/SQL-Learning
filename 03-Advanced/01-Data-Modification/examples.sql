-- Data Modification - Example Queries
-- CAUTION: These modify data. Use in test environment only!

-- Example 1: INSERT single row
INSERT INTO customers (customer_id, first_name, last_name, email, city, country, registration_date)
VALUES (9, 'Tom', 'Clark', 'tom.c@email.com', 'Boston', 'USA', '2024-10-15');

-- Example 2: INSERT multiple rows
INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (11, 'Webcam', 'Electronics', 79.99, 90),
    (12, 'USB Cable', 'Electronics', 9.99, 500);

-- Example 3: UPDATE single column
UPDATE customers
SET city = 'Los Angeles'
WHERE customer_id = 1;

-- Example 4: UPDATE multiple columns
UPDATE products
SET price = 899.99, stock_quantity = 45
WHERE product_id = 1;

-- Example 5: UPDATE with calculation
UPDATE products
SET price = price * 1.10
WHERE category = 'Electronics';

-- Example 6: UPDATE with complex WHERE
UPDATE orders
SET status = 'Completed'
WHERE status = 'Shipped' 
  AND order_date < '2024-09-15';

-- Example 7: DELETE specific row
DELETE FROM customers
WHERE customer_id = 9;

-- Example 8: DELETE with condition
DELETE FROM orders
WHERE status = 'Cancelled' 
  AND order_date < '2023-01-01';

-- Example 9: INSERT from SELECT
-- First create archive table
CREATE TABLE archived_orders AS 
SELECT * FROM orders WHERE 1=0;  -- Copy structure only

-- Then insert old orders
INSERT INTO archived_orders
SELECT * FROM orders
WHERE order_date < '2024-01-01';

-- Example 10: Safe DELETE - check first
-- Step 1: See what will be deleted
SELECT * FROM orders WHERE status = 'Cancelled';

-- Step 2: If OK, delete
DELETE FROM orders WHERE status = 'Cancelled';

-- Example 11: Transaction example
BEGIN TRANSACTION;

UPDATE products 
SET stock_quantity = stock_quantity - 1 
WHERE product_id = 1;

INSERT INTO orders (order_id, customer_id, order_date, total_amount, status)
VALUES (100, 1, CURRENT_DATE, 999.99, 'Processing');

COMMIT;

-- Example 12: ROLLBACK example
BEGIN TRANSACTION;

DELETE FROM customers WHERE customer_id = 1;

-- Oops, wrong customer!
ROLLBACK;
