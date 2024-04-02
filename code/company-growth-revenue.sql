-- SQLite
-- Group by orderdate and find total sales each day
DROP VIEW IF EXISTS orders_by_date;

CREATE VIEW
orders_by_date AS
    SELECT o.orderdate,
           SUM(od.quantityOrdered * od.priceeach) AS total
      FROM orders AS o
     INNER JOIN orderdetails AS od
        ON o.ordernumber = od.ordernumber
      GROUP BY o.orderdate;


SELECT CAST(SUBSTR(orderdate, 1, 4) AS INT) * 100 + CAST(SUBSTR(orderdate, 6, 2) AS INT) AS year_month,
       SUM(total) AS monthly_revenue
  FROM orders_by_date
 GROUP BY year_month;