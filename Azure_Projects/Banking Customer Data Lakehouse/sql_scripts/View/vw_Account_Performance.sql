CREATE VIEW dbo.vw_Account_Performance AS
SELECT 
    a.Account_Number,
    a.Customer_ID,
    COUNT(t.Transaction_ID) AS Txn_Count,
    SUM(t.Txn_Amount) AS Total_Amount_Spent,
    AVG(t.Txn_Amount) AS Avg_Txn_Amount
FROM dbo.DimAccount a
INNER JOIN dbo.Fact_Transactions t ON a.Account_Number = t.Account_Number
GROUP BY 
    a.Account_Number, 
    a.Customer_ID;
GO


SELECT * FROM dbo.vw_Account_Performance;

SELECT * FROM dbo.Fact_Transactions;