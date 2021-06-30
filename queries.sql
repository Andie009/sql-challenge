--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, 
	   last_name, 
	   hire_date 
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, 
	   d.dept_name, 
	   m.emp_no, 
	   e.last_name, 
	   e.first_name
FROM departments d
JOIN dept_manager m
ON d.dept_no = m.dept_no
JOIN employees e
ON m.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT w.emp_no, 
	   e.last_name, 
	   e.first_name, 
	   d.dept_name
FROM dept_emp w
JOIN employees e
ON w.emp_no = e.emp_no
JOIN departments d
ON w.dept_no = d.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,
	   e.last_name,
	   e.sex
FROM employees e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT w.emp_no, 
	   e.last_name, 
	   e.first_name, 
	   d.dept_name
FROM dept_emp w
JOIN employees e
ON w.emp_no = e.emp_no
JOIN departments d
ON w.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT w.emp_no, 
	   e.last_name, 
	   e.first_name, 
	   d.dept_name
FROM dept_emp w
JOIN employees e
ON w.emp_no = e.emp_no
JOIN departments d
ON w.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;