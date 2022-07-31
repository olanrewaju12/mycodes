create proc UpdateEmplRecord
(@id int,
@fname nvarchar (10),
@lname nvarchar (20),
@ttle nvarchar (30),
@titleofco nvarchar (25),
@addr nvarchar (60),
@cit nvarchar (15),
@regi nvarchar (15),
@zipcode nvarchar (10),
@count nvarchar (15),
@cell nvarchar (24)
)
as

Begin 
update [HR].[Employees] set [firstname]=@fname, [lastname]=@lname, [title]=@ttle, [titleofcourtesy]=@titleofco,
                            [address]=@addr, [city]=@cit,  [region]= @regi, [postalcode]= @zipcode,
                            [country]=@count, [phone]=@cell where [empid] =@id

end
exec UpdateEmplRecord 2,'Tolu','salimon','mr','developer','4  NE','Atlanta','GA',
                      30224,'usa', 2665502034

select * from [HR].[Employees]