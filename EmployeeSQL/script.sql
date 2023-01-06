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

--- List the employee number, last name, first name, sex, and salary of each employee 

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e 
INNER JOIN salary as salary
ON e.emp_no = s.emp_no; 

--- List the first name, last name, and hire date for the employees who were hired in 1986 

SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date >= "1986-01-01";

--- List the manager of each department along with their department number, 
--- department name, employee number, last name, and first name 

SELECT e.first_name as manager_first_name, e.last_name as manager_last_name, e.emp_no, d.dept_no, dd.dept_name 
FROM employees as e
INNER JOIN dept_manager as d
ON e.emp_no = d.emp_no
INNER JOIN departments as dd
on d.dept_no = dd.dept_no; 

--- List the department number for each employee along with that employee’s employee number, 
--- last name, first name, and department name 

SELECT e.first_name as employee_first_name, e.last_name as employee_last_name, e.emp_no, d.dept_no, dd.dept_name 
FROM employees as e
INNER JOIN dept_emp as d
ON e.emp_no = d.emp_no
INNER JOIN departments as dd
ON d.dept_no = dd.dept_no; 

--- List first name, last name, and sex of each employee whose first name is Hercules and 
--- whose last name begins with the letter B

SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name like 'B%';

--- List each employee in the Sales department, including their employee number, 
-- last name, and first name 

SELECT e.first_name as employee_first_name, e.last_name as employee_last_name, e.emp_no, dd.dept_name 
FROM employees as e
INNER JOIN dept_emp as d
ON e.emp_no = d.emp_no
INNER JOIN departments as dd
ON d.dept_no = dd.dept_no
WHERE dd.dept_name = 'Sales'; 

-- List each employee in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name 

SELECT e.first_name as employee_first_name, e.last_name as employee_last_name, e.emp_no, dd.dept_name 
FROM employees as e
INNER JOIN dept_emp as d
ON e.emp_no = d.emp_no
INNER JOIN departments as dd
ON d.dept_no = dd.dept_no
WHERE dd.dept_name = 'Sales' or dd.dept_name = 'Development'; 

--- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 

SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;