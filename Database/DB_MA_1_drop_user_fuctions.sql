use Hotel_MA;

--IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValidateBookingDatesRule_1]')
--AND type in (N'FN', N'IF',N'TF', N'FS', N'FT'))
--DROP FUNCTION [dbo].[ValidateBookingDatesRule_1];

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValidateBookingDates]')
AND type in (N'FN', N'IF',N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ValidateBookingDates]

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValidateDates]')
AND type in (N'FN', N'IF',N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ValidateDates]

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ValidateDates_real]')
AND type in (N'FN', N'IF',N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[ValidateDates_real]

-------------------Not sure how does this work--------------------------
--USE Hotel_MA;
--GO  
---- determines if function exists in database  
--IF OBJECT_ID (N'dbo.ValidateBookingDatesRule_1', N'IF') IS NOT NULL  
---- deletes function  
--    DROP FUNCTION dbo.ValidateBookingDatesRule_1;  
--GO 