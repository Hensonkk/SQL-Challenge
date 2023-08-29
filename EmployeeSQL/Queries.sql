-- List the employee number, last name, first name, sex, and salary of each employee.
select * from employees e2;
select * from salaries s2;

select e.emp_no, first_name, last_name, sex, s.salary 
from employees e 
left join salaries s 
on e.emp_no = s.emp_no
order by e.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
select * from employees e2 ;

select first_name, last_name, hire_date
from employees e 
where hire_date between '1986-01-01'
and '1986-12-31';


-- List the manager of each department along with their department number, department name, employee number, last name, and first name
select * from employees e;
select * from departments d;
select * from dept_manager dm;

select e.first_name, e.last_name, e.emp_no, dm.dept_no, d.dept_name 
from employees e 
inner join dept_manager dm 
on e.emp_no = dm.emp_no 
inner join departments d 
on d.dept_no = dm.dept_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select * from employees e;
select * from dept_emp de;
select * from departments d;

select e.emp_no, e.first_name, e.last_name, de.dept_no, d.dept_name 
from employees e 
inner join dept_emp de 
on e.emp_no = de.emp_no 
inner join departments d
on d.dept_no = de.dept_no
order by e.emp_no;


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

select  e.emp_no, e.first_name, e.last_name, d.dept_name 
from employees e 
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d 
on d.dept_no = de.dept_no 
where de.dept_no = 'd007'
order by e.emp_no;


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select  e.emp_no, e.first_name, e.last_name, d.dept_name 
from employees e 
inner join dept_emp de
on e.emp_no = de.emp_no
inner join departments d 
on d.dept_no = de.dept_no 
where d.dept_name in ('Sales', 'Development')
order by e.emp_no;


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select e.last_name, count(e.last_name) as "last_name_frequency_counts"
from employees e
group by e.last_name 
order by "last_name_frequency_counts" desc;

