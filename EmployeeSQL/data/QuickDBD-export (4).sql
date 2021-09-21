-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees 
join salaries on employees.emp_no = salaries.emp_no


--2. List first name, last name, and hire date for employees who were hired in 1986.
select employees.first_name,employees.last_name,employees.hire_date
from employees
where date_part('year',employees.hire_date) = 1986

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept_manager.emp_no, department.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_manager on dept_manager.emp_no = employees.emp_no
inner join department on department.dept_no = dept_manager.dept_no


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no,employees.last_name,employees.first_name,department.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join department on department.dept_no = dept_emp.dept_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select employees.first_name, employees.last_name, employees.sex
from employees
where employees.first_name = 'Hercules' and employees.last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select department.dept_name, dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join department on department.dept_no = dept_emp.dept_no
where department.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select department.dept_name, department.dept_no, dept_emp.emp_no, employees.emp_no, employees.last_name, employees.first_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join department on dept_emp.dept_no = department.dept_no
where dept_name in ('Sales','Development')

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select count(*) ,last_name
from employees
group by last_name
order by 1 asc

---- 9. “Search your ID number.”
select employees.first_name, employees.last_name, employees.emp_no
from employees
where employees.emp_no = 499942


