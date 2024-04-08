SELECT *,
       SUM(od.quantityOrdered) as qty_sold
  FROM orderdetails AS od
 INNER JOIN products AS p
    ON p.productCode = od.productCode
 GROUP BY od.productCode
 ORDER BY qty_sold DESC
 LIMIT 5
 