-- List employees who were hired in 1986.
-- add  employee number incase duplicates or need for future use 
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '01/01/1987';

-- 3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT m.dept_no, dept_name, m.emp_no,
first_name, last_name, m.from_date, m.to_date
FROM dept_manager m
LEFT JOIN departments on m.dept_no = departments.dept_no
LEFT JOIN employees on m.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name, d.dept_no
	FROM employees e
	JOIN departments d
	 ON d.dept_no = d.dept_no;


-- 5 List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name, d.dept_no
	FROM employees e
	JOIN departments d
	 ON d.dept_no = d.dept_no
	 WHERE dept_name = 'Sales';
	 
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.	 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name, d.dept_no
	FROM employees e
	JOIN departments d
	 ON d.dept_no = d.dept_no
	 WHERE dept_name = 'Sales' OR dept_name = 'Development';



 --In descending order, list the frequency count of employee last names, i.e., 
 -- how many employees share each last name.

SELECT COUNT(first_name), first_name
  FROM employees
  GROUP BY first_name
  ORDER BY COUNT(first_name) DESC;


--- https://www.w3schools.com/sql/sql_groupby.asp
