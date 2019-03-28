select*from room

EXEC sp_helpsrvrole;
CREATE LOGIN Julie with password='Julie'
CREATE USER Julie FOR LOGIN Julie;
CREATE ROLE receptionist;
ALTER ROLE receptionist add member Julie;
GRANT SELECT,UPDATE,INSERT,DELETE ON dbo.room TO Julie; 