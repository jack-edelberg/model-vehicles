-- SQLite
DROP VIEW IF EXISTS customers_with_sales_group;

CREATE VIEW customers_with_sales_group
AS
SELECT *,
       (CASE
             WHEN country LIKE 'Australia' THEN 'APAC'
             WHEN country LIKE 'Austria' THEN 'EMEA'
             WHEN country LIKE 'Belgium' THEN 'EMEA'
             WHEN country LIKE 'Canada' THEN 'NA'
             WHEN country LIKE 'Denmark' THEN 'EMEA'
             WHEN country LIKE 'Finland' THEN 'EMEA'
             WHEN country LIKE 'France' THEN 'EMEA'
             WHEN country LIKE 'Germany' THEN 'EMEA'
             WHEN country LIKE 'Hong Kong' THEN 'APAC'
             WHEN country LIKE 'Ireland' THEN 'EMEA'
             WHEN country LIKE 'Israel' THEN 'EMEA'
             WHEN country LIKE 'Italy' THEN 'EMEA'
             WHEN country LIKE 'Japan' THEN 'Japan'
             WHEN country LIKE 'Netherlands' THEN 'EMEA'
             WHEN country LIKE 'New Zealand' THEN 'APAC'
             WHEN country LIKE 'Norway%' THEN 'EMEA'
             WHEN country LIKE 'Philippines' THEN 'APAC'
             WHEN country LIKE 'Poland' THEN 'EMEA'
             WHEN country LIKE 'Portugal' THEN 'EMEA'
             WHEN country LIKE 'Russia' THEN 'EMEA'
             WHEN country LIKE 'Singapore' THEN 'APAC'
             WHEN country LIKE 'South Africa' THEN 'EMEA'
             WHEN country LIKE 'Spain' THEN 'EMEA'
             WHEN country LIKE 'Sweden' THEN 'EMEA'
             WHEN country LIKE 'Switzerland' THEN 'EMEA'
             WHEN country LIKE 'UK' THEN 'EMEA'
             WHEN country LIKE 'USA' THEN 'NA'
             ELSE NULL
                END) AS salesgroup
  FROM customers;

SELECT *
  FROM customers_with_sales_group
 WHERE salesgroup IS 'EMEA';