/*
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title VARCHAR(25)
);

CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(5),
    birth_date DATE,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    sex VARCHAR(1),
    hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY NOT NULL,
    salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT PRIMARY KEY NOT NULL,
    dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
LEFT JOIN salaries 
ON (employees.emp_no = salaries.emp_no);

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees 
WHERE hire_date 
BETWEEN '1986-01-01' AND '1986-12-31';

SELECT employees.last_name,
	COUNT(last_name)
FROM employees
GROUP BY(last_name) ORDER BY COUNT(last_name) DESC;

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_manager 
ON employees.emp_no = dept_manager.emp_no
JOIN departments 
ON dept_manager.dept_no = departments.dept_no;

SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN departments
ON departments.dept_no = employees.emp_no
JOIN dept_emp
ON employees.dept_no = dept_emp.emp_no

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_no, departments.dept_name
FROM employees
JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT employees.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');
*/

