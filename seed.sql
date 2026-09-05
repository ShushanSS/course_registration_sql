
============================================================
SEED DATA: course_registration (YSU-modeled)
Run this AFTER schema.sql has been executed successfully.
Insert order follows foreign key dependencies.
============================================================

---------- 1. DEPARTMENTS (head set to NULL for now, fixed after instructors exist) ----------
INSERT INTO departments (department_id, department_name, department_head) VALUES
(1, 'Faculty of Mathematics and Mechanics', NULL),
(2, 'Institute of Physics', NULL);

-- ---------- 2. PEOPLE (6 future instructors, 14 future students) ----------
INSERT INTO people (person_id, first_name, last_name, father_name, email, date_of_birth) VALUES
(1,  'Armen',   'Petrosyan', 'Vardan',   'a.petrosyan@ysu.am', '1975-03-12'),
(2,  'Anahit',  'Sargsyan',  'Norayr',   'a.sargsyan@ysu.am',  '1980-07-04'),
(3,  'Vahagn',  'Grigoryan', 'Ashot',    'v.grigoryan@ysu.am', '1985-11-23'),
(4,  'Lilit',   'Harutyunyan','Karen',   'l.harutyunyan@ysu.am','1978-02-17'),
(5,  'Davit',   'Avetisyan', 'Samvel',   'd.avetisyan@ysu.am', '1982-09-30'),
(6,  'Nare',    'Manukyan',  'Hrant',    'n.manukyan@ysu.am',  '1988-05-08'),
(7,  'Shushan', 'Sargsyan',  'Artak',    'shushan.s@edu.ysu.am','2006-04-14'),
(8,  'Tigran',  'Hovhannisyan','Vazgen', 'tigran.h@edu.ysu.am','2006-01-22'),
(9,  'Mariam',  'Gasparyan', 'Levon',    'mariam.g@edu.ysu.am','2005-08-19'),
(10, 'Narek',   'Simonyan',  'Ruben',    'narek.s@edu.ysu.am', '2005-12-02'),
(11, 'Anna',    'Khachatryan','Aram',    'anna.kh@edu.ysu.am', '2004-06-27'),
(12, 'Gor',     'Baghdasaryan','Suren',  'gor.b@edu.ysu.am',   '2004-10-11'),
(13, 'Milena',  'Danielyan', 'Edgar',    'milena.d@edu.ysu.am','2006-03-05'),
(14, 'Aram',    'Nazaryan',  'Gagik',    'aram.n@edu.ysu.am',  '2005-07-30'),
(15, 'Sona',    'Vardanyan', 'Mher',     'sona.v@edu.ysu.am',  '2006-02-14'),
(16, 'Erik',    'Sahakyan',  'Tatul',    'erik.s@edu.ysu.am',  '2004-09-09'),
(17, 'Marine',  'Yeghiazaryan','Robert', 'marine.y@edu.ysu.am','2005-11-16'),
(18, 'Vardan',  'Torosyan',  'Ashot',    'vardan.t@edu.ysu.am','2006-05-21'),
(19, 'Diana',   'Melkonyan', 'Gevorg',   'diana.m@edu.ysu.am', '2004-04-03'),
(20, 'Karen',   'Ohanyan',   'Vahe',     'karen.o@edu.ysu.am', '2005-01-28');

-- ---------- 3. INSTRUCTORS ----------
INSERT INTO instructors (instructor_id, person_id, department_id, ranking) VALUES
(1, 1, 1, 'Professor'),
(2, 2, 1, 'Associate Professor'),
(3, 3, 1, 'Assistant Professor'),
(4, 4, 2, 'Professor'),
(5, 5, 2, 'Associate Professor'),
(6, 6, 2, 'Assistant Professor');

-- Now that instructors exist, assign department heads
UPDATE departments SET department_head = 1 WHERE department_id = 1;
UPDATE departments SET department_head = 4 WHERE department_id = 2;

-- ---------- 4. CHAIRS ----------
INSERT INTO chairs (chair_id, chair_name, department_id) VALUES
(1, 'Chair of Probability and Statistics', 1),
(2, 'Chair of Mathematical Analysis', 1),
(3, 'Chair of Programming and Computer Science', 1),
(4, 'Chair of Algebra', 1),
(5, 'Chair of Foreign Languages', 1),
(6, 'Chair of General Education', 1),
(7, 'Chair of General Physics', 2),
(8, 'Chair of Radiophysics', 2);

---------- 5. MAJORS ----------
INSERT INTO majors (major_id, major_name, department_id) VALUES
(1, 'Pure Mathematics', 1),
(2, 'Statistics and Data Science', 1),
(3, 'Financial Mathematics', 1),
(4, 'Physics and AI', 2),
(5, 'Radiophysics', 2);

-- ---------- 6. PROGRAMS ----------
INSERT INTO programs (program_id, major_id, degree_level, study_mode, duration_years) VALUES
(1, 2, 'Bachelor', 'full_time', 4),   -- Statistics and Data Science, full-time
(2, 2, 'Bachelor', 'part_time', 5),   -- Statistics and Data Science, part-time
(3, 1, 'Bachelor', 'full_time', 4),   -- Pure Mathematics
(4, 3, 'Bachelor', 'full_time', 4),   -- Financial Mathematics
(5, 4, 'Bachelor', 'full_time', 4),   -- Physics and AI
(6, 5, 'Bachelor', 'full_time', 4);   -- Radiophysics

-- ---------- 7. COURSES ----------
-- Chair 1 = Probability & Statistics, 2 = Analysis, 3 = Programming/CS,
-- 4 = Algebra, 5 = Languages, 6 = General Ed, 7 = General Physics, 8 = Radiophysics
INSERT INTO courses (course_id, course_name, credits, chair_id) VALUES
(1,  'Mathematical Analysis 1', 9, 2),
(2,  'Mathematical Analysis 2', 9, 2),
(3,  'Mathematical Analysis 3', 9, 2),
(4,  'Mathematical Analysis 4', 9, 2),
(5,  'Algebra', 6, 4),
(6,  'Algebra 3', 3, 4),
(7,  'Linear Algebra', 9, 4),
(8,  'Discrete Mathematics 1', 6, 4),
(9,  'Discrete Probability', 6, 1),
(10, 'Foundations of Computer Science', 3, 3),
(11, 'Elements of Algorithm Theory', 6, 3),
(12, 'Programming (Python)', 6, 3),
(13, 'Modern Programming Languages (Python)', 6, 3),
(14, 'Databases', 3, 3),
(15, 'Real Analysis', 6, 2),
(16, 'Ordinary Differential Equations', 6, 2),
(17, 'Numerical Analysis', 9, 2),
(18, 'Optimization Methods', 6, 2),
(19, 'Probability Theory', 6, 1),
(20, 'Mathematical Statistics', 6, 1),
(21, 'Applied Statistics', 6, 1),
(22, 'Data Science', 3, 1),
(23, 'Machine Learning 1', 6, 1),
(24, 'Machine Learning 2', 6, 1),
(25, 'English 1', 2, 5),
(26, 'English 2', 2, 5),
(27, 'History of Armenia', 2, 6),
(28, 'Philosophy', 3, 6),
(29, 'General Physics 1', 6, 7),
(30, 'Introduction to Radiophysics', 6, 8);

-- ---------- 8. CURRICULUM (program_id, course_id, semester_number, is_mandatory) ----------
-- Statistics and Data Science, full-time (program 1)
INSERT INTO curriculum (program_id, course_id, semester_number, is_mandatory) VALUES
(1, 1, 1, TRUE),   -- Math Analysis 1
(1, 5, 1, TRUE),   -- Algebra
(1, 8, 1, TRUE),   -- Discrete Math 1
(1, 10, 1, TRUE),  -- Foundations of CS
(1, 25, 1, TRUE),  -- English 1
(1, 27, 1, TRUE),  -- History of Armenia
(1, 2, 2, TRUE),   -- Math Analysis 2
(1, 7, 2, TRUE),   -- Linear Algebra
(1, 11, 2, TRUE),  -- Elements of Algorithm Theory
(1, 12, 2, TRUE),  -- Programming (Python)
(1, 26, 2, TRUE),  -- English 2
(1, 3, 3, TRUE),   -- Math Analysis 3
(1, 9, 3, TRUE),   -- Discrete Probability
(1, 14, 3, TRUE),  -- Databases
(1, 28, 3, TRUE),  -- Philosophy
(1, 4, 4, TRUE),   -- Math Analysis 4
(1, 16, 4, TRUE),  -- Ordinary Differential Equations
(1, 13, 4, TRUE),  -- Modern Programming Languages (Python)
(1, 6, 4, TRUE),   -- Algebra 3
(1, 19, 5, TRUE),  -- Probability Theory
(1, 15, 5, TRUE),  -- Real Analysis
(1, 22, 5, TRUE),  -- Data Science
(1, 20, 6, TRUE),  -- Mathematical Statistics
(1, 17, 6, TRUE),  -- Numerical Analysis
(1, 18, 6, TRUE),  -- Optimization Methods
(1, 21, 7, TRUE),  -- Applied Statistics
(1, 23, 7, TRUE),  -- Machine Learning 1
(1, 24, 8, TRUE);  -- Machine Learning 2

-- Statistics and Data Science, part-time (program 2) -- partial, illustrative only
INSERT INTO curriculum (program_id, course_id, semester_number, is_mandatory) VALUES
(2, 1, 1, TRUE),
(2, 5, 1, TRUE);

-- Pure Mathematics (program 3) -- shares general-ed/foundation courses, partial
INSERT INTO curriculum (program_id, course_id, semester_number, is_mandatory) VALUES
(3, 1, 1, TRUE),
(3, 5, 1, TRUE),
(3, 25, 1, TRUE),
(3, 27, 1, TRUE);

-- ---------- 9. COURSE PREREQUISITES ----------
INSERT INTO course_prerequisites (course_id, prerequisite_course_id) VALUES
(2, 1),    -- Math Analysis 2 needs Math Analysis 1
(3, 2),    -- Math Analysis 3 needs Math Analysis 2
(4, 3),    -- Math Analysis 4 needs Math Analysis 3
(7, 5),    -- Linear Algebra needs Algebra
(15, 2),   -- Real Analysis needs Math Analysis 2
(17, 3),   -- Numerical Analysis needs Math Analysis 3
(13, 12),  -- Modern Programming Languages needs Programming (Python)
(20, 19),  -- Mathematical Statistics needs Probability Theory
(23, 19),  -- Machine Learning 1 needs Probability Theory
(24, 23);  -- Machine Learning 2 needs Machine Learning 1

-- ---------- 10. BUILDINGS ----------
INSERT INTO buildings (building_id, building_name) VALUES
(1, 'Main Building'),
(2, 'Physics Building');

-- ---------- 11. ROOMS ----------
INSERT INTO rooms (room_id, room_number, building_id, capacity) VALUES
(1, '204', 1, 60),
(2, '210', 1, 30),
(3, '305', 1, 40),
(4, '101', 2, 50);

-- ---------- 12. SEMESTERS ----------
INSERT INTO semesters (semester_id, season, year, start_date, end_date) VALUES
(1, 'Fall',   2025, '2025-09-01', '2025-12-20'),
(2, 'Spring', 2026, '2026-02-01', '2026-06-15'),
(3, 'Fall',   2026, '2026-09-01', '2026-12-20');

---------- 13. SECTIONS ----------
INSERT INTO sections (section_id, course, academic_term, instructor, room, session_type) VALUES
(1, 1,  1, 1, 1, 'lecture'),  -- Math Analysis 1, Fall 2025
(2, 1,  1, 2, 2, 'practice'),
(3, 5,  1, 2, 1, 'lecture'),  -- Algebra, Fall 2025
(4, 12, 2, 3, 4, 'lecture'),  -- Programming (Python), Spring 2026
(5, 19, 3, 1, 1, 'lecture'),  -- Probability Theory, Fall 2026
(6, 17, 3, 2, 2, 'lecture'),  -- Numerical Analysis, Fall 2026 (matches real 6th-semester example)
(7, 23, 3, 3, 4, 'lecture');  -- Machine Learning 1, Fall 2026

---------- 14. STUDENTS ----------
-- person_id 7-20 become students; mostly Statistics & DS (program 1), a few others
INSERT INTO students (student_id, person_id, program_id, enrollment_year) VALUES
(1, 7,  1, 2025),
(2, 8,  1, 2025),
(3, 9,  1, 2024),
(4, 10, 1, 2024),
(5, 11, 1, 2023),
(6, 12, 3, 2025),
(7, 13, 3, 2024),
(8, 14, 4, 2025),
(9, 15, 4, 2024),
(10, 16, 5, 2025),
(11, 17, 5, 2024),
(12, 18, 6, 2025),
(13, 19, 2, 2025),
(14, 20, 1, 2023);

---------- 15. ENROLLMENTS ----------
-- Mix of graded (upperclassmen, past semesters) and ungraded (current, first-years)
INSERT INTO enrollments (enrollment_id, student_id, section_id, grade, status) VALUES
(1,  1, 1, 16, 'completed'),   -- student 1, Math Analysis 1, Fall 2025
(2,  1, 3, 14, 'completed'),
(3,  2, 1, 12, 'completed'),
(4,  2, 3, NULL, 'enrolled'),  -- no grade yet
(5,  3, 4, 17, 'completed'),   -- Programming, Spring 2026
(6,  5, 5, 15, 'completed'),   -- Probability Theory, Fall 2026 (5th-semester student)
(7,  5, 6, 18, 'completed'),   -- Numerical Analysis
(8,  14, 5, 19, 'completed'),  -- Probability Theory, upperclassman
(9,  14, 7, NULL, 'enrolled'), -- Machine Learning 1, in progress
(10, 4, 1, NULL, 'enrolled'),  -- current first-year, no grade yet
(11, 6, 1, NULL, 'enrolled'),
(12, 8, 1, NULL, 'enrolled');