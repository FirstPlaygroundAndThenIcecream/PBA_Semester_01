USE Hotel_MA;

IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='room_category')
CREATE TABLE room_category (
	roomType char(5) NOT NULL,
	balcony bit,
	window bit,
	bathroom bit,
	bed1 char(15),
	bed2 char(15),
	bed3 char(15),
	bed4 char(15),
	bed5 char(15),
	bed6 char(15),
	PRIMARY KEY (roomType)
);

IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='price')
CREATE TABLE price(
	priceType char(5) NOT NULL,
	roomType char(5) NOT NULL,
	price smallmoney NOT NULL check (price > 0),
	PRIMARY KEY (priceType),
	FOREIGN KEY (roomType) REFERENCES room_category(roomType)
);

IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='room')
CREATE TABLE room (
	roomNo char(5) NOT NULL,
	roomType char(5) NOT NULL,
	priceType char(5) NOT NULL,
	PRIMARY KEY (roomNo),
	FOREIGN KEY (roomType) REFERENCES room_category (roomType),
	FOREIGN KEY (priceType) REFERENCES price (priceType)
);

--IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='bed')
--CREATE TABLE bed (
--	bedType char(3) NOT NULL ,
--	bed_1 varchar(10),  
--	bed_2 varchar(10),
--	bed_3 varchar(10),
--	bed_4 varchar(10),
--	bed_5 varchar(10),
--	bedTotal char(1) NOT NULL
--);

IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='guest')
CREATE TABLE guest(
	guestNo char(10) NOT NULL,
	fName varchar(20) NOT NULL,
	lName varchar(20) NOT NULL,
	sex char(1) NOT NULL,
	telephone char(20) NOT NULL,
	email varchar(50),
	PRIMARY KEY (guestNo) 
);

IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='booking')
CREATE TABLE booking(
	bookingNo char(10) NOT NULL,
	guestNo char(10) NOT NULL,
	roomNo char(5) NOT NULL,
	dateFrom date NOT NULL,
	dateTo date NOT NULL,
	PRIMARY KEY (bookingNo),
	FOREIGN KEY (guestNo) REFERENCES guest (guestNo),
	FOREIGN KEY (roomNo) REFERENCES room (roomNo),
	CONSTRAINT check_date check (dateFrom < dateTo),
	CONSTRAINT check_dateFrom check(dateFrom >= GETDATE())
);
