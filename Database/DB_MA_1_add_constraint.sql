USE Hotel_MA;
DROP table booking;


---------------drop contstraint---------------------------------
--ALTER TABLE booking
--DROP CONSTRAINT check_date;

-------------add constraint for check date----------------------
--ALTER TABLE booking
--ADD CONSTRAINT check_date CHECK(dateTo > dateFrom),
--    CONSTRAINT check_dateFrom CHECK (dateFrom > GETDATE());