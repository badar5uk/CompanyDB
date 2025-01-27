USE CompanyDB;

/*
Pair Employees With All Projects
Write a query to generate a list of all possible employee-project pairs.
*/

SELECT *
FROM employees e
CROSS JOIN projects p

/*
Generate a List of Department-Project Pairs
Write a query to pair each department with every project in the database.
*/
SELECT *
FROM departments d
CROSS JOIN projects p