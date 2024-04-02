-- SQLite
SELECT 'customers' AS table_name,
       (SELECT count(*)
          FROM pragma_table_info('customers')) AS num_attributes,
       (SELECT COUNT(*)
          FROM customers) AS num_rows

UNION ALL

SELECT 'employees' AS table_name,
       (SELECT count(*)
          FROM pragma_table_info('employees')) AS num_attributes,
       (SELECT COUNT(*)
          FROM employees) AS num_rows

UNION ALL

SELECT 'offices' AS table_name,
       (SELECT count(*)
          FROM pragma_table_info('offices')) AS num_attributes,
       (SELECT COUNT(*)
          FROM offices) AS num_rows

UNION ALL

SELECT 'orderdetails' AS table_name,
       (SELECT count(*)
          FROM pragma_table_info('orderdetails')) AS num_attributes,
       (SELECT COUNT(*)
          FROM orderdetails) AS num_rows

UNION ALL

SELECT 'orders' AS table_name,
       (SELECT count(*)
          FROM pragma_table_info('orders')) AS num_attributes,
       (SELECT COUNT(*)
          FROM orders) AS num_rows

UNION ALL

SELECT 'payments' AS table_name,
       (SELECT count(*)
          FROM pragma_table_info('payments')) AS num_attributes,
       (SELECT COUNT(*)
          FROM payments) AS num_rows

UNION ALL

SELECT 'productlines' AS table_name,
       (SELECT count(*)
          FROM pragma_table_info('productlines')) AS num_attributes,
       (SELECT COUNT(*)
          FROM productlines) AS num_rows

UNION ALL

SELECT 'products' AS table_name,
       (SELECT count(*)
          FROM pragma_table_info('products')) AS num_attributes,
       (SELECT COUNT(*)
          FROM employees) AS num_rows