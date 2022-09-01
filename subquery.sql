SELECT borr.[BorrowerID]
      ,[BORROWER NAME]	= REPLACE(CONCAT_WS(' ', borr.[BorrowerFirstName], borr.[BorrowerMiddleInitial] ,borr.[BorrowerLastName]), '  ', ' ')
	  ,[PURCHASE AMOUNT]	=	setup.PurchaseAmount
  FROM [SkyBarrelBank_UAT].[dbo].[Borrower] AS borr
  INNER JOIN [SkyBarrelBank_UAT].[dbo].[LoanSetupInformation] AS setup
  ON borr.BorrowerID = setup.BorrowerID
  WHERE PurchaseAmount = ( SELECT MIN(PurchaseAmount) FROM [SkyBarrelBank_UAT].[dbo].[LoanSetupInformation] )