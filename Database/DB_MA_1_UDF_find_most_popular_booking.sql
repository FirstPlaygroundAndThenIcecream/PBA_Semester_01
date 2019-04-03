
--------table valued UDF return a table shows all booked times of room type-----------------------------------
CREATE FUNCTION dbo.fn_getRoomtypeBookedCount()
RETURNS TABLE
AS
RETURN(
	SELECT roomType, COUNT(roomType) AS room_count
	FROM room
	JOIN booking ON room.roomNo=booking.roomNo
	GROUP BY room.roomType
);
GO

--DROP FUNCTION fn_getRoomtypeBookedCount
--GO

SELECT * FROM fn_getRoomtypeBookedCount() ORDER BY room_count DESC

SELECT MAX(room_count) FROM fn_getRoomtypeBookedCount()

---------------------------table valyed UDF uses another function returned table to compute --------------------------------------------------------------------------
DROP FUNCTION dbo.fn_getTheMostPopularRoomtype;

CREATE FUNCTION dbo.fn_getTheMostPopularRoomtype()
RETURNS @popularRoom TABLE(
	roomType char(5),
	bookedCount int NOT NULL
)
AS
BEGIN
	DECLARE @mostPopular int;
	SET @mostPopular =  (SELECT MAX(room_count) FROM fn_getRoomtypeBookedCount())
	INSERT @popularRoom
		SELECT roomType, room_count FROM fn_getRoomtypeBookedCount() WHERE room_count=@mostPopular 
	RETURN 
END;

SELECT*FROM dbo.fn_getTheMostPopularRoomtype() 


-------------------------table valued UDF return the most popular room type and its booked times----------------------
CREATE FUNCTION dbo.fn_table_getMostPopularRoomtype()
RETURNS @mostBookedRoomType TABLE
(
	roomType char(5),
	bookedTimes int
)
AS
BEGIN
	DECLARE @mostPopular int; 
	DECLARE @roomType char(5);
	DECLARE @book_count table(roomType char(5), countTimes int);
	INSERT @book_count
		SELECT roomType, COUNT(roomType) AS booked_count FROM room
		JOIN booking ON room.roomNo=booking.roomNo
		GROUP BY roomType
	SET @mostPopular =  (SELECT MAX(countTimes) FROM @book_count)
	INSERT @mostBookedRoomType 
		SELECT roomType, countTimes FROM @book_count WHERE countTimes=@mostPopular
	RETURN 
END;

SELECT *FROM dbo.fn_table_getMostPopularRoomtype()


---------scalar valued UDF return total booked count for each room parameter------------------------------
CREATE FUNCTION dbo.fn_countMostBookedRoom(@roomNo char(5))
RETURNS INT
AS 
BEGIN 
    DECLARE @returnvalue INT;

    SELECT @returnvalue = COUNT(*)  --count all rows
    FROM dbo.booking
    WHERE roomNo = @roomNo

    RETURN(@returnvalue);
END;

--DROP FUNCTION dbo.fn_countMostBookedRoom;

SELECT dbo.fn_countMostBookedRoom('f205') AS returnvalue;

