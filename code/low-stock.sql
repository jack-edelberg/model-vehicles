-- SQLite
SELECT -- p.productcode,
       p.productName,
       -- quantityInStock AS num_stocked,
       -- SUM(quantityordered) AS num_ordered,
       --CASE
       --     WHEN SUM(quantityordered) - quantityinstock <= 0
       --     THEN 0
       --     ELSE SUM(quantityordered) - quantityinstock
       --END as num_backordered,
       ROUND((SUM(quantityordered) * 1.0) / quantityinstock, 2) AS stock_fraction,
       --buyprice AS buy_price,
       --priceeach AS sell_price,
       --priceeach * SUM(quantityordered) AS revenue,
       --(priceeach - buyprice) * SUM(quantityordered) AS profit,
       ROUND((priceeach - buyprice)/priceeach, 2) AS profit_margin
  FROM products AS p
 INNER JOIN orderdetails AS od
    ON p.productcode = od.productcode
 GROUP BY p.productcode
HAVING stock_fraction > 0.7
   AND profit_margin > 0.5
 ORDER BY profit_margin DESC