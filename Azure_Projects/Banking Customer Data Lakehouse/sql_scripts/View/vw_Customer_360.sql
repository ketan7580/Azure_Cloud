IF OBJECT_ID('dbo.vw_Customer_360', 'V') IS NOT NULL
    DROP VIEW dbo.vw_Customer_360;
GO

CREATE VIEW dbo.vw_Customer_360 AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    c.City,
    a.Account_Number,
    a.Account_Type,
    COALESCE(a.Current_Balance, 0.00) AS Current_Account_Balance,
    COALESCE(SUM(CASE WHEN t.Txn_Type = 'CREDIT' THEN t.Txn_Amount ELSE 0 END), 0.00) AS Total_Deposits,
    COALESCE(SUM(CASE WHEN t.Txn_Type = 'DEBIT' THEN t.Txn_Amount ELSE 0 END), 0.00) AS Total_Withdrawals,
    COUNT(t.Transaction_ID) AS Total_Txn_Count,
    COALESCE(l.LoanAmount, 0.00) AS Active_Loan_Amount,
    COALESCE(l.DefaultStatus, 'NO_LOAN') AS Loan_Status
FROM dbo.DimCustomer c
INNER JOIN dbo.DimAccount a 
    ON RTRIM(LTRIM(c.CustomerID)) = RTRIM(LTRIM(a.Customer_ID))
LEFT JOIN dbo.Fact_Transactions t 
    ON RTRIM(LTRIM(a.Account_Number)) = RTRIM(LTRIM(t.Account_Number))
LEFT JOIN dbo.FactLoan l 
    ON RTRIM(LTRIM(c.CustomerID)) = RTRIM(LTRIM(l.CustomerID))
GROUP BY 
    c.CustomerID,
    c.CustomerName,
    c.City,
    a.Account_Number,
    a.Account_Type,
    a.Current_Balance,
    l.LoanAmount,
    l.DefaultStatus;
GO

SELECT * FROM dbo.vw_Customer_360;

