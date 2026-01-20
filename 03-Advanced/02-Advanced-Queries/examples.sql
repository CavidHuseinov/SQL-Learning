-- Advanced Queries - Example Queries

-- Example 1: Simple CTE
WITH customer_totals AS (
    SELECT 
        customer_id,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT 
    c.first_name,
    c.last_name,
    ct.total_spent
FROM customers c
INNER JOIN customer_totals ct ON c.customer_id = ct.customer_id
WHERE ct.total_spent > 500;

-- Example 2: Multiple CTEs
WITH 
sales_qty AS (
    SELECT product_id, SUM(quantity) AS total_qty
    FROM order_items
    GROUP BY product_id
),
sales_revenue AS (
    SELECT product_id, SUM(quantity * unit_price) AS revenue
    FROM order_items
    GROUP BY product_id
)
SELECT 
    p.product_name,
    sq.total_qty,
    sr.revenue
FROM products p
LEFT JOIN sales_qty sq ON p.product_id = sq.product_id
LEFT JOIN sales_revenue sr ON p.product_id = sr.product_id;

-- Example 3: ROW_NUMBER
SELECT 
    product_name,
    category,
    price,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS price_rank
FROM products;

-- Example 4: Running total
SELECT 
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- Example 5: CASE expression
SELECT 
    product_name,
    price,
    CASE 
        WHEN price < 100 THEN 'Budget'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_category
FROM products;

-- Example 6: LAG and LEAD
SELECT 
    order_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (ORDER BY order_date) AS prev_amount,
    LEAD(total_amount) OVER (ORDER BY order_date) AS next_amount
FROM orders;

-- Example 7: RANK and DENSE_RANK
SELECT 
    first_name,
    last_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM employees;

-- Example 8: Window function with partition
SELECT 
    first_name,
    last_name,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary,
    salary - AVG(salary) OVER (PARTITION BY department) AS diff_from_avg
FROM employees;

-- Example 9: CASE with aggregation
SELECT 
    CASE 
        WHEN price < 100 THEN 'Budget'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_category,
    COUNT(*) AS product_count
FROM products
GROUP BY 
    CASE 
        WHEN price < 100 THEN 'Budget'
        WHEN price BETWEEN 100 AND 500 THEN 'Mid-Range'
        ELSE 'Premium'
    END;

-- Example 10: String functions
SELECT 
    email,
    SUBSTRING(email, 1, POSITION('@' IN email) - 1) AS username,
    SUBSTRING(email, POSITION('@' IN email) + 1) AS domain
FROM customers;

-- Example 11: Complex window function
SELECT 
    product_name,
    category,
    price,
    RANK() OVER (PARTITION BY category ORDER BY price DESC) AS category_rank,
    AVG(price) OVER (PARTITION BY category) AS category_avg_price,
    price - AVG(price) OVER (PARTITION BY category) AS diff_from_avg
FROM products;
