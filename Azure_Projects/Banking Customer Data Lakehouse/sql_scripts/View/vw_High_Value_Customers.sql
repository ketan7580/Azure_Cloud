IF OBJECT_ID('dbo.vw_High_Value_Customers', 'V') IS NOT NULL
    DROP VIEW dbo.vw_High_Value_Customers;
GO

CREATE VIEW dbo.vw_High_Value_Customers AS
SELECT 
    CustomerID,
    CustomerName,
    City,
    CreditScore,
    Total_Accounts,
    Total_Transactions,
    Total_Transaction_Value
FROM dbo.vw_Customer_360_Summary
WHERE Total_Transaction_Value > 50000 
   OR CreditScore >= 750;
GO