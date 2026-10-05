--  ## DDL Query ## --
-- -------------------------------------------------------- --

-- create database --

	create database sqastudentdb

-- create Table --
	
	create table teacherInfo(
	id int not null primary key,
	name varchar(100))

-- Update Table --
	
	alter table studentInfo
	add column Mobile varchar(50)
	
-- Rename table --
	rename table studentInfo to studentInformation

-- Drop Table --
	
	drop table teacherinfo

-- Create table with using Primary Key and foreign key --

	create table tutionInfo(
	tution_id int not null auto_increment primary key,
	departmentName varchar(100),
	student_id int,
	foreign key(student_id) references studentpersonal(studentId)
	)
	
	
	--- Alter table data with foreign key-----
	ALTER TABLE courses
ADD COLUMN teacherid INT NULL,
ADD CONSTRAINT fk_courses_teacherinformation
FOREIGN KEY (teacherid) REFERENCES teacherinformation (id);

-- -------------------------####---------------------- --

-- query comment command : ctrl+/
	
-- -------------------------####---------------------- --


--  ## DML Query ## --
-- -------------------------------------------------------- --


-- Insert Values into Table --

-- Single Row Insert --
	
	INSERT INTO studentInformation (student_id, student_name, Mobile)
	VALUES (1, 'Razon', '013184415');

-- Multiple Rows Insert (Bulk Insert) --

	INSERT INTO studentInformation (student_id, student_name, Mobile)
	VALUES 
	(1, 'Razon', '013184415'),
	(2, 'Emon', '013184415'),
	(3, 'Rifah', '014184415'),
	(4, 'Debashis', '015184415');

-- Update Table --
	
	UPDATE studentInformation
	set student_name='PRODIP'
	WHERE student_id = 4;

-- Delete Table --
	
	delete from studentInformation
	WHERE student_id = 3

-- Truncate Table --
	
	truncate table studentInformation
	
-- -------------------------####---------------------- --

--  ## DQL Query ## --
-- -------------------------------------------------------- --

-- Where -> Filters rows. --
	
	select * from studentInformation
	where student_name ='Razon'

-- ORDER BY->Sorts rows --
	
	select * from studentpersonal s 
	order by firstname desc

-- GROUP BY->Aggregates rows.--
	
		create table empSalary(
	id int not null auto_increment primary key,
	name varchar(50),
	department varchar(50),
	salary decimal(10,2))
	
	insert into empSalary (id,name,department,salary)values
	(1,'John','IT',50000),
	(2,'Rahim','IT',60000),
	(3,'Karim','HR',40000),
	(4,'Hasan','HR',45000),
	(5,'David','Sales',70000)

	SELECT department, COUNT(*) AS total_employee
	FROM empsalary e 
	GROUP BY department;
-- 	select * from studentpersonal s 
-- 	group by s.bloodgroup 

-- HAVING -> Filters aggregated rows --
	
	SELECT department, COUNT(*) AS total_employee
	FROM empsalary
	GROUP BY department
	HAVING COUNT(*) > 1;



-- DISTINCT -> Removes duplicates.--
	
	SELECT DISTINCT religion FROM studentpersonal;

-- LIMIT -> Limits number of rows returned.--
	
	select * from studentpersonal s 
	limit 7

-- -------------------------####---------------------- --

--  ## IN Operator ## --
-- -------------------------------------------------------- --

	SELECT * FROM departments d 
	where d.departmentName in ('Electrical Engineering')

-- -------------------------####------------------------- --

--  ## BETWEEN Operator ## --
-- -------------------------------------------------------- --

	SELECT * FROM studentacademic s 
	where totalSemesterFees  between 1400 and 1600
	
-- -------------------------####---------------------- --

--  ## LIKE Operator ## --
-- -------------------------------------------------------- --

	SELECT * 
	FROM studentpersonal s3
	WHERE s3.firstname LIKE '%a%'  -- If the column contains the character 'a' anywhere
	
	-- -------------------------------------------------------- --

	SELECT * 
	FROM studentpersonal s3
	WHERE s3.firstname LIKE 'a%'  -- If the first character is 'a'
	
	-- -------------------------------------------------------- --

	SELECT * 
	FROM studentpersonal s3
	WHERE s3.firstname LIKE '%a'  -- If the last character is 'a'
	
	
-- -------------------------####---------------------- --



-- Alias মানে হলো table বা column এর temporary short name দেওয়া যাতে query ছোট ও সহজ হয়।
	
	SELECT s3.firstname,s3.lastname   FROM studentpersonal s3


-- -------------------------####---------------------- --

--  ## Aggregate function ## --
-- -------------------------------------------------------- --
	
		select count(*) from studentpersonal s 
		select sum(totalSemesterFees) from studentacademic 
		select avg(totalSemesterFees) from studentacademic 
		select max(totalSemesterFees) from studentacademic 
		select min(totalSemesterFees) from studentacademic 

-- -------------------------####---------------------- --

--  ## Case statement ## --
-- -------------------------------------------------------- --

	select * from studentacademic
	select studentId,totalSemesterFees,
	case 
		when totalSemesterFees<1400 then 'low'
		when totalSemesterFees between 1500 and 1700 then 'medium'
		else 'high'	
	end as fees 
	from studentacademic

-- -------------------------####---------------------- --


--  ## Inner join ## --
-- -------------------------------------------------------- --

	select sp.studentId,sp.firstname ,sp.lastname , 
	concat(sp.firstname,' ',sp.lastname)as fullname,
	sa.departmentCode
	from  studentpersonal sp
	inner join studentacademic sa on sp.studentId=sa.studentId

-- -------------------------####---------------------- --

--  ## Left join ## --
-- -------------------------------------------------------- --

	SELECT sp.firstname, sp.lastname,
	CONCAT(sp.firstname ,'',sp.lastname )as full_name,
	sp.religion,sp.Gender,
	sa.semester
	FROM studentPersonal sp
	LEFT JOIN studentAcademic sa ON sp.studentId = sa.studentId;

-- -------------------------####---------------------- --


--  ## Right join ## --
-- -------------------------------------------------------- --

	SELECT sp.firstname, sp.lastname,
	CONCAT(sp.firstname ,'',sp.lastname )as full_name,
	sp.religion,sp.Gender,
	sa.semester
	FROM studentPersonal sp
	RIGHT JOIN studentAcademic sa ON sp.studentId = sa.studentId;
	
-- -------------------------####---------------------- --

--  ## Cross join ## --
-- -------------------------------------------------------- --

	SELECT sp.firstname, sp.lastname, sa.departmentCode
	FROM studentPersonal sp
	CROSS JOIN studentAcademic sa;

-- -------------------------####---------------------- --











