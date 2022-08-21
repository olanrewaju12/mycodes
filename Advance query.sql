--2, Aggregate the borrowers by country and show, per country, a)
 --The total purchase amount,
---b) Average purchase amount,
--c) Count of borrowers,
--d) Average ltv,
--e) Minimum ltv,
--f) Maximum ltv
--g) Average age of the borrowers
- --Order the report by the Total Purchase Amount in descending order
- --HINT > SELECT FORMAT(10000.004, 'c0')

Select borr.Citizenship as Citizenship,
format(sum(info.purchaseamount),'c0') as TOTAL_PURCHASEAMOUNT,
format(AVG(info.purchaseamount),'c0') as AVG_PURCHASEAMOUNT,
AVG(DATEDIFF(year,DOB, getdate())) as AVE_AGE_OF_BORROWERS,
COUNT(borr.BorrowerID) as NO_OF_BORROWERS,
CAST(AVG(info.ltv)AS varchar (100))+ '%' as AVG_LTV,
CAST(MIN(info.LTV) AS varchar (100))+ '%' as MIN_LTV,
CAST(Max(info.ltv)AS varchar (100))+ '%' as MAX_LTV

from [dbo].[Borrower] as borr 
right join [dbo].[LoanSetupInformation] as info
on borr.borrowerid= info.borrowerid
group by Citizenship
order by TOTAL_PURCHASEAMOUNT desc;