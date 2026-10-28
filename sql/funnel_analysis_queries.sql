-- Query 1: View Dataset SQL 

SELECT *
FROM funnel_data;


-- Query 2: Total Revenue

 SELECT
    SUM("Revenue") AS Total_Revenue
FROM funnel_data;

-- Query 3: Average Revenue

SELECT
    ROUND(AVG("Revenue"), 2) AS Average_Revenue
FROM funnel_data;


-- Query 4: Top Products by Revenue

SELECT
    "Product Category",
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM funnel_data
GROUP BY "Product Category"
ORDER BY Total_Revenue DESC
LIMIT 10;

-- query-04-purchase-revenue-by-category

SELECT
    "Product Category",
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM funnel_data
WHERE Event = 'Purchase'
GROUP BY "Product Category"
ORDER BY Total_Revenue DESC;




-- Query 5: Revenue by Region

SELECT
    Region,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM funnel_data
GROUP BY Region
ORDER BY Total_Revenue DESC;