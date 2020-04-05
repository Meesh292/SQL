
use employees;
show tables;
desc titles;
desc dept_emp;
desc employees;
desc salaries;
desc departments;
select title from titles;
select dept_no from departments;

DELIMITER //

create procedure ChangeDept(
	in pEmp_no INT(10),
	out newDept INT(5)
)

begin
	declare emp VARCHAR(40);

	select emp_no 
	into emp
	from dept_emp
	where emp_no = pEmp_no;

	if emp < 11000 then
		set newDept = 1111;
	end if;
	update dept_emp 
	set dept_no = newDept
	where emp_no = pEmp_no;

end //

delimiter ;

-- Changes dept number for employees with employee numnbers below 11000

DELIMITER //
 
CREATE PROCEDURE GetEmployeeInfo(
    IN employee INT(10)
)
begin 
    SELECT first_name, last_name
    FROM employees
    WHERE emp_no = employee;
   
END //
 
DELIMITER ;
-- Returns first and last name for given employee


DELIMITER //

create procedure DeleteEmp(
	employeeNo INT(10)
)
begin 
	if to_date < curdate() then
	delete from dept_emp
	where emp_no = employeeNo;

end //

delimiter ;
-- Removes emloyees that are no longer employed

DELIMITER //

create procedure GiveRaise(
    IN pemp_no int(11),
	OUT newSalary int(11)
)
BEGIN
    DECLARE curSalary int(11);
    DECLARE raiseAmt int(6);
   	declare empTitle VARCHAR(40);
?
    SET raiseAmt = 5000
?
    SELECT salary
    INTO curSalary
    FROM salaries s
    inner join titles t on t.emp_no = s.emp_no
    WHERE emp_no = pemp_no;
?
    IF t.title = 'Staff' THEN
      SET newSalary = curSalary + raiseAmt;
    END IF;
?
    UPDATE salaries
   	SET salary = newSalary
   	WHERE emp_no = pemp_no and title = 'Staff';
   
END //
 
DELIMITER ;
-- Gives $5000 raise to staff employees

DELIMITER //

create procedure GetDeptEmployees(
    IN deptNo VARCHAR(11)
)
BEGIN
    select d.*, e.first_name, e.last_name
    from dept_emp de 
    inner join departments d on d.dept_no = de.dept_no 
    inner join employees e on e.emp_no = de.emp_no
    where d.dept_no = deptNo;
 
END //
 
DELIMITER ;
-- Returns department name, department numnber, and first and last names of employees within specified department



