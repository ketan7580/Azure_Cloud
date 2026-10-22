IF OBJECT_ID('dbo.Fact_Transactions', 'U') IS NOT NULL
    DROP TABLE dbo.Fact_Transactions;

CREATE TABLE dbo.Fact_Transactions
(
    Transaction_ID VARCHAR(50) NOT NULL,
    Account_Number VARCHAR(50) NOT NULL,
    Txn_Amount DECIMAL(18,2) NULL,
    Txn_Type VARCHAR(20) NULL,
    Txn_Timestamp VARCHAR(20) NULL,
    Location VARCHAR(100) NULL,
    ingestion_timestamp VARCHAR(20) NULL
)
WITH
(
    DISTRIBUTION = HASH(Account_Number), -- High-performance joins with Dim_Account
    CLUSTERED COLUMNSTORE INDEX
);