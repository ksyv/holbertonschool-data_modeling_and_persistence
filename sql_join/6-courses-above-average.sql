SELECT course_title
FROM (
    SELECT courses.title AS course_title, COUNT(enrollments.student_id) AS student_count
    FROM courses
    JOIN enrollments ON courses.id = enrollments.course_id
    GROUP BY courses.id
)
WHERE student_count > (
    SELECT AVG(count_per_course)
    FROM (
        SELECT COUNT(student_id) AS count_per_course
        FROM enrollments
        GROUP BY course_id
    )
)
ORDER BY course_title ASC;