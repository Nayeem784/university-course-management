-- =====================================================
-- Query 1: List students enrolled in a specific course
-- This query joins student, enrollment, and course tables
-- =====================================================
SELECT
    s.student_id,
    s.student_name,
    c.course_name
FROM student s
JOIN enrollment e
    ON s.student_id = e.student_id
JOIN course c
    ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';


-- =====================================================
-- Query 2: List courses taught by a specific instructor
-- This query joins instructor and course tables
-- =====================================================
SELECT
    i.instructor_id,
    i.instructor_name,
    c.course_name
FROM instructor i
JOIN course c
    ON i.instructor_id = c.instructor_id
WHERE i.instructor_name = 'John Smith';


-- =====================================================
-- Query 3: Find students enrolled in more than 3 courses
-- Uses subquery with GROUP BY and HAVING
-- =====================================================
SELECT
    student_id,
    student_name
FROM student
WHERE student_id IN (
    SELECT student_id
    FROM enrollment
    GROUP BY student_id
    HAVING COUNT(course_id) > 3
);
