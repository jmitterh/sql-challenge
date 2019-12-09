-- Jean-Paul Mitterhofer
-- 12-08-2019
--Queries for DB employees

SELECT * FROM "Employees";
SELECT * FROM "Departments";
SELECT * FROM "Titles";
SELECT * FROM "Salaries";
SELECT * FROM "Dept_Emp";
SELECT * FROM "Dept_Manager";

--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.gender,s.salary
FROM "Employees" AS e
INNER JOIN "Salaries" AS s
ON s.emp_no = e.emp_no;

--List employees who were hired in 1986.
SELECT *
FROM "Employees"
WHERE hire_date LIKE '1986%';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name,dm.from_date,dm.to_date
FROM "Employees" AS e
INNER JOIN "Dept_Manager" AS dm
ON dm.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON d.dept_no = dm.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de
ON de.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON d.dept_no = de.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM "Employees"
WHERE first_name = 'Hercules' 
AND last_name Like 'B%' ;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de
ON de.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de
ON de.emp_no = e.emp_no
INNER JOIN "Departments" AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "count of last_name"
FROM "Employees"
GROUP BY last_name
ORDER BY last_name DESC;
