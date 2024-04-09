-- SELECT *,
--        SUM(od.quantityOrdered) as qty_sold
--   FROM orderdetails AS od
--  INNER JOIN products AS p
--     ON p.productCode = od.productCode
--  GROUP BY od.productCode
--  ORDER BY qty_sold DESC
--  LIMIT 5
 
-- SELECT employees.firstName ||  ' ' || employees.lastName
--        salesRepEmployeeNumber,
--        COUNT(*) AS num_customers
--   FROM customers
--  INNER JOIN employees
--     ON employees.employeeNumber = customers.salesRepEmployeeNumber
--  GROUP BY salesRepEmployeeNumber
--  ORDER BY num_customers DESC

-- SELECT e1.employeenumber,
--        e1.lastname || ', ' || e1.firstname AS employee_name,
--        e1.jobTitle AS employee_title,
--        e2.lastname || ', ' || e2.firstname AS boss_name,
--        e2.jobTitle AS boss_title,
--        e3.lastname || ', ' || e3.firstname AS supervisor_name,
--        e3.jobTitle AS supervisor_title
--   FROM employees AS e1
--   LEFT JOIN employees AS e2
--     ON e1.reportsto = e2.employeenumber
--   LEFT JOIN employees AS e3
--     ON e2.reportsto = e3.employeenumber
--  ORDER BY employee_name;

-- SELECT employees.lastname || ', ' || employees.firstname
--   FROM employees

SELECT COUNT(*)
  FROM employees