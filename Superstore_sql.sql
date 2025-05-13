SELECT * FROM superstore.superstore;

-- Total sales by category
SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore.`superstore`
GROUP BY Category;

--Total order by Consumer
select Segment,count(Order_ID) as Order_by_Consumer
from superstore.`superstore`
WHERE Segment = "Consumer"
GROUP BY Segment;

--Total order by Corporate
select Segment,count(Order_ID) as Order_by_Corporate
from superstore.`superstore`
WHERE Segment = "Corporate"
GROUP BY Segment;

--Total order by Home Office
select Segment,count(Order_ID) as Order_by_HomeOffice
from superstore.`superstore`
WHERE Segment = "Home Office"
GROUP BY Segment;

--Total order by region
SELECT Region, COUNT(Order_ID) AS Total_Orders
FROM superstore.`superstore`
GROUP BY Region;

--Total sales and profit by category
SELECT Category,
       SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM superstore.`superstore`
GROUP BY Category;

--Region with the highest total profit
SELECT Region, SUM(Profit) AS Total_Profit
FROM superstore.`superstore`
GROUP BY Region 
Order by Total_Profit DESC;

--Top Products by Discount Value
SELECT Product_Name, Category, Discount, Sales
FROM superstore.`superstore`
ORDER BY Discount DESC
limit 5;

--Total sales by year
SELECT YEAR(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Year,
       SUM(Sales) AS Total_Sales
FROM superstore.`superstore`
GROUP BY Year
ORDER BY Year;

--Month with the highest number of orders
SELECT MONTHNAME(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Month,
       COUNT(DISTINCT Order_ID) AS Total_Orders
FROM superstore.`superstore`
GROUP BY Month
ORDER BY Total_Orders
LIMIT 1;

--State with the highest sales
SELECT State, SUM(Sales) AS Total_Sales
FROM superstore.`superstore`
GROUP BY State
ORDER BY Total_Sales
LIMIT 1;

#PRODUCT ANALYSIS
SELECT Category, Product_Name, SUM(Sales) AS Total_Sales
FROM superstore.`superstore`
GROUP BY Category, Product_Name
ORDER BY Category, Total_Sales DESC;
