-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON e.emp_no = s.emp_no 

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, EXTRACT (YEAR FROM e.hire_date)
FROM employees as e
WHERE EXTRACT (YEAR FROM e.hire_date) = 1986

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employees as e
INNER JOIN department_managers as dm ON e.emp_no = dm.emp_no 
INNER JOIN departments as d ON dm.dept_no = d.dept_no

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN department_employees as de ON e.emp_no = de.emp_no 
INNER JOIN departments as d ON de.dept_no = d.dept_no

-- List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees as e
WHERE e.first_name LIKE 'Hercules' AND e.last_name LIKE 'B%'

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN department_employees as de ON e.emp_no = de.emp_no 
INNER JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_name LIKE 'Sales'

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN department_employees as de ON e.emp_no = de.emp_no 
INNER JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_name LIKE 'Sales' OR d.dept_name LIKE 'Development'

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT e.last_name, 
COUNT(e.last_name) as count_lastname
FROM employees as e
GROUP BY e.last_name
ORDER BY count_lastname DESC

SELECT *
FROM employees as e
WHERE e.emp_no = 499942