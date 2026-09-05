
SELECT
    CONCAT(p.first_name, ' ', p.last_name) AS student_name,
    m.major_name,
    AVG(e.grade) AS avg_grade,
    RANK() OVER (PARTITION BY m.major_id ORDER BY AVG(e.grade) DESC) AS rank_in_major
FROM students st
JOIN people p ON p.person_id = st.person_id
JOIN programs pr ON pr.program_id = st.program_id
JOIN majors m ON m.major_id = pr.major_id
JOIN enrollments e ON e.student_id = st.student_id
WHERE e.grade IS NOT NULL
GROUP BY st.student_id, p.first_name, p.last_name, m.major_id, m.major_name;

WITH student_term_credits AS (
    SELECT
        e.student_id,
        se.semester_id,
        se.season,
        se.year,
        se.start_date,
        SUM(c.credits) AS credits_this_term
    FROM enrollments e
    JOIN sections s ON s.section_id = e.section_id
    JOIN courses c ON c.course_id = s.course
    JOIN semesters se ON se.semester_id = s.academic_term
    WHERE e.grade IS NOT NULL
    GROUP BY e.student_id, se.semester_id, se.season, se.year, se.start_date
)
SELECT
    stc.student_id,
    CONCAT(p.first_name, ' ', p.last_name) AS student_name,
    stc.season,
    stc.year,
    stc.credits_this_term,
    SUM(stc.credits_this_term) OVER (
        PARTITION BY stc.student_id
        ORDER BY stc.start_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_credit_total
FROM student_term_credits stc
JOIN students st ON st.student_id = stc.student_id
JOIN people p ON p.person_id = st.person_id
ORDER BY stc.student_id, stc.start_date;

SELECT
    d.department_name,
    COUNT(DISTINCT s.section_id) AS total_sections,
    COUNT(e.student_id) AS total_enrollments,
    ROUND(COUNT(e.student_id) / COUNT(DISTINCT s.section_id), 2) AS avg_enrollment_per_section
FROM sections s
JOIN courses c ON c.course_id = s.course
JOIN chairs ch ON ch.chair_id = c.chair_id
JOIN departments d ON d.department_id = ch.department_id
LEFT JOIN enrollments e ON e.section_id = s.section_id
GROUP BY d.department_id, d.department_name
ORDER BY avg_enrollment_per_section DESC;