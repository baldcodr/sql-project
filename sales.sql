SELECT *
FROM sales.customers;
-- --------------------------
SELECT *
FROM sales.markets;
-- --------------------------
SELECT *
FROM sales.products;
-- --------------------------
SELECT *
FROM sales.date;
-- --------------------------
SELECT *
FROM sales.transactions;



-- --------------------------
-- QUESTIONS --
-- --------------------------
-- 1. Which market has the highest number of customers;
SELECT t.market_code, m.markets_name, COUNT(DISTINCT t.customer_code) num_of_customers
FROM sales.transactions t
LEFT JOIN sales.markets m ON t.market_code = m.markets_code
GROUP BY t.market_code
ORDER BY num_of_customers DESC;

-- ANSWER: Mumbai has the highest number of customers

-- 2. Which product had the most sales in 2019
SELECT 
	t.product_code,
	SUM(CASE
			WHEN t.currency = 'USD' THEN t.sales_amount * 83.17
			ELSE t.sales_amount
		END) AS sales_amount_inr
FROM sales.transactions AS t
WHERE YEAR(order_date) = '2019'
GROUP BY t.product_code
ORDER BY sales_amount_inr DESC;

-- ANSWER: Prod318 had the most sales in 2019 with 21305692 in sales amount, 83.17 is the rate for converting USD to INR

-- 3. Which customer bought the most products between 2017 and 2019 
SELECT t.customer_code, SUM(t.sales_amount) sales_amount, SUM(t.sales_qty) sales_qty
FROM sales.transactions t
WHERE YEAR(order_date) BETWEEN '2017' AND '2019'
GROUP BY t.customer_code
ORDER BY sales_qty DESC;

-- ANSWER: Cust006 bought the most products btw 2017 and 2019

-- 4. Which market names have the most sales

SELECT t.market_code, m.markets_name, SUM(t.sales_amount) sales_amount
FROM sales.transactions t
LEFT JOIN sales.markets m ON t.market_code = m.markets_code
GROUP BY t.market_code
ORDER BY sales_amount DESC;

-- ANSWER: Mar004 and Delhi NCR had the most sales

-- 5. How many product are in each of the markets names
SELECT t.market_code, m.markets_name, COUNT(t.product_code) product_count
FROM sales.transactions t
LEFT JOIN sales.markets m ON t.market_code = m.markets_code
GROUP BY t.market_code
ORDER BY product_count DESC;

-- ANSWER: Outputs list of market names