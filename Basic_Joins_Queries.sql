USE CompanyDB;
/* Employee and Their Department Name 
employee's name along with their respective department name.
*/
SELECT e.name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

/*
List Projects and Their Department Locations
Write a query to list all projects with their department's location.
*/
SELECT p.project_name,p.project_id, d.location
FROM projects p, departments d
WHERE p.department_id= d.department_id;

/*
Find Employees Without Departments
Write a query to find employees who do not belong to any department.
*/

SELECT * 
FROM employees
WHERE department_id = null;

/*
List All Projects and Assigned Departments
Write a query to list each project name and the name of the department it is assigned to. Include projects that are not assigned to any department.
*/
SELECT p.project_name as project_name, d.department_name as Department_name
FROM projects p
FULL OUTER JOIN departments d
ON p.department_id = d.department_id

