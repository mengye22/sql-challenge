SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, 
-- first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex,s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.
SELECT A.dept_no,B.dept_name,A.emp_no,C.first_name,C.last_name
FROM dept_manager AS A
JOIN departments AS B
ON A.dept_no = B.dept_no
JOIN employees AS C
ON A.emp_no = C.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT E.emp_no,E.last_name,E.first_name,D.dept_name
FROM employees AS E
JOIN dept_emp 
ON dept_emp.emp_no = E.emp_no
JOIN departments AS D
ON dept_emp.dept_no = D.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is
-- "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee 
-- number, last name, first name, and department name.
SELECT E.emp_no,E.last_name,E.first_name,D.dept_name
FROM employees AS E
JOIN dept_emp 
ON dept_emp.emp_no = E.emp_no
JOIN departments AS D
ON dept_emp.dept_no = D.dept_no
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT E.emp_no,E.last_name,E.first_name,D.dept_name
FROM employees AS E
JOIN dept_emp 
ON dept_emp.emp_no = E.emp_no
JOIN departments AS D
ON dept_emp.dept_no = D.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8.In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name,count(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;


