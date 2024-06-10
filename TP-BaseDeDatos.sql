CREATE DATABASE IF NOT EXISTS Películas;
USE Películas;

CREATE TABLE movies(
id_movie INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
descripcion VARCHAR(255) NOT NULL,
genero VARCHAR(255) NOT NULL,
calificacion VARCHAR(255) NOT NULL,
año YEAR,
estrellas INT NOT NULL CHECK (estrellas >= 1 AND estrellas <= 5),
director INT NOT NULL,
FOREIGN KEY (director) REFERENCES directores(id_director)
);

CREATE TABLE directores(
id_director INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
edad INT NOT NULL,
nacionalidad VARCHAR(255) NOT NULL
);

CREATE TABLE usuarios(
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
contraseña VARCHAR(255) NOT NULL,
fecha_nac DATE,
pais VARCHAR(255) NOT NULL
);

-- Inserción de 15 registros en la tabla directores
INSERT INTO directores (nombre, apellido, edad, nacionalidad) VALUES
('Jose', 'Gomez', 45, 'Argentina'),
('Maria', 'Lopez', 35, 'Bolivia'),
('Carlos', 'Perez', 28, 'Brazil'),
('Ana', 'Martinez', 50, 'Argentina'),
('Luis', 'Garcia', 40, 'Argentina'),
('Laura', 'Rodriguez', 33, 'Alemania'),
('Miguel', 'Fernandez', 42, 'Inglaterra'),
('Lucia', 'Sanchez', 29, 'Uruguiay'),
('Jose', 'Ramirez', 37, 'Alemania'),
('Sofia', 'Diaz', 27, 'Perú'),
('Alberto', 'Alvarez', 48, 'EEUU'),
('Carmen', 'Molina', 31, 'China'),
('David', 'Castro', 26, 'China'),
('Paula', 'Ortiz', 49, 'Canada'),
('Francisco', 'Ruiz', 30, 'Chile');

-- Inserción de 15 registros en la tabla movies
INSERT INTO movies (nombre, descripcion, genero, calificacion, año, estrellas, director) VALUES
('Movie 1', 'Description 1', 'Comedia', 'PG', 2024, 5, 1),
('Movie 2', 'Description 2', 'Terror', 'R', 2023, 4, 2),
('Movie 3', 'Description 3', 'Accion', 'PG-13', 2022, 3, 3),
('Movie 4', 'Description 4', 'Comedia', 'PG', 2010, 2, 4),
('Movie 5', 'Description 5', 'Terror', 'R', 2005, 1, 5),
('Movie 6', 'Description 6', 'Accion', 'PG-13', 2015, 5, 6),
('Movie 7', 'Description 7', 'Comedia', 'PG', 2024, 4, 7),
('Movie 8', 'Description 8', 'Terror', 'R', 2023, 3, 8),
('Movie 9', 'Description 9', 'Terror', 'PG-13', 2008, 2, 9),
('Movie 10', 'Description 10', 'Terror', 'PG', 2024, 1, 10),
('Movie 11', 'Description 11', 'Suspenso', 'R', 2011, 5, 11),
('Movie 12', 'Description 12', 'Suspenso', 'PG-13', 2023, 4, 12),
('Movie 13', 'Description 13', 'Romance', 'PG', 2007, 3, 13),
('Movie 14', 'Description 14', 'Romance', 'R', 2009, 2, 14),
('Movie 15', 'Description 15', 'Accion', 'PG-13', 2017, 1, 15);

-- Inserción de 15 registros en la tabla usuarios
INSERT INTO usuarios (nombre, apellido, email, contraseña, fecha_nac, pais) VALUES
('Juan', 'Perez', 'juan.perez@example.com', 'hashed_password1', '1990-01-01', 'Argentina'),
('Ana', 'Lopez', 'ana.lopez@example.com', 'hashed_password2', '1985-02-02', 'Alemania'),
('Luis', 'Garcia', 'luis.garcia@example.com', 'hashed_password3', '1975-03-03', 'Inglaterra'),
('Carlos', 'Martinez', 'carlos.martinez@example.com', 'hashed_password4', '1995-04-04', 'Argentina'),
('Laura', 'Sanchez', 'laura.sanchez@example.com', 'hashed_password5', '1980-05-05', 'Alemania'),
('Miguel', 'Fernandez', 'miguel.fernandez@example.com', 'hashed_password6', '1992-06-06', 'Inglaterra'),
('Lucia', 'Ramirez', 'lucia.ramirez@example.com', 'hashed_password7', '1988-07-07', 'Argentina'),
('Pedro', 'Diaz', 'pedro.diaz@example.com', 'hashed_password8', '1978-08-08', 'Alemania'),
('Sofia', 'Rodriguez', 'sofia.rodriguez@example.com', 'hashed_password9', '1999-09-09', 'Inglaterra'),
('Alberto', 'Molina', 'alberto.molina@example.com', 'hashed_password10', '1973-10-10', 'Argentina'),
('Carmen', 'Ortiz', 'carmen.ortiz@example.com', 'hashed_password11', '1983-11-11', 'Alemania'),
('David', 'Castro', 'david.castro@example.com', 'hashed_password12', '1996-12-12', 'Inglaterra'),
('Paula', 'Ruiz', 'paula.ruiz@example.com', 'hashed_password13', '1977-01-13', 'Argentina'),
('Francisco', 'Alvarez', 'francisco.alvarez@example.com', 'hashed_password14', '1984-02-14', 'Alemania'),
('Jose', 'Gomez', 'jose.gomez@example.com', 'hashed_password15', '1993-03-15', 'Inglaterra');

-- Realizar las siguientes consultas

-- consultar las películas creadas desde el 2010
SELECT * FROM movies WHERE año >= 2010;

-- consultar las películas creadas antes del 2010
SELECT * FROM movies WHERE año < 2010;

-- consultar las películas creadas en el año 2024
SELECT * FROM movies WHERE año = 2024;

-- consultar las peliculas del genero terror
SELECT * FROM movies WHERE genero = 'Terror';

-- consultar las peliculas del genero comedia
SELECT * FROM movies WHERE genero = 'Comedia';

-- consultar las peliculas del genero accion
SELECT * FROM movies WHERE genero = 'Accion';

-- consultar las películas que fueron creadas antes del 2022 y que sean de comedia
SELECT * FROM movies WHERE año < 2022 AND genero = 'Comedia';

-- consultar las pelculas que su número de estrellas en cuanto a calificación sea igual a 5
SELECT * FROM movies WHERE estrellas = 5;

-- consultar las películas que su número de estrellas de calificación sea menor a 3
SELECT * FROM movies WHERE estrellas < 3;

-- consultar las películas que su género sea acción y su calificación de estrellas sea mayor o igual a 4
SELECT * FROM movies WHERE genero = 'Accion' AND estrellas >= 4;

-- consultar los directores que tengan la edad entre 25 y 40 años
SELECT * FROM directores WHERE edad BETWEEN 25 AND 40;

-- consultar los directores que tengan el nombre “jose”
SELECT * FROM directores WHERE nombre = 'Jose';

-- consultar los directores que su país de origen sea Argentina
SELECT * FROM directores WHERE nacionalidad = 'Argentina';

-- consultar los directores que su país de origen sea Inglaterra
SELECT * FROM directores WHERE nacionalidad = 'Inglaterra';

-- Consultar los directores que su país de origen sea Alemania y su edad sea mayor a 35
SELECT * FROM directores WHERE nacionalidad = 'Alemania' AND edad > 35;
