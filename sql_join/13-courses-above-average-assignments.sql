SELECT title
FROM courses
WHERE id IN (
    SELECT course_id
    FROM assignments
    GROUP BY course_id
    HAVING COUNT(id) > (
        SELECT AVG(assignment_count)
        FROM (
            SELECT COUNT(id) AS assignment_count
            FROM assignments
            GROUP BY course_id
        )
    )
)
ORDER BY title ASC;