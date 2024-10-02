/*
2. Average GPA
You want to retrieve students details based on gpas.
Write a SQL query to find the average gpa of students who require transportation and live more than 5 km away from the school.

1.Schema
    CREATE TABLE students (
    stu_id INT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    class VARCHAR(9),
    section VARCHAR(4),
    gpa INT
    )

    CREATE TABLE address (
    stu_id INT PRIMARY KEY,
    address VARCHAR (20),
    transport_req VARCHAR(5),
    greater_than_5_km VARCHAR(4)
    )

2. Table structure
    students
    Name	Type	Description
    stu_id	INT	Column denoting stu_id representing id of students.
    first_name	VARCHAR(45)	Column denoting first_name representing first name of students.
    last_name	VARCHAR(45)	Column denoting last_name representing last name of students.
    class	VARCHAR(9)	Column denoting class representing student's class.
    section	VARCHAR(4)	Column denoting section representing student's section.
    gpa	INT	Column denoting gpa representing student's gpa.
    address
    Name	Type	Description
    stu_id	INT	Column denoting stu_id representing id of students.
    address	VARCHAR (20)	Column denoting address respresenting student's address.
    transport_req	VARCHAR(5)	Column denoting transport_req representing if the student requires transportation. Here, the value is set as 'Y' if it is Yes and 'N' if it is No.
    greater_than_5_km	VARCHAR(4)	Column denoting greater_than_5_km displaying if the students address is more than 5 km away from the school. Here, the value is set as 'Y' if it is Yes and 'N' if it is No.

3.Sample testcase 1
    Input
    students
    stu_id	first_name	last_name	class	section	gpa
    1	Tony	Stark	8	A	5
    2	Steve	Roggers	10	B	4
    3	Thor	Oddinson	9	C	4
    4	Bruce	Banner	8	A	5
    address
    stu_id	address	transport_req	greater_than_5_km
    1	BLOCK 1	Y	Y
    2	BLOCK 2	N	N
    3	BLOCK 3	Y	Y
    4	BLOCK 1	N	N
    Output
    4.5
*/

SELECT 
    AVG(s.gpa) AS average_gpa
FROM students s
JOIN address a ON s.stu_id = a.stu_id
WHERE a.transport_req = 'Y' AND a.greater_than_5_km = 'Y';

-- Selecciona el promedio de las GPA de los estudiantes, renombrando el resultado como average_gpa
SELECT AVG(s.gpa) AS average_gpa
-- De la tabla students con el alias s
FROM students s
-- Realiza una unión con la tabla address usando el alias a, emparejando las filas donde los ID de los estudiantes coinciden
JOIN 
    address a ON s.stu_id = a.stu_id
-- Filtra los resultados para incluir solo los estudiantes que requieren transporte y viven a más de 5 km de la escuela
WHERE a.transport_req = 'Y' 
    AND a.greater_than_5_km = 'Y';


