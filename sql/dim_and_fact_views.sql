/* Author: [Csonka László]
Description: SQL views for Power BI Data Model. 
Instead of loading raw tables, we provide pre-filtered and clean views for the BI layer.
*/

CREATE VIEW Fact_Sales_BI AS
SELECT 
    Row_ID, Order_ID, Order_Date, Ship_Date, Ship_Mode,
    Customer_ID, Product_ID, Region_ID,
    Sales, Quantity, Discount, Profit
FROM dbo.Superstore_Raw
WHERE Order_Date >= '2022-01-01'; -- We only need the last few years for this report

GO

CREATE VIEW Dim_Product_BI AS
SELECT DISTINCT
    Product_ID, Category, Sub_Category, Product_Name
FROM dbo.Superstore_Products_Raw;