-- 1- from “orderdetails” table. Write a query to get the total payment for each order.
SELECT SUM(priceEach) FROM `orderdetails`
GROUP BY orderNumber;

-- 2- from “employees” table. Write a query to get the full name of all employees side by side with the full name of their managers. The employee number of the manager is stored in “reportsTo” column.
SELECT CONCAT(emp.firstName," " ,emp.lastName)AS fullname ,manag.firstName AS managName 
FROM employees AS emp JOIN employees AS manag ON emp.reportsTo=manag.employeeNumber;


-- 3- Write a query to get all employees who work in the London office (using subqueries). 
SELECT firstName,lastName,employeeNumber FROM employees
 WHERE officeCode=(SELECT officeCode from offices WHERE city="London" )

-- 4- Write a query to get all employees who work in the London office (using joins).
SELECT firstName,lastName,employeeNumber FROM employees JOIN offices ON city="London" AND employees.officeCode=offices.officeCode

-- 5- From “customers”, “orders” and “orderdetails” tables. Write a query to get all customer names and the total amount they paid.
SELECT customerName ,priceEach FROM customers JOIN orders JOIN orderdetails
ON customers.customerNumber=orders.customerNumber AND orders.orderNumber=orderdetails.orderNumber;