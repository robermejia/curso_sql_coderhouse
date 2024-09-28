-- ########################################################### VISTAS #######################################################
-- ========= VISTA 1 - PRESTAMOS DE LIBROS =========
DROP VIEW IF EXISTS prestamos_usuarios_vw; -- Eliminando la vista si es que existe
-- CREANDO LA VISTA "prestamos_usuarios_vw"
CREATE VIEW prestamos_usuarios_vw AS
SELECT usuarios.ID_Usuario, usuarios.Nombre, MAX(prestamos.Fecha_Devolucion) AS Ultima_Fecha_Devolucion
FROM usuarios INNER JOIN prestamos ON usuarios.ID_Usuario = prestamos.ID_Usuario
GROUP BY usuarios.ID_Usuario;

SELECT * FROM prestamos_usuarios_vw; -- Visualiza la vista creada

-- ========= VISTA 2 - LIBROS MÁS CAROS =========
DROP VIEW IF EXISTS libros_caros_vw; -- Eliminando la vista si es que existe
CREATE VIEW libros_caros_vw AS
SELECT ID_Libro, Titulo, Precio 
FROM libros ORDER BY Precio DESC LIMIT 5;

SELECT * FROM libros_caros_vw; -- Visualiza la vista creada

-- ========= VISTA 3 - AUTOR MÁS JOVEN =========
DROP VIEW IF EXISTS autores_top_jovenes_vw; -- Eliminando la vista si es que existe
CREATE VIEW autores_top_jovenes_vw AS
SELECT 
    ID_Autor, Nombre, Nacionalidad, Fecha_Nacimiento
FROM autores ORDER BY ABS(DATEDIFF(Fecha_Nacimiento, NOW())) LIMIT 5;

SELECT * FROM autores_top_jovenes_vw; -- Visualiza la vista creada

-- ========= VISTA 4 - STOCK DE LIBROS =========
DROP VIEW IF EXISTS stock_libros_vw; -- Eliminando la vista si es que existe
CREATE VIEW stock_libros_vw AS
SELECT COUNT(ID_Libro) AS STOCK_LIBROS FROM Libros;

SELECT * FROM stock_libros_vw; -- Visualiza la vista creada
