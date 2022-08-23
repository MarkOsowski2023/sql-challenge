DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Titles;



-- create table for department
CREATE TABLE Department (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

-- create table for titles
CREATE TABLE Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

-- create table for employees
CREATE TABLE Employees (
	emp_no INTEGER NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title) REFERENCES Titles(title_id)
);

-- create tablae for department employees
CREATE TABLE DepartmentEmployee (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Department (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- create table for department managers
CREATE TABLE DepartmentManager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Department(dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- create table for salaries
CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);


