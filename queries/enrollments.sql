
SELECT c.course_name, se.year, CONCAT(p.first_name, ' ', p.last_name) AS instructor_name,
r.room_number, b.building_name, e.grade, e.status
FROM enrollments e
JOIN sections s ON s.section_id = e.section_id 
JOIN instructors i ON i.instructor_id = s.instructor 
JOIN courses c ON c.course_id = s.course 
JOIN students st ON st.student_id = e.student_id 
JOIN semesters se ON se.semester_id = s.academic_term
JOIN people p ON p.person_id = i.person_id 
JOIN rooms r ON r.room_id = s.room
JOIN buildings b ON b.building_id = r.building_id
WHERE e.student_id = 1;


