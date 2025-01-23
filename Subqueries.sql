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
SELECT name, department_id, Salary
FROM employees
GROUP BY Salary, department_id, name
Having Salary = MAX(Salary)
;

/*
Projects with budgets that exceed the total salaries of all employees in their respective departments.
*/

Group By

