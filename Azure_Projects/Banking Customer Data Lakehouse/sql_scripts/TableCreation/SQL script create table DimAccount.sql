IF OBJECT_ID('dbo.DimAccount', 'U') IS NOT NULL
    DROP TABLE dbo.DimAccount;

CREATE TABLE dbo.DimAccount
(
    Account_Number VARCHAR(50) NOT NULL,
    Customer_ID VARCHAR(50) NOT NULL,
    Account_Type VARCHAR(20),
    Current_Balance FLOAT,
    Status VARCHAR(20),
    IngestionDate VARCHAR(20) NULL
)
WITH
(
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);