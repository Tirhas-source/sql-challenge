# sql-challenge



Background
It is a beautiful spring day, and it is two weeks since you have been hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remain of the database of employees from that period are six CSV files.
In this assignment, you will design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, you will perform:


#Data Engineering


CREATE TABLE employees (
emp_no INT NOT NULL PRIMARY KEY,
emp_title VARCHAR(255),
birth_date DATE,
first_name VARCHAR(255),
last_name VARCHAR(255),
Sex VARCHAR(1),
hire_date DATE
);

______________
CREATE TABLE Salaries (
emp_no INT NOT NULL,
salary INT
);

ALTER TABLE Salaries
ADD FOREIGN KEY (emp_no) REFERENCES Employees(emp_no);

______________________

CREATE TABLE Titles (
title_id VARCHAR NOT NULL PRIMARY KEY,
title VARCHAR(255)
);


____________________________

CREATE TABLE Departments (
dept_no VARCHAR NOT NULL PRIMARY KEY,
dept_name VARCHAR(255)
);
_______________________________

CREATE TABLE Dept_emp (
emp_no INT NOT NULL,
dept_no VARCHAR NOT NULL
);


ALTER TABLE Dept_emp
ADD FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
ADD FOREIGN KEY (dept_no) REFERENCES Departments(dept_no);

_______________________________


CREATE TABLE Dept_manager (
dept_no VARCHAR NOT NULL,
emp_no INT NOT NULL
);

ALTER TABLE Dept_manager
ADD FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
ADD FOREIGN KEY (emp_no) REFERENCES Employees(Emp_no);



# Data Analysis

--List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no,
last_name,
first_name, 
sex,
salary
from employees
Join salaries on employees.emp_no = salaries.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.

select first_name, 
last_name,
hire_date
from employees
WHERE extract(year from hire_date) = 1986;


--List the department of each employee with the following information: employee number, last name, first name, and department name.

select dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from dept_emp
join employees on employees.emp_no = dept_emp.emp_no 
join departments on departments.dept_no = dept_emp.dept_no;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select employees.first_name,
employees.last_name,
employees.sex
from employees
where employees.first_name = 'Hercules' and employees.last_name like 'B%'


--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from dept_emp
join employees on employees.emp_no = dept_emp.emp_no 
join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from dept_emp
join employees on employees.emp_no = dept_emp.emp_no 
join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select employees.last_name,
count (employees.last_name) as count_freq
from employees 
group by employees.last_name
order by count (employees.last_name) DESC;




