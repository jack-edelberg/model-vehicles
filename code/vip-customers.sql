-- SQLite
SELECT o.customernumber,
       c.customername,
       COUNT(*) AS num_orders,
       ROUND(SUM(od.quantityordered * od.priceeach), 2) AS total_revenue,
       ROUND(SUM(od.quantityordered * (od.priceeach - p.buyprice)), 2) AS total_profit
  FROM orders AS o
 INNER JOIN orderdetails AS od
    ON o.ordernumber = od.ordernumber
 INNER JOIN products AS p
    ON p.productcode = od.productcode
 INNER JOIN customers AS c
    ON c.customernumber = o.customernumber
 GROUP BY o.customernumber
 ORDER BY total_profit DESC
