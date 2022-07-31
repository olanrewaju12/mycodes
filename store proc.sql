declare @supplierid as int= 3

select sup.companyname,
       sup.[phone],
       sup.contactname,
       pro.productname,
       pro.productid,
	   pro.supplierid,
	   cate.categoryid,
       cate.categoryname,
	   cate.[description]
       
	   
	   from Production.Products as pro
	   inner join [Production].[Suppliers]  as sup
	   on pro.[supplierid] = sup.[supplierid]
	   inner join [Production].[Categories] as cate
	   on cate.[categoryid] = pro.[categoryid]
	   where pro.[supplierid]= @supplierid;


create proc GetSupplierProductCatgories
            @supplierid as int= 3

as
begin

select sup.companyname,
       sup.[phone],
       sup.contactname,
       pro.productname,
       pro.productid,
	   pro.supplierid,
	   cate.categoryid,
       cate.categoryname,
	   cate.[description]
       
	   
	   from Production.Products as pro
	   inner join [Production].[Suppliers]  as sup
	   on pro.[supplierid] = sup.[supplierid]
	   inner join [Production].[Categories] as cate
	   on cate.[categoryid] = pro.[categoryid]
	   where pro.[supplierid]= @supplierid

end;

exec GetSupplierProductCatgories 

exec GetSupplierProductCatgories 
     @supplierid= 5;
