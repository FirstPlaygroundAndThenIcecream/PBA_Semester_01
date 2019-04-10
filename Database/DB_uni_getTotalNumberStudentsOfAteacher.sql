SELECT*FROM student;

SELECT student.ID, student.name, takes.grade, course.title, course.credits as total
FROM student 
INNER JOIN takes ON student.ID = takes.ID 
INNER JOIN course ON takes.course_id = course.course_id
WHERE (student.name <> 'Peter')

DBCC showcontig('student')

CREATE NONCLUSTERED INDEX indnc ON student(tot_cred)

SELECT name, tot_cred FROM student WHERE id=17600;


exec sp_help
exec sp_helpindex 'student'

--------------------------------count total amount of students who takes class of a specific teacher--------
----------------------------------------option 1----------------------------------------------
SELECT COUNT(DISTINCT student.ID) AS LileyClass FROM 
	(SELECT*FROM instructor WHERE name='Liley') AS ins
JOIN teaches ON ins.ID = teaches.ID
JOIN course ON teaches.course_id=course.course_id
JOIN takes ON course.course_id=takes.course_id
JOIN student ON takes.ID = student.ID
GROUP BY takes.year

----------------------------------------option 2----------------------------------------------
SELECT COUNT(DISTINCT id) FROM takes WHERE course_id in 
(SELECT course_id FROM teaches WHERE teaches.id in (
SELECT i.id FROM instructor i WHERE i.name='Liley'
));


