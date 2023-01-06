--- Creation of Tables ---

CREATE TABLE titles (
title_id varchar(15) PRIMARY KEY NOT NULL,
title varchar(40) NOT NULL
);

CREATE TABLE Employees (
emp_no int PRIMARY KEY NOT NULL,
emp_title_id int NOT NULL,
birth_date Date,
first_name varchar(30),
last_name varchar(30),
sex varchar(10),
hire_date Date,
FOREIGN KEY (employee_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Salary (
emp_no int PRIMARY KEY NOT NULL,
salary int NOT NULL,
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE departments (
dept_no varchar(30) PRIMARY KEY NOT NULL,
dept_name varchar(50) NOT NULL
);

CREATE TABLE dept_manager (
dept_no varchar(30) NOT NULL,
emp_no int NOT NULL, 
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE dept_emp (
emp_no int NOT NULL,
dept_no varchar(30) NOT NULL,
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

