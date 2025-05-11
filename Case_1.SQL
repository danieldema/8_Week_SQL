--1. What is the total amount each customer spent at the restaurant?

SELECT SUM(price)
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'A';

--76

SELECT SUM(price)
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'B';

--74

SELECT SUM(price)
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'C';

--36

--2. How many days has each customer visited the restaurant?

SELECT COUNT(DISTINCT order_date)
FROM sales
WHERE customer_id = 'A';

--4

SELECT COUNT(DISTINCT order_date)
FROM sales
WHERE customer_id = 'B';

--6

SELECT COUNT(DISTINCT order_date)
FROM sales
WHERE customer_id = 'C';

--2

--3. What was the first item from the menu purchased by each customer?

SELECT product_id
FROM sales
WHERE customer_id = 'A'
ORDER BY order_date asc
LIMIT 1;

--1

SELECT product_name
FROM menu
WHERE product_id = 1;

--sushi

SELECT product_id
FROM sales
WHERE customer_id = 'B'
ORDER BY order_date asc
LIMIT 1;

--2

SELECT product_name
FROM menu
WHERE product_id = 2;

--curry

SELECT product_id
FROM sales
WHERE customer_id = 'C'
ORDER BY order_date asc
LIMIT 1;

--3

SELECT product_name
FROM menu
WHERE product_id = 3;

--ramen

--4. What is the most purchased item on the menu and how many times was it purchased by all customers?