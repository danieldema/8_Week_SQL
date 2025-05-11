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

SELECT COUNT(*), product_id
FROM sales
GROUP BY product_id
ORDER BY COUNT(8) DESC;

--8 | 3
--4 | 2
--3 | 1

SELECT product_name
FROM menu
WHERE product_id = 3;

--ramen

SELECT COUNT(*)
FROM sales
WHERE customer_id = 'A' AND product_id = 3;

--3

SELECT COUNT(*)
FROM sales
WHERE customer_id = 'B' AND product_id = 3;

--2

SELECT COUNT(*)
FROM sales
WHERE customer_id = 'C' AND product_id = 3;

--3

--5. Which item was the most popular for each customer?

SELECT product_id
FROM sales
WHERE customer_id = 'A'
GROUP BY product_id
ORDER BY COUNT(*) DESC
LIMIT 1;

--3

SELECT product_name
FROM menu
WHERE product_id = 3;

--ramen

SELECT product_id
FROM sales
WHERE customer_id = 'B'
GROUP BY product_id
ORDER BY COUNT(*) DESC;

--1

SELECT product_name
FROM menu
WHERE product_id = 1;

--sushi

SELECT product_id
FROM sales
WHERE customer_id = 'C'
GROUP BY product_id
ORDER BY COUNT(*) DESC;

--3

SELECT product_name
FROM menu
WHERE product_id = 3;

--ramen

--6. Which item was purchased first by the customer after they became a member?

--7. Which item was purchased just before the customer became a member?

--8. What is the total items and amount spent for each member before they became a member?

--9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

--10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B
--have at the end of January?