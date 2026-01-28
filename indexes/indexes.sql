-- =====================================================
-- Index 1: Improve performance of student-course joins
-- Used when fetching enrollments for a student
-- =====================================================
CREATE INDEX idx_enrollment_student_id
ON enrollment(student_id);

-- =====================================================
-- Index 2: Improve performance of course-student joins
-- Used when fetching students for a course
-- =====================================================
CREATE INDEX idx_enrollment_course_id
ON enrollment(course_id);
