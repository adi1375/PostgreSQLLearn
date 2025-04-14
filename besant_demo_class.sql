-- DDL commands

-- Student details
-- 1)SID 			int			primarykey(notnull+unique)
-- 2)name 			varchar(40) notnull	
-- 3)Department 	varchar(20) 
-- 4)Phone no. 	char(15)	unique,notnull,check length=10
-- 5)Place 		varchar(40)	notnull
-- 6)Email 		varchar(30)	unique,notnull

-- CREATE TABLE students (student_id int primary key
-- ,student_name varchar(40) not null
-- ,department varchar(20)
-- ,phone_num char(15) unique
-- ,place varchar(40) not null
-- ,email varchar(30) unique not null);

select * from students