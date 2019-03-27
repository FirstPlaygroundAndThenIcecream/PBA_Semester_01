--------------------------drop constraint--------------------------------
ALTER TABLE booking
DROP CONSTRAINT ValidateDates;

--------------------------drop function-------------------------------------
DROP FUNCTION dbo.Validate_Dates;

--------------------------create UDF----------------------------------------
create function dbo.Validate_Dates
(
	@bookingNo char(10),
	@guestNo char(10),
    @roomNo char(5),
	@dateFrom date,
	@dateTo date
)
returns bit
as
begin
	declare @validate bit = 1;
	if exists (
	select*from dbo.booking
	where booking.roomNo = @roomNo
	AND @dateTo >= booking.dateFrom AND @dateFrom <= booking.dateTo
	)
	set @validate = 0;
	return @validate;
end;
go

PRINT dbo.Validate_Dates('br02', 'g2', 'f205', '2019-04-04', '2019-04-06');

--begin
--    declare @Valid bit = 1;

--    if exists(    select *
--                  from   dbo.booking 
--                  where  booking.roomNo = @roomNo
--                  and    @dateFrom <= booking.dateTo and @dateTo >= booking.dateFrom
--			)
--       set @Valid = 0;
--    return @Valid;
--end
--GO


alter table booking with nocheck
add constraint ValidateDates
    check (dbo.Validate_Dates(bookingNo, guestNo, roomNo, dateFrom, dateTo) = 1);

insert into booking values('br07', 'g2', 'f300', '2019-04-01', '2019-04-02');

