--Drop database Hotel_MA;

IF NOT EXISTS(SELECT * FROM sys.databases WHERE NAME='Hotel_MA')
CREATE DATABASE Hotel_MA;