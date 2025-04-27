-- Drop tables if they exist
DROP TABLE IF EXISTS order_details, orders, products, users;

-- USERS table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- PRODUCTS table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- ORDERS table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ORDER_DETAILS table (for many-to-many relationship)
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_at_purchase DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert users
INSERT INTO users (username, email, password)
VALUES ('Certura', 'certura@example.com', 'password123'),
       ('Huzaifa', 'huzaifa@example.com', 'password123');

-- Insert products
INSERT INTO products (name, price, stock_quantity)
VALUES ('Laptop', 1200.00, 10),
       ('Phone', 800.00, 20);

-- Insert orders
INSERT INTO orders (user_id)
VALUES (1), (2);

-- Insert order details
INSERT INTO order_details (order_id, product_id, quantity, price_at_purchase)
VALUES (1, 1, 1, 1200.00),
       (2, 2, 2, 800.00);

-- Use SELECT queries to check data integrity and relationships

-- Check if orders are linked to users
SELECT orders.order_id, orders.user_id, users.username
FROM orders
JOIN users ON orders.user_id = users.user_id;

-- Check if order details link orders and products
SELECT order_details.order_detail_id, order_details.order_id, order_details.product_id, 
       products.name AS product_name, order_details.quantity, order_details.price_at_purchase
FROM order_details
JOIN orders ON order_details.order_id = orders.order_id
JOIN products ON order_details.product_id = products.product_id;

-- Check data integrity (ensure no missing foreign keys)

-- Check for orders with missing users
SELECT order_id, user_id
FROM orders
WHERE user_id NOT IN (SELECT user_id FROM users);

-- Check for order details with missing orders
SELECT order_detail_id, order_id
FROM order_details
WHERE order_id NOT IN (SELECT order_id FROM orders);

-- Check for order details with missing products
SELECT order_detail_id, product_id
FROM order_details
WHERE product_id NOT IN (SELECT product_id FROM products);
