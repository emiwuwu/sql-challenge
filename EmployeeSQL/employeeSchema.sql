CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(10) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT fk_emp_title_id FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE titles(
	title_id VARCHAR(20) PRIMARY KEY,
	title VARCHAR NOT NULL
);

CREATE TABLE salaries(
	emp_no INTEGER PRIMARY KEY,
	salary BIGINT NOT NULL,
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp(
	emp_no INTEGER,
	dept_no VARCHAR(10),
	PRIMARY KEY (emp_no,dept_no),
	CONSTRAINT fk_dept_emp_no FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	CONSTRAINT fk_dept_no FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY,
	dep_name VARCHAR(50) NOT NULL
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(10),
	emp_no INTEGER,
	PRIMARY KEY (dept_no, emp_no),
	CONSTRAINT fk_dept_no_emp FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	CONSTRAINT fk_dept_no_manager FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);