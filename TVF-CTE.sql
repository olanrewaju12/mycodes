create function cte_reuseable_employee
(@empid int = 9
)
Returns table
as
  return
with cte_reuseable_employee as(
select [empid]
       ,fullname= concat_ws(' ',[firstname],[lastname])
	   ,[hiredate]
	   ,[mgrid]
	   ,[title]
	   from [HR].[Employees]
)
select [empid],fullname,[hiredate],[title]
       from cte_reuseable_employee
	   where empid <= @empid;


select * from cte_reuseable_employee ('2')