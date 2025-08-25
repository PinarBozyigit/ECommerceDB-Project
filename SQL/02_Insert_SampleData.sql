
-- =============================================
--  SAMPLE DATA INSERT SCRIPT
--  Database: ECommerceDB
--  Author: [Pinar Bozyigit]
--  Date: [23.08.2025 ]
-- =============================================

-- =======================
-- CUSTOMERS
-- =======================
INSERT INTO Customers (CustomerName, City, Country, Email) VALUES
('Ali Yılmaz', 'İstanbul', 'Türkiye', 'ali.yilmaz@example.com'),
('Ayşe Demir', 'Ankara', 'Türkiye', 'ayse.demir@example.com'),
('John Smith', 'London', 'UK', 'john.smith@example.com'),
('Maria Garcia', 'Madrid', 'Spain', 'maria.garcia@example.com');

-- ===========================
-- INSERT SAMPLE PRODUCTS
-- ===========================

INSERT INTO Products (ProductName, Category, Price, StockQty)
VALUES 
('Laptop', 'Electronics', 18500.00, 15),
('Wireless Mouse', 'Electronics', 250.00, 120),
('Mechanical Keyboard', 'Electronics', 600.00, 75),
('Monitor 24"', 'Electronics', 3200.00, 20),
('Office Chair', 'Furniture', 2500.00, 10),
('Desk Lamp', 'Furniture', 450.00, 35),
('Headphones', 'Electronics', 750.00, 50),
('Powerbank 10000mAh', 'Accessories', 350.00, 40),
('Book: Learning SQL', 'Books', 120.00, 100),
('Laptop Bag', 'Accessories', 600.00, 25);

-- ===========================
-- INSERT SAMPLE EMPLOYEES
-- ===========================
INSERT INTO Employees (FirstName, LastName, Email, Position)
VALUES ('John', 'Doe', 'john.doe@example.com', 'Sales Manager');

INSERT INTO Employees (FirstName, LastName, Email, Position)
VALUES ('Emily', 'Smith', 'emily.smith@example.com', 'Sales Representative');

INSERT INTO Employees (FirstName, LastName, Email, Position)
VALUES ('Michael', 'Brown', 'michael.brown@example.com', 'Support Specialist');

INSERT INTO Employees (FirstName, LastName, Email, Position)
VALUES ('Sarah', 'Johnson', 'sarah.johnson@example.com', 'HR Manager');

INSERT INTO Employees (FirstName, LastName, Email, Position)
VALUES ('David', 'Wilson', 'david.wilson@example.com', 'IT Administrator');


-- =======================
-- ORDERS
-- =======================
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status)
VALUES 
(1, '2023-08-01', 19000.00, 'Pending'),
(2, '2023-08-02', 3800.00, 'Shipped'),
(3, '2023-08-03', 19750.00, 'Pending'),
(4, '2023-08-04', 3400.00, 'Delivered'),
(1, '2023-08-05', 950.00, 'Pending');

-- =======================
-- ORDER DETAILS
-- =======================
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES
-- Order 1
(1, 1, 1, 18500.00),   -- Laptop
(1, 2, 2, 250.00),     -- Wireless Mouse

-- Order 2
(2, 3, 1, 600.00),     -- Mechanical Keyboard
(2, 4, 1, 3200.00),    -- Monitor 24"

-- Order 3
(3, 1, 2, 18500.00),   -- Laptop x2
(3, 7, 1, 750.00),     -- Headphones

-- Order 4
(4, 5, 1, 2500.00),    -- Office Chair
(4, 6, 2, 450.00),     -- Desk Lamp

-- Order 5
(5, 8, 1, 350.00),     -- Powerbank 10000mAh
(5, 10, 1, 600.00);    -- Laptop Bag


-- =======================
-- PAYMENTS
-- =======================
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod)
VALUES 
(1, '2023-08-02', 19000.00, 'Credit Card'),
(2, '2023-08-03', 3800.00, 'Bank Transfer'),
(3, '2023-08-04', 19750.00, 'Credit Card'),
(4, '2023-08-05', 3400.00, 'Cash'),
(5, '2023-08-06', 950.00, 'PayPal');