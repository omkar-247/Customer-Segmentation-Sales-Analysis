CREATE DATABASE CustomerSalesDB;
use customersalesdb

SELECT * from CustomerSales;

-- Data Cleaning --

-- Check for Missing Values
SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Nulls,
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS Order_ID_Nulls,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS Order_Date_Nulls,
    SUM(CASE WHEN Product IS NULL THEN 1 ELSE 0 END) AS Product_Nulls,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Sales_Nulls,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Quantity_Nulls,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Category_Nulls,
    SUM(CASE WHEN Customer_Age IS NULL THEN 1 ELSE 0 END) AS Customer_Age_Nulls,
    SUM(CASE WHEN Customer_City IS NULL THEN 1 ELSE 0 END) AS Customer_City_Nulls,
    SUM(CASE WHEN Customer_Region IS NULL THEN 1 ELSE 0 END) AS Customer_Region_Nulls,
    SUM(CASE WHEN Customer_Segment IS NULL THEN 1 ELSE 0 END) AS Customer_Segment_Nulls
FROM CustomerSales;



-- Check for Outliers
SELECT * FROM CustomerSales
WHERE Customer_Age < 18 OR Customer_Age > 70;

-- Handling Incorrect Data
UPDATE CustomerSales
SET Order_Date = STR_TO_DATE(Order_Date, '%m/%d/%Y')
WHERE Order_Date LIKE '%/%/%';

UPDATE CustomerSales
SET Order_Date = STR_TO_DATE(Order_Date, '%Y-%m-%d')
WHERE Order_Date IS NOT NULL;

-- View Data
SELECT * FROM customersales
LIMIT 10;

-- Count Total Records
SELECT COUNT(*) As Total_Records
From customersales;

-- RFM Analysis (Recency, Frequency, Monetary Value)
 SELECT 
      Customer_ID, 
      MAX(Order_Date) AS Last_Order_Date, 
      COUNT(Order_ID) AS Order_Frequency, 
      SUM(Sales) AS Total_Spent 
   FROM CustomerSales 
   GROUP BY Customer_ID;
   
   
-- Total Sales By Category
SELECT Category, SUM(Sales) AS total_sales
FROM CustomerSales
GROUP BY Category;


-- Top 5 Customers By Sales
SELECT Customer_ID, SUM(Sales) AS total_sales
FROM CustomerSales
GROUP BY Customer_ID
ORDER BY total_sales DESC
LIMIT 5;

-- Monthly Sales Trend
SELECT 
  YEAR(Order_Date) AS year, 
  MONTH(Order_Date) AS month, 
  SUM(Sales) AS monthly_sales
FROM CustomerSales
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY year, month;

-- Average Sales per Product
SELECT Product, AVG(Sales) AS avg_sales
FROM CustomerSales
GROUP BY Product;

-- Sales Distribution By Age Group
SELECT 
  CASE 
    WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Customer_Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '55+' 
  END AS age_group,
  SUM(Sales) AS total_sales
FROM CustomerSales
GROUP BY age_group;

-- Customer Lifetime Value (CLTV)
SELECT Customer_ID, SUM(Sales) AS CLTV
FROM CustomerSales
GROUP BY Customer_ID;

-- Customers who placed more than one order
SELECT Customer_ID, COUNT(Order_ID) AS orders_count
FROM CustomerSales
GROUP BY Customer_ID
HAVING orders_count > 1;

-- Regional Sales Performance
SELECT 
   Customer_Region, 
   SUM(Sales) AS Total_Sales 
FROM CustomerSales 
GROUP BY Customer_Region 
ORDER BY Total_Sales DESC;


