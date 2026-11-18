-- VUA-SEN307 Week 6 Practical
-- Student: OFOR OTI
-- Matric Number: VUG/SEN/24/11717

USE `sen307_vug_sen_24_11717`;

-- PART 1: DEPARTMENTS AND COURSES

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
 'Architectural styles, design patterns, microservices and how to structure large software systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
 'Processes, threads, CPU scheduling, memory management and file systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
 'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
 'Intelligent agents, search algorithms, knowledge representation and reasoning.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
 'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
 'Exploratory data analysis, charts, dashboards and telling stories with data.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
 'Distributed storage and processing of very large datasets with Hadoop and Spark.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d
LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;


-- PART 2: LECTURERS, STUDENTS AND ENROLMENTS

-- Step 1: Lecturers

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUA/ST/103', 'Mr Chinedu Eze', 'c.eze@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUA/ST/104', 'Dr Aisha Ibrahim', 'a.ibrahim@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUA/ST/105', 'Dr Tunde Adeyemi', 't.adeyemi@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUA/ST/106', 'Mrs Zainab Yusuf', 'z.yusuf@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUA/ST/107', 'Mr Emeka Nwosu', 'e.nwosu@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUA/ST/108', 'Dr Grace Danjuma', 'g.danjuma@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUA/ST/109', 'Mr Samuel Ojo', 's.ojo@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUA/ST/110', 'Mrs Fatima Garba', 'f.garba@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));


-- Step 2: Students

INSERT INTO Student (matric_no, full_name, phone, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/24/11717', 'OFOR OTI', '08030000001', 'M', '2005-04-12',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('20231234', 'Ada Obi', '08030000002', 'F', '2005-03-14',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('20231235', 'John Musa', '08030000003', 'M', '2004-11-02',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('20231236', 'Chika Eze', '08030000004', 'F', '2006-01-19',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('20231237', 'David Okoro', '08030000005', 'M', '2003-08-25',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('20231238', 'Maryam Bello', '08030000006', 'F', '2005-06-11',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('20231239', 'Peter James', '08030000007', 'M', '2007-02-03',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('20231240', 'Ngozi Nnamdi', '08030000008', 'F', '2004-07-16',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('20231241', 'Ibrahim Sani', '08030000009', 'M', '2006-09-08',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('20231242', 'Blessing Etim', '08030000010', 'F', '2003-12-21',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('20231243', 'Samuel Adebayo', '08030000011', 'M', '2005-05-30',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('20231244', 'Ruth Oke', '08030000012', 'F', '2004-02-14',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('20231245', 'Daniel Uche', '08030000013', 'M', '2006-04-07',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('20231246', 'Esther Danladi', '08030000014', 'F', '2007-10-18',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('20231247', 'Kelvin Obi', '08030000015', 'M', '2003-06-09',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('20231248', 'Hauwa Ahmed', '08030000016', 'F', '2005-11-23',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('20231249', 'Michael Ojo', '08030000017', 'M', '2004-09-12',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('20231250', 'Peace Chukwu', '08030000018', 'F', '2006-03-05',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('20231251', 'Josephine Yakubu', '08030000019', 'F', '2005-08-17',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('20231252', 'Ahmed Sule', '08030000020', 'M', '2007-12-01',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science'));


SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;


-- Step 3: Enrolments

INSERT INTO Enrolment (student_id, course_id) VALUES
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/11717'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231234'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231235'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231236'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231237'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231240'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231241'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231242'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),

((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/11717'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
((SELECT student_id FROM Student WHERE matric_no = '20231234'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
((SELECT student_id FROM Student WHERE matric_no = '20231244'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
((SELECT student_id FROM Student WHERE matric_no = '20231249'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN301')),

((SELECT student_id FROM Student WHERE matric_no = '20231235'),
 (SELECT course_id FROM Course WHERE course_code = 'COS301')),
((SELECT student_id FROM Student WHERE matric_no = '20231240'),
 (SELECT course_id FROM Course WHERE course_code = 'COS301')),
((SELECT student_id FROM Student WHERE matric_no = '20231245'),
 (SELECT course_id FROM Course WHERE course_code = 'COS301')),
((SELECT student_id FROM Student WHERE matric_no = '20231250'),
 (SELECT course_id FROM Course WHERE course_code = 'COS301')),

((SELECT student_id FROM Student WHERE matric_no = '20231235'),
 (SELECT course_id FROM Course WHERE course_code = 'COS305')),
((SELECT student_id FROM Student WHERE matric_no = '20231240'),
 (SELECT course_id FROM Course WHERE course_code = 'COS305')),
((SELECT student_id FROM Student WHERE matric_no = '20231250'),
 (SELECT course_id FROM Course WHERE course_code = 'COS305')),

((SELECT student_id FROM Student WHERE matric_no = '20231236'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
((SELECT student_id FROM Student WHERE matric_no = '20231241'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
((SELECT student_id FROM Student WHERE matric_no = '20231246'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
((SELECT student_id FROM Student WHERE matric_no = '20231251'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN301')),

((SELECT student_id FROM Student WHERE matric_no = '20231236'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
((SELECT student_id FROM Student WHERE matric_no = '20231241'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
((SELECT student_id FROM Student WHERE matric_no = '20231246'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN305')),

((SELECT student_id FROM Student WHERE matric_no = '20231236'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231241'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN307')),
((SELECT student_id FROM Student WHERE matric_no = '20231251'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN307')),

((SELECT student_id FROM Student WHERE matric_no = '20231237'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS301')),
((SELECT student_id FROM Student WHERE matric_no = '20231242'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS301')),
((SELECT student_id FROM Student WHERE matric_no = '20231247'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS301')),

((SELECT student_id FROM Student WHERE matric_no = '20231237'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS305')),
((SELECT student_id FROM Student WHERE matric_no = '20231242'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS305')),
((SELECT student_id FROM Student WHERE matric_no = '20231247'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS305')),

((SELECT student_id FROM Student WHERE matric_no = '20231243'),
 (SELECT course_id FROM Course WHERE course_code = 'CYB301')),
((SELECT student_id FROM Student WHERE matric_no = '20231248'),
 (SELECT course_id FROM Course WHERE course_code = 'CYB301')),
((SELECT student_id FROM Student WHERE matric_no = '20231235'),
 (SELECT course_id FROM Course WHERE course_code = 'CYB301')),
((SELECT student_id FROM Student WHERE matric_no = '20231250'),
 (SELECT course_id FROM Course WHERE course_code = 'CYB301')),
((SELECT student_id FROM Student WHERE matric_no = '20231244'),
 (SELECT course_id FROM Course WHERE course_code = 'CYB301'));


-- Course Allocations

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
((SELECT course_id FROM Course WHERE course_code = 'SEN307'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/101')),
((SELECT course_id FROM Course WHERE course_code = 'SEN307'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/102')),
((SELECT course_id FROM Course WHERE course_code = 'SEN301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/102')),
((SELECT course_id FROM Course WHERE course_code = 'COS301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/103')),
((SELECT course_id FROM Course WHERE course_code = 'COS305'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/104')),
((SELECT course_id FROM Course WHERE course_code = 'AIN301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/105')),
((SELECT course_id FROM Course WHERE course_code = 'AIN305'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/106')),
((SELECT course_id FROM Course WHERE course_code = 'AIN307'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/105')),
((SELECT course_id FROM Course WHERE course_code = 'DTS301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/107')),
((SELECT course_id FROM Course WHERE course_code = 'DTS305'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/108')),
((SELECT course_id FROM Course WHERE course_code = 'CYB301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/109'));


-- PART 3: UPDATE A RECORD

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = '20231234';

UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')
WHERE matric_no = '20231234';

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = '20231234';


-- PART 4: REFERENTIAL INTEGRITY

INSERT INTO Department (dept_name)
VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES (
    '20239999',
    'Transfer Student',
    (SELECT dept_id
     FROM Department
     WHERE dept_name = 'Library and Information Science')
);

-- Run this DELETE separately to produce Error 1451 for your screenshot.
-- DELETE FROM Department
-- WHERE dept_name = 'Library and Information Science';

UPDATE Student
SET dept_id = (SELECT dept_id
               FROM Department
               WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

DELETE FROM Department
WHERE dept_name = 'Library and Information Science';

SELECT * FROM Department;


-- FINAL DATA CHECKS

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;

SELECT c.course_code, c.course_title, COUNT(e.student_id) AS student_count
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_code, c.course_title
ORDER BY c.course_code;

SELECT s.matric_no, s.full_name
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
WHERE e.enrolment_id IS NULL;