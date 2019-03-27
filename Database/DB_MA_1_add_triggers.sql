DROP TRIGGER IF EXISTS check_overlap_dates;


-------------------------triggers for overlapping dates-------------------------------
USE Hotel_MA;
GO

---DOESNT WORK!!!------
CREATE TRIGGER check_overlap_dates ON booking
FOR INSERT AS
--IF @@ROWCOUNT = 0 RETURN;

IF EXISTS(	
	SELECT*FROM inserted AS I 
	JOIN booking ON I.roomNo = booking.roomNo
	WHERE I.dateTo >= booking.dateFrom ---I.dateFrom <= booking.dateTo AND  
)
BEGIN
ROLLBACK TRANSACTION;
RAISERROR('Room is not aviable', 16, 1);
RETURN;
END;