--SELECT*FROM room_category;
--SELECT*FROM price;
--SELECT*FROM room;
--SELECT*FROM guest;
--SELECT*FROM booking;

SELECT fname, lname FROM guest
JOIN booking ON guest.guestNo = booking.guestNo
WHERE booking.dateTo <= (SELECT CONVERT(date, GETDATE()));

SELECT* FROM booking
WHERE booking.dateTo <= '2019-03-18';

SELECT	CONVERT(date, GETDATE());