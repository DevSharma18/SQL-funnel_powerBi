# First Qury

SELECT *
FROM funnel_data;

----------------


# ✅ Query #2 — Total Revenue (Sales)
SELECT
    SUM("Revenue") AS Total_Revenue
FROM funnel_data;

---------------------
# ✅ Query #3 — Average Revenue
SELECT
    ROUND(AVG("Revenue"), 2) AS Average_Revenue
FROM funnel_data;

----------------

# Step 4 — Top 10 Products by Revenue
SELECT
    Product,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM funnel_data
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 10;

--------------

# ✅ Query 5 — Revenue by Region

SELECT
    Region,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM funnel_data
GROUP BY Region
ORDER BY Total_Revenue DESC;




