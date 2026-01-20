# SELECT Basics

## Overview
The SELECT statement is the foundation of SQL. It's used to retrieve data from one or more tables.

## Basic Syntax
```sql
SELECT column1, column2, ...
FROM table_name;
```

## Key Concepts

### 1. Select All Columns
```sql
SELECT * FROM customers;
```

### 2. Select Specific Columns
```sql
SELECT first_name, last_name, email FROM customers;
```

### 3. DISTINCT - Remove Duplicates
```sql
SELECT DISTINCT city FROM customers;
```

### 4. Column Aliases
```sql
SELECT first_name AS "First Name", last_name AS "Last Name" FROM customers;
```

### 5. Simple Calculations
```sql
SELECT product_name, price, price * 1.1 AS price_with_tax FROM products;
```

## Practice Tips
- Start simple with single table queries
- Practice selecting different column combinations
- Get comfortable with the basic syntax before moving to filters
- Use DISTINCT when you need unique values

## Next Steps
After mastering SELECT basics, move on to WHERE clause for filtering data.
