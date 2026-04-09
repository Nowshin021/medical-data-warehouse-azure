-- First make sure you're in the right database
USE MedicalWarehouse;

-- View over your CLEAN silver Parquet data
CREATE VIEW silver_patients AS
SELECT *
FROM OPENROWSET(
    BULK 'https://@your_STORAGE_ACCOUNT.dfs.core.windows.net/raw-data/silver/patients/**',
    FORMAT = 'PARQUET'
) AS [result];

