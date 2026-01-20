# Data Modification

## Overview
Data Modification Language (DML) statements allow you to insert, update, and delete data in database tables.

## INSERT - Adding New Data

### 1. Insert Single Row
```sql
INSERT INTO customers (customer_id, first_name, last_name, email, city, country, registration_date)
VALUES (9, 'Tom', 'Clark', 'tom.c@email.com', 'Boston', 'USA', '2024-10-15');
```

### 2. Insert Multiple Rows
```sql
INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (11, 'Webcam', 'Electronics', 79.99, 90),
    (12, 'USB Cable', 'Electronics', 9.99, 500),
    (13, 'Desk Pad', 'Furniture', 29.99, 200);
```

### 3. Insert from SELECT
```sql
INSERT INTO archived_orders (order_id, customer_id, order_date, total_amount)
SELECT order_id, customer_id, order_date, total_amount
FROM orders
WHERE order_date < '2024-01-01';
```

## UPDATE - Modifying Existing Data

### 1. Update Single Row
```sql
UPDATE customers
SET city = 'Los Angeles'
WHERE customer_id = 1;
```

### 2. Update Multiple Columns
```sql
UPDATE products
SET price = 899.99, stock_quantity = 45
WHERE product_id = 1;
```

### 3. Update with Calculation
```sql
-- Increase all prices by 10%
UPDATE products
SET price = price * 1.10
WHERE category = 'Electronics';
```

### 4. Update with WHERE
```sql
UPDATE orders
SET status = 'Completed'
WHERE status = 'Shipped' AND order_date < '2024-09-01';
```

## DELETE - Removing Data

### 1. Delete Specific Rows
```sql
DELETE FROM customers
WHERE customer_id = 9;
```

### 2. Delete with Condition
```sql
DELETE FROM orders
WHERE status = 'Cancelled' AND order_date < '2023-01-01';
```

### 3. Delete All Rows (Use with EXTREME CAUTION!)
```sql
DELETE FROM temp_table;
```

## TRANSACTION Control (Important!)

### 1. Using Transactions
```sql
BEGIN TRANSACTION;

UPDATE products SET stock_quantity = stock_quantity - 1 WHERE product_id = 1;
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status)
VALUES (9, 1, '2024-10-20', 999.99, 'Processing');

COMMIT;  -- Or ROLLBACK to undo
```

## Best Practices

1. **Always use WHERE clause** with UPDATE/DELETE (unless you really mean to affect all rows)
2. **Test with SELECT first** - Convert your WHERE clause to SELECT to verify what will be affected
3. **Use transactions** for multiple related changes
4. **Backup before bulk operations**
5. **Be careful with NULL** - Use IS NULL, not = NULL

## Practice Tips
- Start with INSERT on single rows
- Practice UPDATE with simple WHERE conditions
- Always SELECT before you UPDATE/DELETE
- Never run DELETE/UPDATE without WHERE in production!
- Practice transactions for related operations

## Safety Check Query
```sql
-- Before: UPDATE customers SET city = 'Boston' WHERE customer_id = 5;
-- First run: SELECT * FROM customers WHERE customer_id = 5;
```
