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