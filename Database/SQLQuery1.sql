/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [pno]
      ,[sno]
      ,[bno]
  FROM [Dreamhome].[dbo].[Property_For_Rent_VIEW]

SELECT*FROM Property_For_Rent_VIEW
WHERE pno='PA14';