CREATE DATABASE COMPANY;
SELECT * FROM sales;

#1) Find all orders shipped via 'Economy' mode with a total amount greater than ₹25,000.
SELECT * FROM sales
WHERE Ship_Mode='Economy' AND Total_Amount > 25000;

#2) Retrive all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.

SELECT * FROM sales
WHERE category = 'Technology' AND country = 'Ireland' 
 AND order_date > '2020-01-01';
 
#3)List the top 10 most profitable sales transactions in descending order.
SELECT * FROM sales
ORDER BY unit_profit DESC LIMIT 10;  #top 10 transactions

SELECT * FROM sales
ORDER BY unit_profit DESC LIMIT 10, 20;   # skip 10 records and show next 20 records

#4)Find all customers whose name starts with 'J' and ends with 'n'.
SELECT * FROM sales
WHERE customer_name LIKE 'J%N';

#5)Retrieve all product names that contain 'Acco' anywhere in the name.
SELECT order_id, product_name
FROM sales
WHERE product_name LIKE '%Acco%' ;

#6) Get the top 5 cities with the highest total sales amount.
SELECT city,SUM(Total_Amount) AS total_sales FROM sales
GROUP BY city
ORDER BY total_sales DESC LIMIT 5;

#7) Display the second set of 10 records for Customer_Name and Total_Amount in descending order.
SELECT Customer_Name, Total_Amount FROM sales
ORDER BY Customer_Name AND Total_Amount DESC LIMIT 10, 10;

#8)Find the total revenue, average unit cost, and total number of orders.
SELECT SUM(Total_Amount) AS `total_revenue` , 
      AVG(unit_cost) AS `Average unit cost` , 
	  COUNT(order_id) AS `total number of orders` FROM sales;

#9) Count unique number of regions.
SELECT COUNT(DISTINCT(REGION)) as unique_region FROM sales;

#10)Find the number of orders placed by each customers
SELECT customer_name, COUNT(order_id) AS Order_count FROM sales 
GROUP BY customer_name 
ORDER BY Order_count DESC;

#11)Rank 5 products based on total sales using RANK(). 5types rank products-row number,rank,end type
SELECT Product_Name, SUM(Total_Amount) AS Total_Sales,
RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Sales_Rank
FROM Sales
GROUP BY Product_Name
LIMIT 5;







