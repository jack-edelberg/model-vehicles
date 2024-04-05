SELECT origin,
       COUNT(*) as num_models,
       SUM(quantityInStock) AS num_on_hand,
       SUM(quantityInStock) / COUNT(*) AS avg_quantity
  FROM products as p
 INNER JOIN make_and_country as mc
    ON p.productName = mc.productName
 GROUP BY origin
 ORDER BY avg_quantity DESC;

-- SELECT origin,
--        COUNT(*) as num_models,
--        SUM(quantityInStock) / COUNT(*) AS avg_quantity_stocked,
--        SUM(od.quantityOrdered) / COUNT(*) AS avg_quantity_ordered
--   FROM orderDetails AS od
--  INNER JOIN products AS p
--     ON od.productCode = p.productCode
--  INNER JOIN make_and_country AS mc
--     ON p.productName = mc.productName
--  GROUP BY mc.origin;

SELECT origin,
    --    ROUND(AVG(p.buyprice), 2) AS avg_buy_price,
    --    ROUND(AVG(p.msrp), 2) AS avg_msrp,
    --    ROUND(AVG(od.priceeach), 2) AS avg_sale_price,
       ROUND((AVG(od.priceeach) - AVG(p.buyprice)) / AVG(p.buyprice), 2) AS avg_margin
  FROM products AS p
 INNER JOIN orderDetails AS od
    ON p.productCode = od.productCode
 INNER JOIN make_and_country AS mc
    ON p.productCode = mc.productCode
 GROUP BY mc.origin
 ORDER BY avg_margin DESC;