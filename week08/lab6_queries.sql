
-- ============================================
-- VUA-SEN307 Lab 6: Aggregate Functions,
-- Grouping and Subqueries
-- Name: OCHIGBO SAMUEL OCHE
-- Matric: VUG/SEN/24/11582
-- ============================================

USE sen307_vug_sen_24_11582;


-- TASK 1: Count students enrolled in each course
-- Explanation: LEFT JOIN includes courses with zero
-- enrolments. COUNT(e.student_id) ignores NULL values,
-- so courses with no students return 0.

SELECT c.course_title,
       COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
ORDER BY total_students DESC;


-- TASK 2: Find courses with more than a given number
-- of students using HAVING.
-- Explanation: HAVING filters grouped results after
-- COUNT has calculated the number of students.

-- Threshold: More than 3 students
SELECT c.course_title,
       COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 3
ORDER BY total_students DESC;


-- Threshold: More than 5 students
SELECT c.course_title,
       COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 5
ORDER BY total_students DESC;


-- Threshold: More than 7 students
SELECT c.course_title,
       COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 7
ORDER BY total_students DESC;


-- TASK 3: Calculate the average number of courses
-- taken per student, including students with zero courses.
-- Explanation: The inner query counts each student's
-- enrolments. The outer query calculates the average
-- of those counts.

SELECT ROUND(AVG(course_count), 2) AS average_courses_per_student
FROM (
    SELECT s.student_id,
           COUNT(e.enrolment_id) AS course_count
    FROM Student s
    LEFT JOIN Enrolment e ON s.student_id = e.student_id
    GROUP BY s.student_id
) AS per_student;


-- TASK 4: Find students not enrolled in any course
-- (Non-correlated subquery).
-- Explanation: The inner query returns student IDs
-- found in Enrolment. NOT IN selects students whose
-- IDs do not appear in that result.

SELECT s.full_name, s.matric_no
FROM Student s
WHERE s.student_id NOT IN (
    SELECT e.student_id
    FROM Enrolment e
)
ORDER BY s.full_name;


-- TASK 5: Find the student(s) with the highest
-- number of enrolments in each department.
-- (Correlated subquery).
-- Explanation: The subqueries compare each student's
-- enrolment count with the highest count among students
-- in the same department. Ties are included.

SELECT d.dept_name,
       s.full_name,
       (
           SELECT COUNT(*)
           FROM Enrolment e
           WHERE e.student_id = s.student_id
       ) AS courses
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE (
    SELECT COUNT(*)
    FROM Enrolment e
    WHERE e.student_id = s.student_id
) = (
    SELECT MAX(student_course_count)
    FROM (
        SELECT s2.student_id,
               COUNT(e2.enrolment_id) AS student_course_count
        FROM Student s2
        LEFT JOIN Enrolment e2 ON s2.student_id = e2.student_id
        WHERE s2.dept_id = s.dept_id
        GROUP BY s2.student_id
    ) AS department_counts
)
ORDER BY d.dept_name, s.full_name;
