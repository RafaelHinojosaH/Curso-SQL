 -- Crear la tabla students
CREATE TABLE students (
    stu_id INT PRIMARY KEY,               -- Columna denotando stu_id que representa el id de los estudiantes
    first_name VARCHAR(45),               -- Columna denotando first_name que representa el nombre de pila de los estudiantes
    last_name VARCHAR(45),                -- Columna denotando last_name que representa el apellido de los estudiantes
    class VARCHAR(9),                     -- Columna denotando class que representa la clase del estudiante
    section VARCHAR(4),                   -- Columna denotando section que representa la sección del estudiante
    gpa INT                               -- Columna denotando gpa que representa el GPA del estudiante
);

-- Crear la tabla address
CREATE TABLE address (
    stu_id INT,                           -- Columna denotando stu_id que representa el id de los estudiantes
    address VARCHAR(20),                  -- Columna denotando address que representa la dirección del estudiante
    transport_req VARCHAR(5),             -- Columna denotando transport_req que representa si el estudiante requiere transporte ('Y' para Sí, 'N' para No)
    greater_than_5_km VARCHAR(4),         -- Columna denotando greater_than_5_km que indica si la dirección del estudiante está a más de 5 km de la escuela ('Y' para Sí, 'N' para No)
    PRIMARY KEY (stu_id),                 -- Definir stu_id como clave primaria de la tabla address
    FOREIGN KEY (stu_id) REFERENCES students(stu_id) -- Definir stu_id como clave foránea que referencia a stu_id en la tabla students
);

-- Insertar datos en la tabla students
INSERT INTO students (stu_id, first_name, last_name, class, section, gpa) VALUES
(1, 'Tony', 'Stark', '8', 'A', 5),
(2, 'Steve', 'Roggers', '10', 'B', 4),
(3, 'Thor', 'Oddinson', '9', 'C', 4),
(4, 'Bruce', 'Banner', '8', 'A', 5);

-- Insertar datos en la tabla address
INSERT INTO address (stu_id, address, transport_req, greater_than_5_km) VALUES
(1, 'BLOCK 1', 'Y', 'Y'),
(2, 'BLOCK 2', 'N', 'N'),
(3, 'BLOCK 3', 'Y', 'Y'),
(4, 'BLOCK 1', 'N', 'N');

-- Calcular el GPA promedio de los estudiantes que requieren transporte y viven a más de 5 km de la escuela
SELECT AVG(s.gpa) AS average_gpa
FROM students s
JOIN address a ON s.stu_id = a.stu_id
WHERE a.transport_req = 'Y' AND a.greater_than_5_km = 'Y';

