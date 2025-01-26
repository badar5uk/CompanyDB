USE CompanyDB;

/*
Find Employees in the IT Department
Write a query to fetch the names of employees working in the IT department.
*/
SELECT e.name,d.department_id, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id = 2

/*
List Employees Working on Projects
Write a query to list the names of employees who are part of a department that is assigned to any project.
*/
SELECT e.name, p.project_id, p.project_name
FROM employees e
INNER JOIN projects p 
ON e.department_id = p.department_id

/*
Find Employees and Their Projects
Write a query to fetch employees along with project names they are indirectly associated with (based on their department).
*/

SELECT e.name, p.project_id, p.project_name
FROM employees e
INNER JOIN projects p 
ON e.department_id = p.department_id