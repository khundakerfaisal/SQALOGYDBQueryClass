create database studentdb

select * from studentacademic s 

create table empSalary(
id int not null auto_increment primary key,
name varchar(50),
department varchar(50),
salary decimal(10,2))

alter table teacherInfo add column Mobile varchar(50)

rename table teacherinfo to teacherInformation

insert into empSalary (id,name,department,salary)values
(1,'John','IT',50000),
(2,'Rahim','IT',60000),
(3,'Karim','HR',40000),
(4,'Hasan','HR',45000),
(5,'David','Sales',70000)




delete from  teacherinformation
where id=3

truncate table teacherinformation

update teacherinformation
set name='robin'
where id=1

create table tutionInfo(
id int not null auto_increment primary key,
department_name varchar(100),
student_id int,
foreign key (student_id) references studentpersonal (studentId)
)

ALTER TABLE courses
ADD COLUMN teacherid INT NULL,
ADD CONSTRAINT fk_courses_teacherinformation
FOREIGN KEY (teacherid) REFERENCES teacherinformation (id);

ALTER TABLE courses
ADD COLUMN teacherId INT NULL,
ADD CONSTRAINT fk_courses_teacherinformation
FOREIGN KEY (teacherId) REFERENCES teacherinformation(id);


select * from departments d 
where d.departmentName ='Biotechnology'

select * from studentpersonal s 
order by firstname asc

SELECT department, COUNT(*) AS total_employee
FROM empsalary e 
GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM empsalary
GROUP BY department;

SELECT department, COUNT(*) AS total_employee
FROM empsalary
GROUP BY department
HAVING COUNT(*) > 1;


SELECT
    sp.studentId,sp.firstname,sp.lastname,sp.city,sp.Gender
FROM studentpersonal sp
WHERE sp.studentId NOT IN (
    SELECT p.studentId
    FROM payment p
);

select studentId,s.firstname 
from studentpersonal s 
where s.studentId  not in(select studentId from payment p )

select * from studentacademic s 


select s2.studentId,
s.firstname ,s.lastname,
CONCAT(s.firstname ,' ',s.lastname ) as full_name,s2.`session` ,s2.totalSemesterFees,
case 
	when s2.totalSemesterFees<=1400 then 'low'
	when s2.totalSemesterFees between 1500 and 1700 then 'medium'
	else 'high'
end as fees

 from studentacademic s2 
 left join studentpersonal s on s2.studentId =s.studentId 

 --------Subquery-------------
 select s2.studentId, s2.firstname ,s2.lastname ,s2.Gender
 from studentpersonal s2 
 where s2.studentId  in(select p.studentId  from payment p  )
 
 
 

