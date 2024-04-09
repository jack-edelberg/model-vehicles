-- SQLite
-- ID locations of each office
SELECT city,
       country
  FROM offices;

-- Use view to determine number of customers in each sales group
SELECT salesgroup,
       COUNT(*),
       ROUND(SUM(customer_revenue.total_revenue) / COUNT(*), 2) AS average_customer_revenue,
       ROUND(SUM(customer_revenue.total_profit) / COUNT(*), 2) AS average_customer_profit
  FROM customers_with_sales_group
 INNER JOIN (-- Subquery identifies total revenue and total profit for each customer
             SELECT customerNumber,
                    SUM(quantityOrdered * priceEach) AS total_revenue,
                    SUM(quantityOrdered * (priceEach - products.buyPrice)) AS total_profit
               FROM orderDetails
              INNER JOIN orders
                 ON orderDetails.orderNumber = orders.orderNumber
              INNER JOIN products
                 ON orderdetails.productCode = products.productCode
              GROUP BY customerNumber) AS customer_revenue
    ON customers_with_sales_group.customerNumber = customer_revenue.customerNumber
 GROUP BY salesgroup;