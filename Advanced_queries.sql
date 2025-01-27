USE CompanyDB;

/*
Find Employees Working in Departments Handling Projects With Budgets Greater Than 5000
Write a query to fetch the names of employees working in departments that have at least one project with a budget exceeding 5000.
*/
SELECT *
FROM employees e
INNER  JOIN projects p
ON e.department_id = p.department_id
WHERE p.budget > 5000
/*
Find Employees and Their Projects With Department Details
Write a query to fetch employee names, project names, department names, and department locations.
*/
SELECT e.name, p.project_name, d.department_name, d.location
FROM employees e
INNER JOIN projects p
ON e.department_id = p.project_id
INNER JOIN departments d
ON d.department_id = e.department_id


/*
Find Total Budget Managed by Each Employee’s Department
Write a query to calculate the total budget of projects managed by each department and list the department name, location, and the employees working in it.
*/

SELECT e.name, p.project_name, d.department_name, d.location,
(SELECT SUM(budget) FROM projects psum) as SUM
FROM employees e
INNER JOIN projects p
ON e.department_id = p.project_id
INNER JOIN departments d
ON d.department_id = e.department_id;


/*
Identify Departments With More Than 2 Employees
Write a query to find the names of departments that have more than two employees assigned.
*/
SELECT d.department_name
FROM departments d
INNER JOIN employees e
ON d.department_id = e.department_id
GROUP BY(d.department_name)
HAVING COUNT(e.employee_id) = 2;
/*
Employees in Shared Locations
Write a query to list employees working in departments that share the same location.
*/
SELECT *
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.location in (SELECT d2.location from departments d2)