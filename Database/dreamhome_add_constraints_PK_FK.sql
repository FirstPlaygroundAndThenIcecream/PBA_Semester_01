--ALTER TABLE Property_For_Rent
--ADD CONSTRAINT PK_pno PRIMARY KEY (pno);

--ALTER TABLE Staff
--ADD CONSTRAINT PK_sno PRIMARY KEY (sno);

--ALTER TABLE Viewing
--ADD CONSTRAINT PK_viewing_rno PRIMARY KEY (rno, pno);

--ALTER TABLE Staff
--ADD CONSTRAINT FK_branchNo
--FOREIGN KEY (bno) REFERENCES Branch(bno);

--ALTER TABLE Property_For_Rent
--ADD CONSTRAINT FK_sno_bno_ono
--FOREIGN KEY (sno) REFERENCES Staff(sno),
--FOREIGN KEY (ono) REFERENCES Owner(ono),
--FOREIGN KEY (bno) REFERENCES Branch(bno);

--ALTER TABLE Viewing
--ADD CONSTRAINT FK_propertyID
--FOREIGN KEY (pno) REFERENCES Property_For_Rent(pno);

ALTER TABLE Viewing
ADD CONSTRAINT FK_renterID
FOREIGN KEY (rno) REFERENCES Renter(rno);
