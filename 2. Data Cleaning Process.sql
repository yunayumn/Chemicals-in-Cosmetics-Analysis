-- Data Cleaning

-- Standardization of column names

ALTER TABLE
  `fashioncosmetics.chemicals_in_cosmetics.list`
RENAME COLUMN CDPHId to cdph_id,
RENAME COLUMN ProductName to product_name,
RENAME COLUMN CSFId to csf_id,
RENAME COLUMN CompanyId to company_id,
RENAME COLUMN CompanyName to company_name,
RENAME COLUMN BrandName to brand_name,
RENAME COLUMN PrimaryCategoryId to primary_category_id,
RENAME COLUMN PrimaryCategory to primary_category,
RENAME COLUMN SubCategoryId to subcategory_id,
RENAME COLUMN CasId to cas_id,
RENAME COLUMN CasNumber to cas_number,
RENAME COLUMN ChemicalId to chemical_id,
RENAME COLUMN ChemicalName to chemical_name,
RENAME COLUMN InitialDateReported to initial_date_reported,
RENAME COLUMN MostRecentDateReported to recently_reported,
RENAME COLUMN DiscontinuedDate to discontinued_date,
RENAME COLUMN ChemicalCreatedAt to chemical_created_at,
RENAME COLUMN ChemicalUpdatedAt to chemical_updated_at,
RENAME COLUMN ChemicalDateRemoved to chemical_date_remove,
RENAME COLUMN ChemicalCount to chemical_count;

-- Standardization of column names with a single word to a temporary name

ALTER TABLE
  `fashioncosmetics.chemicals_in_cosmetics.list`
RENAME COLUMN CSF to csf_temp,
RENAME COLUMN SubCategory to subcategory_temp;

-- Standardization of single-worded column names

ALTER TABLE
  `fashioncosmetics.chemicals_in_cosmetics.list`
RENAME COLUMN csf_temp to csf,
RENAME COLUMN subcategory_temp to subcategory;

-- There are a lot of data with an empty brand_name, so we need to fill it in with 'Unknown'

UPDATE `fashioncosmetics.chemicals_in_cosmetics.list`
SET brand_name = 'Unknown'
WHERE brand_name IS NULL;

-- product_name column standardized using REGEXP replace

UPDATE `your_project.your_dataset.chemicals_in_cosmetics`
SET product_name = REGEXP_REPLACE(product_name, r'[^[:ascii:]]', '')
WHERE product_name IS NOT NULL;

-- Duplicate row removal

CREATE TABLE `fashioncosmetics.chemicals_in_cosmetics.list_cleaned` AS
SELECT DISTINCT
    cdph_id, product_name, csf_id, csf, company_id, company_name, brand_name primary_category_id, primary_category, subcategory_id, subcategory, cas_id, cas_number, chemical_id, chemical_name, initial_date_reported, recently_reported, discontinued_date, chemical_created_at, chemical_updated_at, chemical_date_remove, chemical_count
FROM
    `fashioncosmetics.chemicals_in_cosmetics.list`;

-- Check results first

SELECT
  COUNT(*)
FROM `fashioncosmetics.chemicals_in_cosmetics.list`;

SELECT
  COUNT(*)
FROM `fashioncosmetics.chemicals_in_cosmetics.list_cleaned`;

-- Drop old table and rename new table

DROP TABLE `fashioncosmetics.chemicals_in_cosmetics.list`;

ALTER TABLE `fashioncosmetics.chemicals_in_cosmetics.list_cleaned`
RENAME TO `fashioncosmetics.chemicals_in_cosmetics.list`;
