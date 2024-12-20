-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
FROM 
    employees
JOIN 
    salaries
ON 
    employees.emp_no = salaries.emp_no;
	
-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	first_name,
	last_name,
	hire_date
FROM
	employees e
WHERE
	extract(year from hire_date) = 1986
ORDER BY
	hire_date ASC, last_name ASC, first_name ASC;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    employees.last_name,
    employees.first_name,
	departments.dept_name,
	dept_manager.dept_no,
    dept_manager.emp_no
FROM 
    dept_manager
JOIN 
    departments
ON 
    dept_manager.dept_no = departments.dept_no
JOIN 
    employees
ON 
    dept_manager.emp_no = employees.emp_no
ORDER BY
	last_name ASC, first_name ASC;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    e.first_name,
	e.last_name,
	d.dept_name,
	de.dept_no,
	e.emp_no   
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
ORDER BY
	e.last_name ASC, e.first_name ASC;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
FROM
	employees e
	JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN departments d on de.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales'
ORDER BY
	e.last_name ASC, e.first_name ASC;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	e.last_name,
	count(e.emp_no) as num_last_name
FROM
	employees e
GROUP BY
	e.last_name
ORDER BY
	num_last_name DESC;
