SELECT emp_no, 
	first_name,
	last_name
FROM employees;

SELECT title,
	from_date
	to_date
FROM titles;

--DELIVERABLE 1--

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	tl.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

---DELIVERABLE 2--
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tl.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_employees AS de
ON (e.emp_no = de.emp_no)
--FROM employees AS e (don't need to retype once already declared)
INNER JOIN titles AS tl
ON (e.emp_no = tl.emp_no)
WHERE de.to_date = ('9999-01-01') 
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM current_emp;
SELECT * FROM emp_info;
SELECT * FROM retiring_emp;

--QUERY 1
SELECT ce.emp_no,
	e.birth_date
--INTO current_birhtdates
FROM current_emp AS ce
INNER JOIN employees AS e
ON (ce.emp_no = e.emp_no)
WHERE (e.birth_date > '1965-12-31');
----Um...... no one at Pewlett-Hackard was born AFTER 1965?!?!? 
---------------------------------------------------

SELECT COUNT(ce.emp_no),
	d.dept_name
--INTO current_noretire
FROM current_emp AS ce
LEFT JOIN employees AS e
ON (ce.emp_no = e.emp_no)
INNER JOIN dept_employees as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
GROUP BY dept_name;


	



