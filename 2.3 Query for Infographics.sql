-- Count the number of most reported chemicals
SELECT
  DISTINCT chemical_name,
  COUNT (chemical_name) AS chemical_count
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
GROUP BY chemical_name
ORDER BY chemical_count DESC
LIMIT 5;

-- Where chemicals are found
SELECT
  DISTINCT primary_category,
  COUNT (primary_category) AS category_count
FROM `fashioncosmetics.chemicals_in_cosmetics.list`
GROUP BY primary_category
ORDER BY category_count DESC;