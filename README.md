# University Course Management System

## Overview
This project implements a relational database design for a University Course Management System using MySQL 8.  
It covers database normalization, table relationships, SQL queries using JOINs and subqueries, indexing, and proper Git version control practices.

---

## Database Design (3NF)
The database is designed in **Third Normal Form (3NF)** to eliminate redundancy and ensure data integrity.

### Entities
- **Student**: Stores core student details.
- **Instructor**: Stores instructor information.
- **Course**: Stores course details and references the instructor teaching the course.
- **Enrollment**: Acts as a junction table to resolve the many-to-many relationship between students and courses.

### Normalization Explanation
- Each table has a **primary key**.
- All non-key attributes depend only on the primary key.
- No transitive dependencies exist.
- Repeating and derived data are avoided.

This ensures the schema adheres to 3NF standards.

---

## SQL Queries
The following queries are implemented in `queries/queries.sql`:

1. **List students enrolled in a given course**
   - Uses JOIN between Student, Enrollment, and Course tables.

2. **List courses taught by a given instructor**
   - Uses JOIN between Instructor and Course tables.

3. **Find students enrolled in more than 3 courses**
   - Uses a subquery with GROUP BY and HAVING.

All queries avoid `SELECT *` and explicitly specify required columns.

---

## Indexing Strategy
Indexes are created in `indexes/indexes.sql` to improve query performance.

### Indexes Added
1. **Index on `enrollment.student_id`**
   - Optimizes joins and subqueries that filter or group by student.

2. **Index on `enrollment.course_id`**
   - Optimizes joins when retrieving students for a specific course.

### Justification
These indexes improve lookup speed and join performance without introducing unnecessary overhead.

---

## Git Usage
The project follows clean Git practices:
- Separate commits for schema, queries, indexes, and documentation.
- Meaningful commit messages.
- Logical progression of commits for easy review.

---

## How to Run
1. Execute `schema/schema.sql` to create the database and tables.
2. (Optional) Insert test data locally for verification.
3. Execute queries from `queries/queries.sql`.
4. Create indexes using `indexes/indexes.sql`.

---

## Technologies Used
- MySQL 8
- Git & GitHub
- MySQL Workbench
