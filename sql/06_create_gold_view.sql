-- View over your AGGREGATED gold Parquet data
CREATE VIEW gold_patient_stats AS
SELECT *
FROM OPENROWSET(
    BULK 'https://@YOUR_STORAGE_VIEW.dfs.core.windows.net/raw-data/gold/patient_stats/**',
    FORMAT = 'PARQUET'
) AS [result];