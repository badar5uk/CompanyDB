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
WHERE g1.salary > (select avg(g2.salary) from employees g2 where g2.department_id = g1.department_id)
group by g1.department_id;

SELECT e.name, e.Salary, e.department_id
FROM employees e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM employees sub
    WHERE sub.department_id = e.department_id
) OR e.department_id NOT IN (
    SELECT DISTINCT department_id
    FROM employees
);

/*
Employees with no dpeartments
*/
SELECT * FROM employees WHERE department_id = null;


/*
Find departments with no pojects
*/
SELECT project_name from projects WHERE department_id = null;

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


