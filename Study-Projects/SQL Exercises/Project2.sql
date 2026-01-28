CREATE SCHEMA IF NOT EXISTS Project2;

USE Project2;

DROP TABLE IF EXISTS person, section, enrollment;

CREATE TABLE person (

	person_id		INT NOT NULL,
    first_name		VARCHAR(30) NOT NULL,
    last_name		VARCHAR(30) NOT NULL,
    date_of_birth	DATE,
    gender			VARCHAR(6),
    address			VARCHAR(50),
    city			VARCHAR(20),
    state			CHAR(2),
    zip_code		VARCHAR(5),
    
    PRIMARY KEY (person_id)

);

CREATE TABLE section (

	subject			VARCHAR(4) NOT NULL,
    number			INT NOT NULL,
    section			INT NOT NULL,
    title			VARCHAR(35),
    credit_hours	INT,
    instructor_id	INT,
    days			VARCHAR(3),
    start_time		TIME,
    end_time		TIME,
    
	PRIMARY KEY	(subject,number,section),
    
    FOREIGN KEY (instructor_id) REFERENCES person(person_id)

);

CREATE TABLE enrollment (

	subject			VARCHAR(4) NOT NULL,
    number			INT NOT NULL,
    section			INT NOT NULL,
    student_id		INT NOT NULL,
    
	PRIMARY KEY	(subject, student_id),
    
    FOREIGN KEY (subject,number,section) REFERENCES section(subject,number,section),
    FOREIGN KEY (student_id) REFERENCES person(person_id)

);

SELECT * FROM person;

SELECT * FROM section;

SELECT * FROM enrollment;

