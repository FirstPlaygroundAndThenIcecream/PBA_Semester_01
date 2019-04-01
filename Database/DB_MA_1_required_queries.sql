---------select all current guests-----------------
SELECT*FROM booking
WHERE dateFrom <= CONVERT(date, GETDATE()) AND dateTo >= CONVERT(date, GETDATE()); 


SELECT *FROM booking;

select roomNo, COUNT(roomNo) AS booked_times
from booking
group by roomNo;

select MAX(roomNo)
from booking;

CREATE FUNCTION find_most_booked_room