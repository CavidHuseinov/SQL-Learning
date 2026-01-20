# Sample Database

This folder contains the database schema and sample data used throughout all SQL exercises.

## Database Structure

The database represents a simple e-commerce system with the following tables:

### Tables

1. **customers** - Customer information
   - customer_id (PK)
   - first_name, last_name, email
   - city, country
   - registration_date

2. **products** - Product catalog
   - product_id (PK)
   - product_name, category
   - price, stock_quantity

3. **orders** - Customer orders
   - order_id (PK)
   - customer_id (FK)
   - order_date, total_amount, status

4. **order_items** - Individual items in orders
   - order_item_id (PK)
   - order_id (FK), product_id (FK)
   - quantity, unit_price

5. **employees** - Company employees
   - employee_id (PK)
   - first_name, last_name
   - department, salary
   - hire_date, manager_id (FK)

## How to Use

1. Run `schema.sql` to create the database structure
2. Run `sample-data.sql` to populate tables with sample data
3. Use this database for all exercises in the repository

## ER Diagram Relationships

- customers → orders (1:N)
- orders → order_items (1:N)
- products → order_items (1:N)
- employees → employees (self-referencing for manager relationship)
