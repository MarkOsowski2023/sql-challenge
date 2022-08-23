-- Query Tables
SELECT * FROM Employees;

SELECT * FROM Salaries;

-- List employee number, last name, first name, sex and salary
-- Query Join Statement
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
LEFT JOIN Salaries s
ON e.emp_no = s.emp_no;

-- List employee first name, last name, hire date for emplyees hired in 1986
-- WHERE QUERY
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List manager of each department
-- department number, department name, employee number, last name, first name
-- JOIN TABLES
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM DepartmentManager dm
JOIN Department d
	ON dm.dept_no = d.dept_no
JOIN Employees e
	ON dm.emp_no = e.emp_no;
	
-- List the department of each employee with the following info:
-- employee number, last name, first name, and department name
SELECT de.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
FROM DepartmentEmployee de
JOIN Department d
	ON de.dept_no = d.dept_no
JOIN Employees e
	ON de.emp_no = e.emp_no;

-- List first name, last name, and sex for employees whose:
-- first name is 'Hercules' and last names being with 'B'
SELECT first_name, last_name, sex
FROM Employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
-- List all employees in the Sales department, including:
-- employee number, last name, first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM DepartmentEmployee de
JOIN Employees e 
	ON de.emp_no = e.emp_no
JOIN Department d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments:
-- including employee number, last name, first name, department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM DepartmentEmployee de
JOIN Employees e 
	ON de.emp_no = e.emp_no
JOIN Department d
	ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';

-- List the frequency count of employee last names in descending order
SELECT e.last_name, COUNT(DISTINCT e.first_name) AS "count last name"
FROM Employees e
GROUP BY e.last_name
ORDER BY "count last name" DESC;

	