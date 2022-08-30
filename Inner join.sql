SELECT borr.[BorrowerID]
      ,[BORROWER NAME]	= REPLACE(CONCAT_WS(' ', borr.[BorrowerFirstName], borr.[BorrowerMiddleInitial] ,borr.[BorrowerLastName]), '  ', ' ')
	  ,[SSN]=	RIGHT(borr.[TaxPayerID_SSN], 4)
	  ,[YEAR OF PURCHASE]=YEAR(setup.PURCHASEDATE)
	  ,[PURCHASE AMOUNT (IN THOUSANDS)]=FORMAT(setup.PurchaseAmount/1000, 'C0')+'K'
  FROM  [SkyBarrelBank_UAT].[dbo].[LoanSetupInformation] AS setup
  INNER JOIN [SkyBarrelBank_UAT].[dbo].[Borrower] AS borr
  ON borr.BorrowerID = setup.BorrowerID