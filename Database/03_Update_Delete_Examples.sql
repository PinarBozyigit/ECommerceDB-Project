-- ============================================
-- SAMPLE UPDATE & DELETE & ALTER SCRIPT
-- Database: ECommerceDB
-- ============================================
-- =======================
-- ALTER EXAMPLES
-- Database: ECommerceDB
-- ============================================
-- =======================
-- 0. ADD EmployeeID TO Orders
-- =======================
-- Add EmployeeID column (nullable first to avoid FK issues)
ALTER TABLE Orders
ADD EmployeeID INT NULL;

-- =======================
-- 1. UPDATE EXISTING RECORDS
-- =======================
-- Assign EmployeeID to existing orders
UPDATE Orders
SET EmployeeID = 1
WHERE OrderID IN (1, 3);

UPDATE Orders
SET EmployeeID = 2
WHERE OrderID IN (2, 5);

UPDATE Orders
SET EmployeeID = 3
WHERE OrderID = 4;

-- =======================
-- 2. ADD FOREIGN KEY AFTER UPDATE
-- =======================
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Employees
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

-- =======================
-- 3. UPDATE EXAMPLES
-- =======================

-- a) Update product price
UPDATE Products
SET Price = 2000.00
WHERE ProductName = 'Office Chair';

-- b) Update order status
UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 1;

-- c) Update customer email
UPDATE Customers
SET Email = 'newemail@example.com'
WHERE CustomerID = 2;

-- d) Increase stock quantity
UPDATE Products
SET StockQty = StockQty + 10
WHERE ProductName = 'Wireless Mouse';

-- =======================
-- 4. DELETE EXAMPLES
-- =======================

-- a) Delete an order detail
-- NOTE: If you want Orders to automatically delete related OrderDetails, you can add:
-- FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE

DELETE FROM OrderDetails
WHERE OrderDetailID = 3;


-- NOTE: Deleting Orders directly may fail due to foreign key constraints.
-- Use a Stored Procedure or manually delete related OrderDetails first.
-- b) Delete an order using stored procedure (safe way)
-- EXEC DeleteOrder @OrderID = 5;
-- 2. Delete an order (only if no details exist or cascade is enabled)

DELETE FROM Orders
WHERE OrderID = 5;


-- c) Delete a customer (ensure related orders are handled first)
DELETE FROM Customers
WHERE CustomerID = 4;

-- d) Delete a product (careful: might break FK in OrderDetails)
DELETE FROM Products
WHERE ProductID = 10;

-- =======================
-- NOTES
-- =======================
-- 1. EmployeeID added to Orders allows joining Employees and Orders for reporting.
-- 2. Orders must have valid EmployeeID for foreign key constraint.
-- 3. To safely delete orders, use the stored procedure DeleteOrder to also delete related OrderDetails.

