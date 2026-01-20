# WHERE Clause

## Overview
The WHERE clause is used to filter records based on specific conditions. It allows you to retrieve only the data that meets your criteria.

## Basic Syntax
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

## Key Concepts

### 1. Comparison Operators
- `=` Equal to
- `<>` or `!=` Not equal to
- `>` Greater than
- `<` Less than
- `>=` Greater than or equal to
- `<=` Less than or equal to

```sql
SELECT * FROM products WHERE price > 100;
SELECT * FROM customers WHERE country = 'USA';
```

### 2. Logical Operators
- `AND` - All conditions must be true
- `OR` - At least one condition must be true
- `NOT` - Negates a condition

```sql
SELECT * FROM products WHERE price > 100 AND category = 'Electronics';
SELECT * FROM customers WHERE country = 'USA' OR country = 'Canada';
```

### 3. Special Operators

**BETWEEN** - Range of values
```sql
SELECT * FROM products WHERE price BETWEEN 100 AND 500;
```

**IN** - Match any value in a list
```sql
SELECT * FROM customers WHERE country IN ('USA', 'UK', 'Canada');
```

**LIKE** - Pattern matching
- `%` - Represents zero or more characters
- `_` - Represents a single character
```sql
SELECT * FROM customers WHERE email LIKE '%@email.com';
SELECT * FROM products WHERE product_name LIKE 'Lap%';
```

**IS NULL / IS NOT NULL** - Check for NULL values
```sql
SELECT * FROM employees WHERE manager_id IS NULL;
```

## Practice Tips
- Start with simple single conditions
- Practice combining conditions with AND/OR
- Master LIKE patterns for text searching
- Remember that NULL requires special handling (IS NULL, not = NULL)

## Next Steps
After mastering WHERE clause, move on to ORDER BY for sorting results.
