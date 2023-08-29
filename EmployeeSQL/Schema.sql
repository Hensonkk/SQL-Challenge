-- Create tables for each of the six csv files

-- Dropping tables if they exist already (No tables currently being used with these names)
-- DROP TABLE IF EXISTS departments;
-- DROP TABLE IF EXISTS titles;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS salaries;

-- Create departments table
create table departments (
	dept_no char (10) not null,
	dept_name varchar (50) not null,
	primary key (dept_no)
);


-- Create titles table
create table titles (
	title_id char (10) not null,
	title text,
	primary key (title_id)
);


-- Create employees table
create table employees (
	emp_no int not null,
	emp_title_id char (20) not null,
	birth_date date not null,
	first_name varchar (50) not null,
	last_name varchar (50) not null,
	sex char not null,
	hire_date date not null,
	primary key (emp_no),
	foreign key (emp_title_id) references titles(title_id)
);


-- Create dept_emp table
create table dept_emp (
	emp_no int not null,
	dept_no char (10) not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);


-- Create dept_manager table
create table dept_manager (
	dept_no char (10) not null,
	emp_no int not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);


-- Create table salaries
create table salaries (
	emp_no int not null,
	salary money,
	primary key (emp_no),
	foreign key (emp_no) references employees(emp_no)
);
