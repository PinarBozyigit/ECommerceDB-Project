
# ECommerceDB Project Report

## 1. Introduction
The goal of this project is to analyze sales and customer data from the **ECommerceDB** database and create visual dashboards using **Power BI**.  
This project demonstrates how SQL scripts extract insights from data and how Power BI visualizations support business decisions.

**Tools Used:**  
- SQL Server (Database Scripts & Queries)  
- Power BI Desktop (Data Visualization)  
- GitHub (Repository & README)  

---

## 2. Database & Scripts
The ECommerceDB contains the main tables:  

- **Products**: ProductID, ProductName, Price, Stock, etc.  
- **Orders**: OrderID, CustomerID, OrderDate, etc.  
- **OrderDetails**: OrderID, ProductID, Quantity, UnitPrice  
- **Customers**: CustomerID, CustomerName, Contact info  

**Database Scripts (Direct Links):**  

| Script | Description | Link |
|--------|------------|------|
| `01_CreateTables.sql` | Creates all tables with necessary constraints | [Link](Database/01_Create_Tables.sql) |
| `02_InsertProducts.sql` | Populates `Products` table with sample data | [Link](Database/02_Insert_SampleData.sql) |
| `03_InsertCustomers.sql` | Populates `Customers` table with sample data | [Link](Database//03_Update_Delete_Examples.sql) |
| `04_InsertOrders.sql` | Populates `Orders` and `OrderDetails` tables | [Link](Database/04_Sample_Queries.sql) |
| `05_Queries.sql` | Contains all SQL queries for the project | [Link](Database/05_StoredProcedure_Trigger.sql) |


> These scripts can be executed directly in SQL Server to fully recreate the database and run the project queries.  

---

## 3. Power BI Visualizations
- SQL scripts were imported into Power BI for visualization.  
- Visuals used:


### Query 1 – Monthly Sales Trend
<a href="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/MonthlySalesTrend.png">
  <img src="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/MonthlySalesTrend.png" alt="Query1 – Monthly Sales Trend" width="200"/>
</a>

### Query 2 – Top Selling Products
<a href="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/TopSellingProducts.png">
  <img src="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/TopSellingProducts.png" alt="Query2 – Top Selling Products" width="200"/>
</a>

### Query 3 – Product Price Groups
<a href="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/ProductPriceGroups.png">
  <img src="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/ProductPriceGroups.png" alt="Query3 – Product Price Groups" width="200"/>
</a>

### Query 4 – Top Products by Revenue
<a href="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/SumTotalAvenue.png">
  <img src="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/SumTotalAvenue.png" alt="Query4 – Top Products by Revenue" width="200"/>
</a>

### Query 5 – Monthly/Yearly Sales Comparison
<a href="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/CountOfTotalRevenue.png">
  <img src="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/CountOfTotalRevenue.png" alt="Query5 – Monthly/Yearly Sales Comparison" width="200"/>
</a>

### Query 6 – Top Customers by Revenue
<a href="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/TopCustomersbyRevenue.png">
  <img src="https://github.com/PinarBozyigit/ECommerceDB-Project/blob/main/PowerBI/screenshots/TopCustomersbyRevenue.png" alt="Query6 – Top Customers by Revenue" width="200"/>
</a>

- Data labels, currency formatting (£), and axis formatting applied for readability.  

---

## 4. Insights & Findings
- Top-selling products dominate total revenue.  
- Higher-priced products generate significant revenue even with lower sales volume.  
- Certain customers consistently generate high revenue.  
- Monthly/yearly trends show seasonal peaks in sales.  
- Price segmentation reveals revenue contribution per product category.  

---

## 5. Conclusion
This project demonstrates the integration of SQL and Power BI for business analytics:  
- Database scripts allow full recreation of tables and data.  
- Power BI provides clear and interactive visualization.  
- The project supports business decision-making through insights on products, customers, and sales trends.  

---

## 6. Appendix
- **Database Scripts:** 5 `.sql` files linked above  
- **Dashboard Screenshots:** Stored in `PowerBI/screenshots/` folder  
