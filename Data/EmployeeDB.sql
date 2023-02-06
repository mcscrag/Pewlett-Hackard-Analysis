DROP TABLE titles;

CREATE TABLE titles (
	index INT NOT NULL,
	emp_no INT NOT NULL,
  	title VARCHAR NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (index)
);

SELECT * FROM dept_emp;

DROP TABLE retirement_info;

-- Create new table for retiring employees

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables

SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments d
INNER JOIN dept_manager dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables

SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
INTO current_emp
FROM retirement_info ri
LEFT OUTER JOIN dept_emp de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number

SELECT COUNT(ce.emp_no), de.dept_no
INTO retirees_dept
FROM current_emp ce
LEFT JOIN dept_emp de
on ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no, 
	first_name, 
	last_name,
	gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
-- INTO emp_info
FROM employees e
INNER JOIN salaries s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- List of managers per department

SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
--INTO manager_info
FROM dept_manager dm
	INNER JOIN departments d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp ce
		ON (dm.emp_no = ce.emp_no);
		
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp ce
	INNER JOIN dept_emp de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments d
		ON (de.dept.no = d.dept_no);
		
