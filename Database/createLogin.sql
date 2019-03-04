EXEC sp_helpsrvrole;
--CREATE LOGIN Marie with password = 'Marie';
--CREATE USER Marie FOR LOGIN Marie;
--CREATE ROLE office;
--alter role office add member Marie;
--GRANT SELECT on Property_Owner_VIEW to Marie;

EXECUTE AS USER='Marie';
SELECT*FROM Property_Owner_VIEW;