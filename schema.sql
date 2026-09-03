CREATE TABLE people(
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    father_name VARCHAR(40),
    email VARCHAR(50),
    date_of_birth DATE NOT NULL
    );

CREATE TABLE departments(
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50),
    department_head INT
    
);

CREATE TABLE instructors(
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL UNIQUE,
    department_id INT NOT NULL,
    ranking VARCHAR(50),
    FOREIGN KEY (person_id) REFERENCES people(person_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id) 
);

ALTER TABLE departments
ADD FOREIGN KEY (department_head) REFERENCES instructors(instructor_id);


CREATE TABLE majors(
    major_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE programs(
    program_id INT AUTO_INCREMENT PRIMARY KEY,
    major_id INT NOT NULL,
    degree_level VARCHAR(50),
    study_mode VARCHAR(20),
    duration_years INT,
    FOREIGN KEY (major_id) REFERENCES majors(major_id)
);

CREATE TABLE students(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT NOT NULL UNIQUE,
    program_id INT NOT NULL , 
    enrollement_year INT,
    FOREIGN KEY (person_id) REFERENCES people(person_id),
    FOREIGN KEY (program_id) REFERENCES programs(program_id) 
);

CREATE TABLE chairs(
    chair_id INT AUTO_INCREMENT PRIMARY KEY ,
    chair_name VARCHAR(100),
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses(
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    chair_id INT NOT NULL,
    FOREIGN KEY (chair_id) REFERENCES chairs(chair_id)
    
);

CREATE TABLE curriculum(
    program_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_number INT NOT NULL,
    is_mandatory BOOLEAN,
    PRIMARY KEY (program_id, course_id),
    FOREIGN KEY (program_id) REFERENCES programs(program_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE semesters(
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    season VARCHAR(20) NOT NULL,
    start_date DATE, 
    end_date DATE,
    year INT NOT NULL,
    UNIQUE (season, year)
);

CREATE TABLE buildings(
    building_id INT AUTO_INCREMENT PRIMARY KEY,
    building_name VARCHAR(50)
    
);

CREATE TABLE rooms(
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number INT NOT NULL,
    building_id INT NOT NULL,
    capacity INT,
    FOREIGN KEY (building_id) REFERENCES buildings(building_id)

);

CREATE TABLE course_prerequisites(
course_id INT NOT NULL,
prerequisite_course_id INT NOT NULL,
PRIMARY KEY (course_id, prerequisite_course_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id),
FOREIGN KEY (prerequisite_course_id) REFERENCES courses(course_id)

);

CREATE TABLE enrollments(
enrollment_id INT auto_increment PRIMARY KEY,
student_id INT NOT NULL,
section_id INT NOT NULL, 
grade INT CHECK (grade BETWEEN 0 AND 20),
status VARCHAR(20),
FOREIGN KEY (student_id) references students(student_id),
FOREIGN KEY (section_id) references sections(section_id)
)