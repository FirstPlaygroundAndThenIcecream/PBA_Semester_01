--SELECT Staff.sno, Staff.fname, Staff.lname,
--COUNT(Property_For_Rent.pno) AS total_property
--FROM Staff
--FULL JOIN Property_For_Rent ON Staff.sno = Property_For_Rent.sno
--GROUP BY Staff.sno, Staff.fname, Staff.lname;

--SELECT * FROM Staff; 
--SELECT * FROM Property_For_Rent;

USE Dreamhome
CREATE VIEW Property_For_Rent_VIEW AS
SELECT Property_For_Rent.pno, Property_For_Rent.sno, Branch.bno 
FROM Property_For_Rent, Staff, Branch
WHERE Property_For_Rent.sno = Staff.sno AND Property_For_Rent.bno = Branch.bno;

--CREATE VIEW Property_Owner_VIEW AS
--SELECT Property_For_Rent.pno, Property_For_Rent.ono, Owner.ono, Owner.fname, Owner.lname
--FROM Property_For_Rent, Owner
--WHERE Property_For_Rent.ono = Owner.ono;

--DROP VIEW IF EXISTS Property_For_Rent;
--GO