-- Analytics queries on medical dataset

USE MedicalWarehouse;

-- 1. Total records
SELECT COUNT(*) AS total_records FROM bronze_patients;

-- 2. Patients by severity
SELECT
    Severity_of_Illness,
    COUNT(*) AS total,
    ROUND(AVG(Admission_Deposit), 2) AS avg_deposit
FROM bronze_patients
GROUP BY Severity_of_Illness
ORDER BY total DESC;

-- 3. Top departments
SELECT TOP 5
    Department,
    COUNT(*) AS admissions,
    COUNT(DISTINCT patientid) AS unique_patients
FROM bronze_patients
GROUP BY Department
ORDER BY admissions DESC;

-- 4. Admission type breakdown
SELECT
    Type_of_Admission,
    COUNT(*) AS total,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 1) AS pct
FROM bronze_patients
GROUP BY Type_of_Admission;

-- 5. Stay distribution
SELECT Stay, COUNT(*) AS frequency
FROM bronze_patients
GROUP BY Stay
ORDER BY frequency DESC;