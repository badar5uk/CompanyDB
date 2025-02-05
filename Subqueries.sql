Use CompanyDB;
/*
Displays salaries higher than the average
*/
select *  FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

/*
Display employees working in al-khoud, IT department set to ID 2
*/
select name  FROM employees Where department_id = '2'

/*
Find employees whose salaries are greater than the average salary of their respective department.
*/

SELECT *
FROM employees g1
WHERE g1.salary >= (select avg(g2.salary) as Average from employees g2 
where g2.department_id = g1.department_id);

select * from employees e, 
(select g2.department_id, avg(g2.salary) as AVG from employees g2 group by g2.department_id) x2 
Where e.department_id = x2.department_id AND e.Salary >= AVG

/*
Employees with no dpeartments
*/
SELECT * FROM employees WHERE department_id = null;


/*
Find departments with no pojects
*/

SELECT *
FROM departments d WHERE d.department_id in 
(SELECT department_id FROM projects p WHERE p.department_id = null);

/*
Department with highest number of employees
*/

SELECT TOP 1 y.department_id, y.c AS "num_of_emp"
FROM (SELECT e.department_id, COUNT(e.employee_id) AS c
FROM employees e
    GROUP BY e.department_id) y
ORDER BY y.c DESC;
/*
Names and salaries of highest paid in each department
*/
SELECT e.name, e.department_id, e.Salary
FROM employees e
where e.Salary = (SELECT MAX(Salary) from employees where department_id = e.department_id )
;

/*
Projects with budgets that exceed the total salaries of all employees in their respective departments.
*/
SELECT project_name,budget
FROM projects
Where budget > (SELECT SUM(Salary) FROM employees);

/*
Names of employees working in departments that manage projects with a budget greater than $2000.
*/

SELECT e.name, e.department_id FROM
employees e
WHERE e.department_id in (SELECT d.department_id
FROM departments d WHERE department_id in (SELECT department_id from projects p
Where budget > 2000))
GROUP BY e.name,e.department_id;

/*
List the names of employees who work in departments located in 'amerat'.
*/
SELECT e.name, e.department_id
FROM employees e 
Where e.department_id in ( SELECT d.department_id from departments d where d.location = 'amerat')

/*
Identify employees who earn more than the average salary across all departments.
*/

select employee_id, Salary, department_id 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees)
GROUP BY employee_id, Salary, department_id;

/*
Retrieve the name of the department that manages the project with the highest budget.
*/

SELECT d.department_name
FROM departments d
Where d.department_id in (SELECT p.department_id FROM projects p
WHERE p.budget in (SELECT MAX(budget) FROM projects ))
GROUP BY department_name;

/*
Display the department ID and the total number of employees in each department.
*/

SELECT department_id, COUNT(*) as 'Total Employees'
FROM employees
GROUP BY department_id;

/*
List employees who are in departments that do not have any projects.
*/
SELECT *
FROM employees e 
WHERE e.department_id not in (SELECT department_id FROM projects)

/*
List the names of projects that have a budget higher than the average project budget.
*/

SELECT project_name
FROM projects
WHERE budget > (SELECT AVG(budget) FROM projects);

/*
Find the department IDs of departments that have fewer than three employees.
*/

SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) < 3

/*
Find the name of the employee with the highest salary in the company
*/

SELECT name
FROM employees
WHERE Salary = (SELECT MAX(Salary) FROM employees)

/*
Find the names of departments that manage projects with a budget of less than $100,000.
*/

SELECT d.department_name, d.department_id FROM
departments d
WHERE d.department_id in (SELECT department_id from projects p
Where budget < 100000)
GROUP BY d.department_name,d.department_id;

/*
Identify the name and hire date of the most recently hired employee.
*/
SELECT name, hire_date
FROM employees
WHERE hire_date in (SELECT max(hire_date) FROM employees)


SELECT *
FROM projects p, departments d
WHERE p.department_id = d.department_id;

SELECT *
FROM projects p
LEFT JOIN departments d
ON p.department_id = d.department_id;

Insert Into projects(project_name, budget)
Values
('SAMPLE','300'),
('NEW project','500')

SELECT d.department_name as Department_Name , p.project_name as Project_Name
FROM departments d
INNER JOIN projects p
ON d.department_id = p.department_id

SELECT e1.name as Employee_name, e2.name as Colleauge_Name
FROM employees e1
INNER JOIN employees e2
ON e1.department_id =e2.department_id
WHERE e1.hire_date > e2.hire_date

SELECT *
FROM projects p1
INNER JOIN projects p2
ON p1.department_id = p2.department_id
WHERE p1.budget > p2.budget
