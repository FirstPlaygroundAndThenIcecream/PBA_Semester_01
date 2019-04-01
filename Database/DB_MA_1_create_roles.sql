USE Hotel_MA;
select*from room;

------------create roles in database level----------------------------
------receptionist can only access vw_booking_detail-------------------
CREATE ROLE receptionist;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.vw_booking_detail TO receptionist; 
--REVOKE SELECT,UPDATE,INSERT,DELETE ON vw_booking_detail FROM receptionist;

---------manager has access to all tables in database-----------------------
CREATE ROLE manager;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.room TO manager; 
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.guest TO manager; 
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.price TO manager;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.room_category TO manager;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.booking TO manager;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.vw_booking_detail TO manager; 
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.vw_hotel_status TO manager; 
--REVOKE SELECT,UPDATE,INSERT,DELETE ON dbo.vw_booking_detail FROM manager; 

-----------show all current roles in the database----------------------
EXEC sp_helprole;

-----------create logins and add them to roles--------------------------------
---------------receptionist--------------------------------------
CREATE LOGIN Julie with password='Julie'
CREATE USER Julie FOR LOGIN Julie;
ALTER ROLE receptionist add member Julie;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.room TO Julie; 
REVOKE SELECT,UPDATE,INSERT,DELETE ON dbo.room FROM Julie;

CREATE LOGIN Mia with password='Mia'
CREATE USER Mia FOR LOGIN Mia;
ALTER ROLE receptionist add member Mia;

CREATE LOGIN Liam with password='Liam'
CREATE USER Liam FOR LOGIN Liam;
ALTER ROLE receptionist add member Liam;

------just to test drop user login------------------
--CREATE LOGIN Mike with password='Mike'
--CREATE USER Mike FOR LOGIN Mike;
--ALTER ROLE receptionist add member Mike;
--DROP USER IF EXISTS Mike;
--DROP LOGIN Mike;

------------------manager----------------------------
CREATE LOGIN Joe with password='Joe'
CREATE USER Joe FOR LOGIN Joe;
ALTER ROLE manager add member Joe;

CREATE LOGIN Cliff with password='Cliff'
CREATE USER Cliff FOR LOGIN Cliff;
ALTER ROLE manager add member Cliff;

CREATE LOGIN Peter with password='Peter'
CREATE USER Peter FOR LOGIN Peter;
ALTER ROLE manager add member Peter;



