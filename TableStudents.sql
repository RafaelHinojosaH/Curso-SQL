-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS STUDENT_DB;
USE STUDENT_DB;

-- Eliminar la tabla si ya existe
DROP TABLE IF EXISTS GRADE_HISTORY;
DROP TABLE IF EXISTS STUDENT_COURSES;
DROP TABLE IF EXISTS STUDENT;

-- Crear la tabla
CREATE TABLE STUDENT (
  STUDENTID INT PRIMARY KEY AUTO_INCREMENT,
  FIRSTNAME VARCHAR(50),
  LASTNAME VARCHAR(50),
  AGE INT,
  EMAIL VARCHAR(100),
  SALARY INT,
  ETHNICITY VARCHAR(50),
  LOADDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UPDATEDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO STUDENT (FIRSTNAME, LASTNAME, AGE, EMAIL, SALARY, ETHNICITY)
VALUES 
('Candy', 'Star', 25, 'candy.star@example.com', 1500000, 'Caucasian'),
('Lola', 'Diamond', 22, 'lola.diamond@example.com', 200000, 'Asian'),
('Misty', 'Rose', 28, 'misty.rose@example.com', 1200000, 'Hispanic'),
('Julian', 'Nights', 21, 'raven.nights@example.com', 650000, 'African American'),
('Jasmine', 'Bliss', 24, 'jasmine.bliss@example.com', 320000, 'Caucasian'),
('Crystal', 'Blue', 23, 'crystal.blue@example.com', 275000, 'Asian'),
('Angel', 'Skye', 27, 'angel.skye@example.com', 1400000, 'Hispanic'),
('Ruby', 'Rain', 26, 'ruby.rain@example.com', 500000, 'African American'),
('Sapphire', 'Moon', 29, 'sapphire.moon@example.com', 600000, 'Caucasian'),
('Bella', 'Luna', 20, 'bella.luna@example.com', 950000, 'Hispanic');

CREATE INDEX idx_lastname ON STUDENT (LASTNAME);

CREATE TABLE STUDENT_COURSES (
    STUDENT_COURSE_ID INT PRIMARY KEY AUTO_INCREMENT,
    STUDENT_ID INT,
    COURSE_ID INT,
    COURSE_NAME VARCHAR(50),
    SEMESTER VARCHAR(20),
    GRADE DECIMAL(4 , 2),
    ENROLLMENT_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LOAD_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UPDATE_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (STUDENT_ID)
        REFERENCES STUDENT (STUDENTID)
);

INSERT INTO STUDENT_COURSES (STUDENT_ID, COURSE_ID, COURSE_NAME, SEMESTER, GRADE)
VALUES 
(1, 201, 'Runway Techniques', 'Spring 2021', 95.00),
(1, 202, 'Photography Posing', 'Fall 2021', 87.50),
(1, 203, 'Makeup Application', 'Spring 2021', 78.00),
(3, 204, 'Fashion History', 'Fall 2021', 82.00),
(4, 205, 'Wardrobe Styling', 'Spring 2021', 89.50),
(5, 206, 'Fitness for Models', 'Fall 2021', 91.00),
(5, 207, 'Public Speaking', 'Spring 2021', 84.00),
(5, 208, 'Personal Branding', 'Fall 2021', 92.00),
(8, 209, 'Networking Skills', 'Spring 2021', 88.50),
(8, 210, 'Portfolio Development', 'Fall 2021', 94.00),
(10, 211, 'Acting for Models', 'Spring 2021', 90.00);


CREATE TABLE GRADE_HISTORY (
    STUDENT_COURSE_ID INT,
    OLD_GRADE DECIMAL(4, 2),
    NEW_GRADE DECIMAL(4, 2),
    CHANGE_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (STUDENT_COURSE_ID)
        REFERENCES STUDENT_COURSES (STUDENT_COURSE_ID)
);

/*
-------------INTENTO DE USAR DELIMITER -------------
DELIMITER //
CREATE TRIGGER update_grade
AFTER UPDATE ON STUDENT_COURSES
FOR EACH ROW
BEGIN
    IF NEW.GRADE != OLD.GRADE THEN
        INSERT INTO GRADE_HISTORY (STUDENT_COURSE_ID, OLD_GRADE, NEW_GRADE, CHANGE_DATE)
        VALUES (NEW.STUDENT_COURSE_ID, OLD.GRADE, NEW.GRADE, NOW());
    END IF;
END;
//
DELIMITER ;


-- -- -- Seleccionar los datos -- -- -- 
 SELECT * FROM STUDENT

WHERE AGE < 25;
WHERE AGE IN (18,21,27,29)
WHERE FIRSTNAME <> 'Candy' 
WHERE SALARY BETWEEN 500000 AND 2000000
WHERE LASTNAME LIKE '%R%'

 Seleccionar los datos 
SELECT 
	FIRSTNAME,
    LASTNAME
FROM STUDENT
WHERE AGE > 25 
#AND FIRSTNAME LIKE '%A%';
#AND FIRSTNAME IS NOT NULL;
#AND AGE IS NULL;
OR AGE NOT IN(20); 


 ---Funciones de Aritmética Básica en SQL (COUNT, SUM, AVG)
SELECT--- 
  ETHNICITY,
  GROUP_CONCAT(FIRSTNAME) AS firstnames,
  COUNT(FIRSTNAME) AS name_count,
  AVG(AGE) AS average_age
FROM STUDENT
GROUP BY ETHNICITY
HAVING name_count > 2;


SELECT 
	COUNT(FIRSTNAME) as 'Student number',
    SUM(SALARY) as 'Total De Salarios',
    AVG(SALARY) as 'Promedio de Salarios'
FROM STUDENT

SELECT 
	MIN(AGE) AS 'MINAGE',
    MAX(AGE) AS 'MAXAGE'
FROM STUDENT

SELECT 
    ROUND(AGE) AS 'ROUNDAGE'
FROM STUDENT



SELECT 
    STUDENTID,
    FIRSTNAME,
    ETHNICITY
FROM STUDENT
WHERE ETHNICITY IN (
    SELECT ETHNICITY
    FROM STUDENT
    GROUP BY ETHNICITY
    HAVING COUNT(ETHNICITY) > 1
);


SELECT 
    FIRSTNAME,
	AGE,
	CASE 
		WHEN AGE BETWEEN 18 AND 24 THEN 'TEAM A' 
        ELSE 'TEAM B' END AS TEAM 
FROM STUDENT 
ORDER BY AGE ASC


-- -- -- EXAM -- -- --
SELECT 
    FIRSTNAME,
    SUM(SALARY) AS total_salary
FROM 
    STUDENT
WHERE 
    SALARY > 500000
GROUP BY 
    STUDENTID, FIRSTNAME
HAVING 
    FIRSTNAME IS NOT NULL
ORDER BY 
    total_salary DESC;


-- -- -- EXAMEN -- -- -- 
SELECT 
    s.STUDENTID, s.FIRSTNAME, s.LASTNAME, sc.COURSE_NAME, sc.GRADE
FROM 
    STUDENT s
LEFT JOIN 
    STUDENT_COURSES sc ON s.STUDENTID = sc.STUDENT_ID
WHERE s.SALARY > 500000
ORDER BY s.SALARY ASC;


CREATE VIEW 
	VW_STUDENT AS SELECT 
		FIRSTNAME, 
        LASTNAME, 
        ETHNICITY  
FROM STUDENT;

-------------------- Expresiones de Tablas Comunes (CTE) en SQL ----------------------

WITH student_avg_salary AS (
  SELECT
    STUDENTID,
    AVG(SALARY) AS avg_salary
  FROM
    STUDENT
  GROUP BY
    STUDENTID
)

SELECT
  sc.STUDENT_ID,
  CONCAT(s.FIRSTNAME, ' ', s.LASTNAME) AS full_name,
  sc.COURSE_NAME,
  sas.avg_salary
FROM
  STUDENT_COURSES sc
JOIN
  STUDENT s ON sc.STUDENT_ID = s.STUDENTID
JOIN
  student_avg_salary sas ON sc.STUDENT_ID = sas.STUDENTID
WHERE GRADE > 90;

-------------------- Procedimientos Almacenados en SQL ----------------------



DROP PROCEDURE IF EXISTS AddNewStudent;

DELIMITER //
CREATE PROCEDURE AddNewStudent(
  IN p_firstname VARCHAR(50),
  IN p_lastname VARCHAR(50),
  IN p_age INT,
  IN p_email VARCHAR(100),
  IN p_salary INT,
  IN p_ethnicity VARCHAR(50)
)
BEGIN
  INSERT INTO STUDENT (FIRSTNAME, LASTNAME, AGE, EMAIL, SALARY, ETHNICITY)
  VALUES (p_firstname, p_lastname, p_age, p_email, p_salary, p_ethnicity);
END//
DELIMITER ;

CALL AddNewStudent('Maria', 'Star', 19, 'maria.star@example.com', 50000, 'Hispanic');

SELECT * FROM STUDENT

-------------------- Procedimientos Almacenados en SQL: Gestión de Variables y Manejo de Excepciones ----------------------

DELIMITER //

CREATE PROCEDURE UpdateStudentGrade(
    IN p_StudentCourseID INT, 
    IN p_NewGrade DECIMAL(4,2), 
    OUT p_Message VARCHAR(255)
)
BEGIN 
    DECLARE v_OldGrade DECIMAL(4,2);

    -- Manejo de excepciones
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        -- Mensaje de la excepción: Mostrar un mensaje de error 
        SET p_Message = 'Error: No se pudo completar la operación.';
        ROLLBACK; -- Deshacer todos los cambios realizados durante la transacción 
    END;

    START TRANSACTION; -- Inicia una transacción, todas las operaciones siguientes se consideran una transacción 

    -- Obtener la calificación anterior
    SELECT GRADE 
    INTO v_OldGrade 
    FROM STUDENT_COURSES 
    WHERE STUDENT_COURSE_ID = p_StudentCourseID;

    -- Actualizar la calificación del estudiante
    UPDATE STUDENT_COURSES 
    SET GRADE = p_NewGrade, 
        UPDATE_DATE = CURRENT_TIMESTAMP
    WHERE STUDENT_COURSE_ID = p_StudentCourseID;

    -- Insertar el cambio en la tabla GRADE_HISTORY
    INSERT INTO GRADE_HISTORY (STUDENT_COURSE_ID, OLD_GRADE, NEW_GRADE) 
    VALUES (p_StudentCourseID, v_OldGrade, p_NewGrade);

    COMMIT; -- Confirma la transacción actual y guarda todos los cambios realizados

    -- Mensaje de éxito
    SET p_Message = 'Operación completada exitosamente.';

END //

DELIMITER ;


 */
