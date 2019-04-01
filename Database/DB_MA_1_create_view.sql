----------------create view for receptionists' use--------------------------------
--DROP VIEW vw_booking_detail;

CREATE VIEW vw_booking_detail
AS
SELECT booking.bookingNo, booking.roomNo, room.roomType, 
	guest.fName AS first_name, guest.lName AS last_name, 
	concat(guest.telephone, guest.email) AS guest_contact, -- two columns value merge to one column
	booking.dateFrom, booking.dateTo, 
	price.price AS price_per_night, 
	booking.total_stay,
	booking.total_stay * price.price AS total_price  
FROM booking
JOIN guest ON guest.guestNo = booking.guestNo
JOIN room ON booking.roomNo = room.roomNo
JOIN price ON room.roomType = price.roomType; 


----------------create view for managers' use--------------------------------
--DROP VIEW vw_hotel_status;

CREATE VIEW vw_hotel_status
AS
SELECT booking.bookingNo, booking.roomNo, room.roomType, booking.total_stay,
		booking.total_stay * price.price AS total_price  
FROM booking
JOIN room ON booking.roomNo=room.roomNo
JOIN price ON room.roomType= price.roomType
WHERE booking.dateFrom <= CONVERT(date, GETDATE()) AND booking.dateTo >= CONVERT(date, GETDATE());


SELECT*FROM vw_booking_detail;
SELECT*FROM vw_hotel_status;

