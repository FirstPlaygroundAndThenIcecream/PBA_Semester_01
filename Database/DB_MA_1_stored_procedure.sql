
-------------------A procedure returns current stay guests------------------------
DROP PROCEDURE usp_getCurrentGuests;

CREATE PROCEDURE usp_getCurrentGuests
AS
DECLARE @today date=CONVERT(date, GETDATE());
SELECT booking.bookingNo, guest.fName, guest.lName, booking.dateFrom, booking.dateTo, booking.total_stay
FROM booking 
JOIN guest ON booking.guestNo=guest.guestNo
WHERE dateFrom <= @today AND dateTo  >= @today

EXEC usp_getCurrentGuests;

----------------A procedure returns cancelled booking of each room type-------------------------
DROP PROCEDURE usp_getAllCancelledGuestInfo;

CREATE PROCEDURE usp_getAllCancelledGuestInfo 
AS
SELECT * FROM guest
JOIN cancelled_booking ON cancelled_booking.guestNo = guest.guestNo
JOIN room ON cancelled_booking.roomNo=room.roomNo
JOIN room_category ON room.roomType = room_category.roomType
ORDER BY room.roomType

EXEC usp_getAllCancelledGuestInfo

