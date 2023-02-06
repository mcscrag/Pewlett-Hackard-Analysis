-- Retrieve emp_no, first_name, last_name from the employees table.

SELECT emp_no, first_name, last_name
FROM employees e;

SELECT title, from_date, to_date
FROM titles t;

SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles t
ON (e.emp_no = t.emp_no)
WHERE (birth_date >= '1952-01-01' AND birth_date < '1956-01-01')
ORDER BY emp_no;

DROP TABLE retirement_titles;
SELECT * FROM retirement_titles;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;


-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT count(title) title_count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title;


ORDER BY title_count DESC;

SELECT DISTINCT ON (t.emp_no) t.title,
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
d.from_date,
d.to_date
INTO membership_eligibility
FROM employees e
INNER JOIN dept_emp d ON (e.emp_no = d.emp_no)
INNER JOIN titles t ON (e.emp_no = t.emp_no)
WHERE (d.to_date = '9999-01-01')
AND (e.birth_date >= '1965-01-01' AND e.birth_date <= '1965-12-31')
ORDER BY t.emp_no;