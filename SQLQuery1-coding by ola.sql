-----a) BorrowerID b) Borrower Full Name
--c) SSN (database field: TaxPayerID_SSN). Please mask the first five digits of the SSN d)
--e) The amount purchased in thousands in this format ($44,068K) Here is an example of the data you need to return:

select borr.Borrowerid as BORROWERID, 
concat_ws(' ', borr.[BorrowerFirstName], borr.[BorrowerMiddleInitial],borr.[BorrowerLastName]) as BORROWER_NAME, 
concat('*****',right(borr.TaxPayerID_SSN,4)) as SSN, 
datepart(year,info.PurchaseDate) as YEAR_OF_PURCHASE, 
format(info.purchaseAmount/1000,'C0')+ 'k'  as PURCHASE_AMOUNT_IN_THOUSAND 
from [dbo].[Borrower] as borr 
left join [dbo].[LoanSetupInformation] as info
on borr.borrowerid= info.borrowerid;