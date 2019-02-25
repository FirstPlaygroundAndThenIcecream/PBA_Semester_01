USE mydb_test;

CREATE Table Staff(
	staff_id int ,
	fname varchar(25), 
	lname varchar(25),
	staff_address varchar(50),
	phone int,
	position varchar(10),
	sex char(1),
	salary int,
	branch char not null FOREIGN KEY REFERENCES Branch(bno),
	PRIMARY KEY	(staff_id),
	);

CREATE Table Owner(
	owner_id char(5) not null,
	firstName varchar(25), 
	lastName varchar(25), 
	owner_address varchar(50),
	phone int,
	cpr int,
	type_of_owner varchar(50)
);

CREATE Table Client(
	client_id char(5) not null ,
	fname varchar(25), 
	lname varchar(25),
	client_address varchar(50),
	phone int,cpr int,
	pref_type varchar(10),
	max_rent int,
	PRIMARY KEY (client_id));

CREATE Table Property_For_Rent(
	pno char(5) not null PRIMARY KEY, 
	street varchar(35), 
	area varchar(10), 
	city varchar(10), 
	pcode varchar(10), 
	type varchar(10), 
	rooms smallint, 
	rent int, 
	ono char(5) not null, 
	sno char(5) not null, 
	bno char(5));

CREATE Table Branch(
	bno char not null ,
	street varchar(50),
	area varchar(50) ,
	city varchar(50),
	pcode varchar(10),
	tel_no char(10),
	fax_no char(15),
	PRIMARY KEY(bno));

CREATE Table  Viewing(
	client_id char(5) not null FOREIGN KEY REFERENCES Client(client_id),
	pno char(5) not null FOREIGN KEY REFERENCES Property_For_Rent(pno), 
	date char(9), 
	comment varchar(15),
	PRIMARY KEY	(client_id,pno,date));

ALTER TABLE Client
ADD CONSTRAINT CL_preferences CHECK (phone >100000);

ALTER TABLE Property_for_rent
ADD CONSTRAINT PK_property_for_rent PRIMARY KEY (bno);

CREATE RULE pattern_rule
AS
@value LIKE '__-%[0-9]';

USE mydb_test;
GO
EXEC sp_bindrule 'pattern_rule', 
'Branch.bno';



