USE Hotel_MA;

ALTER TABLE booking
ADD CONSTRAINT check_dateTo CHECK (dateTo > GETDATE()),
    CONSTRAINT check_dateFrom CHECK (dateFrom > GETDATE());