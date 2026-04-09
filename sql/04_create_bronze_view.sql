-- Step 4: Create view over raw CSV
USE MedicalWarehouse;

CREATE VIEW bronze_patients AS
SELECT *
FROM OPENROWSET(
    BULK 'https://YOUR_STORAGE_ACCOUNT.dfs.core.windows.net
          /raw-data/bronze/patients/train_data.csv',
    FORMAT          = 'CSV',
    FIRSTROW        = 2,
    FIELDTERMINATOR = ','
)
WITH (
    case_id                           INT,
    Hospital_code                     INT,
    Hospital_type_code                VARCHAR(10),
    City_Code_Hospital                INT,
    Hospital_region_code              VARCHAR(10),
    Available_Extra_Rooms_in_Hospital INT,
    Department                        VARCHAR(100),
    Ward_Type                         VARCHAR(10),
    Ward_Facility_Code                VARCHAR(10),
    Bed_Grade                         FLOAT,
    patientid                         INT,
    City_Code_Patient                 INT,
    Type_of_Admission                 VARCHAR(50),
    Severity_of_Illness               VARCHAR(50),
    Visitors_with_Patient             INT,
    Age                               VARCHAR(20),
    Admission_Deposit                 FLOAT,
    Stay                              VARCHAR(20)
) AS [result];