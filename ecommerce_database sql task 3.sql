create database ecommerce;
use ecommerce;

-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Order Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_each DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date TIMESTAMP,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

# INSERTING VALUE IN USERS TABLE

INSERT INTO users (user_id, name, email, password_hash) VALUES
(1, 'sanyukta gadge', 'sanyu@gadge.com', 'hashed_pw_1'),
(2, 'sakshi badhe', 'sakshi@badhe.com', 'hashed_pw_2'),
(3, 'Sahil Shelar', 'sahil@shelar.com', 'hashed_pw_3'),
(4, 'Rohit Sawant', 'rohit@sawant.com', 'hashed_pw_4'),
(5, 'Saujanya Gadge', 'sauju@gadge.com', 'hashed_pw_5'),
(6, 'Saloni Patil', 'saloni@patil.com', 'hashed_pw_6'),
(7, 'Kausthubh Tandel', 'kausthub@tandel.com', 'hashed_pw_7'),
(8, 'Swapnil Mane', 'swapnil@mane.com', 'hashed_pw_8'),
(9, 'Sunny Jadhav', 'sunny@jadhav.com', 'hashed_pw_9'),
(10, 'pragati  gadge', 'pragati@gadge.com', 'hashed_pw_10');
select*from users;

#INSERTING VALUE IN CATEGORIES TABLE

INSERT INTO categories (category_id, name) VALUES
(1, 'Electronics'),
(2, 'Books'), (3, 'Home Apliance'), 
(4, 'Electronics'), (5, 'electronics'),
(6, 'Books'), (7, 'Clothes'),
(8, 'Footwear'), (9, 'Electronics'), 
(10, 'Books');
select * from categories;

#INSERTING VALUE IN PRODUCT TABLE

INSERT INTO products (product_id, name, description, price, stock_quantity, category_id) VALUES
(1, 'Smartphone', 'Latest model smartphone with 5G', 19999.99, 50, 1),
(2, 'Book: Python Basics', 'Learn Python programming', 29.99, 100, 2),
(3, 'Kitchen Mixer Grinder', 'Equipped with a 750W motor, 3-speed control', 1599.99, 20, 3),
(4, 'Laptop', 'Powerful gaming laptop', 49999.99, 20, 4),
(5, 'Headphones', 'premium sound quality with the Wireless Headphones.', 1299.99, 60, 5),
(6, 'SQL', 'A practical guide to learning SQL for managing, querying, and analyzing data efficiently', 1299.99,40, 6),
(7, 'Kurti Set', 'Elegant and comfortable kurti set perfect for casual wear, office, or festive occasions', 999.99, 100, 7),
(8, 'Shoes', 'Stylish and comfortable shoes designed for all-day wear and versatility', 799.99, 150, 8),
(9, 'Speaker', 'A speaker that delivers clear, powerful sound for music, movies, and more', 1899.99, 70, 9),
(10, 'Java', 'Learn Java programming from basics to advanced in a simple and practical way', 899.99, 87,10);
update products set price = 299.99 where product_id = 2;
select*from products;

#INSERTING VALULE INTO ORDERS TABLE

INSERT INTO orders (order_id, user_id, order_date, total_amount, status) VALUES
(1, 1, '2024-04-01 10:00:00', 19999.99, 'Shipped'),
(2, 2, '2024-04-02 12:30:00', 299.99, 'Processing'),
(3, 3, '2024-04-03 11:30:00', 1599.99, 'Shipped'),
(4, 4, '2024-04-07 10:30:00', 49999.99, 'Shipped'),
(5, 5, '2024-04-08 09:00:00', 1299.99, 'Processing'),
(6, 6, '2024-04-10 01:00:00', 1299.99, 'Processing'),
(7, 7, '2024-04-20 02:30:00', 999.99, 'Shipped'),
(8, 8, '2024-04-23 02:00:00', 799.99, 'Shipped'),
(9, 9, '2024-04-28 01:45:00', 1899.99, 'Processing'),
(10, 10, '2024-04-29 12:30:00', 899.99, 'Shipped');

#INSERTING VALLUE IN ORDER_ITEMS TABLE

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price_each) VALUES
(1, 1, 1, 1, 19999.99),
(2, 2, 2, 1, 299.99),
(3, 3, 3, 1, 1599.99),
(4, 4, 4, 1, 49999.99),
(5, 5, 5, 1, 1299.99),
(6, 6, 6, 1, 1299.99),
(7, 7, 7, 1, 999.99),
(8, 8, 8, 1, 799.99),
(9, 9, 9, 1, 1899.99),
(10, 10, 10, 1, 899.99);

#INSERTING VALUE IN PAYMENT TABLE

INSERT INTO payments (payment_id, order_id, payment_date, amount, payment_method, status) VALUES
(1, 1, '2024-04-05 11:00:00', 19999.98, 'Credit Card', 'Paid'),
(2, 2, '2024-04-06 12:00:00', 299.99, 'PayPal', 'Pending'),
(3, 3, '2024-04-07 11:30:00', 1599.99, 'PayPal', 'Paid'),
(4, 4, '2024-04-10 12:20:00', 49999.99, 'credit', 'Paid'),
(5, 5, '2024-04-12 12:45:00', 1299.99, 'PayPal', 'Pending'),
(6, 6, '2024-04-14 10:30:00', 1299.99, 'PayPal', 'Pending'),
(7, 7, '2024-04-24 02:00:00', 999.99, 'cash on delivery', 'Paid'),
(8, 8, '2024-04-27 12:30:00', 799.99, 'PayPal', 'Paid'),
(9, 9, '2024-05-02 12:00:00', 1899.99, 'PayPal', 'Pending'),
(10, 10, '2024-05-06 11:40:00', 899.99, 'PayPal', 'paid');

#### PERFORMING QUERY ####

# SELECET QUERY

select * from payments;
select * from categories;
select * from orders;
select * from order_items;
select * from products;
select * from users;

## WHERE QUERY
# FIND AMOUNT FROM PAYMENT TABLE WHERE AMOUNT IS 1299.99

SELECT * FROM PAYMENTS WHERE AMOUNT = 1299.99;

### ORDER BY ASCENDING ###

SELECT * FROM ORDER_ITEMS
ORDER BY PRICE_EACH ASC; 

### ORDER BY DESCENDING ###

SELECT * FROM ORDER_ITEMS
ORDER BY PRICE_EACH desc; 

### GROUP BY ###
## Total Sales per Product ##

SELECT user_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id;

## JOINS ##

## INNER JOINS ##
#Get all orders with user names

SELECT orders.order_id, users.name, orders.order_date
FROM orders
INNER JOIN users ON orders.user_id = users.user_id;

## LEFT JOIN ##
##List all users, along with any orders they  have placed
SELECT users.name, orders.order_id, orders.order_date
FROM users
LEFT JOIN orders ON users.user_id = orders.user_id;

## RIGHT JOIN ##
##List all orders, and show user details if available

SELECT users.name, orders.order_id, orders.order_date
FROM users
RIGHT JOIN orders ON users.user_id = orders.user_id;

### SUB QUERY ###
# 1.Get users who have placed at least one order
SELECT name, email
FROM users
WHERE user_id IN (
    SELECT DISTINCT user_id
    FROM orders
);
# 2. Get products with a price higher than the average price

SELECT name, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

#3. Get names of users who bought a specific product (e.g., product_id = 1)

SELECT name
FROM users
WHERE user_id IN (
    SELECT o.user_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE oi.product_id = 1
);

## AGGRIGATE FUNCTIONS ###

#1. Total revenue (SUM of all payments)

SELECT SUM(amount) AS total_revenue
FROM payments;

#2. Average order amount

SELECT AVG(total_amount) AS average_order_value
FROM orders;

#3. Total quantity of items sold (from order_items)

SELECT SUM(quantity) AS total_items_sold
FROM order_items;

#4. Average price of products

SELECT AVG(price) AS average_product_price
FROM products;

#5. Total revenue per user (using GROUP BY)

SELECT u.name, SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;


### Create views for analysis ##

# 1. user_order_summary
#Summarizes each user’s total number of orders and total amount spent.

CREATE VIEW user_order_summary AS
SELECT 
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;

#2.product_sales_summary
#Summarizes how much of each product has been sold and total revenue.

CREATE VIEW product_sales_summary AS
SELECT 
    p.product_id,
    p.name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.price_each) AS total_revenue
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name;

#3.category_sales_summary
#Shows total revenue and products sold per category.

CREATE VIEW category_sales_summary AS
SELECT 
    c.category_id,
    c.name AS category_name,
    SUM(oi.quantity) AS total_items_sold,
    SUM(oi.quantity * oi.price_each) AS category_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id, c.name;

### Optimize queries with indexes ##

CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_products_category_id ON products(category_id);
CREATE INDEX idx_payments_order_id ON payments(order_id);








