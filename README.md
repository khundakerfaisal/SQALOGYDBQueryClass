## SQALOGY DB Query 
----------------------------------------------------------------------------------------
## DDL Query
-----------------------------------------------------------
**create database :** 
``` bash
create database sqastudentdb
```

**create Table :**	
``` bash
create table teacherInfo(
id int not null primary key,
name varchar(100))
```
``` bash
create table empSalary(
id int not null auto_increment primary key,
name varchar(50),
department varchar(50),
salary decimal(10,2))
```

**Update Table :**

``` bash
alter table studentInfo
add column Mobile varchar(50)
```

**Rename table :**
``` bash
rename table studentInfo to studentInformation
```

**Drop Table :**
``` bash
drop table teacherinfo
```
**Create table with using Primary Key and foreign key :**
``` bash
create table tutionInfo(
tution_id int not null auto_increment primary key,
departmentName varchar(100),
student_id int,
foreign key(student_id) references studentpersonal(studentId)
)
```

**Alter table data with foreign key :**
``` bash
ALTER TABLE courses
ADD COLUMN teacherid INT NULL,
ADD CONSTRAINT fk_courses_teacherinformation
FOREIGN KEY (teacherid) REFERENCES teacherinformation (id);
```



## DML Query
-----------------------------------------------------------
**Insert Values into Table :**

```Single Row Insert ```
``` bash
INSERT INTO studentInformation (student_id, student_name, Mobile)
VALUES (1, 'Razon', '013184415');
```

``` Multiple Rows Insert (Bulk Insert) ```

``` bash
INSERT INTO studentInformation (student_id, student_name, Mobile)
VALUES 
(1, 'Razon', '013184415'),
(2, 'Emon', '013184415'),
(3, 'Rifah', '014184415'),
(4, 'Debashis', '015184415');
```
``` bash
insert into empSalary (id,name,department,salary)values
(1,'John','IT',50000),
(2,'Rahim','IT',60000),
(3,'Karim','HR',40000),
(4,'Hasan','HR',45000),
(5,'David','Sales',70000)
```

**Update Table :**
``` bash	
UPDATE studentInformation
set student_name='PRODIP'
WHERE student_id = 4;
```

**Delete Table :**
``` bash
delete from studentInformation
WHERE student_id = 3
```

**Truncate Table :**
``` bash	
truncate table studentInformation
```	


 ## DQL Query 
-----------------------------------------------------------

```Where -> Filters rows.```

``` bash	
select * from studentInformation
where student_name ='Razon'
```

```ORDER BY->Sorts rows```

``` bash
select * from studentpersonal s 
order by firstname desc
```

```GROUP BY->Aggregates rows.```

``` bash
SELECT department, COUNT(*) AS total_employee
FROM empsalary e 
GROUP BY department;
```

```HAVING -> Filters aggregated rows```

``` bash	
SELECT department, COUNT(*) AS total_employee
FROM empsalary
GROUP BY department
HAVING COUNT(*) > 1;
```

```DISTINCT -> Removes duplicates```

``` bash	
SELECT DISTINCT religion FROM studentpersonal;
```

```LIMIT -> Limits number of rows returned```
``` bash	
select * from studentpersonal s 
limit 7
```

```IN Operator```

``` bash
SELECT * FROM departments d 
where d.departmentName in ('Electrical Engineering')
```


``` BETWEEN Operator ```
``` bash
SELECT * FROM studentacademic s 
where totalSemesterFees  between 1400 and 1600
```

``` LIKE Operator ```
``` bash
SELECT * 
FROM studentpersonal s3
WHERE s3.firstname LIKE '%a%'  -- If the column contains the character 'a' anywhere

-------------------------------------------------------- --

SELECT * 
FROM studentpersonal s3
WHERE s3.firstname LIKE 'a%'  -- If the first character is 'a'
	
-------------------------------------------------------- --

SELECT * 
FROM studentpersonal s3
WHERE s3.firstname LIKE '%a'  -- If the last character is 'a'
```	
	
``` Alias মানে হলো table বা column এর temporary short name দেওয়া যাতে query ছোট ও সহজ হয়।```
``` bash
SELECT s3.firstname,s3.lastname   FROM studentpersonal s3
```

## Aggregate function
``` bash
select count(*) from studentpersonal s 
select sum(totalSemesterFees) from studentacademic 
select avg(totalSemesterFees) from studentacademic 
select max(totalSemesterFees) from studentacademic 
select min(totalSemesterFees) from studentacademic 
```
``` Case statement```

```bash
select * from studentacademic
select studentId,totalSemesterFees,
case 
	when totalSemesterFees<1400 then 'low'
	when totalSemesterFees between 1500 and 1700 then 'medium'
	else 'high'	
end as fees 
from studentacademic
```

```Inner join ```
``` bash
select sp.studentId,sp.firstname ,sp.lastname , 
concat(sp.firstname,' ',sp.lastname)as fullname,
sa.departmentCode
from  studentpersonal sp
inner join studentacademic sa on sp.studentId=sa.studentId
```

``` Left join ```

``` bash
SELECT sp.firstname, sp.lastname,
CONCAT(sp.firstname ,'',sp.lastname )as full_name,
sp.religion,sp.Gender,
sa.semester
FROM studentPersonal sp
LEFT JOIN studentAcademic sa ON sp.studentId = sa.studentId;
```

``` Right join ```

``` bash
SELECT sp.firstname, sp.lastname,
CONCAT(sp.firstname ,'',sp.lastname )as full_name,
sp.religion,sp.Gender,
sa.semester
FROM studentPersonal sp
RIGHT JOIN studentAcademic sa ON sp.studentId = sa.studentId;
```

``` Cross join ```
``` bash
SELECT sp.firstname, sp.lastname, sa.departmentCode
FROM studentPersonal sp
CROSS JOIN studentAcademic sa;
```
```Inner/left/right join ```
``` bash
select s.studentId,
concat(s.firstname , ' ',s.lastname ) as Full_Name,
s.city,s.bloodgroup ,s.religion ,s.Gender,
s2.departmentCode,s2.`session`,c.subjectCode,s3.subjectTitle ,s2.totalSemesterFees,
p.amount 
from studentpersonal s 
inner join studentacademic s2 on s.studentId =s2.studentId 
left join payment p on s.studentId =p.studentId 
inner  join courses c on s.studentId =c.studentId 
inner join subjects s3  on c.subjectCode  =s3.subjectCode  
where p.amount  is null
```
---------------------------####---------------------- --











