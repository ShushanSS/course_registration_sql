
WITH RECURSIVE prereq_chain AS (
    SELECT course_id, prerequisite_course_id, 1 AS depth
    FROM course_prerequisites
    WHERE course_id = 24        

    UNION ALL

    SELECT cp.course_id, cp.prerequisite_course_id, pc.depth + 1
    FROM course_prerequisites cp
    JOIN prereq_chain pc ON cp.course_id = pc.prerequisite_course_id
)
SELECT c.course_name AS prerequisite_needed, pc.depth
FROM prereq_chain pc
JOIN courses c ON c.course_id = pc.prerequisite_course_id
ORDER BY pc.depth;