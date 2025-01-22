/*
Database and table creation
*/

Create Database CompanyDB;

Use CompanyDB;

Create Table departments(
department_id INT IDENTITY(1,1) PRIMARY KEY ,
department_name VARCHAR(50) NOT NULL,
location VARCHAR(50) NOT NULL
);

Create Table employees(
employee_id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
Salary DECIMAL(10, 2) NOT NULL,
department_id INT References departments(department_id),
hire_date DATE NOT NULL
);

Create Table projects(
project_id INT IDENTITY(1,1) PRIMARY KEY,
project_name VARCHAR(100) NOT NULL,
department_id INT References departments(department_id),
budget DECIMAL(10, 2) NOT NULL
);

/*
Insert Data
*/

Insert Into departments (department_name,location)
Values
('HR','Al-khoud'),
('IT','Al-khoud'),
('Finace','Amerat'),
('Marketing','Amerat')
;

Insert Into employees(name,Salary,department_id,hire_date)
Values
('Badar','900','2','2024-09-12'),
('Faisal','920','3','2025-01-23'),
('Hilal','1000', '2','2025-02-20'),
('Daniyal','900','4','2020-03-10');

Insert Into projects(project_name, department_id, budget)
Values
('Trello debug', '2','2500'),
('Hospital system','2','6000'),
('audit finance records','3','2000'),
('Hire new employees','1','10000');





