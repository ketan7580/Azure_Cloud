IF OBJECT_ID('dbo.DimCustomer', 'U') IS NOT NULL
    DROP TABLE dbo.DimCustomer;
GO

CREATE TABLE dbo.DimCustomer
(
    CustomerID VARCHAR(20) NULL,
    CustomerName VARCHAR(100) NULL,
    Gender VARCHAR(20) NULL,
    City VARCHAR(50) NULL,
    CreditScore FLOAT NULL,               -- FLOAT / DOUBLE PRECISION
    JoinDate VARCHAR(20) NULL,             
    IngestionDate VARCHAR(30) NULL         
)
WITH
(
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
);
GO