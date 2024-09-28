-- ############################################### CREACIÓN DE BASE DE DATOS ##############################################
-- ELIMINACIÓN DE BASE DE DATOS 
DROP DATABASE IF EXISTS proyecto_biblioteca;
-- CREACIÓN DE BASE DE DATOS
CREATE DATABASE proyecto_biblioteca;
-- POSICIONARSE EN LA BD
USE proyecto_biblioteca;

-- ################################################### CREACIÓN DE TABLAS #################################################
-- CREACIÓN DE TABLAS
CREATE TABLE IF NOT EXISTS Editoriales (
    ID_Editorial INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Generos (
    ID_Genero INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Usuarios (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Fecha_Registro DATE
);

CREATE TABLE IF NOT EXISTS Autores (
    ID_Autor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Nacionalidad VARCHAR(100),
    Fecha_Nacimiento DATE
);

CREATE TABLE IF NOT EXISTS Libros (
    ID_Libro INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Ano_Publicacion INT,
    ID_Genero INT,
    ID_Editorial INT,
    Precio DECIMAL(10, 2),
    Stock INT,
    FOREIGN KEY (ID_Genero) REFERENCES Generos(ID_Genero),
    FOREIGN KEY (ID_Editorial) REFERENCES Editoriales(ID_Editorial)
);

CREATE TABLE IF NOT EXISTS Prestamos (
    ID_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
    ID_Libro INT,
    ID_Usuario INT,
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    Cantidad_Pedidos INT,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);

CREATE TABLE IF NOT EXISTS Libro_Autor (
    ID_Libro INT,
    ID_Autor INT,
    PRIMARY KEY (ID_Libro, ID_Autor),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro),
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor)
);

-- VISUALIZAR TODAS LAS TABLAS DE LA BASE DE DATOS
SHOW TABLES;