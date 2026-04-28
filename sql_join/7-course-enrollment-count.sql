SELECT courses.title AS course_title, COUNT(enrollments.student_id) AS enrollment_count
FROM courses
LEFT JOIN enrollments ON courses.id = enrollments.course_id
GROUP BY courses.id
ORDER BY course_title ASC, enrollment_count ASC;