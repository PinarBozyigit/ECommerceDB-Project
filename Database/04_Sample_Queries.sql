-- ============================================
-- SAMPLE QUERIES SCRIPT
-- Database: ECommerceDB
-- ============================================

-- =======================
-- 1. JOIN Examples
-- =======================

-- a) List all orders with customer names
SELECT o.OrderID,FORMAT(o.OrderDate,'dd/MM/yy') as Date, o.TotalAmount, c.CustomerName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- b) Show order details with product names
--Format C=currency , en-GB =£
SELECT od.OrderDetailID, o.OrderID, p.ProductName, od.Quantity,FORMAT(price, 'C', 'en-GB')  as Price
FROM OrderDetails od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID;

-- c) List employees and their orders
SELECT e.EmployeeID, e.FirstName, e.LastName, o.OrderID, o.TotalAmount
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID;

-- d) Customers who made orders over 10000
SELECT DISTINCT c.CustomerName, o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > 10000;

-- =======================
-- 2. Window Functions
-- =======================

-- a) Rank employees by total order amount
SELECT e.EmployeeID, e.FirstName, e.LastName, SUM(o.TotalAmount) AS TotalSales,
       RANK() OVER (ORDER BY SUM(o.TotalAmount) DESC) AS RankSales
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;

-- b) Divide customers into 4 quartiles based on total orders
SELECT c.CustomerID, c.CustomerName, SUM(o.TotalAmount) AS TotalSpent,
       NTILE(4) OVER (ORDER BY SUM(o.TotalAmount) DESC) AS Quartile
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

-- =======================
-- 3. Aggregate Functions
-- =======================
SELECT CustomerID, COUNT(OrderID) AS TotalOrders, SUM(TotalAmount) AS TotalSpent,
       AVG(TotalAmount) AS AvgOrder, MAX(TotalAmount) AS MaxOrder, MIN(TotalAmount) AS MinOrder
FROM Orders
GROUP BY CustomerID;

-- =======================
-- 4. Subquery / Nested Query
-- =======================
-- List products that have been ordered in OrderID = 1
SELECT ProductName
FROM Products
WHERE ProductID IN (
    SELECT ProductID FROM OrderDetails WHERE OrderID = 1
);

-- =======================
-- 5. CASE WHEN / Conditional Logic
-- =======================
SELECT OrderID, TotalAmount,
       CASE
           WHEN TotalAmount > 10000 THEN 'High'
           WHEN TotalAmount BETWEEN 5000 AND 10000 THEN 'Medium'
           ELSE 'Low'
       END AS OrderLevel
FROM Orders;



-- ============================================
-- 6. TRANSACTION + TRIGGER Test 
-- ============================================

-- Step 1: Optional – make sure SP exists (simple insert)
CREATE OR ALTER PROCEDURE sp_AddOrder
    @CustomerID INT,
    @EmployeeID INT,
    @OrderDate DATETIME,
    @TotalAmount DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, TotalAmount)
    VALUES (@CustomerID, @EmployeeID, @OrderDate, @TotalAmount);
END;
GO

-- Step 2: Begin transaction
BEGIN TRANSACTION;

-- Step 3: Insert a new order directly (simpler than calling SP)
INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, TotalAmount)
VALUES (1, 1, GETDATE(), 1000);

-- Step 4: Capture the last inserted OrderID
DECLARE @OrderID INT;
SET @OrderID = SCOPE_IDENTITY();

-- Step 5: Insert order details (trigger fires automatically)
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES (@OrderID, 1, 2, 250.00);

-- Step 6: Check product stock
SELECT ProductID, ProductName, StockQty 
FROM Products 
WHERE ProductID = 1;

-- Step 7: Rollback to undo all changes
ROLLBACK TRANSACTION;

-- Note: Trigger executed when inserting into OrderDetails, 
-- but rollback ensures all changes are undone.


-- =======================
-- 7. VIEW Example
-- =======================

-- View for customer order summary
CREATE OR ALTER VIEW vw_CustomerOrderSummary AS
SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS TotalOrders, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

-- Test view
SELECT * FROM vw_CustomerOrderSummary;

-- =======================
-- 8. EMPLOYEE SALES REPORT
-- =======================

-- Total sales by employee
SELECT e.EmployeeID, e.FirstName, e.LastName,format(SUM(o.TotalAmount),'C','en-GB') AS TotalSales
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC;
