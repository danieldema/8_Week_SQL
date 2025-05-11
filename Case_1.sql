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

SELECT join_date
FROM members
WHERE customer_id = 'A';

--2021-01-07

SELECT product_id
FROM sales
WHERE customer_id = 'A' AND order_date >= '2021-01-07'
ORDER BY order_date ASC
LIMIT 1;

--2

SELECT product_name
FROM menu
WHERE product_id = 2;

--curry

SELECT join_date
FROM members
WHERE customer_id = 'B';

--2021-01-09

SELECT product_id
FROM sales
WHERE customer_id = 'B' AND order_date >= '2021-01-09'
ORDER BY order_date ASC
LIMIT 1;

--1

SELECT product_name
FROM menu
WHERE product_id = 1;

--sushi

--7. Which item was purchased just before the customer became a member?

SELECT product_id
FROM sales
WHERE customer_id = 'A' AND order_date < '2021-01-07'
ORDER BY order_date DESC
LIMIT 1;

--1

SELECT product_name
FROM menu
WHERE product_id = 1;

--sushi

SELECT product_id
FROM sales
WHERE customer_id = 'B' AND order_date < '2021-01-09'
ORDER BY order_date DESC
LIMIT 1;

--1

SELECT product_name
FROM menu
WHERE product_id = 1;

--sushi

--8. What is the total items and amount spent for each member before they became a member?

SELECT COUNT(*)
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'A' AND order_date < '2021-01-07';

--2

SELECT SUM(price)
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'A' AND order_date < '2021-01-07';

--25

SELECT COUNT(*)
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'B' AND order_date < '2021-01-09';

--3

SELECT SUM(price)
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'B' AND order_date < '2021-01-09';

--40

--9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT SUM(
  			CASE
  				WHEN product_name = 'sushi' THEN 2*10*price
  				ELSE 10*price
 		   END
  		   )
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'A';

--860

SELECT SUM(
  			CASE
  				WHEN product_name = 'sushi' THEN 2*10*price
  				ELSE 10*price
 		   END
  		   )
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'B';

--940

SELECT SUM(
  			CASE
  				WHEN product_name = 'sushi' THEN 2*10*price
  				ELSE 10*price
 		   END
  		   )
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'C';

--360

--10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B
--have at the end of January?

SELECT SUM(
  			CASE
  				WHEN product_name = 'sushi' OR ('2021-01-07' <= order_date AND order_date <
                                                '2021-01-14') THEN 2*10*price
  				WHEN order_date <= '2021-01-31' THEN 10*price
 		   END
  		   )
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'A';

--1370

SELECT SUM(
  			CASE
  				WHEN product_name = 'sushi' OR ('2021-01-09' <= order_date AND order_date <
                                                '2021-01-16') THEN 2*10*price
  				WHEN order_date <= '2021-01-31' THEN 10*price
 		   END
  		   )
FROM sales
JOIN menu
	ON menu.product_id = sales.product_id
WHERE customer_id = 'B';

--820
