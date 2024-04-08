SELECT mc.origin,
       COUNT(*) as num_models,
       SUM(quantityInStock) / COUNT(*) AS avg_quantity_on_hand,
       profit_margin.avg_margin AS profit_margin
  FROM products as p
 INNER JOIN make_and_country as mc
    ON p.productName = mc.productName
 INNER JOIN (SELECT mc_sub.origin,
                    ROUND((AVG(od_sub.priceeach) - AVG(p_sub.buyprice)) / AVG(p_sub.buyprice), 2) AS avg_margin
               FROM products AS p_sub
              INNER JOIN orderDetails AS od_sub
                 ON p_sub.productCode = od_sub.productCode
              INNER JOIN make_and_country AS mc_sub
                 ON p_sub.productCode = mc_sub.productCode
              GROUP BY mc_sub.origin
              ORDER BY avg_margin DESC) as profit_margin
    ON mc.origin = profit_margin.origin
 GROUP BY mc.origin
 ORDER BY avg_quantity_on_hand DESC;

-- SELECT origin,
--        ROUND(AVG(p.buyprice), 2) AS avg_buy_price,
--        ROUND(AVG(p.msrp), 2) AS avg_msrp,
--        ROUND(AVG(od.priceeach), 2) AS avg_sale_price,
--        ROUND((AVG(od.priceeach) - AVG(p.buyprice)) / AVG(p.buyprice), 2) AS avg_margin
--   FROM products AS p
--  INNER JOIN orderDetails AS od
--     ON p.productCode = od.productCode
--  INNER JOIN make_and_country AS mc
--     ON p.productCode = mc.productCode
--  GROUP BY mc.origin
--  ORDER BY avg_margin DESC;