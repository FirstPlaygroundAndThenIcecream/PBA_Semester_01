USE Hotel_MA;
select*from room;

------------create roles in database level----------------------------
CREATE ROLE receptionist;
CREATE ROLE manager;

-----------show all current roles in the database----------------------
EXEC sp_helprole;

-----------create logins and add them to roles--------------------------------
CREATE LOGIN Julie with password='Julie'
CREATE USER Julie FOR LOGIN Julie;
ALTER ROLE receptionist add member Julie;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.room TO Julie; 

CREATE LOGIN Mia with password='Mia'
CREATE USER Mia FOR LOGIN Mia;
ALTER ROLE receptionist add member Mia;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.room TO Mia; 

CREATE LOGIN Mike with password='Mike'
CREATE USER Mike FOR LOGIN Mike;
ALTER ROLE receptionist add member Mike;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.room TO Mike; 

