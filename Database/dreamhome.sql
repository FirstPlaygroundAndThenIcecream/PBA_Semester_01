IF NOT EXISTS (SELECT * FROM sys.databases where name = 'dreamhome_ex')
CREATE DATABASE dreamhome_ex;

USE dreamhome_ex;

IF NOT EXISTS (SELECT * FROM sysobjects where name = 'Staff')
CREATE TABLE Staff (
	staffNo char(5) NOT NULL,
	fName varchar(50) NOT NULL,
	lName varchar(50) NOT NULL,
	position varchar(60),
	sex char(3), 
	DOB char(10)
);

IF NOT EXISTS (SELECT * FROM sysobjects where name = 'Property_for_rent')
CREATE TABLE Property_for_rent (
	propertyNo char(5) NOT NULL,
	city varchar(100) NOT NULL,
	street varchar(50) NOT NULL,
	ZIPcode varchar(10) NOT NULL,
	type varchar(10), 
	rooms char(10),
	rent int
);

IF NOT EXISTS(SELECT * FROM sysobjects where name = 'Client')
CREATE TABLE Client(
	clientNo char(5) NOT NULL,
	fName varchar(50),
	lName varchar(50),
	telNo char(15)
);

IF NOT EXISTS(SELECT * FROM sysobjects where name = 'Lease')
CREATE TABLE Lease(
	leaseNo char(5) NOT NULL,
	paymentMethod varchar(30) NOT NULL,
	depositPaid char(10),
	rentStart date,
	rentFinish date,
	deposit char(10),
	duration char(10)
);

IF NOT EXISTS(SELECT * FROM sysobjects where name = 'Owner')
CREATE TABLE Owner(
	ownerNo char(5) NOT NULL,
	address varchar(35),
	telNo char(15)
);

ALTER TABLE Staff
ADD CONSTRAINT staff_PK PRIMARY KEY (staffNo);

