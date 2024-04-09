WITH RECURSIVE
managers_chain(employeenumber, heirarchy) AS (
    SELECT employeeNumber, lastName ||  ', ' || firstname AS heirarchy
      FROM employees
     WHERE reportsto IS NULL

     UNION ALL

    SELECT e.employeenumber, mc.heirarchy || ' <-- ' || e.lastname || ', ' || e.firstname AS heirarchy
      FROM employees AS e
     INNER JOIN managers_chain AS mc
        ON e.reportsto = mc.employeenumber
)

SELECT heirarchy
  FROM managers_chain;

SELECT lastname || ', ' || firstName AS employee_name,
       jobTitle,
       offices.country
  FROM employees
 INNER JOIN offices
    ON employees.officeCode = offices.officeCode
 ORDER BY lastname;