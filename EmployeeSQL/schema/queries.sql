-- Rachel Woodill / October 19, 2023

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT "EMPLOYEES".emp_no, last_name, first_name, sex, salary 
FROM "EMPLOYEES"
JOIN "SALARIES" ON "EMPLOYEES".emp_no = "SALARIES".emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "EMPLOYEES"
WHERE hire_date LIKE '%1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT "DEPT_MANAGER".dept_no, "DEPARTMENTS".dept_name, "EMPLOYEES".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name
FROM "DEPT_MANAGER"
JOIN "EMPLOYEES" ON "DEPT_MANAGER".emp_no = "EMPLOYEES".emp_no
JOIN "DEPARTMENTS" ON "DEPT_MANAGER".dept_no = "DEPARTMENTS".dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT "DEPT_EMP".dept_no, "EMPLOYEES".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name, "DEPARTMENTS".dept_name 
FROM "EMPLOYEES"
JOIN "DEPT_EMP" ON "EMPLOYEES".emp_no = "DEPT_EMP".emp_no
JOIN "DEPARTMENTS" ON "DEPT_EMP".dept_no = "DEPARTMENTS".dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM "EMPLOYEES"
WHERE first_name LIKE '%Hercules' AND LOWER(last_name) LIKE 'b%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT "DEPARTMENTS".dept_name, "EMPLOYEES".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name 
FROM "DEPARTMENTS"
JOIN "DEPT_EMP" ON "DEPARTMENTS".dept_no = "DEPT_EMP".dept_no
JOIN "EMPLOYEES" ON "DEPT_EMP".emp_no = "EMPLOYEES".emp_no
WHERE "DEPARTMENTS".dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "EMPLOYEES".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name, "DEPARTMENTS".dept_name
FROM "DEPARTMENTS"
JOIN "DEPT_EMP" ON "DEPARTMENTS".dept_no = "DEPT_EMP".dept_no
JOIN "EMPLOYEES" ON "DEPT_EMP".emp_no = "EMPLOYEES".emp_no
WHERE "DEPARTMENTS".dept_name = 'Sales' OR "DEPARTMENTS".dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM "EMPLOYEES"
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC;