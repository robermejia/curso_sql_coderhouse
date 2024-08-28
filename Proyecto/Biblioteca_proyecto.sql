-- CREACIÓN DE BASE DE DATOS
CREATE DATABASE proyecto_biblioteca;
-- POSICIONARSE EN LA BD
USE proyecto_biblioteca;

-- ELIMINACIÓN DE BASE DE DATOS
DROP DATABASE proyecto_biblioteca;

-- CREACIÓN DE TABLAS
CREATE TABLE editoriales (
    ID_Editorial INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);

CREATE TABLE generos (
    ID_Genero INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE miembros (
    ID_Miembro INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Fecha_Registro DATE
);

CREATE TABLE autores (
    ID_Autor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Nacionalidad VARCHAR(100),
    Fecha_Nacimiento DATE
);

CREATE TABLE libros (
    ID_Libro INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Ano_Publicacion INT,
    ID_Genero INT,
    ID_Editorial INT,
    FOREIGN KEY (ID_Genero) REFERENCES Generos(ID_Genero),
    FOREIGN KEY (ID_Editorial) REFERENCES Editoriales(ID_Editorial)
);

CREATE TABLE prestamos (
    ID_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
    ID_Libro INT,
    ID_Miembro INT,
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro),
    FOREIGN KEY (ID_Miembro) REFERENCES Miembros(ID_Miembro)
);

CREATE TABLE libro_Autor (
    ID_Libro INT,
    ID_Autor INT,
    PRIMARY KEY (ID_Libro, ID_Autor),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro),
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor)
);

-- INSERCIONES
INSERT INTO Editoriales (Nombre, Direccion, Telefono) VALUES
('Editorial Planeta', 'Av. Javier Prado 123, Lima', '01-2345678'),
('Penguin Random House', 'Calle de las Letras 45, Madrid', '+34 910 123 456'),
('HarperCollins', '195 Broadway, New York', '+1 212-207-7000'),
('Simon & Schuster', '1230 Avenue of the Americas, New York', '+1 212-698-7000'),
('Alfaguara', 'Calle Alfonso XII, 62, Madrid', '+34 917 595 300'),
('Anagrama', 'Calle Pedró Martell, 19, Barcelona', '+34 933 687 850'),
('Random House Mondadori', 'Av. Diagonal, 662-664, Barcelona', '+34 934 928 840'),
('Editorial SM', 'Calle de Impresores, 2, Boadilla del Monte', '+34 917 596 400'),
('Santillana', 'Calle del Tambre, 50, Madrid', '+34 913 984 500'),
('Edebé', 'Calle de Provença, 386, Barcelona', '+34 934 535 500'),
('Minotauro', 'Calle de Espronceda, 32, Barcelona', '+34 933 663 600'),
('Roca Editorial', 'Calle de Roger de Llúria, 118, Barcelona', '+34 932 082 040');

INSERT INTO Generos (Nombre) VALUES
('Novela'),
('Ciencia Ficción'),
('Historia'),
('Fantasía'),
('Biografía'),
('Romance'),
('Misterio'),
('Terror'),
('Aventura'),
('Poesía'),
('Ensayo'),
('Drama');

INSERT INTO Miembros (Nombre, Direccion, Telefono, Fecha_Registro) VALUES
('Carlos López', 'Calle Falsa 123, Lima', '987654321', '2024-01-15'),
('María Pérez', 'Av. Universitaria 678, Lima', '912345678', '2024-02-20'),
('José Martínez', 'Av. Pardo y Aliaga 120, Lima', '987654322', '2024-03-10'),
('Lucía Gómez', 'Jirón Miraflores 567, Lima', '987654323', '2024-04-05'),
('Andrés Ramírez', 'Calle Las Lomas 876, Lima', '987654324', '2024-05-12'),
('Ana Torres', 'Av. Brasil 450, Lima', '987654325', '2024-06-18'),
('Jorge Rodríguez', 'Calle Los Sauces 34, Lima', '987654326', '2024-07-25'),
('Elena Gutiérrez', 'Av. Benavides 223, Lima', '987654327', '2024-08-01'),
('Ricardo Méndez', 'Calle Los Olivos 789, Lima', '987654328', '2024-08-15'),
('Isabel Fernández', 'Jirón Lampa 234, Lima', '987654329', '2024-09-20'),
('Rosa García', 'Av. San Felipe 453, Lima', '987654330', '2024-10-05'),
('Diego Herrera', 'Calle Las Flores 123, Lima', '987654331', '2024-11-10');

INSERT INTO Autores (ID_Autor, Nombre, Nacionalidad, Fecha_Nacimiento) VALUES
(1, 'Gabriel García Márquez', 'Colombiana', '1927-03-06'),
(2, 'Isaac Asimov', 'Rusa-Americana', '1920-01-02'),
(3, 'Mario Vargas Llosa', 'Peruana', '1936-03-28'),
(4, 'J.K. Rowling', 'Británica', '1965-07-31'),
(5, 'George Orwell', 'Británica', '1903-06-25'),
(6, 'Julio Verne', 'Francesa', '1828-02-08'),
(7, 'Jane Austen', 'Británica', '1775-12-16'),
(8, 'Ernest Hemingway', 'Americana', '1899-07-21'),
(9, 'Agatha Christie', 'Británica', '1890-09-15'),
(10, 'H.P. Lovecraft', 'Americana', '1890-08-20'),
(11, 'Miguel de Cervantes', 'Española', '1547-09-29'),
(12, 'Virginia Woolf', 'Británica', '1882-01-25');

INSERT INTO Libros (ID_Libro, Titulo, Ano_Publicacion, ID_Genero, ID_Editorial) VALUES
(1, 'Cien Años de Soledad', 1967, 1, 1),
(2, 'Fundación', 1951, 2, 2),
(3, 'La Casa Verde', 1966, 1, 3),
(4, 'Harry Potter y la Piedra Filosofal', 1997, 4, 4),
(5, '1984', 1949, 6, 5),
(6, 'Viaje al Centro de la Tierra', 1864, 4, 6),
(7, 'Orgullo y Prejuicio', 1813, 5, 7),
(8, 'El Viejo y el Mar', 1952, 1, 8),
(9, 'Asesinato en el Orient Express', 1934, 7, 9),
(10, 'La Llamada de Cthulhu', 1928, 8, 10),
(11, 'Don Quijote de la Mancha', 1605, 1, 11),
(12, 'Al Faro', 1927, 12, 12);

INSERT INTO Prestamos (ID_Libro, ID_Miembro, Fecha_Prestamo, Fecha_Devolucion) VALUES
(1, 1, '2024-08-10', '2024-08-20'),
(2, 2, '2024-08-15', '2024-08-25'),
(3, 3, '2024-07-01', '2024-07-15'),
(4, 4, '2024-07-20', '2024-08-05'),
(5, 5, '2024-06-25', '2024-07-05'),
(6, 6, '2024-05-15', '2024-05-25'),
(7, 7, '2024-04-10', '2024-04-20'),
(8, 8, '2024-03-18', '2024-03-28'),
(9, 9, '2024-02-20', '2024-03-01'),
(10, 10, '2024-01-12', '2024-01-22'),
(11, 11, '2024-12-05', '2024-12-15'),
(12, 12, '2024-11-01', '2024-11-11');

INSERT INTO Libro_Autor (ID_Libro, ID_Autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

-- VISUALIZAR DATOS INSERTADOS
SELECT * FROM autores;
SELECT * FROM editoriales;
SELECT * FROM generos;
SELECT * FROM libro_autor;
SELECT * FROM libros;
SELECT * FROM miembros;
SELECT * FROM prestamos;