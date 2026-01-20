-- Advanced Queries - Exercise Questions
-- Use the Sample-Database for these exercises

-- EXERCISE 1: Simple CTE
-- Use a CTE to find customers who have spent more than 500 total
-- Your query here:



-- EXERCISE 2: Multiple CTEs
-- Use CTEs to calculate:
-- 1. Total quantity sold per product
-- 2. Total revenue per product
-- Then join them to show product_name, quantity_sold, and revenue
-- Your query here:



-- EXERCISE 3: ROW_NUMBER window function
-- Rank products by price within each category (highest price = 1)
-- Your query here:



-- EXERCISE 4: Running total
-- Show a running total of order amounts ordered by date
-- Your query here:



-- EXERCISE 5: CASE expression
-- Categorize products as 'Budget' (<100), 'Mid-Range' (100-500), or 'Premium' (>500)
-- Your query here:



-- EXERCISE 6: LAG function
-- For each order, show the previous order's total_amount
-- Your query here:



-- EXERCISE 7: RANK function
-- Rank employees by salary (highest = 1), show rank with ties
-- Your query here:



-- EXERCISE 8: Partition by window function
-- Calculate the average salary for each department and show it alongside each employee
-- Your query here:



-- EXERCISE 9: Complex CTE
-- Create a CTE that calculates total spent per customer,
-- then find customers who spent more than the average
-- Your query here:



-- EXERCISE 10: CASE with aggregation
-- Count how many products are in each price category (Budget, Mid-Range, Premium)
-- Use GROUP BY with CASE
-- Your query here:



-- EXERCISE 11: String functions
-- Extract the username part (before @) from customer emails
-- Your query here:



-- EXERCISE 12: Advanced window function
-- For each product, show:
-- - Product name and price
-- - Rank within category
-- - Average price in category
-- - Difference from category average
-- Your query here:
