-- Performance Tuning Demo for Large Datasets
-- Simulates large Orders table with 1 million records

-- Step 1: Create demo table
CREATE TABLE Demo_Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATETIME
);

-- Step 2: Populate with large number of rows
INSERT INTO Demo_Orders (CustomerID, ProductID, Quantity, OrderDate)
SELECT TOP (1000000)
    ABS(CHECKSUM(NEWID()) % 1000) + 1 AS CustomerID,
    ABS(CHECKSUM(NEWID()) % 500) + 1 AS ProductID,
    ABS(CHECKSUM(NEWID()) % 20) + 1 AS Quantity,
    DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365), GETDATE()) AS OrderDate
FROM sys.objects a
CROSS JOIN sys.objects b;

-- Step 3: Sample query without index (slow)
SELECT CustomerID, SUM(Quantity) AS TotalQuantity
FROM Demo_Orders
GROUP BY CustomerID
ORDER BY TotalQuantity DESC;

-- Step 4: Add index to optimize query
CREATE NONCLUSTERED INDEX IDX_CustomerID ON Demo_Orders(CustomerID);

-- Step 5: Same query with index (faster)
SELECT CustomerID, SUM(Quantity) AS TotalQuantity
FROM Demo_Orders
GROUP BY CustomerID
ORDER BY TotalQuantity DESC;

-- Step 6: Using CTE and Window function for ranking
WITH CustomerSales AS (
    SELECT CustomerID, SUM(Quantity) AS TotalQuantity
    FROM Demo_Orders
    GROUP BY CustomerID
)
SELECT CustomerID, TotalQuantity, RANK() OVER(ORDER BY TotalQuantity DESC) AS Rank
FROM CustomerSales
WHERE TotalQuantity > 500;
