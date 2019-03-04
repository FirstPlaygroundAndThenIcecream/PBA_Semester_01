CREATE VIEW Property_Owner_VIEW AS
SELECT Property_For_Rent.pno, Property_For_Rent.ono, Owner.fname, Owner.lname
FROM Property_For_Rent, Owner
WHERE Property_For_Rent.ono = Owner.ono;