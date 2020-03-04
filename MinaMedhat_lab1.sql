use ITI
-----------part1--------------
---1----
select count(*)
from Student
where St_Age is not null
---2----
select distinct Ins_Name
from Instructor
---3---
select St_Id as 'Student id', ISNULL(St_Fname,'')+' '+ISNULL(st_Lname,' ')as 'Student Full Name',ISNULL(Dept_Name,' ')
from Student s,Department d
where s.Dept_Id=d.Dept_Id
---4---
select Ins_Name , Dept_Name
from Instructor i left outer join Department d
on i.Dept_Id=d.Dept_Id
---5---
select St_Fname+' '+St_Lname as 'full name',Crs_Name
from Student s,Course c,Stud_Course sc
where sc.Crs_Id=c.Crs_Id and sc.St_Id=s.St_Id and Grade is not null
---6---
select Top_Name, count(*) as 'number of courses'
from Course c,Topic t
where c.Top_Id=t.Top_Id
group by t.Top_Name
---7---
select max(Salary) as Maximum , min(Salary) as Minimum
from Instructor
---8---
select Ins_Name,Salary 
from Instructor
where Salary<(select avg(Salary) from Instructor)
---9---
select Dept_Name
from Department d, Instructor i
where d.Dept_Id=i.Dept_Id and i.Salary =(select min(Salary) from Instructor)
--10---
select top(2) Salary
from Instructor
order by Salary desc
--11---
select Ins_Name,coalesce(Salary,Bonus)
from Instructor
--12---
select AVG(Salary)
from Instructor
--13---
select x.St_Fname,y.*
from Student x,Student y
where y.St_Id=x.St_super

---------------------------------------------
---------part2------
use AdventureWorks2012
---1---
select SalesOrderID,ShipDate
from AdventureWorks2012.Sales.SalesOrderHeader
where OrderDate between '7/28/2002' and '7/29/2014'
---2---
select ProductID,Name
from AdventureWorks2012.Production.Product
where StandardCost<110.00
---3---
select ProductID,Name
from AdventureWorks2012.Production.Product
where Weight is null
---4---
select ProductID
from AdventureWorks2012.Production.Product
where Color in('Silver','Black','Red')
---5---
select Name
from AdventureWorks2012.Production.Product
where Name like 'B%'
---6---
update AdventureWorks2012.Production.ProductDescription
set Description='Chromoly steel_High of defects'
where ProductDescriptionID=3

select *
from AdventureWorks2012.Production.ProductDescription
where Description like '%[_]%'
---7---
select sum(TotalDue)
from AdventureWorks2012.Sales.SalesOrderHeader
where OrderDate between '7/1/2001' and '7/31/2014'
group by OrderDate
---8---
select distinct HireDate
from AdventureWorks2012.HumanResources.Employee
---9---
select AVG(distinct ListPrice)
from AdventureWorks2012.Production.Product
--10---
select 'The '+convert(varchar(50),Name)+' is only! '+convert(varchar(50),ListPrice)
From AdventureWorks2012.Production.Product
where ListPrice between 100 and 120
--11-a)--
select rowguid,Name,SalesPersonID,Demographics into store_Archive
from AdventureWorks2012.Sales.Store --701 row--
--11-b)--
select rowguid,Name,SalesPersonID,Demographics into store_Archive_2
from AdventureWorks2012.Sales.Store 
where 2=1 --0 row--
--12---
select format(getdate(), 'dd MM yyyy') as 'today`s date'
Union all
select format(getdate(), 'dd MM yy') as 'today`s date'
Union all
select format(getdate(), 'ddd MMMM yyyy') as 'today`s date'
Union all
select format(getdate(), 'dddd MMMM yyyy') as 'today`s date'
Union all
select format(getdate(), 'ddd MMM yyyy') as 'today`s date'
--13---
select @@VERSION--get name of management studio - version - launch date - copyright of microsoft - kind of edition - info about operating system
--Microsoft SQL Server 2016 (RTM) - 13.0.1601.5 (X64)   Apr 29 2016 23:23:58   Copyright (c) Microsoft Corporation  Enterprise Edition (64-bit) on Windows 10 Pro 6.3 <X64> (Build 18362: )
select @@SERVERNAME--get name of server(laptop)-- 
--DESKTOP-532GCGK