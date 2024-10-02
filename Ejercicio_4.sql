
4. Author Book Details
You want to retrieve book details of certain authors.
Write a SQL query to retrieve the Name of authors along with the Title of their books and the average Rating of each book they have written. Additionally, group the data by Author_ID and Book_ID and order the data by authors Name and book Title.

1.Schema
    CREATE TABLE Authors (ID INT PRIMARY KEY, Name VARCHAR(100))

    CREATE TABLE Books (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author_ID INT,
    FOREIGN KEY (Author_ID) REFERENCES Authors(ID)
    )

    CREATE TABLE Reviews (
    ID INT PRIMARY KEY,
    Book_ID INT,
    Rating INT,
    FOREIGN KEY (Book_ID) REFERENCES Books(ID)
    )

2.Table structure
    Authors
    Name	Type	Description
    ID	INT	Column denoting ID representing authors ID.
    Name	VARCHAR(100)	Column denoting Name representing the authors name.
    Books
    Name	Type	Description
    ID	INT	Column denoting ID representing the id assigned to a book.
    Title	VARCHAR(100)	Column denoting Title representing the books title.
    Author_ID	INT	Column denoting Author_ID representing authors ID.
    Reviews
    Name	Type	Description
    ID	INT	Column denoting ID representing authors ID.
    Book_ID	INT	Column denoting Book_ID representing the id assigned to a book.
    Rating	INT	Column denoting Rating representing the rating of given to a book.

3. Sample testcase 1
    Input

    Authors
        ID	Name
        1	Alice
        2	Bob
        3	Carol
        4	David
        5	Eve
        6	Frank
        7	Grace
        8	Henry
        9	Ivy
        10	Jack
    Books
        ID	Title	Author_ID
        101	Book A	1
        102	Book B	2
        103	Book C	1
        104	Book D	3
        105	Book E	4
        106	Book F	2
        107	Book G	5
        108	Book H	3
        109	Book I	6
        110	Book J	7
    Reviews
        ID	Book_ID	Rating
        1	101	4
        2	101	5
        3	102	3
        4	103	2
        5	103	4
        6	104	5
        7	105	3
        8	106	4
        9	106	5
        10	107	3
        11	108	4
        12	109	2
        13	110	5
        14	110	4
    Output
        Alice	Book A	4.5
        Alice	Book C	3.0
        Bob	Book B	3.0
        Bob	Book F	4.5
        Carol	Book D	5.0
        Carol	Book H	4.0
        David	Book E	3.0
        Eve	Book G	3.0
        Frank	Book I	2.0
        Grace	Book J	4.5
*/

-- Selecciona el nombre del autor (Name), el título del libro (Title) y el promedio de las calificaciones (Rating), renombrando el promedio como Average_Rating
SELECT 
    a.Name, 
    b.Title, 
    AVG(r.Rating) AS Average_Rating
-- De la tabla Authors con el alias a
FROM Authors a
-- Realiza una unión con la tabla Books usando el alias b, emparejando las filas donde los ID de los autores coinciden con los Author_ID de los libros
JOIN 
    Books b ON a.ID = b.Author_ID
-- Realiza una unión con la tabla Reviews usando el alias r, emparejando las filas donde los ID de los libros coinciden con los Book_ID de las reseñas
JOIN 
    Reviews r ON b.ID = r.Book_ID
-- Agrupa los resultados por los ID de los autores (a.ID) y los ID de los libros (b.ID)
GROUP BY a.ID, b.ID
-- Ordena los resultados por el nombre del autor (a.Name) y el título del libro (b.Title)
ORDER BY a.Name, b.Title;
