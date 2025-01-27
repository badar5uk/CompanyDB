USE CompanyDB;

/*
Find Employees Hired After Their Colleagues in the Same Department
Write a query to list employees who were hired after at least one of their colleagues in the same department.
*/
SELECT e1.name as Employee_name, e1.hire_date, e2.name as Colleauge_Name , e2.hire_date
FROM employees e1
INNER JOIN employees e2
ON e1.department_id =e2.department_id
WHERE e1.hire_date > e2.hire_date
/*
List Employees With the Same Salary in the Same Department
Write a query to find employees within the same department who have the same salary.
*/

select DISTINCT e1.*
from employees e1
INNER JOIN employees e2
ON e2.department_id = e1.department_id
where exists(select 1 from employees e2
where e2.Salary = e1.Salary);
