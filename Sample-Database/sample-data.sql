-- Sample Data for SQL Learning Database

-- Insert Customers
INSERT INTO customers (customer_id, first_name, last_name, email, city, country, registration_date) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', 'New York', 'USA', '2024-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', 'London', 'UK', '2024-02-20'),
(3, 'Mike', 'Johnson', 'mike.j@email.com', 'Toronto', 'Canada', '2024-03-10'),
(4, 'Sarah', 'Williams', 'sarah.w@email.com', 'Sydney', 'Australia', '2024-04-05'),
(5, 'David', 'Brown', 'david.b@email.com', 'New York', 'USA', '2024-05-12'),
(6, 'Emma', 'Davis', 'emma.d@email.com', 'Paris', 'France', '2024-06-18'),
(7, 'Oliver', 'Miller', 'oliver.m@email.com', 'Berlin', 'Germany', '2024-07-22'),
(8, 'Sophia', 'Wilson', 'sophia.w@email.com', 'Tokyo', 'Japan', '2024-08-30');

-- Insert Products
INSERT INTO products (product_id, product_name, category, price, stock_quantity) VALUES
(1, 'Laptop', 'Electronics', 999.99, 50),
(2, 'Smartphone', 'Electronics', 699.99, 100),
(3, 'Headphones', 'Electronics', 149.99, 200),
(4, 'Desk Chair', 'Furniture', 299.99, 75),
(5, 'Standing Desk', 'Furniture', 599.99, 30),
(6, 'Monitor', 'Electronics', 349.99, 60),
(7, 'Keyboard', 'Electronics', 89.99, 150),
(8, 'Mouse', 'Electronics', 49.99, 180),
(9, 'Bookshelf', 'Furniture', 199.99, 40),
(10, 'Lamp', 'Furniture', 79.99, 120);

-- Insert Orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
(1, 1, '2024-09-01', 1149.98, 'Completed'),
(2, 2, '2024-09-05', 699.99, 'Completed'),
(3, 3, '2024-09-10', 949.97, 'Shipped'),
(4, 1, '2024-09-15', 299.99, 'Completed'),
(5, 4, '2024-09-20', 1599.96, 'Processing'),
(6, 5, '2024-09-25', 149.99, 'Completed'),
(7, 6, '2024-09-28', 739.98, 'Shipped'),
(8, 2, '2024-10-01', 199.99, 'Completed');

-- Insert Order Items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 999.99),
(2, 1, 3, 1, 149.99),
(3, 2, 2, 1, 699.99),
(4, 3, 6, 2, 349.99),
(5, 3, 7, 1, 89.99),
(6, 3, 8, 2, 49.99),
(7, 4, 4, 1, 299.99),
(8, 5, 1, 1, 999.99),
(9, 5, 5, 1, 599.99),
(10, 6, 3, 1, 149.99),
(11, 7, 2, 1, 699.99),
(12, 7, 8, 1, 49.99),
(13, 8, 9, 1, 199.99);

-- Insert Employees
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date, manager_id) VALUES
(1, 'Alice', 'Anderson', 'Management', 120000.00, '2020-01-15', NULL),
(2, 'Bob', 'Bradley', 'Sales', 65000.00, '2021-03-20', 1),
(3, 'Carol', 'Carter', 'Sales', 60000.00, '2021-06-10', 1),
(4, 'Dan', 'Davis', 'IT', 75000.00, '2020-09-05', 1),
(5, 'Eve', 'Evans', 'IT', 70000.00, '2022-02-14', 4),
(6, 'Frank', 'Foster', 'Marketing', 68000.00, '2021-11-30', 1),
(7, 'Grace', 'Green', 'HR', 62000.00, '2022-05-18', 1),
(8, 'Henry', 'Harris', 'Sales', 58000.00, '2023-01-09', 2);
