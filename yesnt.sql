-- #1:
SELECT first_name AS "first name:", last_name AS "last name:"
FROM student;

-- #2:
SELECT instructor_id AS "instructor id:"
FROM instructor 
WHERE tenured > 0;

-- #3:
SELECT CONCAT(student.first_name," ",student.last_name) AS "student name:", IF(advisor_id = instructor_id, CONCAT(instructor.first_name," ",instructor.last_name), "") AS "advisor name: "
FROM student, instructor
WHERE advisor_id > 0 AND advisor_id = instructor_id;

-- #4:
SELECT
	instructor_id, instructor.first_name, instructor.last_name
FROM
	instructor
LEFT JOIN
	student
ON
	student.advisor_id = instructor_id
WHERE
	student.advisor_id is null
;

-- #5 I cant figure it out:
SELECT 
	CONCAT(first_name, last_name) AS "instructor:", course_name
FROM
	instructor
INNER JOIN
	course
ON
	course.instructor_id = instructor.instructor_id
WHERE
	course.instructor_id = instructor.instructor_id
;

-- #6:
SELECT 
	course_code, course_name
FROM
	course
WHERE
	course_code LIKE '_____3%'
;

-- #7:
SELECT 
	course_code, CONCAT(first_name, last_name) AS "instructor:", num_credits
FROM
	student_schedule, course, instructor
WHERE
	student_id = 1  
    AND student_schedule.course_id = course.course_id
    AND course.instructor_id = instructor.instructor_id
;
