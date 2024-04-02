-- ===================================================
-- NB - I DECIDED TO PERFORM THIS IN PYTHON INSTEAD 
-- OF SQL. Details: './company-growth-customers.ipynb'
-- ===================================================

-- Initialize: Get number of unique customers for month 0. Add the unique numbers to the running list.
--
-- 1. Get customer numbers for this month
-- 2. Check for new customer numbers against the running list
-- 3. Count the number of unique new customer numbers
-- 4. Add new unique customer numbers to running list

SELECT CAST(SUBSTR(orderdate, 1, 4) AS INT) * 100 + CAST(SUBSTR(orderdate, 6, 2) AS INT) AS year_month,
       customerNumber
  FROM orders
 ORDER BY year_month;

-- ========================================================
-- This is how dataquest solved the problem entirely in SQL
-- ========================================================
WITH 

payment_with_year_month_table AS (
SELECT *, 
       CAST(SUBSTR(paymentDate, 1,4) AS INTEGER)*100 + CAST(SUBSTR(paymentDate, 6,7) AS INTEGER) AS year_month
  FROM payments p
),

customers_by_month_table AS (
SELECT p1.year_month, COUNT(*) AS number_of_customers, SUM(p1.amount) AS total
  FROM payment_with_year_month_table p1
 GROUP BY p1.year_month
),

new_customers_by_month_table AS (
SELECT p1.year_month, 
       COUNT(*) AS number_of_new_customers,
       SUM(p1.amount) AS new_customer_total,
       (SELECT number_of_customers
          FROM customers_by_month_table c
        WHERE c.year_month = p1.year_month) AS number_of_customers,
       (SELECT total
          FROM customers_by_month_table c
         WHERE c.year_month = p1.year_month) AS total
  FROM payment_with_year_month_table p1
 WHERE p1.customerNumber NOT IN (SELECT customerNumber
                                   FROM payment_with_year_month_table p2
                                  WHERE p2.year_month < p1.year_month)
 GROUP BY p1.year_month
)

SELECT year_month, 
       ROUND(number_of_new_customers*100/number_of_customers,1) AS number_of_new_customers_props,
       ROUND(new_customer_total*100/total,1) AS new_customers_total_props
  FROM new_customers_by_month_table;

 