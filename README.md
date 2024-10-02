# Curso de Bases de Datos SQL

Este repositorio contiene una serie de archivos SQL diseñados para practicar y aprender conceptos de bases de datos relacionales. A continuación, se proporciona una descripción detallada de cada archivo y sus propósitos.

## Archivos

### 1. `create.sql`
- **Descripción**: Contiene la estructura inicial de las tablas utilizadas en el curso. Este archivo incluye las instrucciones para crear las tablas principales de la base de datos.
- **Contenido**:
  - Creación de la base de datos.
  - Definición de tablas con claves primarias y tipos de datos.
- **Tablas**:
  - `students`: Información de los estudiantes.
  - `instructors`: Información de los instructores.
  - `courses`: Información de los cursos ofrecidos.

### 2. `insert.sql`
- **Descripción**: Contiene instrucciones SQL para insertar datos en las tablas principales.
- **Tablas**:
  - `students`: Información de estudiantes como nombre, apellido, edad y correo electrónico.
  - `instructors`: Información de los instructores.
  - `courses`: Datos de cursos, incluyendo nombre, descripción y duración.
  - `student_course`: Relaciona estudiantes con cursos.

### 3. `Ejercicio_1.sql`
- **Descripción**: Un archivo de práctica que utiliza la tabla `ITEMS` para encontrar el precio máximo de un artículo agrupado por el código del fabricante.
- **Problema**: Encontrar el precio máximo de los artículos cuyo valor supera los 3000.
- **Tablas**:
  - `ITEMS`: ID del artículo, nombre y precio.

### 4. `Ejercicio_2.sql`
- **Descripción**: Encuentra el promedio de GPA de los estudiantes que requieren transporte y viven a más de 5 km de la escuela.
- **Problema**: Calcular el promedio de GPA para ciertos estudiantes según las condiciones especificadas.
- **Tablas**:
  - `students`: Información del estudiante como nombre, clase, sección y GPA.
  - `address`: Información sobre la dirección y la necesidad de transporte del estudiante.

### 5. `Ejercicio_3.sql`
- **Descripción**: Suma los precios de los productos según la fecha de fabricación y muestra aquellos cuya suma sea al menos 500 unidades más que el precio máximo del producto.
- **Problema**: Agrupar productos por la fecha de fabricación y calcular la suma de precios según las condiciones.
- **Tablas**:
  - `PRODUCT`: Información de los productos como ID, nombre, fecha de fabricación y precio.

### 6. `Ejercicio_4.sql`
- **Descripción**: Recupera detalles de libros escritos por ciertos autores, incluyendo el nombre del autor, el título del libro y el promedio de calificaciones.
- **Problema**: Agrupar los libros por autor y calcular el promedio de calificaciones de cada libro.
- **Tablas**:
  - `Authors`: Información de los autores.
  - `Books`: Información de los libros escritos.
  - `Reviews`: Calificaciones de cada libro.

### 7. `EjercicioCompleto_1.sql`
- **Descripción**: Contiene la creación de las tablas `students` y `address` con relaciones de clave foránea. Además, inserta datos y calcula el GPA promedio de los estudiantes que requieren transporte y viven a más de 5 km.
- **Tablas**:
  - `students`: Información básica del estudiante.
  - `address`: Direcciones de los estudiantes y sus preferencias de transporte.

### 8. `TableStudents.sql`
- **Descripción**: Define una estructura completa para la gestión de estudiantes, cursos y registros históricos de calificaciones.
- **Contenido**:
  - Creación de la base de datos y sus tablas.
  - Inserción de registros de ejemplo.
  - Creación de índices y vistas.
  - Uso de procedimientos almacenados y triggers.
- **Tablas**:
  - `STUDENT`: Información personal del estudiante.
  - `STUDENT_COURSES`: Registros de cursos tomados por cada estudiante.
  - `GRADE_HISTORY`: Historial de calificaciones de los cursos.

## Cómo usar los archivos

1. **Creación de Tablas**:
   Ejecuta `create.sql` para crear la estructura de la base de datos inicial.

2. **Inserción de Datos**:
   Ejecuta `insert.sql` para poblar las tablas con datos de ejemplo.

3. **Ejercicios**:
   - Ejecuta `Ejercicio_1.sql`, `Ejercicio_2.sql`, etc., en secuencia para resolver los problemas propuestos.
   - Cada archivo incluye comentarios que explican el objetivo y las consultas utilizadas.

4. **Completar con `EjercicioCompleto_1.sql`**:
   Puedes usar este archivo para ejecutar un ejercicio completo de creación, inserción y consulta de datos.

## Requisitos

- **Base de Datos**: MySQL o cualquier otra base de datos compatible con SQL.
- **Editor**: Cualquier editor de texto que soporte SQL (Sublime, VSCode, MySQL Workbench).
- **Terminal**: Acceso a línea de comandos para ejecutar scripts SQL si se usa en local.

## Contribución

Si tienes sugerencias o encuentras errores, por favor, abre un issue o envía un pull request.
