-- ####################################################### STORED PROCEDURES #################################################
-- ======= PROCEDIMIENTO 1 - PRÉSTAMO DE STOCK =======
DROP PROCEDURE IF EXISTS prestamo_stock;
DELIMITER //
CREATE PROCEDURE prestamo_stock(IN ID_Miembro INT, IN ID_Libro INT, OUT cantidad INT)
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

SHOW PROCEDURE STATUS; -- Visualizar la lista de procedimientos creadas
UPDATE Libros SET Stock = 5 WHERE ID_Libro = 6; -- Ejecutar si ya el valor quedo en 0
SET @cantidad = -1; -- Definir la variable @cantidad antes de llamar al procedimiento
CALL prestamo_stock(1, 6, @cantidad); -- Ejecutando el procedimiento
SELECT Stock FROM Libros WHERE ID_Libro = 6; -- Comprobar el número de Stoc

-- ======= PROCEDIMIENTO 2 - CATEGORÍA DE USUARIOS =======
DROP PROCEDURE IF EXISTS tipo_lector;
DELIMITER //
CREATE PROCEDURE tipo_lector(IN ID_Usuario INT)
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

SHOW PROCEDURE STATUS; -- Visualizar la lista de procedimientos creadas
SET @cantidad = 0; -- Definir la variable @cantidad antes de llamar al procedimiento
CALL tipo_lector(1); --  Ejecutando el procedimiento

-- ======= PROCEDIMIENTO 3 - LIBROS AL AZAR =======
DROP PROCEDURE IF EXISTS libro_azar; -- Eliminando el procedimiento si es que existe
DELIMITER //
CREATE PROCEDURE libro_azar()
BEGIN
    SET @iterador = 0;
    WHILE @iterador < 3 DO
        SELECT ID_Libro, Titulo FROM libros ORDER BY RAND() LIMIT 1;
        SET @iterador = @iterador + 1;
    END WHILE;
END //
DELIMITER ;

CALL libro_azar(); -- Ejecutando el procedimiento
SHOW PROCEDURE STATUS; -- Visualizar la lista de procedimientos creadas