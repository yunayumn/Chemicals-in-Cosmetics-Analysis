-- Exploratory Data Analysis

-- Checking data head

SELECT
  *
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
WHERE csf_id IS NOT NULL
LIMIT 5;

-- Count the total number of chemicals and the company that reported them

SELECT
  COUNT(*) AS total_reports,
  COUNT (DISTINCT chemical_name) AS total_chemicals_reported,
  COUNT (DISTINCT company_id) AS total_companies_reported
FROM `fashioncosmetics.chemicals_in_cosmetics.list`;

-- Count the number of rows with null brand_name

SELECT
  COUNT(*)
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
WHERE brand_name IS NULL;

-- Count the number of rows with null CSF

SELECT
  COUNT(*)
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
WHERE csf_id IS NULL;
