-- Create departments table
CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,
  dept_name VARCHAR NOT NULL,
  CONSTRAINT departments_pk PRIMARY KEY (dept_no)
);

-- Create titles table
CREATE TABLE titles (
  title_id VARCHAR NOT NULL PRIMARY KEY,
  title VARCHAR NOT NULL
);

-- Create employees table
CREATE TABLE employees (
  emp_no INT NOT NULL,
  emp_title VARCHAR NOT NULL,
  birth_date VARCHAR NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date VARCHAR NOT NULL,
  CONSTRAINT employees_pk PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_title) REFERENCES titles (title_id)
);

-- Create department employees table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Create department manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no INT NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create salaries table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);