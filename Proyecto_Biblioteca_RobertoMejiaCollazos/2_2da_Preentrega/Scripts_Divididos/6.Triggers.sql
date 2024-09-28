-- ############################################################ TIGGERS ###########################################################
-- ########################################## TIGGERS 1 ######################################
DELIMITER //
CREATE TRIGGER nuevo_libro_autor
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

INSERT INTO Libros (ID_Libro, Titulo, Ano_Publicacion, ID_Genero, ID_Editorial, Precio, Stock) 
VALUES (13, 'Matar a un ruiseñor', 1960, 5, 1, 100.00, 12),
        (14, 'El gran Gatsby', 1925, 5, 1, 80.00, 18),
        (15, 'Fahrenheit 451', 1953, 6, 1, 90.00, 10);

-- ########################################## TIGGERS 2 ######################################
DELIMITER //
CREATE TRIGGER actualizar_stock_prestamo
AFTER INSERT ON Prestamos
FOR EACH ROW
BEGIN
-- Actualizar el stock del libro en la tabla Libros
    UPDATE Libros
    SET Stock = Stock - NEW.Cantidad_Pedidos
    WHERE ID_Libro = NEW.ID_Libro;
END //
DELIMITER ;
INSERT INTO Prestamos (ID_Libro, ID_Usuario, Fecha_Prestamo, Fecha_Devolucion, Cantidad_Pedidos)
VALUES (1, 1, '2024-04-26', NOW(), 2);