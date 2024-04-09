SELECT employees.firstName ||  ' ' || employees.lastName
       salesRepEmployeeNumber,
       COUNT(*) AS num_customers
  FROM customers
 INNER JOIN employees
    ON employees.employeeNumber = customers.salesRepEmployeeNumber
 GROUP BY salesRepEmployeeNumber
 ORDER BY num_customers DESC