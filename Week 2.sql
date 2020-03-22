SHOW tables;
DESC employees;
DESC titles;
desc salaries;
desc departments;
desc dept_emp;

select count(*), t.title from employees e
inner join titles t on t.emp_no = e.emp_no
where birth_date > '1965-01-01'
group by title;

select t.title, avg(salary) from salaries s 
inner join titles t on t.emp_no = s.emp_no 
group by title;

select d.dept_name, sum(salary) from dept_emp de 
inner join departments d on d.dept_no = de.dept_no 
inner join salaries s on s.emp_no = de.emp_no 
where s.from_date >= '1990-01-01' and s.to_date <='1992-12-31' and dept_name = 'Marketing';

