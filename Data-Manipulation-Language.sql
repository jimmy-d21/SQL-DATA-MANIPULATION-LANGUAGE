-- Example 1 — Insert a Single Row with All Columns Specified
-- GOAL: Insert a single new customer record into the customers table by explicitly providing values for all available columns.

-- Insert a single new customer
INSERT INTO customers (id, name, email, membership_level, created_at)
VALUES (4, 'Diana Prince', 'diana@example.com', 'Premium', '2026-09-22');

-- Verify inserted data
SELECT id, name, email, membership_level, created_at
FROM customers
WHERE id = 4;

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | name         | email             | membership_level | created_at
-- ---+--------------+-------------------+------------------+------------
-- 4  | Diana Prince | diana@example.com | Premium          | 2026-09-22


-- Example 2 — Insert a Single Row Omitting Auto-Incrementing Primary Key
-- GOAL: Insert a new customer without specifying the id column, letting PostgreSQL automatically generate the primary key value using SERIAL.
-- Insert a customer letting PostgreSQL handle the ID
INSERT INTO customers (name, email, membership_level, created_at)
VALUES ('Evan Wright', 'evan@example.com', 'Standard', '2026-09-22');

-- Verify inserted data
SELECT id, name, email, membership_level, created_at
FROM customers
WHERE email = 'evan@example.com';

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | name        | email            | membership_level | created_at
-- ---+-------------+------------------+------------------+------------
-- 5  | Evan Wright | evan@example.com | Standard         | 2026-09-22


-- Example 3 — Insert Multiple Rows in a Single Query
-- GOAL: Insert three new products into the products table using one INSERT statement.
-- Insert three products at once
INSERT INTO products (name, price, stock_quantity, is_available)
VALUES 
  ('Cheese Dog', 95.00, 30, true),
  ('Milk Tea', 110.00, 45, true),
  ('Onion Rings', 75.00, 20, true);

-- Verify inserted data
SELECT id, name, price, stock_quantity, is_available
FROM products
WHERE id >= 4;

-- Command Result:
-- INSERT 0 3

-- Verification Query Result:
-- id | name        | price  | stock_quantity | is_available
-- ---+-------------+--------+----------------+--------------
-- 4  | Cheese Dog  |  95.00 |             30 | t
-- 5  | Milk Tea    | 110.00 |             45 | t
-- 6  | Onion Rings |  75.00 |             20 | t


-- Example 4 — Insert Data into Specific Columns Only
-- GOAL: Insert a product while supplying values for only required/specific columns (name and price).
-- Insert product with specific columns only
INSERT INTO products (name, price)
VALUES ('Choco Sundae', 50.00);

-- Verify inserted data
SELECT id, name, price, stock_quantity, is_available
FROM products
WHERE name = 'Choco Sundae';

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | name         | price | stock_quantity | is_available
-- ---+--------------+-------+----------------+--------------
-- 7  | Choco Sundae | 50.00 |              0 | t


-- Example 5 — Insert Text Values with Special Characters
-- GOAL: Insert a customer whose name contains single quotes (apostrophes).
-- Insert name containing an apostrophe
INSERT INTO customers (name, email)
VALUES ('Fiona O''Connor', 'fiona@example.com');

-- Verify inserted data
SELECT id, name, email
FROM customers
WHERE email = 'fiona@example.com';

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | name           | email
-- ---+----------------+------------------
-- 6  | Fiona O'Connor | fiona@example.com


-- Example 6 — Insert Numeric Data Types (Decimals and Integers)
-- GOAL: Insert a product record focusing on exact decimal values (NUMERIC) and integer values (INT).
-- Insert explicit numeric data types
INSERT INTO products (name, price, stock_quantity)
VALUES ('Double Cheeseburger', 220.50, 25);

-- Verify inserted data
SELECT name, price, stock_quantity
FROM products
WHERE name = 'Double Cheeseburger';

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- name                | price  | stock_quantity
-- --------------------+--------+----------------
-- Double Cheeseburger | 220.50 |             25


-- Example 7 — Insert Date Values
-- GOAL: Insert an order record with an explicit date format (YYYY-MM-DD).
-- Insert order with explicit date format
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES (3, '2026-09-21', 195.00, 'Completed');

-- Verify inserted data
SELECT id, customer_id, order_date, total_amount, status
FROM orders
WHERE id = 4;

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | customer_id | order_date | total_amount | status
-- ---+-------------+------------+--------------+-----------
-- 4  |           3 | 2026-09-21 |       195.00 | Completed


-- Example 8 — Insert Boolean Values
-- GOAL: Insert a product record explicitly specifying a BOOLEAN field as false.
-- Insert a product with explicit boolean false
INSERT INTO products (name, price, stock_quantity, is_available)
VALUES ('Seasonal Pie', 65.00, 0, false);

-- Verify inserted data
SELECT name, price, is_available
FROM products
WHERE name = 'Seasonal Pie';

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- name         | price | is_available
-- -------------+-------+--------------
-- Seasonal Pie | 65.00 | f


-- Example 9 — Insert Records with Explicit NULL Values
-- GOAL: Insert an order record where the total_amount is unknown or not yet calculated (NULL).
-- Insert order with NULL amount
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES (2, '2026-09-22', NULL, 'Pending');

-- Verify inserted data
SELECT id, customer_id, total_amount, status
FROM orders
WHERE id = 5;

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | customer_id | total_amount | status
-- ---+-------------+--------------+---------
-- 5  |           2 |         NULL | Pending


-- Example 10 — Insert Records using the DEFAULT Keyword
-- GOAL: Insert a customer relying on column default values by explicitly passing the DEFAULT keyword.
-- Insert using DEFAULT keyword for membership and date
INSERT INTO customers (name, email, membership_level, created_at)
VALUES ('George Clark', 'george@example.com', DEFAULT, DEFAULT);

-- Verify inserted data
SELECT id, name, membership_level, created_at
FROM customers
WHERE email = 'george@example.com';

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | name         | membership_level | created_at
-- ---+--------------+------------------+------------
-- 7  | George Clark | Standard         | 2026-09-22