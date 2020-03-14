use employees

select * from employees where birth_date < '1965-01-01';

select * from employees where gender = 'f' and hire_date >= '1991-01-01';

select first_name , last_name from employees where last_name like 'f%' limit 50;

desc employees; 

insert into employees
values (100, '1992-02-15', 'Michelle', 'Wu', 'F', '2017-10-02'), (101, '1991-08-30', 'John', 'Kosta', 'M', '2019-06-17'), (102, '1995-01-12', 'Marco', 'Polo', 'M', '1890-05-02');

update employees
set first_name = 'Bob'
where emp_no = 10023;

update employees
set hire_date = '2002-01-01'
where first_name like 'p%' or last_name like 'p%';

delete from employees where emp_no < 10000;

delete from employees where emp_no in (10048, 10099, 20089);

select * from employees order by emp_no desc limit 20;
