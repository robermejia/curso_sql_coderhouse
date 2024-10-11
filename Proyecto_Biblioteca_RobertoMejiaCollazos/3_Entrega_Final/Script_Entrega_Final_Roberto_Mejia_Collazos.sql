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

-- ######################################################## INSERCIONES ####################################################
-- INSERCIONES MULTIPLES
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

INSERT INTO Usuarios (Nombre, Apellido, Direccion, Telefono, Fecha_Registro) VALUES
('Carlos', 'López', 'Calle Falsa 123, Lima', '987654321', '2024-01-15'),
('María', 'Pérez', 'Av. Universitaria 678, Lima', '912345678', '2024-02-20'),
('José', 'Martínez', 'Av. Pardo y Aliaga 120, Lima', '987654322', '2024-03-10'),
('Lucía', 'Gómez', 'Jirón Miraflores 567, Lima', '987654323', '2024-04-05'),
('Andrés', 'Ramírez', 'Calle Las Lomas 876, Lima', '987654324', '2024-05-12'),
('Ana', 'Torres', 'Av. Brasil 450, Lima', '987654325', '2024-06-18'),
('Jorge', 'Rodríguez', 'Calle Los Sauces 34, Lima', '987654326', '2024-07-25'),
('Elena', 'Gutiérrez', 'Av. Benavides 223, Lima', '987654327', '2024-08-01'),
('Ricardo', 'Méndez', 'Calle Los Olivos 789, Lima', '987654328', '2024-08-15'),
('Isabel', 'Fernández', 'Jirón Lampa 234, Lima', '987654329', '2024-09-20'),
('Rosa', 'García', 'Av. San Felipe 453, Lima', '987654330', '2024-10-05'),
('Diego', 'Herrera', 'Calle Las Flores 123, Lima', '987654331', '2024-11-10');

INSERT INTO Autores (ID_Autor, Nombre, Apellido, Nacionalidad, Fecha_Nacimiento) VALUES
(1, 'Gabriel', 'García Márquez', 'Colombiana', '1927-03-06'),
(2, 'Isaac', 'Asimov', 'Rusa-Americana', '1920-01-02'),
(3, 'Mario', 'Vargas Llosa', 'Peruana', '1936-03-28'),
(4, 'J.K.', 'Rowling', 'Británica', '1965-07-31'),
(5, 'George', 'Orwell', 'Británica', '1903-06-25'),
(6, 'Julio', 'Verne', 'Francesa', '1828-02-08'),
(7, 'Jane', 'Austen', 'Británica', '1775-12-16'),
(8, 'Ernest', 'Hemingway', 'Americana', '1899-07-21'),
(9, 'Agatha', 'Christie', 'Británica', '1890-09-15'),
(10, 'H.P.', 'Lovecraft', 'Americana', '1890-08-20'),
(11, 'Miguel de', 'Cervantes', 'Española', '1547-09-29'),
(12, 'Virginia', 'Woolf', 'Británica', '1882-01-25');

INSERT INTO Libros (ID_Libro, Titulo, Ano_Publicacion, ID_Genero, ID_Editorial, Precio, Stock) VALUES
(1, 'Cien Años de Soledad', 1967, 1, 1, 150.50, 10),
(2, 'Fundación', 1951, 2, 2, 120.75, 15),
(3, 'La Casa Verde', 1966, 1, 3, 95.25, 8),
(4, 'Harry Potter y la Piedra Filosofal', 1997, 4, 4, 180.30, 20),
(5, '1984', 1949, 6, 5, 88.90, 12),
(6, 'Viaje al Centro de la Tierra', 1864, 4, 6, 75.60, 5),
(7, 'Orgullo y Prejuicio', 1813, 5, 7, 68.40, 7),
(8, 'El Viejo y el Mar', 1952, 1, 8, 105.80, 18),
(9, 'Asesinato en el Orient Express', 1934, 7, 9, 110.20, 14),
(10, 'La Llamada de Cthulhu', 1928, 8, 10, 95.75, 9),
(11, 'Don Quijote de la Mancha', 1605, 1, 11, 65.90, 25),
(12, 'Al Faro', 1927, 12, 12, 82.45, 6);

INSERT INTO Prestamos (ID_Libro, ID_Usuario, Fecha_Prestamo, Fecha_Devolucion, Cantidad_Pedidos) VALUES
(1, 1, '2024-08-10', '2024-08-20', 2),
(2, 2, '2024-08-15', '2024-08-25', 1),
(3, 3, '2024-07-01', '2024-07-15', 3),
(4, 4, '2024-07-20', '2024-08-05', 0),
(5, 5, '2024-06-25', '2024-07-05', 5),
(6, 6, '2024-05-15', '2024-05-25', 2),
(7, 7, '2024-04-10', '2024-04-20', 1),
(8, 8, '2024-03-18', '2024-03-28', 4),
(9, 9, '2024-02-20', '2024-03-01', 0),
(10, 10, '2024-01-12', '2024-01-22', 2),
(11, 11, '2024-12-05', '2024-12-15', 3),
(12, 12, '2024-11-01', '2024-11-11', 1);

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

-- ########################################################### VISTAS #######################################################
-- ========= VISTA 1 - PRESTAMOS DE LIBROS =========
DROP VIEW IF EXISTS vw_prestamos_usuarios; -- Eliminando la vista si es que existe
-- CREANDO LA VISTA "prestamos_usuarios_vw"
CREATE VIEW vw_prestamos_usuarios AS
SELECT usuarios.ID_Usuario, usuarios.Nombre, MAX(prestamos.Fecha_Devolucion) AS Ultima_Fecha_Devolucion
FROM usuarios INNER JOIN prestamos ON usuarios.ID_Usuario = prestamos.ID_Usuario
GROUP BY usuarios.ID_Usuario;



-- ========= VISTA 2 - LIBROS MÁS CAROS =========
DROP VIEW IF EXISTS vw_libros_caros; -- Eliminando la vista si es que existe
CREATE VIEW vw_libros_caros AS
SELECT ID_Libro, Titulo, Precio 
FROM libros ORDER BY Precio DESC LIMIT 5;


-- ========= VISTA 3 - AUTOR MÁS JOVEN =========
DROP VIEW IF EXISTS vw_autores_top_jovenes; -- Eliminando la vista si es que existe
CREATE VIEW vw_autores_top_jovenes AS
SELECT 
    ID_Autor, Nombre, Nacionalidad, Fecha_Nacimiento
FROM autores ORDER BY ABS(DATEDIFF(Fecha_Nacimiento, NOW())) LIMIT 5;



-- ========= VISTA 4 - STOCK DE LIBROS =========
DROP VIEW IF EXISTS vw_stock_libros; -- Eliminando la vista si es que existe
CREATE VIEW vw_stock_libros AS
SELECT COUNT(ID_Libro) AS STOCK_LIBROS FROM Libros;


-- ################################### CREACIÓN DE FUNCIONES 1 #######################################
-- FUNCIÓN SIMULACIÓN DE AMPLIACIÓN DE FECHA DE DEVOLUCIÓN
DROP FUNCTION IF EXISTS fn_agregar_dias_prestamo;
DELIMITER //
CREATE FUNCTION fn_agregar_dias_prestamo (prestamo_id INT, dias INT)
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE fecha_prestamo DATE;
    DECLARE fecha_limite DATE;

    SELECT Fecha_Devolucion INTO fecha_prestamo
    FROM prestamos
    WHERE ID_Prestamo = prestamo_id;

    SET fecha_limite = fecha_prestamo + INTERVAL dias DAY;

    RETURN CONCAT('Fecha de devolución: ', DATE_FORMAT(fecha_prestamo, '%Y-%m-%d'), ' - Nueva fecha límite: ', DATE_FORMAT(fecha_limite, '%Y-%m-%d'));
END;
//
DELIMITER ;

-- ################################### CREACIÓN DE FUNCIONES 2 #######################################
-- FUNCIÓN VER FECHA DE NACIMIENTO DE AUTORES POR SU ID
DROP FUNCTION IF EXISTS fn_fecha_nacimiento_autor;
DELIMITER //
CREATE FUNCTION fn_fecha_nacimiento_autor (autor_id INT)
RETURNS DATE
READS SQL DATA
BEGIN
    DECLARE fecha_autor DATE;
    SELECT Fecha_Nacimiento INTO fecha_autor
    FROM autores
    WHERE ID_Autor = autor_id;
    RETURN fecha_autor;
END;
//
DELIMITER ;

-- ####################################################### STORED PROCEDURES #################################################
-- ======= PROCEDIMIENTO 1 - PRÉSTAMO DE STOCK =======
DROP PROCEDURE IF EXISTS sp_prestamo_stock;
DELIMITER //
CREATE PROCEDURE sp_prestamo_stock(IN ID_Miembro INT, IN ID_Libro INT, OUT cantidad INT)
BEGIN
    DECLARE cantidad_libros INT;    
    SELECT Stock INTO cantidad_libros FROM libros WHERE libros.ID_Libro = ID_Libro; 
    IF cantidad_libros > 0 THEN
        -- Actualizar el stock en la tabla libros
        UPDATE libros SET Stock = Stock - 1 WHERE libros.ID_Libro = ID_Libro;
        
        SET cantidad = cantidad_libros - 1;
        SELECT "Se ha realizado el préstamo exitosamente." AS Mensaje;
    ELSE
        SELECT "No es posible realizar préstamos." AS Mensaje;
    END IF;
END //
DELIMITER ;

-- ======= PROCEDIMIENTO 2 - CATEGORÍA DE USUARIOS =======
DROP PROCEDURE IF EXISTS sp_tipo_lector;
DELIMITER //
CREATE PROCEDURE sp_tipo_lector(IN ID_Usuario INT)
BEGIN
    SET @cantidad = (SELECT Cantidad_Pedidos FROM prestamos
                    WHERE prestamos.ID_Usuario = ID_Usuario);
    CASE
        WHEN @cantidad = 5 THEN
            SELECT "Fanático" AS Mensaje;
        WHEN @cantidad = 4 THEN
            SELECT "Aficionado" AS Mensaje;
        WHEN @cantidad = 3 THEN
            SELECT "Promedio" AS Mensaje;
        ELSE
            SELECT "Nuevo" AS Mensaje;
    END CASE;
END //
DELIMITER ;

-- ======= PROCEDIMIENTO 3 - LIBROS AL AZAR =======
DROP PROCEDURE IF EXISTS sp_libro_azar; -- Eliminando el procedimiento si es que existe
DELIMITER //
CREATE PROCEDURE sp_libro_azar()
BEGIN
    SET @iterador = 0;
    WHILE @iterador < 3 DO
        SELECT ID_Libro, Titulo FROM libros ORDER BY RAND() LIMIT 1;
        SET @iterador = @iterador + 1;
    END WHILE;
END //
DELIMITER ;


-- ############################################################ TIGGERS ###########################################################
-- ########################################## TIGGERS 1 ######################################
DELIMITER //
CREATE TRIGGER tg_nuevo_libro_autor
AFTER INSERT ON Libros
FOR EACH ROW
BEGIN
-- Verificar si el libro ya existe en la tabla Libro_Autor
    IF NOT EXISTS (SELECT 1 FROM Libro_Autor WHERE ID_Libro = NEW.ID_Libro) THEN
    -- Insertar un nuevo registro en la tabla Libro_Autor
    INSERT INTO Libro_Autor (ID_Libro, ID_Autor) VALUES (NEW.ID_Libro, 1); -- Aquí puedes cambiar el ID_Autor por el que consideres 
    END IF;
END //
DELIMITER ;

-- ########################################## TIGGERS 2 ######################################
DELIMITER //
CREATE TRIGGER tg_actualizar_stock_prestamo
AFTER INSERT ON Prestamos
FOR EACH ROW
BEGIN
-- Actualizar el stock del libro en la tabla Libros
    UPDATE Libros
    SET Stock = Stock - NEW.Cantidad_Pedidos
    WHERE ID_Libro = NEW.ID_Libro;
END //
DELIMITER ;
