-- Example: Export and Import demo

-- Step 1: Export data from Customers table to CSV
-- (Pseudo-SQL / SQL Server example using BCP or OPENROWSET)
-- Replace with actual file path in real use
SELECT * 
INTO OUTFILE 'C:\Export\Customers.csv'
FROM Customers;

-- Step 2: Import data from CSV into a staging table
BULK INSERT Staging_Customers
FROM 'C:\Export\Customers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Step 3: Data cleaning & transformation
UPDATE Customers
SET Email = LOWER(Email)
WHERE Email IS NOT NULL;

-- Step 4: Load into production table
INSERT INTO Customers (CustomerName, Email, Phone)
SELECT CustomerName, Email, Phone
FROM Customers;
