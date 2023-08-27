-- Create tables for each of the six csv files

-- Dropping tables if they exist already (No tables currently being use with these names)
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;

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
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);


-- Create dept_manager table
create table dept_manager (
	dept_no char (10) not null,
	emp_no int not null,
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


-- List the employee number, last name, first name, sex, and salary of each employee.
select * from employees e2;
select * from salaries s2;

select e.emp_no, last_name, first_name, sex, s.salary 
from employees e 
join salaries s 
on e.emp_no = s.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
select * from employees e2 ;

select first_name, last_name, hire_date
from employees e 
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
select * from employees e;
select * from departments d;
select * from dept_manager dm;

select e.first_name, e.last_name, e.emp_no, dm.dept_no, d.dept_name 
from employees e 
join dept_manager dm 
on e.emp_no = dm.emp_no 
join departments d 
on d.dept_no = dm.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select * from employees e;
select * from dept_emp de;
select * from departments d;

select e.first_name, e.last_name, e.emp_no, de.dept_no, d.dept_name 
from employees e 
join dept_emp de 
on e.emp_no = de.emp_no 
join departments d 
on d.dept_no = de.dept_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select * from employees e;

select first_name, last_name, sex
from employees e 
where first_name = 'Hercules'
and last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
select * from employees e;
select * from dept_emp de;
select * from departments d;

select e.first_name, e.last_name, e.emp_no, d.dept_name 
from employees e 
join dept_emp de
on e.emp_no = de.emp_no
join departments d 
on d.dept_no = de.dept_no 
where de.dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.first_name, e.last_name, e.emp_no, d.dept_name 
from employees e 
join dept_emp de
on e.emp_no = de.emp_no
join departments d 
on d.dept_no = de.dept_no 
where de.dept_no = 'd007'
or de.dept_no = 'd005';








