SELECT *
  FROM products as p
 INNER JOIN make_and_country as mc
    ON p.productName = mc.productName