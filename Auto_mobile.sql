

 --Total Sales:
-- comparing the total sales of automobile between countries.
     
SELECT COUNTRY, SUM(SALES) AS TotalSales
FROM auto_salesdata
GROUP BY COUNTRY
ORDER BY 2 DESC

-- Average Sales:
-- Determine the average number of sales per country

SELECT COUNTRY, AVG(SALES) AS AverageSales
FROM protofolio_project.auto_salesdata
GROUP BY COUNTRY 
ORDER BY 2 ASC

-- Top Selling automobile:
-- Identifying the top-selling automobile in each country.

SELECT COUNTRY,PRODUCTLINE, SUM(SALES) AS Topselling_automobile
FROM auto_salesdata
GROUP BY PRODUCTLINE, COUNTRY
ORDER BY Topselling_automobile DESC

--Sales Distribution Over Time:
--Analyze how sales are distributed over time.

SELECT Country, DATE_FORMAT(ORDERDATE, '%Y-%m') AS orderMonth, SUM(Sales) AS TotalSales
FROM auto_salesdata
GROUP BY Country, SalesMonth
ORDER BY Country, SalesMonth;

--Market Share:
-- Calculate the market share of each customer in each country.

SELECT COUNTRY, CUSTOMERNAME, SUM(SALES) AS TotalSales,
SUM(SALES) / (SELECT SUM(SALES) FROM auto_salesdata )* 100.0 AS MarketShare
FROM auto_salesdata
GROUP BY Country, CUSTOMERNAME;
ORDER BY 3,4 DESC

--Yearly Sales Growth:
--Analyze the yearly sales growth for each country.

SELECT Country, DATE_FORMAT(ORDERDATE, '%Y-%m') AS SalesMonth, SUM(Sales) AS TotalSales
FROM auto_salesdata
GROUP BY Country, SalesMonth
ORDER BY Country, SalesMonth;

-- Investigate the distribution of sales based on price ranges.

SELECT Country, 
       CASE 
         WHEN SALES BETWEEN 0 AND 20000 THEN '0-20k'
         WHEN SALES BETWEEN 20001 AND 40000 THEN '20k-40k'
         WHEN SALES BETWEEN 40001 AND 60000 THEN '40k-60k'
         ELSE '60k+'
       END AS PriceRange,
       SUM(Sales) AS TotalSales
FROM auto_salesdata
GROUP BY Country, PriceRange;













