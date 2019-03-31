DROP VIEW vw_booking_detail;

CREATE VIEW vw_booking_detail
AS
SELECT booking.bookingNo, booking.roomNo, room.roomType, 
	guest.fName AS first_name, guest.lName AS last_name, 
	booking.dateFrom, booking.dateTo, 
	price.price AS price_per_night, 
	DATEDIFF(DAY, booking.dateFrom, booking.dateTo) AS total_stay,
	SUM(total_stay * price_per_night) AS total_price  
FROM booking
JOIN guest ON guest.guestNo = booking.guestNo
JOIN room ON booking.roomNo = room.roomNo
JOIN price ON room.roomType = price.roomType; 

SELECT*FROM vw_booking_detail;

SELECT*FROM booking;

SELECT DATEDIFF(DAY, booking.dateFrom, booking.dateTo) AS days_total
FROM booking;
