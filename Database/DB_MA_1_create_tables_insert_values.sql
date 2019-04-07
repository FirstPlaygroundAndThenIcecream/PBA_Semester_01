--Drop database Hotel_MA;

-----------------------create database--------------------------------------------------------
IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME='Hotel_MA')
CREATE DATABASE Hotel_MA;

------------------------create tables--------------------------------------------------------------
USE Hotel_MA; 

--------------------table: room category--------------------------------------
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

--------------------table: price--------------------------------------
IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='price')
CREATE TABLE price(
	priceType char(5) NOT NULL,
	roomType char(5) NOT NULL,
	price smallmoney NOT NULL check (price > 0),
	PRIMARY KEY (priceType),
	FOREIGN KEY (roomType) REFERENCES room_category(roomType)
);

--------------------table: room--------------------------------------
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

--------------------table: guest--------------------------------------
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

--------------------table: booking--------------------------------------
DROP TABLE booking;
IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='booking')
CREATE TABLE booking(
	bookingNo char(10) NOT NULL,
 	guestNo char(10) NOT NULL,
	roomNo char(5) NOT NULL,
	dateFrom date NOT NULL,
	dateTo date NOT NULL,
	total_stay AS DATEDIFF(DAY, dateFrom, dateTo)
	PRIMARY KEY (bookingNo),
	FOREIGN KEY (guestNo) REFERENCES guest (guestNo),
	FOREIGN KEY (roomNo) REFERENCES room (roomNo),
	CONSTRAINT check_date check (dateFrom < dateTo),
	--CONSTRAINT check_dateFrom check (dateFrom >= CONVERT(date, GETDATE()))
);
ALTER TABLE booking
DROP CONSTRAINT check_dateFrom

ALTER TABLE booking WITH NOCHECK  --add constraint 
ADD CONSTRAINT check_dateFrom CHECK (dateFrom > CONVERT(date, GETDATE()));

--------------------table: cancelled booking--------------------------------------
IF NOT EXISTS(SELECT*FROM sys.objects WHERE name='cancelled_booking')
CREATE TABLE cancelled_booking(
	bookingNo char(10) NOT NULL,
	guestNo char(10) NOT NULL,
	roomNo char(5) NOT NULL,
	dateFrom date NOT NULL,
	dateTo date NOT NULL,
	total_stay AS DATEDIFF(DAY, dateFrom, dateTo)
	PRIMARY KEY (bookingNo),
	FOREIGN KEY (guestNo) REFERENCES guest (guestNo),
	FOREIGN KEY (roomNo) REFERENCES room (roomNo),
);

--------------------table: archived booking--------------------------------------
DROP TABLE old_booking;
IF NOT EXISTS (SELECT*FROM sys.objects WHERE NAME='old_booking')
CREATE TABLE old_booking(
	bookingNo char(10) NOT NULL,
	guestNo char(10) NOT NULL,
	roomNo char(5) NOT NULL,
	dateFrom date NOT NULL,
	dateTo date NOT NULL,
	total_stay int
	PRIMARY KEY (bookingNo),
	FOREIGN KEY (guestNo) REFERENCES guest (guestNo),
	FOREIGN KEY (roomNo) REFERENCES room (roomNo)
);

--------------------------------populate tables with values------------------------------------
delete from booking;
delete from room;
delete from price;
delete from room_category;
delete from guest;

insert into room_category values('s01', 'False', 'True', 'True', 'Standard', NULL, NULL, NULL, NULL, NULL);
insert into room_category values('s02', 'False', 'False', 'True', 'Standard', NULL, NULL, NULL, NULL, NULL);
insert into room_category values('d01', 'False', 'True', 'True', 'Standard', 'Standard', NULL, NULL, NULL, NULL);
insert into room_category values('d02', 'False', 'True', 'True', 'kingsize', NULL, NULL, NULL, NULL, NULL);
insert into room_category values('d03', 'True', 'True', 'True', 'kingsize', NULL, NULL, NULL, NULL, NULL);
insert into room_category values('f01', 'True', 'True', 'True', 'kingsize', 'Standard', 'Standard', NULL, NULL, NULL);
insert into room_category values('f02', 'False', 'True', 'True', 'Standard', 'Standard', 'Standard', 'Standard', NULL, NULL);
insert into room_category values('f03', 'False', 'True', 'True', 'Standard', 'Standard', 'Standard', NULL, NULL, NULL);

insert into price values('pt1', 's01', '899');
insert into price values('pt2', 's02', '769');
insert into price values('pt3', 'd01', '1250');
insert into price values('pt4', 'd02', '1299');
insert into price values('pt5', 'd03', '1399');
insert into price values('pt6', 'f01', '1799');
insert into price values('pt7', 'f02', '1689');
insert into price values('pt8', 'f03', '1399');

insert into room values('f100', 's01', 'pt1');
insert into room values('f101', 's02', 'pt2');
insert into room values('f102', 's01', 'pt1');
insert into room values('f103', 's01', 'pt1');
insert into room values('f104', 's01', 'pt1');
insert into room values('f105', 'd01', 'pt3');
insert into room values('f201', 'd01', 'pt3');
insert into room values('f202', 'd01', 'pt3');
insert into room values('f203', 'd01', 'pt3');
insert into room values('f204', 'd02', 'pt4');
insert into room values('f205', 'd02', 'pt4');
insert into room values('f301', 'd02', 'pt4');
insert into room values('f302', 'd02', 'pt4');
insert into room values('f303', 'd02', 'pt4');
insert into room values('f304', 'd03', 'pt5');
insert into room values('f305', 'd03', 'pt5');
insert into room values('f306', 'f01', 'pt6');
insert into room values('f307', 'f01', 'pt6');
insert into room values('f308', 'f02', 'pt7');
insert into room values('f309', 'f02', 'pt7');

insert into guest values('g1', 'Johan', 'Petersen', 'M', '+4555505435', 'j_pe@yahoo.com');
insert into guest values('g2', 'Tine', 'Andersen', 'F', '+4552689999', 'tine_andersen@gmail.com');
insert into guest values('g3', 'Erik', 'Bit', 'M', '+4541574121', 'erik99@mail.com');
insert into guest values('g4', 'Johan', 'Bergsø', 'M', '+4545557845', 'bergsø@gmail.com');
insert into guest values('g5', 'Johan', 'Petersen', 'M', '+4542165470', 'johanp@gmail.com');
insert into guest values('g6', 'Melissa', 'Pat', 'F', '+4544065570', 'melissa_p@gmail.com');

insert into booking values('br01', 'g1', 'f100', '2019-04-10', '2019-04-14');
insert into booking values('br02', 'g2', 'f203', '2019-03-27', '2019-04-04');
insert into booking values('br03', 'g3', 'f103', '2019-03-27', '2019-03-29');
insert into booking values('br04', 'g4', 'f304', '2019-03-28', '2019-04-02');
insert into booking values('br05', 'g5', 'f205', '2019-04-01', '2019-04-02');
insert into booking values('br06', 'g2', 'f205', '2019-05-12', '2019-05-16');
insert into booking values('br07', 'g4', 'f205', '2019-05-01', '2019-05-04');
insert into booking values('br08', 'g6', 'f303', '2019-03-28', '2019-03-29');
insert into booking values('br09', 'g2', 'f301', '2019-04-28', '2019-04-29');
insert into booking values('br10', 'g1', 'f202', '2019-05-01', '2019-05-04');
insert into booking values('br11', 'g6', 'f309', '2019-04-28', '2019-04-30');
insert into booking values('br12', 'g4', 'f305', '2019-04-29', '2019-05-02');
insert into booking values('br13', 'g4', 'f205', '2019-04-20', '2019-04-24');
insert into booking values('br16', 'g3', 'f205', '2019-07-20', '2019-07-24');

delete from booking where booking.bookingNo='br07';
delete from booking where booking.bookingNo='br10'
delete from booking where booking.bookingNo='br11'

insert into cancelled_booking values('br07', 'g4', 'f205', '2019-05-01', '2019-05-04');
insert into cancelled_booking values('br10', 'g1', 'f202', '2019-05-01', '2019-05-04');
insert into cancelled_booking values('br11', 'g6', 'f309', '2019-04-28', '2019-04-30');
insert into cancelled_booking values('br14', 'g6', 'f309', '2019-06-11', '2019-06-17');
insert into cancelled_booking values('br15', 'g2', 'f202', '2019-06-11', '2019-06-17');

