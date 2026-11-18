-- VUA-SEN307 Lab 5
-- Name: Ofor Oti
-- Matric:VUG/SEN/24/11717

-- WEEK 6 data verification
SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL
SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL
SELECT 'Students', COUNT(*) FROM Student
UNION ALL
SELECT 'Courses', COUNT(*) FROM Course
UNION ALL
SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL
SELECT 'Allocations', COUNT(*) FROM CourseAllocation;



USE sen307_vug_sen_24_11717;

-- Task 1
SELECT s.student_id, s.full_name, d.dept_name
FROM Student AS s
INNER JOIN Department AS d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

-- Task 2
SELECT c.course_id, c.course_title, l.full_name AS lecturer_name
FROM Course AS c
INNER JOIN CourseAllocation AS ca ON c.course_id = ca.course_id
INNER JOIN Lecturer AS l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_title ASC, l.full_name ASC;

-- Task 3
SELECT s.student_id, s.full_name, c.course_title
FROM Student AS s
LEFT JOIN Enrolment AS e ON s.student_id = e.student_id
LEFT JOIN Course AS c ON e.course_id = c.course_id
ORDER BY s.full_name ASC, c.course_title ASC;

-- Task 3: Students without enrolments
SELECT s.student_id, s.full_name
FROM Student AS s
LEFT JOIN Enrolment AS e ON s.student_id = e.student_id
LEFT JOIN Course AS c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;

-- Task 4
SELECT s.student_id, s.full_name, s.gender, s.dept_id, s.date_of_birth
FROM Student AS s
WHERE s.gender = 'F'
AND s.dept_id IN (1, 3)
AND s.date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY s.full_name ASC;

-- Task 5: Page 1
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 0;

-- Task 5: Page 2
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 10;

-- Optional RIGHT JOIN Challenge
SELECT s.student_id, s.full_name, c.course_title
FROM Enrolment AS e
RIGHT JOIN Student AS s ON e.student_id = s.student_id
LEFT JOIN Course AS c ON e.course_id = c.course_id
ORDER BY s.full_name ASC, c.course_title ASC;
