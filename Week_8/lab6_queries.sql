-- VUA-SEN307 Lab 6: Aggregate Functions, Grouping and Subqueries
-- Name: OFOR OTI
-- Matric: VUG/SEN/24/11717

USE sen307_vug_sen_24_11717;

-- TASK 1: Count the students enrolled in each course.
-- LEFT JOIN keeps courses with zero enrolments.
-- COUNT(e.enrolment_id) returns 0 for courses without students.

SELECT
    c.course_id,
    c.course_title,
    COUNT(e.enrolment_id) AS total_students
FROM Course AS c
LEFT JOIN Enrolment AS e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
ORDER BY total_students DESC, c.course_title;


-- TASK 2: Find courses with more than a given number of students.
-- Try the three HAVING thresholds: 3, 5 and 7.

-- Threshold: more than 3 students
SELECT
    c.course_id,
    c.course_title,
    COUNT(e.enrolment_id) AS total_students
FROM Course AS c
LEFT JOIN Enrolment AS e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.enrolment_id) > 3
ORDER BY total_students DESC;

-- Threshold: more than 5 students
SELECT
    c.course_id,
    c.course_title,
    COUNT(e.enrolment_id) AS total_students
FROM Course AS c
LEFT JOIN Enrolment AS e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.enrolment_id) > 5
ORDER BY total_students DESC;

-- Threshold: more than 7 students
SELECT
    c.course_id,
    c.course_title,
    COUNT(e.enrolment_id) AS total_students
FROM Course AS c
LEFT JOIN Enrolment AS e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.enrolment_id) > 7
ORDER BY total_students DESC;


-- TASK 3: Calculate the average number of courses taken per student,
-- including students who have zero courses.
-- The inner query counts courses for every student.
-- The outer query calculates the average of those counts.

SELECT ROUND(AVG(per_student.course_count), 2) AS average_courses_per_student
FROM (
    SELECT
        s.student_id,
        COUNT(e.enrolment_id) AS course_count
    FROM Student AS s
    LEFT JOIN Enrolment AS e
        ON s.student_id = e.student_id
    GROUP BY s.student_id
) AS per_student;


-- TASK 4: Find students who are not enrolled in any course.
-- This is a non-correlated subquery because the inner query
-- does not refer to a column from the outer query.

SELECT
    s.student_id,
    s.matric_no,
    s.full_name
FROM Student AS s
WHERE s.student_id NOT IN (
    SELECT e.student_id
    FROM Enrolment AS e
)
ORDER BY s.full_name;


-- TASK 5: For each department, find the student or students
-- with the highest number of enrolments. Ties are allowed.
-- The subqueries are correlated because they refer to the
-- student and department in the outer query.

SELECT
    d.dept_name,
    s.full_name,
    (
        SELECT COUNT(*)
        FROM Enrolment AS e
        WHERE e.student_id = s.student_id
    ) AS courses
FROM Student AS s
JOIN Department AS d
    ON s.dept_id = d.dept_id
WHERE (
    SELECT COUNT(*)
    FROM Enrolment AS e
    WHERE e.student_id = s.student_id
) = (
    SELECT MAX(
        (
            SELECT COUNT(*)
            FROM Enrolment AS e2
            WHERE e2.student_id = s2.student_id
        )
    )
    FROM Student AS s2
    WHERE s2.dept_id = s.dept_id
)
ORDER BY d.dept_name, s.full_name;
