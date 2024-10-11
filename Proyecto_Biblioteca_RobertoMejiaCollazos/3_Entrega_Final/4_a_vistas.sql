-- ########################################################### VISTAS #######################################################
-- ========= VISTA 1 - PRESTAMOS DE LIBROS =========
DROP VIEW IF EXISTS vw_prestamos_usuarios; -- Eliminando la vista si es que existe
-- CREANDO LA VISTA "prestamos_usuarios_vw"
CREATE VIEW vw_prestamos_usuarios AS
SELECT usuarios.ID_Usuario, usuarios.Nombre, MAX(prestamos.Fecha_Devolucion) AS Ultima_Fecha_Devolucion
FROM usuarios INNER JOIN prestamos ON usuarios.ID_Usuario = prestamos.ID_Usuario
GROUP BY usuarios.ID_Usuario;

SELECT * FROM prestamos_usuarios_vw; -- Visualiza la vista creada

-- ========= VISTA 2 - LIBROS MÁS CAROS =========
DROP VIEW IF EXISTS vw_libros_caros; -- Eliminando la vista si es que existe
CREATE VIEW vw_libros_caros AS
SELECT ID_Libro, Titulo, Precio 
FROM libros ORDER BY Precio DESC LIMIT 5;

SELECT * FROM libros_caros_vw; -- Visualiza la vista creada

-- ========= VISTA 3 - AUTOR MÁS JOVEN =========
DROP VIEW IF EXISTS vw_autores_top_jovenes; -- Eliminando la vista si es que existe
CREATE VIEW vw_autores_top_jovenes AS
SELECT 
    ID_Autor, Nombre, Nacionalidad, Fecha_Nacimiento
FROM autores ORDER BY ABS(DATEDIFF(Fecha_Nacimiento, NOW())) LIMIT 5;

SELECT * FROM autores_top_jovenes_vw; -- Visualiza la vista creada

-- ========= VISTA 4 - STOCK DE LIBROS =========
DROP VIEW IF EXISTS vw_stock_libros; -- Eliminando la vista si es que existe
CREATE VIEW vw_stock_libros AS
SELECT COUNT(ID_Libro) AS STOCK_LIBROS FROM Libros;

SELECT * FROM stock_libros_vw; -- Visualiza la vista creada
