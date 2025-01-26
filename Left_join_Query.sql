USE CompanyDB;

/*
List All Departments and Their Employees
Write a query to list all department names along with their employees, ensuring that departments without employees are also included.
*/
SELECT *
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.department_id
/*
Find Projects Without Assigned Departments
Write a query to find all projects that do not have any associated department.
*/

SELECT *
FROM projects p
LEFT JOIN departments d
ON p.department_id = d.department_id
WHERE p.department_id is NULL 
/*
List Departments Without Employees
Write a query to list departments that currently have no employees assigned.
*/
SELECT *
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.department_id is NULL

