
-- =======================
-- 1. STORED PROCEDURE Example
-- =======================

-- Stored procedure to insert a new order
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

--EXAMPLE
-- ADD New Order
EXEC sp_AddOrder
    @CustomerID = 1,      -- Customer
    @EmployeeID = 2,      -- Employee
    @OrderDate = '2023-08-25', 
    @TotalAmount = 1500.00;
--CHECK NEW ENROLL
SELECT  *
FROM Orders
ORDER BY OrderID DESC;


-- =======================
-- 2. TRIGGER Example
-- =======================

-- Trigger to update stock quantity when an order detail is inserted
CREATE OR ALTER TRIGGER trg_UpdateStock
ON OrderDetails
AFTER INSERT
AS
BEGIN
    -- Decrease stock quantity based on inserted order details
    UPDATE p
    SET p.StockQty = p.StockQty - i.Quantity
    FROM Products p
    INNER JOIN inserted i ON p.ProductID = i.ProductID;
END;

-- =======================
-- TESTING THE TRIGGER
-- =======================

-- 1. Using Transaction to test without permanently changing data
BEGIN TRANSACTION;

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES (1, 2, 1, 250.00);  -- This will fire trg_UpdateStock

-- Check product stock (still updated inside the transaction)
SELECT ProductID, ProductName, StockQty FROM Products WHERE ProductID = 2;

-- Rollback to undo changes (trigger effect is also rolled back)
ROLLBACK TRANSACTION;

-- 2. Temporarily disable the trigger
DISABLE TRIGGER trg_UpdateStock ON OrderDetails;

-- This insert will NOT fire the trigger
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES (1, 2, 1, 250.00);

-- Re-enable trigger
ENABLE TRIGGER trg_UpdateStock ON OrderDetails;


