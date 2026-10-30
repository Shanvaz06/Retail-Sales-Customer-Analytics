use retail_analytics;  /* Database*/

/*Customers Table*/

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    city VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE
);

/*SHOW TABLES;
DESCRIBE customers;*/

INSERT INTO customers
(customer_name, gender, city, email, signup_date)
VALUES
('Rahul', 'Male', 'Hyderabad', 'rahul@gmail.com', '2025-01-15'),
('Priya', 'Female', 'Bengaluru', 'priya@gmail.com', '2025-02-20'),
('Arjun', 'Male', 'Chennai', 'arjun@gmail.com', '2025-03-10'),
('Sneha', 'Female', 'Hyderabad', 'sneha@gmail.com', '2025-04-05'),
('Kiran', 'Male', 'Mumbai', 'kiran@gmail.com', '2025-05-12'),
('Divya', 'Female', 'Pune', 'divya@gmail.com', '2025-06-18'),
('Vikram', 'Male', 'Chennai', 'vikram@gmail.com', '2025-07-22'),
('Ananya', 'Female', 'Bengaluru', 'ananya@gmail.com', '2025-08-14'),
('Rohit', 'Male', 'Hyderabad', 'rohit@gmail.com', '2025-09-09'),
('Meena', 'Female', 'Mumbai', 'meena@gmail.com', '2025-10-25');

select * from customers;
/*select customer_name from customers where city = "Hyderabad"; 
select customer_name, city from customers 
order By customer_name ASC;

select city, count(*) AS NumberofCustomers from customers
group by city
HAVING count(*) > 1;

select customer_name from customers
where customer_name LIKE 'A%';

select customer_name, city, 
        CASE
            WHEN city='Hyderabad' THEN 'Major City'
            WHEN city='Bengaluru' THEN 'Major City'
            ELSE 'Other City'
        END AS city_category
 from customers;*/
/*----------------------------------------------------*/

/*Products Table*/

 
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

INSERT INTO products
(product_name, category, price, stock_quantity)
VALUES
('Laptop', 'Electronics', 55000.00, 10),
('Smartphone', 'Electronics', 25000.00, 20),
('Headphones', 'Electronics', 2000.00, 35),
('Office Chair', 'Furniture', 6500.00, 15),
('Study Table', 'Furniture', 8000.00, 12),
('Water Bottle', 'Home Essentials', 500.00, 50),
('Backpack', 'Accessories', 1500.00, 30),
('Keyboard', 'Electronics', 1200.00, 25),
('Mouse', 'Electronics', 700.00, 40),
('Bedsheet', 'Home Essentials', 1800.00, 18);

SELECT * FROM products;
/*----------------------------------------------------*/

/*Orders Table*/


CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


INSERT INTO orders
(customer_id, order_date, order_status)
VALUES
(1, '2026-01-05', 'Delivered'),
(2, '2026-01-08', 'Delivered'),
(1, '2026-01-12', 'Shipped'),
(3, '2026-02-02', 'Delivered'),
(4, '2026-02-10', 'Pending'),
(5, '2026-02-15', 'Delivered'),
(6, '2026-03-01', 'Delivered'),
(7, '2026-03-05', 'Shipped'),
(8, '2026-03-12', 'Delivered'),
(9, '2026-03-18', 'Pending'),
(10, '2026-04-02', 'Delivered'),
(2, '2026-04-10', 'Delivered'),
(3, '2026-04-15', 'Shipped'),
(5, '2026-04-20', 'Delivered'),
(1, '2026-05-01', 'Delivered');

SELECT * FROM orders;
/*----------------------------------------------------*/

/*Order_Item Table*/


CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 55000.00),
(1, 8, 2, 1200.00),
(2, 2, 1, 25000.00),
(2, 3, 1, 2000.00),
(3, 7, 2, 1500.00),
(3, 9, 1, 700.00),
(4, 4, 1, 6500.00),
(4, 6, 3, 500.00),
(5, 5, 1, 8000.00),
(6, 2, 1, 25000.00),
(6, 3, 2, 2000.00),
(7, 10, 2, 1800.00),
(8, 8, 1, 1200.00),
(8, 9, 2, 700.00),
(9, 1, 1, 55000.00),
(9, 3, 1, 2000.00),
(10, 7, 1, 1500.00),
(11, 5, 1, 8000.00),
(11, 6, 2, 500.00),
(12, 2, 2, 25000.00),
(13, 4, 1, 6500.00),
(13, 9, 1, 700.00),
(14, 3, 3, 2000.00),
(14, 8, 1, 1200.00),
(15, 1, 1, 55000.00),
(15, 7, 1, 1500.00);

SELECT * FROM order_items;

/*----------------------------------------------------*/


SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.order_status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;

/*----------------------------------------------------*/
/*Calculate revenue for each order*/

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;

/*----------------------------------------------------*/
/*Total revenue by product*/

SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

/*----------------------------------------------------*/

/*Calculate total business revenue*/

SELECT
    SUM(quantity * unit_price) AS total_business_revenue
FROM order_items;

/*----------------------------------------------------*/

/*Best-selling products*/

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

/*----------------------------------------------------*/

/*Monthly Sales Analysis*/

SELECT
    MONTH(order_date) AS sales_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY MONTH(order_date)
ORDER BY sales_month;

/*----------------------------------------------------*/

/*Customer Spending Analysis*/


SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spent DESC;

/*----------------------------------------------------*/

/*Order Status Analysis*/


SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

/*----------------------------------------------------*/

/*Revenue by product category*/


SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

/*----------------------------------------------------*/

/*Average Order Value (AOV)*/


SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    ROUND(
        SUM(oi.quantity * oi.unit_price) /
        COUNT(DISTINCT o.order_id), 2
    ) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id;

/*----------------------------------------------------*/

/*Find repeat customers*/


SELECT
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

/*----------------------------------------------------*/

/*Inventory Stock Analysis*/


SELECT
    product_name,
    category,
    stock_quantity,
    CASE
        WHEN stock_quantity < 10 THEN 'Critical Stock'
        WHEN stock_quantity < 20 THEN 'Low Stock'
        ELSE 'Available'
    END AS stock_status
FROM products
ORDER BY stock_quantity ASC;

/*----------------------------------------------------*/

/*Calculate total inventory value*/


SELECT
    SUM(price * stock_quantity) AS total_inventory_value
FROM products;

/*----------------------------------------------------*/

/*Products that need restocking*/

SELECT
    product_name,
    stock_quantity,
    CASE
        WHEN stock_quantity < 10 THEN 'Reorder Immediately'
        WHEN stock_quantity < 20 THEN 'Plan Restocking'
        ELSE 'Sufficient Stock'
    END AS restock_recommendation
FROM products
WHERE stock_quantity < 20
ORDER BY stock_quantity ASC;

/*----------------------------------------------------*/

/*Delivered Orders Revenue*/

SELECT
    o.order_status,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY o.order_status;

/*----------------------------------------------------*/