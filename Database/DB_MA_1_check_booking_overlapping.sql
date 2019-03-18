--create function dbo.ValidateDates_real
--(
--    @roomNo char,
--    @dateFrom date,
--    @dateTo date
--)
--returns bit
--as
--begin
--    declare @Valid bit = 1;

--    if exists(    select *
--                  from   dbo.booking 
--                  where  booking.roomNo = @roomNo
--                  and    @dateFrom <= booking.dateTo and @dateTo >= booking.dateFrom)
--       set @Valid = 0;	 
--	if exists(    select *
--                from   dbo.booking 
--                where  booking.roomNo = @roomNo
--                and    @dateFrom = booking.dateFrom and @dateTo = booking.dateTo)
--    set @Valid = 0;	 


--    return @Valid;
--end

--alter table booking with nocheck
--add constraint Hotel_MA_ValidateDates_for_real
--    check (dbo.ValidateDates_real(roomNo, dateFrom, dateTo) = 1);

--insert into booking values('br17', 'g6', 'f100', '2019-04-10', '2019-04-12');

USE Hotel_MA;  
GO  
-- determines if function exists in database  
IF OBJECT_ID (N'dbo.ValidateBookingDatesRule_1', N'IF') IS NOT NULL  
-- deletes function  
    DROP FUNCTION dbo.ValidateBookingDatesRule_1;  
GO 