CREATE PROCEDURE usp_archiveOldRecord
AS
BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO old_booking
		SELECT * FROM booking
		WHERE booking.dateTo < '2019-04-01';
		
		DELETE FROM booking
		WHERE booking.dateTo < '2019-04-01';

		COMMIT
END TRY
BEGIN CATCH
	ROLLBACK
END CATCH

EXEC usp_archiveOldRecord

SELECT*FROM old_booking
SELECT*FROM booking
