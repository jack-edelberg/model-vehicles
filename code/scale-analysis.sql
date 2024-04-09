-- SQLite
SELECT productscale,
       COUNT(*)
  FROM products
 GROUP BY productScale;

SELECT productname
  FROM products
 WHERE productscale LIKE '%24%';