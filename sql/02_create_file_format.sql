-- Step 2: Create CSV file format
USE MedicalWarehouse;

CREATE EXTERNAL FILE FORMAT CsvFormat
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR  = ',',
        FIRST_ROW         = 2,
        USE_TYPE_DEFAULT  = TRUE
    )
);

CREATE EXTERNAL FILE FORMAT ParquetFormat
WITH ( FORMAT_TYPE = PARQUET );