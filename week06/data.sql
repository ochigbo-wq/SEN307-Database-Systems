
-- VERITAS UNIVERSITY, ABUJA
-- SEN307 DATABASE SYSTEMS
-- WEEK 6 PRACTICAL: DML
-- Student: OCHIGBO SAMUEL OCHE
-- Matric No: VUG/SEN/24/11582

USE sen307_vug_sen_24_11582;

-- ==========================================
-- PART 1: INSERT DEPARTMENTS
-- ==========================================

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

-- ==========================================
-- PART 1: INSERT COURSES
-- ==========================================

INSERT INTO Course
(course_code, course_title, credit_units, description, dept_id)
VALUES
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

-- CHECK DEPARTMENTS AND COURSES

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d
LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

-- ==========================================
-- PART 2: INSERT 10 LECTURERS
-- ==========================================

INSERT INTO Lecturer
(staff_no, full_name, email, dept_id)
VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Dr Chinedu Eze', 'c.eze@vua.edu.ng', 2),
('VUA/ST/104', 'Dr Fatima Ibrahim', 'f.ibrahim@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Ngozi Okeke', 'n.okeke@vua.edu.ng', 3),
('VUA/ST/106', 'Dr Ahmed Yusuf', 'a.yusuf@vua.edu.ng', 3),
('VUA/ST/107', 'Dr Peter James', 'p.james@vua.edu.ng', 4),
('VUA/ST/108', 'Dr Grace Nwosu', 'g.nwosu@vua.edu.ng', 4),
('VUA/ST/109', 'Dr Samuel Ade', 's.ade@vua.edu.ng', 5),
('VUA/ST/110', 'Dr Mary Danjuma', 'm.danjuma@vua.edu.ng', 5);

-- ==========================================
-- PART 2: INSERT 20 STUDENTS
-- ==========================================

INSERT INTO Student
(matric_no, full_name, gender, date_of_birth, dept_id)
VALUES
('VUG/SEN/24/11582', 'OCHIGBO SAMUEL OCHE', 'M', NULL, 1),
('20231234', 'Ada Obi', 'F', '2005-03-14', 1),
('20231235', 'John Musa', 'M', '2004-11-02', 2),
('20231236', 'Chika Nwosu', 'F', '2006-01-21', 1),
('20231237', 'Ibrahim Bello', 'M', '2003-08-17', 2),
('20231238', 'Zainab Yusuf', 'F', '2005-06-09', 3),
('20231239', 'Tunde Bakare', 'M', '2004-02-25', 4),
('20231240', 'Grace Eze', 'F', '2007-04-11', 1),
('20231241', 'David Okonkwo', 'M', '2003-12-19', 2),
('20231242', 'Aisha Mohammed', 'F', '2006-07-30', 5),
('20231243', 'Emeka Okafor', 'M', '2005-09-05', 3),
('20231244', 'Fatima Abdullahi', 'F', '2004-10-16', 5),
('20231245', 'Samuel Ojo', 'M', '2007-02-08', 4),
('20231246', 'Blessing Danjuma', 'F', '2003-05-27', 1),
('20231247', 'Peter Uche', 'M', '2006-11-13', 2),
('20231248', 'Maryam Sule', 'F', '2005-01-04', 3),
('20231249', 'Daniel James', 'M', '2004-08-22', 4),
('20231250', 'Esther Paul', 'F', '2007-06-18', 5),
('20231251', 'Kelechi Obi', 'M', '2005-12-03', 1),
('20231252', 'Hauwa Aliyu', 'F', '2006-03-26', 2);

-- ==========================================
-- CHECK STUDENT AND LECTURER IDS
-- ==========================================

SELECT student_id, matric_no, full_name FROM Student;

SELECT lecturer_id, full_name FROM Lecturer;

-- ==========================================
-- PART 2: INSERT 40 ENROLMENTS
-- ==========================================

INSERT INTO Enrolment (student_id, course_id) VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),

(1,2),
(2,2),
(3,2),
(4,2),

(5,3),
(6,3),
(7,3),
(8,3),

(9,4),
(10,4),
(11,4),
(12,4),

(13,5),
(14,5),
(15,5),
(16,5),

(1,6),
(9,6),
(13,6),
(17,6),

(2,7),
(10,7),
(14,7),
(18,7),

(3,8),
(11,8),
(15,8),

(4,9),
(12,9),
(16,9),

(5,10),
(17,10);

-- ==========================================
-- PART 2: COURSE ALLOCATIONS
-- 11 allocations; Course 1 has two lecturers
-- ==========================================

INSERT INTO CourseAllocation
(course_id, lecturer_id) VALUES
(1,1),
(1,2),
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(7,8),
(8,9),
(9,10),
(10,1);

-- ==========================================
-- PART 3: UPDATE A STUDENT'S DEPARTMENT
-- ==========================================

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = '20231234';

SET SQL_SAFE_UPDATES = 0;

UPDATE Student
SET dept_id = 2
WHERE matric_no = '20231234';

SET SQL_SAFE_UPDATES = 1;

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = '20231234';

-- ==========================================
-- PART 4: REFERENTIAL INTEGRITY
-- Run the following statements individually.
-- ==========================================

-- STEP 1: CREATE A TEMPORARY DEPARTMENT

INSERT INTO Department (dept_name)
VALUES ('Library and Information Science');

-- STEP 2: ADD A STUDENT TO THAT DEPARTMENT

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES (
    '20239999',
    'Transfer Student',
    (SELECT dept_id
     FROM Department
     WHERE dept_name = 'Library and Information Science')
);

-- STEP 3: DELIBERATE ERROR 1451
-- Execute this statement separately and take a screenshot.
-- It should fail because a student still references the department.

-- DELETE FROM Department
-- WHERE dept_name = 'Library and Information Science';

-- STEP 4: FIX THE FOREIGN KEY PROBLEM

UPDATE Student
SET dept_id = (
    SELECT dept_id
    FROM Department
    WHERE dept_name = 'Software Engineering'
)
WHERE matric_no = '20239999';

-- STEP 5: DELETE THE DEPARTMENT AFTER REASSIGNMENT

DELETE FROM Department
WHERE dept_name = 'Library and Information Science';

-- ==========================================
-- FINAL VERIFICATION
-- ==========================================

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
