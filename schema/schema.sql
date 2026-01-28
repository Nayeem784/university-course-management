
-- create database for University Course Management System
CREATE DATABASE IF NOT EXISTS university_db;

-- select the  database to work with

USE university_db;

-- =======================================
-- STUDENT TABLE
-- Stores basic student information
-- Independent entity (no foreign key dependency)
-- =======================================
CREATE TABLE student(
student_id INT PRIMARY KEY,                               -- Unique identifier for each student
student_name VARCHAR(100) NOT NULL,                       -- Student full name
email VARCHAR(100) NOT NULL UNIQUE,                       -- Unique email for communication
enrollment_year INT NOT NULL                              -- Year the student joined the university
);

-- =====================================================
-- INSTRUCTOR TABLE
-- Stores instructor details
-- Independent entity
-- =====================================================

CREATE TABLE instructor(
instructor_id INT PRIMARY KEY,                            -- Unique identifier for instructor
instructor_name VARCHAR(100) NOT NULL,                    -- Instructor full name
department VARCHAR(100) NOT NULL,                         -- Department instructor belongs to
email VARCHAR(100) NOT NULL UNIQUE                        -- Unique instructor email
);


-- =====================================================
-- COURSE TABLE
-- Each course is taught by exactly one instructor
-- One-to-many relationship: Instructor -> Course
-- =====================================================

CREATE TABLE course(
course_id INT PRIMARY KEY,                              -- Unique course identifier
course_name VARCHAR(100) NOT NULL,                      -- Course title
credits INT NOT NULL,                                   -- Credit value of the course
instructor_id INT NOT NULL,                               -- Instructor teaching the course
FOREIGN KEY (instructor_id)	REFERENCES instructor(instructor_id));     -- Enforces valid instructor assignment

-- =====================================================
-- ENROLLMENT TABLE
-- Junction table to resolve many-to-many relationship
-- between Student and Course
-- =====================================================

CREATE TABLE enrollment(
enrollment_id INT PRIMARY KEY,                           -- Unique enrollment record
student_id INT NOT NULL,                                 -- References enrolled student
course_id INT NOT NULL,                                   -- References enrolled course
enrollment_date DATE NOT NULL,                            -- Date of enrollment
FOREIGN KEY (student_id) REFERENCES student(student_id),   -- Ensures valid student
FOREIGN KEY (course_id) REFERENCES course(course_id)       -- Ensures valid course
);

