--SELECT*FROM room_category;
--SELECT*FROM price;
SELECT*FROM room;
--SELECT*FROM guest;			
SELECT*FROM booking;

--------------------------return all guests at a certain date-----------------------------------
DECLARE @date date;
SET @date = (CONVERT(date, GETDATE()));
SELECT fname, lname, bookingNo, dateFrom, dateTo FROM guest, booking
WHERE guest.guestNo = booking.guestNo
And booking.dateFrom <= @date AND booking.dateTo >= @date;


-------------------------count the most popular roomtype------------------------------
SELECT room.roomType,
COUNT (roomType) room_count
FROM room
JOIN booking ON booking.roomNo = room.roomNo
GROUP BY room.roomType
ORDER BY room_count DESC;


   
--SELECT CONVERT(date, GETDATE());

INSERT INTO booking VALUES('br06', 'g5', 'f100', '2019-04-08', '2019-04-09')

DELETE FROM booking WHERE dateFrom < CONVERT(date, GETDATE());
DELETE FROM booking;

DECLARE @date date,
		@roomNo char(5),
		@newRoom char(5),
		@newDate date;
SET @date=GETDATE();
SET	@roomNo='f205';

--SELECT*FROM booking
--WHERE booking.roomNo=@roomNo AND booking.dateFrom > @date;
SET @newRoom = 'f205';
SET @newDate = '2019-04-12';
IF @newDate > @date
	PRINT @newDate;
--	INSERT INTO booking VALUES ('br10', 'g2', 'f301', @newDate, '2019-04-17');
ELSE
	PRINT @date;
--	raiserror('no', 1, 1);
 



