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
