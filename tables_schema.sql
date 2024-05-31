DROP TABLE IF EXISTS Employees;

-- Create table for Employees if it does not exist
CREATE TABLE IF NOT EXISTS Employees (
	emp_no INTEGER NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date VARCHAR,
	PRIMARY KEY(emp_no)
);

-- insert information into Employees
COPY Employees FROM 'C:\Users\Emmy\Desktop\Data_Bootcamp\Projects\Module_9_EmployeesSQL\data\employees.csv' WITH (format csv, header);

-- Print table 
SELECT * FROM Employees;

--Don't run if it's already done 
DROP TABLE IF EXISTS Department;
	
-- Create table for Department if it does not exist
CREATE TABLE IF NOT EXISTS Department(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY(dept_no)
);

-- Insert information into Departments
COPY Department FROM 'C:\Users\Emmy\Desktop\Data_Bootcamp\Projects\Module_9_EmployeesSQL\data\departments.csv' WITH (format csv, header);

-- Print table
SELECT * FROM Department;

-- Don't run if it's already done 
Drop TABLE IF EXISTS Jobs;

-- Create table for Jobs if it does not exist
CREATE TABLE IF NOT EXISTS Jobs(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Department(dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY(dept_no, emp_no) -- Composite primary key
);

-- Insert information into Jobs
COPY Jobs FROM 'C:\Users\Emmy\Desktop\Data_Bootcamp\Projects\Module_9_EmployeesSQL\data\dept_emp.csv' WITH (format csv, header);

-- Print table 
SELECT * FROM Jobs;

-- Don't run if it's already done
DROP TABLE IF EXISTS Managers;

-- Create table for Managers if it does not exist
CREATE TABLE IF NOT EXISTS Managers(
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES Department(dept_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY(dept_no, emp_no) -- Composite primary key
);

-- Insert information into Managers
COPY Managers FROM 'C:\Users\Emmy\Desktop\Data_Bootcamp\Projects\Module_9_EmployeesSQL\data\dept_manager.csv' WITH (format csv, header);

-- Print table 
SELECT * FROM Managers;

-- Don't run if it's already done
DROP TABLE IF EXISTS Titles;

-- Create table for Titles if it does not exist
CREATE TABLE IF NOT EXISTS Titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY(title_id)
);

-- Insert information into titles
COPY Titles FROM 'C:\Users\Emmy\Desktop\Data_Bootcamp\Projects\Module_9_EmployeesSQL\data\titles.csv' WITH (format csv, header);

-- Print table
SELECT * FROM Titles;

-- Don't Run if it's already done
DROP TABLE IF EXISTS Salary;

-- Create table for Salary if it does not exist
CREATE TABLE IF NOT EXISTS Salary(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY(emp_no) 
);

-- insert information into Salary
COPY Salary FROM 'C:\Users\Emmy\Desktop\Data_Bootcamp\Projects\Module_9_EmployeesSQL\data\salaries.csv' WITH (format csv, header);

-- Print table
SELECT * FROM Salary;
