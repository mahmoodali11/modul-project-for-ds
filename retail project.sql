-- create schema retailshop;
-- use retailshop;

use onlineretailsegmentation;

describe online_retail;

SELECT CustomerID, SUM(Quantity * UnitPrice) AS OrderValue
FROM online_retail
GROUP BY CustomerID;

SELECT CustomerID, COUNT(DISTINCT StockCode) AS UniqueProducts
FROM online_retail
GROUP BY CustomerID;

SELECT CustomerID
FROM online_retail
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) = 1;

SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS PurchaseFrequency,
       CASE 
          WHEN COUNT(DISTINCT InvoiceNo) > 10 THEN 'High Frequency'
          WHEN COUNT(DISTINCT InvoiceNo) BETWEEN 5 AND 10 THEN 'Medium Frequency'
          ELSE 'Low Frequency'
       END AS FrequencySegment
FROM online_retail
GROUP BY CustomerID;

SELECT Country, AVG(Quantity * UnitPrice) AS AvgOrderValue
FROM online_retail
GROUP BY Country;

SELECT CustomerID
FROM online_retail
WHERE InvoiceDate < (SELECT MAX(InvoiceDate) - INTERVAL 6 MONTH FROM online_retail)
GROUP BY CustomerID;