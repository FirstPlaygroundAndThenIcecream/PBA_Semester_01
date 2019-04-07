--------------------------drop constraint--------------------------------
ALTER TABLE booking
DROP CONSTRAINT ValidateDates;

--------------------------drop function-------------------------------------
DROP FUNCTION dbo.Validate_Dates;

--------------------------create UDF checking overlapping booking date----------------------------------------
CREATE FUNCTION dbo.Validate_Dates
(
	@bookingNo char(10),
	@guestNo char(5),
    @roomNo char(5),
	@dateFrom date,
	@dateTo date
)
RETURNS BIT
AS
BEGIN
	DECLARE @validate bit = 1;
	DECLARE @booking_dateFrom date;
	DECLARE @booking_dateTO date;
	SET @booking_dateFrom = (SELECT booking.dateFrom FROM booking WHERE @roomNo = booking.roomNo);
	SET @booking_dateTO = (SELECT booking.dateTo FROM booking WHERE @roomNo = booking.roomNo);
	IF @dateTo >= @booking_dateFrom AND @dateFrom <= @booking_dateTO
	BEGIN
	SET @validate = 0;
	END
	RETURN (@validate); 
END;
GO

select*from booking;
PRINT dbo.Validate_Dates('f301', '2019-04-15', '2019-04-16');


ALTER TABLE booking WITH NOCHECK
ADD CONSTRAINT ValidateDates
    CHECK (dbo.Validate_Dates(bookingNo, guestNo, roomNo, dateFrom, dateTo) = 1);

INSERT INTO booking VALUES('br17', 'g2', 'f307', '2019-05-01', '2019-05-02');

