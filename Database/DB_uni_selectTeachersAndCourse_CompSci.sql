SELECT COUNT(*) FROM student;
SELECT * FROM teaches WHERE ID = '3335' ;
SELECT * FROM instructor;
SELECT*FROM course WHERE course.dept_name='Comp. Sci.';
SELECT*FROM instructor JOIN teaches ON instructor.ID = teaches.ID WHERE instructor.dept_name = 'Comp. Sci.';

------get all teachers' name and their courses in Comp.Sci-------------------

----------------option1---------------------------
SELECT instructor.name, tc.title
FROM (
	SELECT teaches.ID, course.title FROM teaches 
	INNER JOIN course ON teaches.course_id = course.course_id
	) AS tc
INNER JOIN instructor ON instructor.ID = tc.ID
WHERE (instructor.dept_name='Comp. Sci.')

----------------option2---------------------------
SELECT * FROM course 
INNER JOIN teaches ON teaches.course_id=course.course_id
WHERE teaches.id IN (
	SELECT id FROM instructor 
	WHERE dept_name='Comp. Sci.'
)

----------------option3---------------------------
SELECT instructor.name, instructor.dept_name, course.title, course.dept_name 
FROM instructor 
JOIN teaches ON instructor.ID = teaches.ID AND instructor.dept_name='Comp. Sci.'
JOIN course ON teaches.course_id = course.course_id --AND instructor.dept_name=course.dept_name
--WHERE instructor.dept_name='Comp. Sci.' --AND course.dept_name='Comp. Sci.';
