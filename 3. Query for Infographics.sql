-- Total number of chemicals and company reported by year

SELECT
  EXTRACT(YEAR FROM initial_date_reported) AS year_reported,
  COUNT(*) AS total_reports,
  COUNT (DISTINCT chemical_name) AS total_chemicals_reported,
  COUNT (DISTINCT company_id) AS total_companies_reported
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
GROUP BY year_reported
ORDER BY year_reported;

-- Count the number of most reported chemicals

SELECT
  DISTINCT chemical_name,
  COUNT (chemical_name) AS chemical_count
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
GROUP BY chemical_name
ORDER BY chemical_count DESC
LIMIT 5;

-- In which categories chemicals are found

SELECT
  DISTINCT primary_category,
  COUNT (primary_category) AS category_count
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
GROUP BY primary_category
ORDER BY category_count DESC;

-- How many chemicals are found in each product?

SELECT
  chemical_count,
  COUNT(chemical_count)
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
GROUP BY chemical_count;
