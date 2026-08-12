CREATE TABLE people(
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40),
    last_surname VARCHAR(40),
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

