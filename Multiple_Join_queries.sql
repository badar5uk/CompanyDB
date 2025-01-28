USE CompanyDB;

/*
Find all departments and their projects along with the employees working in each department. Include departments with no employees or projects.
*/

SELECT *
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
LEFT JOIN projects p
ON p.department_id = d.department_id



/*
Retrieve a list of employees who are part of departments that have projects assigned. Include employees from departments with no projects.
*/

SELECT e.employee_id, e.name
FROM employees e
INNER JOIN departments d
ON d.department_id = e.department_id
LEFT JOIN projects p
ON p.department_id = d.department_id

/*
List all departments and the number of employees in each department. Include departments with no employees.
*/

SELECT  d.department_name ,COUNT(e.employee_id) as 'Total Employees'
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id 
GROUP BY d.department_name

/*
Find all employees and display their department names along with project names, even if the department or project is missing.
*/
SELECT e.*, d.department_name, p.project_name 
FROM employees e
INNER JOIN departments d
ON d.department_id = e.department_id
LEFT JOIN projects p
ON p.department_id = d.department_id



/*
List all employees, their department names, and the total budget of projects in their department. Include employees without a department or a department without projects.
*/
SELECT  e.name, d.department_name, SUM(p.budget) as Total_Budget 
FROM employees e
LEFT JOIN departments d
ON d.department_id = e.department_id
LEFT JOIN projects p
ON p.department_id = d.department_id
GROUP BY e.name, d.department_name


/*
Retrieve a list of projects and their assigned departments, including projects with no department and departments with no projects.
*/

SELECT p.project_id, p.project_name,p.budget, d.*
FROM projects p
FULL OUTER JOIN departments d
ON p.department_id = d.department_id


/*
Display all departments and their employees, including departments with no employees.
*/

SELECT *
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id


/*
Find all employees along with their department names and the projects they are working on. Include employees who are not assigned a department or project.
*/
SELECT e.* , d.department_name, p.project_name
FROM employees e
RIGHT JOIN departments d
ON d.department_id = e.department_id
LEFT JOIN projects p
ON p.department_id = d.department_id

/*
List all projects along with the department names. Include projects that are not linked to any department.
*/

SELECT p.* , d.department_name
FROM projects p
LEFT JOIN departments d
ON p.department_id = d.department_id



/*
Find all employees along with their department names. Include employees without a department.
*/
SELECT * , d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id