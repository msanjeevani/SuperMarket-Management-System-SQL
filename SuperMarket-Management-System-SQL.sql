create database SuperMarketDB;
use SuperMarketDB;
create table customer(
     customer_id INT PRIMARY KEY,
     customer_name VARCHAR(20) NOT NULL,
     phone INT UNIQUE,
     city VARCHAR(30) DEFAULT 'Madurai');
create table product(
     product_id INT PRIMARY KEY,
     product_name VARCHAR(20),
     category VARCHAR(30),
     price DECIMAL(10,2),
     stock INT);
create table orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    foreign key(customer_id)
    REFERENCES customer(customer_id),
    foreign key(product_id)
    REFERENCES product(product_id));
SELECT * FROM customer;
SELECT * FROM product;
SELECT * FROM orders;
ALTER TABLE customer
modify phone BIGINT;
INSERT INTO customer VALUES(1,'Anu','1234567890','Madurai');
INSERT INTO customer VALUES(2,'Priya','1238567890','Trichy');
INSERT INTO customer VALUES(3,'Geetha','1234507890','Coimbatore');
INSERT INTO customer VALUES(4,'Pooja','6234567890','Vellore');
INSERT INTO product VALUES(1,'Rice','Grocery',200,30);
INSERT INTO product VALUES(2,'Soap','personal care',30,20);
INSERT INTO product VALUES(3,'Milk','Dairy',10,30);
INSERT INTO product VALUES(4,'Biscuits','Snacks',10,20);
INSERT INTO orders VALUES(1,1,1,20,'2026-01-07');
INSERT INTO orders VALUES(2,2,2,30,'2026-01-08');
INSERT INTO orders VALUES(3,3,3,40,'2026-01-09');
INSERT INTO orders VALUES(4,4,4,50,'2026-01-10');
SELECT * FROM customer;
SELECT * FROM product;
SELECT * FROM orders;
SELECT customer_name
FROM customer;
SELECT * FROM product
where category='grocery';
SELECT * FROM product
where category='Personal care';
SELECT * FROM product
where price<=200;
SELECT * FROM product
ORDER BY price;
SELECT MAX(price)
FROM product;
SELECT Min(price)
FROM product;
SELECT AVg(price)
FROM product;
SELECT count(*)
FROM customer;
SELECT count(*)
FROM product;
SELECT count(*)
FROM orders;
SELECT category,
count(*)
FROM product
GROUP BY category;
SELECT city,
count(*)
FROM customer
GROUP BY city;
SELECT category,
count(*)
FROM product
GROUP BY category
HAVING count(*)>1;
UPDATE customer
SET phone='3456789047'
WHERE customer_id=1;
SELECT * FROM customer;
DELETE FROM orders
WHERE customer_id=4;
SELECT * FROM customer;
SELECT * FROM orders;
DELETE FROM customer
WHERE customer_id=4;
SELECT * FROM customer;
ALTER TABLE product
ADD Discount INT;
UPDATE product
SET Discount=5;
WHERE product_id=1;
DESC Product;
UPDATE product
SET Discount=10
WHERE product_id=1;
SELECT SUM(stock)
FROM product;
SELECT * FROM product
LIMIT 2;
SELECT
customer.customer_name,
product.product_name,
orders.quantity
FROM customer
INNER JOIN orders
ON customer.customer_id=orders.customer_id
INNER JOIN product
ON orders.product_id=product.product_id;
SELECT * FROM customer
WHERE city='Madurai';
SELECT * FROM customer
WHERE customer_name LIKE 'A%';
SELECT * FROM product
WHERE product_name LIKE '%S';
SELECT * FROM product
WHERE price BETWEEN 50 AND 1500;
SELECT * FROM product
WHERE category IN('Grocery','Dairy');
START Transaction;
UPDATE product
SET stock=40
WHERE product_id=1;
COMMIT;
START Transaction;
UPDATE product
SET price=1500
WHERE product_id=1;
ROLLBACK;
CREATE VIEW CustomerOrders
AS
SELECT
Customer.customer_name,
Product.product_name,
Orders.quantity
FROM Customer
JOIN Orders
ON Customer.customer_id=Orders.customer_id
JOIN Product
ON Orders.product_id=Product.product_id;
SELECT * FROM customerorders;
DROP VIEW customerorders;
TRUNCATE TABLE orders;
DROP TABLE orders;