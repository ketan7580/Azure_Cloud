IF OBJECT_ID('dbo.vw_Customer_360_Summary', 'V') IS NOT NULL
    DROP VIEW dbo.vw_Customer_360_Summary;
GO

CREATE VIEW dbo.vw_Customer_360_Summary AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    c.City,
    c.CreditScore,
    COUNT(DISTINCT a.Account_Number) AS Total_Accounts,
    COUNT(t.Transaction_ID) AS Total_Transactions,
    ISNULL(SUM(t.Txn_Amount), 0) AS Total_Transaction_Value,
    MAX(t.Txn_Timestamp) AS Last_Transaction_Date
FROM dbo.DimCustomer c 
LEFT JOIN dbo.DimAccount a ON c.CustomerID = a.Customer_ID
LEFT JOIN dbo.Fact_Transactions t ON a.Account_Number = t.Account_Number
GROUP BY 
    c.CustomerID, 
    c.CustomerName, 
    c.City, 
    c.CreditScore;
GO