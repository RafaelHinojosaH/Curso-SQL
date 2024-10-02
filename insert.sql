-- Insertar datos en la tabla de estudiantes
INSERT INTO STUDENTS (FIRSTNAME, LASTNAME, AGE, EMAIL)
VALUES ('John', 'Doe', 25, 'john.doe@example.com');

-- Insertar datos en la tabla de instructores
INSERT INTO INSTRUCTORS (FIRSTNAME, LASTNAME, EMAIL)
VALUES ('Jane', 'Smith', 'jane.smith@example.com');

-- Insertar datos en la tabla de cursos
INSERT INTO COURSES (COURSENAME, DESCRIPTION, INSTRUCTORID, DURATIONHOURS)
VALUES ('Introduction to SQL', 'Learn the basics of SQL', 1, 40);

-- Insertar datos en la tabla de relaciones entre estudiantes y cursos
INSERT INTO STUDENT_COURSE (STUDENTID, COURSEID)
VALUES (1, 1, 1);


