-- ########################################################## FUNCIONES #####################################################
-- ============ FUNCIONES CON STRINGS ============
-- FUNCIÓN 1 - FUNCIÓN DE CONCATENACIÓN
SELECT CONCAT(Nombre, " ", Apellido) AS "Nombre_Completo" FROM autores;

-- FUNCIÓN 2 - CANTIDAD DE CARACTERES
SELECT LENGTH(CONCAT(Nombre, " ", Apellido)) AS "Caracteres_nombre+apellido" FROM autores;

-- FUNCIÓN 3 - MAYUSCULAS
SELECT UPPER(Nombre) AS "NOMBRE", Apellido FROM autores;

-- FUNCIÓN 4 - EXTRAE CARACTERES DESDE IZQUIERDA
SELECT * FROM autores WHERE LEFT(Nombre, 1) = 'G'; 

-- ============ FUNCIONES CON NÚMERO ============ 
-- FUNCIÓN 5 - TRUNCA NÚMERO FLOTANTE A UN NÚMERO ESPECIFICO DECIMAL
SELECT precio, TRUNCATE(precio, 1) AS "REDONDEADO"  FROM libros;

-- FUNCIÓN 6 - REDONDEA NÚMERO FLOTANTE 
SELECT precio, ROUND(precio, 0) AS "REDONDEADO"  FROM libros;

-- ============ FUNCIONES CON CONDICIONALE============ 
-- FUNCIÓN 7 - CON CONDICIONALES
SELECT IF(precio > 90, precio, "menor a 90") AS Precio_Mayor_90 FROM libros;

-- ################################### CREACIÓN DE FUNCIONES 1 #######################################
-- FUNCIÓN SIMULACIÓN DE AMPLIACIÓN DE FECHA DE DEVOLUCIÓN
DROP FUNCTION fn_agregar_dias_prestamo;
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
SELECT fn_agregar_días_prestamo(2, 8) AS FECHAS_PRESTAMOS_LIBROS;

-- ################################### CREACIÓN DE FUNCIONES 2 #######################################
-- FUNCIÓN VER FECHA DE NACIMIENTO DE AUTORES POR SU ID
DROP FUNCTION fn_fecha_nacimiento_autor;
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
SELECT fn_fecha_nacimiento_autor(2) AS;