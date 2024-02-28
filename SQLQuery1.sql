-- Stored Procedures
use northwind

create procedure sp_employees
@city nvarchar(15)

as 
Begin
	Select * from employees 
	where city = @city 
End

exec sp_employees 'Seattle' 

drop procedure sp_employees





Use suma
--As a rule of thumb, every table should have at least one clustered index preferably on 
--the column that is used for SELECTING records and contains unique values. 
--The primary key column is an ideal candidate for a clustered index.
--On the other hand columns that are often involved in INSERT and
--UPDATE queries should have a non-clustered index assuming that disk space isn’t a concern.

Create table tableindexes
(
	emp_if int primary key,
	fname nvarchar(255),
	laname nvarchar(255)
);


insert into tableindexes values(1,'suma','g')
insert into tableindexes values(3,'uma','f')
insert into tableindexes values(5,'an','h')
insert into tableindexes values(8,'bgv','d')

select * from tableindexes

-- only one clustred index per table structures indexes are created  btrees

-- when index is slow while updata Pk for non key columns its ok 
--synonym 
use suma
create synonym syn_parent for parent

select * from syn_parent

insert into syn_parent(P_ID,FName,Lname,phone,gen,age)
values(69,'tma','thh',1323304,'f',72)


drop synonym syn_parent

-- non clusterd inde

drop index tableindexes.orderbylaname



CREATE NONCLUSTERED INDEX non_cindex_fname   
    ON tableindexes (fname);   

	select * from tableindexes
-- constraints
Create table parent
(
	P_ID int ,
	FName nvarchar(255) not null,
	Lname nvarchar(255),
	phone int unique,
	Gen nvarchar(255) default 'M',
	age int check (age> 21),
	constraint PK_id Primary key(P_id)

);

create NONCLUSTERED index ix_age 
on parent (age)

select * from parent 

insert into parent(P_ID,FName,Lname,phone,gen,age)
values(39,'uma','th',1323334,'f',92)

select * from parent

drop table parent

drop table child

alter table parent drop constraint [Check]
go

alter table parent drop column age

create table child
(
	C_Id int primary key,
	p_id int foreign key REFERENCES parent(P_ID),
	fName nvarchar(25) not null,
	Lname nvarchar(25) unique,
	phone int unique

);

insert into child values(930,77,'suma','ge5g', 99231720)

select * from child

alter table parent
drop primary key

alter column P_id  


alter table parent
add constraint nn_id not null P_id
go
alter table parent
add constraint pk_id primary key(P_id)



drop  constraint uni;


alter table parent 
drop constraint  pk_id;


Select parent.P_ID,parent.fName,child.fName ,parent.phone, child.phone 
from parent join child on parent.P_ID = child.p_id


-- table to see constraints
use suma
Select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS


-- with out a name
alter table dbo.child DROP CONSTRAINT [PK__child__A9FDEC32B1B8608F]



select * from child


drop table parent

use master

select * from sys.columns