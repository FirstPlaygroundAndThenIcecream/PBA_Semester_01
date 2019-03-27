CREATE DATABASE hotel;

USE hotel;

CREATE TABLE Rooms (
	rid int NOT NULL,
	rnumber int,
	rtype varchar(10) NOT NULL,
		PRIMARY KEY(rid),
		CONSTRAINT roomtype CHECK (rtype='single' OR rtype='double' OR rtype='family')
);

CREATE TABLE Guests(
	gid int NOT NULL,
	name varchar(255) NOT NULL,
	phonenumber int NOT NULL,
		PRIMARY KEY(gid)
);

CREATE TABLE Bookings (
	bid int NOT NULL,
	datefrom date NOT NULL,
	dateto date NOT NULL,
	rid int NOT NULL,
	gid int NOT NULL,
		PRIMARY KEY (bid),
		FOREIGN KEY (rid) REFERENCES Rooms(rid),
		FOREIGN KEY (gid) REFERENCES Guests(gid),
		CONSTRAINT validdates CHECK (datefrom >= GETDATE() AND dateto >= GETDATE() AND dateto >= datefrom)
);

--	DROP FUNCTION dbo.overlapcheck;
CREATE FUNCTION overlapcheck(
	@gid int,
	@datefrom date,
	@dateto date
)
RETURNS INT
AS
BEGIN
	DECLARE @return INT
	SET @return = (SELECT COUNT(*) FROM Bookings WHERE (gid = @gid AND (
		(@dateto > datefrom AND @dateto < dateto) OR
		(@datefrom > datefrom AND @datefrom < dateto) OR
		(@datefrom < dateto AND @dateto > datefrom)
	)))
	RETURN @return
END

PRINT dbo.overlapcheck(0, '2019-04-24', '2019-04-28'); --test function
PRINT dbo.overlapcheck(0, '2019-04-29', '2019-04-30'); --test function
PRINT dbo.overlapcheck(0, '2019-04-27', '2019-04-30'); --test function
PRINT dbo.overlapcheck(0, '2019-05-27', '2019-05-30'); --test function

--	ALTER TABLE Bookings DROP CONSTRAINT bookingoverlap;
ALTER TABLE Bookings
	WITH CHECK ADD CONSTRAINT bookingoverlap
	CHECK (dbo.overlapcheck([gid], [datefrom], [dateto]) = 1)

--	DELETE FROM Rooms;
INSERT INTO Rooms VALUES (0, 101, 'single');
INSERT INTO Rooms VALUES (1, 102, 'single');
INSERT INTO Rooms VALUES (2, 103, 'double');
INSERT INTO Rooms VALUES (3, 201, 'single');
INSERT INTO Rooms VALUES (4, 202, 'single');
INSERT INTO Rooms VALUES (5, 203, 'double');
INSERT INTO Rooms VALUES (6, 301, 'family');
INSERT INTO Rooms VALUES (7, 302, 'family');

INSERT INTO Guests VALUES (0, 'John Doe', 12345678);
INSERT INTO Guests VALUES (1, 'Cotton Maher', 13572468);
INSERT INTO Guests VALUES (2, 'Deodat Lawson', 87654321);
INSERT INTO Guests VALUES (3, 'Edward Bishop', 86427531);
INSERT INTO Guests VALUES (4, 'John Proctor', 12348765);
INSERT INTO Guests VALUES (5, 'Ann Putnam', 87651234);

--	DELETE FROM Bookings;
INSERT INTO Bookings Values (0, '2019-04-24', '2019-04-28', 0, 0);	-- John Doe
INSERT INTO Bookings Values (1, '2019-04-29', '2019-04-30', 1, 0);	-- John Doe in another room at different time
INSERT INTO Bookings Values (2, '2019-04-25', '2019-04-29', 2, 2);	-- Deodat Lawson overlapping John Doe's first stay
INSERT INTO Bookings Values (3, '2019-05-13', '2019-05-18', 3, 5);	-- Ann Putnam alone in hotel
INSERT INTO Bookings Values (4, '2019-05-24', '2019-05-28', 0, 0);	-- John Doe likes room 0
INSERT INTO Bookings Values (5, '2019-06-24', '2019-06-28', 0, 0);	-- John Doe likes room 0

SELECT Guests.* FROM Guests JOIN Bookings ON Guests.gid = Bookings.gid WHERE (Bookings.datefrom < GETDATE() AND dateto > GETDATE());

--	DROP FUNCTION mostcommonlybookedroomtype;
CREATE FUNCTION mostcommonlybookedroomtype()
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @return VARCHAR(10)
	DECLARE @map TABLE (type VARCHAR(10), amount INT)
	INSERT INTO @map VALUES ('single', (SELECT COUNT(*) FROM Rooms JOIN Bookings ON Rooms.rid = Bookings.rid WHERE (Rooms.rtype = 'single')))
	INSERT INTO @map VALUES ('double', (SELECT COUNT(*) FROM Rooms JOIN Bookings ON Rooms.rid = Bookings.rid WHERE (Rooms.rtype = 'double')))
	INSERT INTO @map VALUES ('family', (SELECT COUNT(*) FROM Rooms JOIN Bookings ON Rooms.rid = Bookings.rid WHERE (Rooms.rtype = 'family')))
	SET @return = (SELECT MAX(amount) FROM @map)
	SET @return = (SELECT TOP 1 type FROM @map WHERE amount=@return)
	RETURN @return
END

PRINT dbo.mostcommonlybookedroomtype()

--	TASK F
--	DROP TABLE CancelledBookings
CREATE TABLE CancelledBookings (
	cid int IDENTITY(0,1) PRIMARY KEY,
	datefrom date NOT NULL,
	dateto date NOT NULL,
	rid int NOT NULL,
	gid int NOT NULL,
		FOREIGN KEY(rid) REFERENCES Rooms(rid),
		FOREIGN KEY(rid) REFERENCES Guests(gid)
);

CREATE TRIGGER booking_cancelled
	ON dbo.Bookings
	AFTER DELETE
AS
BEGIN
	INSERT INTO CancelledBookings SELECT datefrom, dateto, rid, gid FROM deleted
END

--	test of this trigger
INSERT INTO Bookings Values (99, '2020-06-24', '2020-06-28', 0, 0);	-- John Doe likes room 0
DELETE FROM Bookings WHERE (bid = 99)
SELECT * FROM CancelledBookings

--	DROP TRIGGER room_type_changed
CREATE TRIGGER room_type_changed
	ON dbo.Rooms
	AFTER UPDATE,INSERT
AS
BEGIN
	IF UPDATE(rtype)
		DECLARE @rid int = (SELECT rid FROM inserted)
		SELECT Bookings.* FROM Bookings JOIN Rooms ON Bookings.rid = Rooms.rid WHERE(@rid = Rooms.rid)
END

UPDATE Rooms SET rtype='single' WHERE rid=0