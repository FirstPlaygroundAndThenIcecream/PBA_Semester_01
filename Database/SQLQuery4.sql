CREATE VIEW Property_For_Rent_VIEW AS
SELECT Property_For_Rent.pno, Property_For_Rent.sno, Branch.bno 
FROM Property_For_Rent, Staff, Branch
WHERE Property_For_Rent.sno = Staff.sno AND Property_For_Rent.bno = Branch.bno;