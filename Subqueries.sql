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
WHERE g1.salary > (select avg(g2.salary) from employees g2 where g2.department_id = g1.department_id);

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

SELECT y.department_id, MAX(y.c) as "num of emp"
FROM (SELECT e.department_id as "department_id", COUNT(e.employee_id) as "c" FROM employees e GROUP BY e.department_id) y
GROUP BY y.department_id 

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


