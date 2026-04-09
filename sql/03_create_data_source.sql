-- Step 3: Point to ADLS Gen2
USE MedicalWarehouse;

CREATE EXTERNAL DATA SOURCE MedicalLake
WITH (
    LOCATION = 'abfss://raw-data@YOUR_STORAGE_ACCOUNT
                .dfs.core.windows.net'
);