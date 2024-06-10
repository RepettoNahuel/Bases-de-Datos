CREATE DATABASE IF NOT EXISTS PelículasV2;
USE PelículasV2;

CREATE TABLE generos(
id_genero INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL
);

CREATE TABLE calificaciones(
id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE nacionalidades(
id_nacionalidad INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL
);

CREATE TABLE directores(
id_director INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
edad INT NOT NULL,
nacionalidad INT NOT NULL,
FOREIGN KEY (nacionalidad) REFERENCES nacionalidades(id_nacionalidad)
);

CREATE TABLE movies(
id_movie INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
descripcion VARCHAR(255) NOT NULL,
genero INT NOT NULL,
calificacion INT NOT NULL,
año YEAR,
estrellas INT NOT NULL CHECK (estrellas >= 1 AND estrellas <= 5),
director INT NOT NULL,
FOREIGN KEY (genero) REFERENCES generos(id_genero),
FOREIGN KEY (calificacion) REFERENCES calificaciones(id_calificacion),
FOREIGN KEY (director) REFERENCES directores(id_director)
);

CREATE TABLE paises(
id_pais INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL
);

CREATE TABLE usuarios(
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
contraseña VARCHAR(255) NOT NULL,
fecha_nac DATE,
pais INT NOT NULL,
FOREIGN KEY (pais) REFERENCES paises(id_pais)
);

-- Inserción de 15 registros en la tabla nacionalidades
INSERT INTO nacionalidades (nombre) VALUES
('Argentino'),
('Boliviano'),
('Brazileño'),
('Aleman'),
('Belga'),
('Canadiense'),
('Colombiano'),
('Coreano'),
('Chino'),
('Español'),
('Frances'),
('Ingles'),
('Japones'),
('Estadounidense'),
('Holandes');

-- Inserción de 15 registros en la tabla directores
INSERT INTO directores (nombre, apellido, edad, nacionalidad) VALUES
('Jose', 'Gomez', 45, 1),
('Maria', 'Lopez', 35, 2),
('Carlos', 'Perez', 28, 3),
('Ana', 'Martinez', 50, 1),
('Luis', 'Garcia', 40, 1),
('Laura', 'Rodriguez', 33, 4),
('Miguel', 'Fernandez', 42, 12),
('Lucia', 'Sanchez', 29, 5),
('Jose', 'Ramirez', 37, 4),
('Sofia', 'Diaz', 27, 6),
('Alberto', 'Alvarez', 48, 14),
('Carmen', 'Molina', 31, 9),
('David', 'Castro', 26, 9),
('Paula', 'Ortiz', 49, 6),
('Francisco', 'Ruiz', 30, 15);

-- Inserción de 15 registros en la tabla generos
INSERT INTO generos (nombre) VALUES
('Terror'),
('Comedia'),
('Acción'),
('Suspenso'),
('Romance'),
('Drama'),
('Aventura'),
('Ciencia ficción'),
('Thriller'),
('Fantasía'),
('Animación'),
('Documentales'),
('Catástrofe'),
('Musicales'),
('Deportivas');

-- Inserción de 5 registros en la tabla calificacion
INSERT INTO calificaciones (descripcion) VALUES
('G – General Audiences'),
('PG – Parental Guidance Suggested'),
('PG-13 – Parents Strongly Cautioned'),
('R – Restricted'),
('NC-17 – Adults Only');

-- Inserción de 15 registros en la tabla movies
INSERT INTO movies (nombre, descripcion, genero, calificacion, año, estrellas, director) VALUES
('Movie 1', 'Description 1', 2, 2, 2024, 5, 1),
('Movie 2', 'Description 2', 1, 4, 2023, 4, 2),
('Movie 3', 'Description 3', 3, 3, 2022, 3, 3),
('Movie 4', 'Description 4', 2, 2, 2010, 2, 4),
('Movie 5', 'Description 5', 1, 4, 2005, 1, 5),
('Movie 6', 'Description 6', 3, 5, 2015, 5, 6),
('Movie 7', 'Description 7', 2, 2, 2024, 4, 7),
('Movie 8', 'Description 8', 1, 4, 2023, 3, 8),
('Movie 9', 'Description 9', 1, 3, 2008, 2, 9),
('Movie 10', 'Description 10', 1, 2, 2024, 1, 10),
('Movie 11', 'Description 11', 4, 1, 2011, 5, 11),
('Movie 12', 'Description 12', 4, 3, 2023, 4, 12),
('Movie 13', 'Description 13', 5, 2, 2007, 3, 13),
('Movie 14', 'Description 14', 5, 4, 2009, 2, 14),
('Movie 15', 'Description 15', 3, 3, 2017, 1, 15);

-- Inserción de 15 registros en la tabla nacionalidades
INSERT INTO paises (nombre) VALUES
('Argentina'),
('Bolivia'),
('Brazil'),
('Alemania'),
('Belgica'),
('Canada'),
('Colombia'),
('Corea'),
('China'),
('España'),
('Francia'),
('Inglaterra'),
('Japon'),
('Estado Unidos'),
('Holanda');

-- Inserción de 15 registros en la tabla usuarios
INSERT INTO usuarios (nombre, apellido, email, contraseña, fecha_nac, pais) VALUES
('Juan', 'Perez', 'juan.perez@example.com', 'hashed_password1', '1990-01-01', 1),
('Ana', 'Lopez', 'ana.lopez@example.com', 'hashed_password2', '1985-02-02', 14),
('Luis', 'Garcia', 'luis.garcia@example.com', 'hashed_password3', '1975-03-03', 12),
('Carlos', 'Martinez', 'carlos.martinez@example.com', 'hashed_password4', '1995-04-04', 11),
('Laura', 'Sanchez', 'laura.sanchez@example.com', 'hashed_password5', '1980-05-05', 8),
('Miguel', 'Fernandez', 'miguel.fernandez@example.com', 'hashed_password6', '1992-06-06', 6),
('Lucia', 'Ramirez', 'lucia.ramirez@example.com', 'hashed_password7', '1988-07-07', 1),
('Pedro', 'Diaz', 'pedro.diaz@example.com', 'hashed_password8', '1978-08-08', 4),
('Sofia', 'Rodriguez', 'sofia.rodriguez@example.com', 'hashed_password9', '1999-09-09', 12),
('Alberto', 'Molina', 'alberto.molina@example.com', 'hashed_password10', '1973-10-10', 1),
('Carmen', 'Ortiz', 'carmen.ortiz@example.com', 'hashed_password11', '1983-11-11', 4),
('David', 'Castro', 'david.castro@example.com', 'hashed_password12', '1996-12-12', 9),
('Paula', 'Ruiz', 'paula.ruiz@example.com', 'hashed_password13', '1977-01-13', 1),
('Francisco', 'Alvarez', 'francisco.alvarez@example.com', 'hashed_password14', '1984-02-14', 4),
('Jose', 'Gomez', 'jose.gomez@example.com', 'hashed_password15', '1993-03-15', 12);

-- Realizar las siguientes consultas

-- consultar las películas creadas desde el 2010
SELECT * FROM movies WHERE año >= 2010;

-- consultar las películas creadas antes del 2010
SELECT * FROM movies WHERE año < 2010;

-- consultar las películas creadas en el año 2024
SELECT * FROM movies WHERE año = 2024;

-- consultar las peliculas del genero terror
SELECT m.id_movie, m.nombre, m.descripcion, g.nombre, m.calificacion, m.año, m.director 
FROM movies AS m JOIN generos AS g on m.genero = g.id_genero
WHERE g.nombre = 'Terror';

-- consultar las peliculas del genero comedia
SELECT m.id_movie, m.nombre, m.descripcion, g.nombre, m.calificacion, m.año, m.director 
FROM movies AS m JOIN generos AS g on m.genero = g.id_genero
WHERE g.nombre = 'Comedia';

-- consultar las peliculas del genero accion
SELECT m.id_movie, m.nombre, m.descripcion, g.nombre, m.calificacion, m.año, m.director 
FROM movies AS m JOIN generos AS g on m.genero = g.id_genero
WHERE g.nombre = 'Accion';

-- consultar las películas que fueron creadas antes del 2022 y que sean de comedia
SELECT m.id_movie, m.nombre, m.descripcion, g.nombre, m.calificacion, m.año, m.director 
FROM movies AS m JOIN generos AS g on m.genero = g.id_genero
WHERE m.año < 2022 AND g.nombre = 'Comedia';

-- consultar las pelculas que su número de estrellas en cuanto a calificación sea igual a 5
SELECT * FROM movies WHERE estrellas = 5;

-- consultar las películas que su número de estrellas de calificación sea menor a 3
SELECT * FROM movies WHERE estrellas < 3;

-- consultar las películas que su género sea acción y su calificación de estrellas sea mayor o igual a 4
SELECT m.id_movie, m.nombre, m.descripcion, g.nombre, m.calificacion, m.año, m.director 
FROM movies AS m JOIN generos AS g on m.genero = g.id_genero
WHERE g.nombre = 'Accion' AND m.estrellas >= 4;

-- consultar los directores que tengan la edad entre 25 y 40 años
SELECT * FROM directores WHERE edad BETWEEN 25 AND 40;

-- consultar los directores que tengan el nombre “jose”
SELECT * FROM directores WHERE nombre = 'Jose';

-- consultar los directores que su país de origen sea Argentina
SELECT d.id_director, d.nombre, d.apellido, d.edad, n.nombre
FROM directores AS d JOIN nacionalidades AS n ON d.nacionalidad = n.id_nacionalidad
WHERE n.nombre = 'Argentino';

-- consultar los directores que su país de origen sea Inglaterra
SELECT d.id_director, d.nombre, d.apellido, d.edad, n.nombre
FROM directores AS d JOIN nacionalidades AS n ON d.nacionalidad = n.id_nacionalidad
WHERE n.nombre = 'Ingles';

-- Consultar los directores que su país de origen sea Alemania y su edad sea mayor a 35
SELECT d.id_director, d.nombre, d.apellido, d.edad, n.nombre
FROM directores AS d JOIN nacionalidades AS n ON d.nacionalidad = n.id_nacionalidad
WHERE n.nombre = 'Aleman' AND d.edad > 35;