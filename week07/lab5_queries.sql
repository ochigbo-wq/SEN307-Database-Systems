
-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: OCHIGBO SAMUEL OCHE
-- Matric: VUG/SEN/24/11582
-- ============================================

USE sen307_vug_sen_24_11582;

-- TASK 1: Students in one department, sorted A-Z
-- Explanation: Retrieves all students in Software Engineering
-- and sorts their names alphabetically.

SELECT s.full_name, s.matric_no, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;


-- TASK 2: Courses with their lecturers (INNER JOIN)
-- Explanation: Displays each course alongside the lecturer
-- assigned to teach it. Courses with two lecturers appear twice.

SELECT c.course_code, c.course_title, l.full_name AS lecturer_name
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code, l.full_name;


-- TASK 3: Students and their courses (LEFT JOIN)
-- Explanation: Displays every student and their enrolled courses.
-- Students without enrolments appear with NULL course titles.

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;


-- TASK 3 (ADDITIONAL): Students without courses
-- Explanation: Shows only students who have no course enrolments.

SELECT s.full_name, s.matric_no
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
WHERE e.enrolment_id IS NULL
ORDER BY s.full_name;


-- TASK 4: Filtering with AND, IN and BETWEEN
-- Explanation: Retrieves female students in Software Engineering
-- or Artificial Intelligence who were born between 2004 and 2005.

SELECT s.full_name, s.gender, s.date_of_birth, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE s.gender = 'F'
AND d.dept_name IN ('Software Engineering', 'Artificial Intelligence')
AND s.date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY s.full_name;


-- TASK 5: Paginating enrolments
-- Explanation: Displays the first 10 enrolment records.
-- ORDER BY ensures consistent ordering of the results.

-- Page 1: Rows 1-10
SELECT *
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;


-- Page 2: Rows 11-20
-- Explanation: Skips the first 10 records and displays the next 10.

SELECT *
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;


-- OPTIONAL CHALLENGE: RIGHT JOIN
-- Explanation: Returns every student, including those without
-- enrolments. RIGHT JOIN preserves all rows from Student.

SELECT s.full_name, c.course_title
FROM Enrolment e
RIGHT JOIN Student s ON e.student_id = s.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

-- The LEFT JOIN version is easier to read because Student
-- is the starting table and all students must be included.
