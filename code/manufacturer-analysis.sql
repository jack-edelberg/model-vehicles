-- SQLite
SELECT productvendor,
       COUNT(*)
  FROM products
 GROUP BY productVendor;
 