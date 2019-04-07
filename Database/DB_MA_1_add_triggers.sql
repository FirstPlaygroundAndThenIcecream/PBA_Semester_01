-------------------------triggers after a new room is booked-------------------------------
CREATE TRIGGER tr_remindNewGuest
ON booking
AFTER INSERT
AS RAISERROR('New booking!', 16, 10)

-------------------------triggers after room type updated-------------------------------
DROP TRIGGER IF EXISTS tr_listUpdatedRoomtype;

CREATE TRIGGER tr_listUpdatedRoomtype
ON room
AFTER UPDATE
AS
BEGIN
	DECLARE @roomAffected table(
		oldRoomType char(5),
		newRoomType char(5),
		affectedRoomNo char(5),
		changedDate date
	);

	--DECLARE @oldRoomType char(5); 
	--SELECT @oldRoomType = inserted.roomType FROM inserted; 	
	--DECLARE @newRoomType char(5), @affectedRoomNo char(5); 
	--SELECT @newRoomType = deleted.roomType, @affectedRoomNo = deleted.roomNo FROM deleted; 	
	
	--INSERT INTO @roomAffected
    --VALUES (@oldRoomType, @newRoomType, @affectedRoomNo);
	INSERT INTO @roomAffected
	SELECT deleted.roomType, inserted.roomType,inserted.roomNo, GETDATE() 
	FROM deleted, inserted 
	WHERE inserted.roomNo = deleted.roomNo;

	SELECT*FROM @roomAffected;
END

--update query
update room set roomType='f03' where roomType='f02'


-------------------------triggers for overlapping dates-------------------------------
USE Hotel_MA;
GO

--DROP TRIGGER IF EXISTS check_overlap_dates;


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