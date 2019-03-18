SELECT*FROM room_category;
SELECT*FROM price;
SELECT*FROM room;
SELECT*FROM guest;
SELECT*FROM booking;


--------------------------return current guests-----------------------------------
--SELECT fname, lname, bookingNo, dateFrom, dateTo FROM guest, booking
--WHERE guest.guestNo = booking.guestNo
--And booking.dateFrom <= (CONVERT(date, GETDATE())) AND booking.dateTo >= (CONVERT(date, GETDATE()));


-------------------------count room booking recurrence------------------------------
SELECT room.roomType,
	COUNT (roomType) room_count
FROM room
JOIN booking ON booking.roomNo = room.roomNo
GROUP BY room.roomType
ORDER BY room_count DESC;

--SELECT* FROM booking
--WHERE booking.dateTo <= '2019-03-18';

--SELECT	CONVERT(date, GETDATE());