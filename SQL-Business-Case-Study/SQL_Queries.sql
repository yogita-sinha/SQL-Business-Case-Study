CREATE DATABASE sql_case_study;

-- SQL BUSINESS CASE STUDY
-- Retail Sales Analysis

USE sql_case_study;

-- ===========================================
-- SECTION 1 : BASIC ANALYSIS
-- ===========================================

-- Query 1: Total Records
SELECT COUNT(*) AS Total_Records
FROM retail_sales;

-- Query 2: Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales;

-- Query 3: Total Profit
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales;

-- Query 4: Total Quantity
SELECT SUM(Quantity) AS Total_Quantity
FROM retail_sales;


SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- ===========================================
-- SECTION 2 : SALES ANALYSIS
-- ===========================================

-- Query 5: Sales by Category
SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Query 6: Profit by Category
SELECT
    Category,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Query 7  : Sales by Region
SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- Query 8  : Profit by Region
SELECT
    Region,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Query 9: Top 10 States by Sales
SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- Query 10 : Sales by Sub-Category
SELECT
    `Sub-Category`,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;

-- Query 11: Average Sales by Category
SELECT
    Category,
    ROUND(AVG(Sales),2) AS Average_Sales
FROM retail_sales
GROUP BY Category
ORDER BY Average_Sales DESC;

-- Query 12: Categories with Total Sales Greater Than 5,00,000
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Category
HAVING SUM(Sales) > 500000;

-- Query 13: Average Profit by Region
SELECT
    Region,
    ROUND(AVG(Profit),2) AS Average_Profit
FROM retail_sales
GROUP BY Region
ORDER BY Average_Profit DESC;

-- Query 14: Discount Analysis by Category
SELECT
    Category,
    ROUND(AVG(Discount),2) AS Average_Discount
FROM retail_sales
GROUP BY Category;

-- Query 15: Total Quantity Sold by Region
SELECT
    Region,
    SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Region
ORDER BY Total_Quantity DESC;

-- Query 16: Most Profitable State
SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 1;

-- Query 17: Least Profitable State
SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 1;

-- Query 18: Profit Margin by Category
SELECT
    Category,
    ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM retail_sales
GROUP BY Category
ORDER BY Profit_Margin DESC;

-- Query 19: High vs Low Discount Analysis
SELECT
    CASE
        WHEN Discount >= 0.2 THEN 'High Discount'
        ELSE 'Low Discount'
    END AS Discount_Level,
    COUNT(*) AS Orders
FROM retail_sales
GROUP BY Discount_Level;

-- Query 20: Categories with Above Average Sales
SELECT
    Category,
    ROUND(AVG(Sales),2) AS Avg_Sales
FROM retail_sales
GROUP BY Category
HAVING AVG(Sales) >
(
    SELECT AVG(Sales)
    FROM retail_sales
);
SELECT VERSION();

-- Query 21: Rank States by Sales
SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM retail_sales
GROUP BY State;

-- Query 22: Dense Rank States by Profit
SELECT
    State,
    ROUND(SUM(Profit),2) AS Total_Profit,
    DENSE_RANK() OVER (ORDER BY SUM(Profit) DESC) AS Profit_Rank
FROM retail_sales
GROUP BY State;

-- Query 23: Row Number by Sales
SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROW_NUMBER() OVER (ORDER BY SUM(Sales) DESC) AS Row_Num
FROM retail_sales
GROUP BY State;