EXEC sp_helpsrvrole;
CREATE LOGIN xian with password = 'xian123456789';
CREATE USER xian FOR LOGIN xian;
GO
--CREATE ROLE office;
--alter role office add member sa;
--GRANT SELECT on Property_Owner_VIEW to Marie;

--EXECUTE AS USER='Marie';
--SELECT*FROM Property_Owner_VIEW;
