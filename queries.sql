-- List employee #, names, sex, salary 
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salary.salary
FROM Employees
INNER JOIN Salary ON Employees.emp_no = Salary.emp_no;

-- List employee names for hirees in 1986
SELECT first_name, last_name, hire_date
FROM Employees
WHERE TO_DATE(hire_date, 'MM-DD-YYYY') BETWEEN '01-01-1986' AND '12-31-1986';

-- List manager of each dept with dept number, dept, name, employee #, last name, first name
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Department.dept_no, Department.dept_name
FROM Employees
JOIN Managers
ON Employees.emp_no = Managers.emp_no
JOIN Department
ON Department.dept_no = Managers.dept_no;

-- List the department number for each employee along with the employee number, names and dept name
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Department.dept_no, Department.dept_name
FROM Employees
JOIN Jobs
ON Employees.emp_no = Jobs.emp_no
JOIN Department
ON Department.dept_no = Jobs.dept_no;

-- List the first and last name and sex of each employee whos first name is Hercules and last name begins with the ltter B
SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in Sales, include their number, last name and first name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Department.dept_name
FROM Employees
JOIN Jobs
ON Employees.emp_no = Jobs.emp_no
JOIN Department
ON Department.dept_no = Jobs.dept_no
WHERE Jobs.dept_no = 'd007';

-- List each employee in the Sales and Development dept including their emp_no, last name, first name, dept name
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Department.dept_name
FROM Employees
JOIN Jobs
ON Employees.emp_no = JObs.emp_no
JOIN Department
ON Department.dept_no = Jobs.dept_no
WHERE Jobs.dept_no = 'd007' OR Jobs.dept_no = 'd005';

-- List the frequency counts, in descending order, of all the employees last names
SELECT last_name, COUNT(*) AS name_count
FROM Employees
GROUP BY last_name
ORDER BY name_count DESC;