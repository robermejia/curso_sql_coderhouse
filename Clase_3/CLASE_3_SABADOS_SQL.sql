# CLASE 3 

#UNION:

/*Elimina los registros duplicados del conjunto de resultados final.
Devuelve solo un registro por cada combinación única de valores en las columnas seleccionadas.
Realiza una desduplicación antes de mostrar los resultados.*/

#UNION ALL:

/*Incluye todos los registros de las consultas, incluidos los duplicados.
No realiza ninguna eliminación de duplicados.
Muestra un conjunto de resultados más extenso, con registros repetidos si los hay.*/

SELECT id_game, name, description, id_level, id_class 
FROM game
WHERE id_level = 1
UNION 
SELECT id_game, name, description, id_level, id_class 
FROM game
WHERE id_level = 2
UNION
SELECT id_game, name, description, id_level, id_class 
FROM game
WHERE id_level = 3;

SELECT id_game, name, description, id_level, id_class
FROM  game
WHERE id_level = 1 
UNION ALL
SELECT id_game, name, description, id_level, id_class
FROM game
WHERE id_level = 2;

# OPERADOR LIKE EJERCICIOS

/*Buscaremos usuarios (SYSTEM_USER) utilizando el operador LIKE, y combinando el mismo con las 
diferentes variantes vistas hasta aquí.

Aquellos usuarios cuyo nombre comience con la letra ‘J’
Aquellos usuarios cuyo apellido contenga la letra ‘W’
Aquellos usuarios cuyo nombre contenga la letra ‘i’ en segundo lugar
Aquellos usuarios cuyo nombre finalice con la letra ‘k’
Aquellos usuarios cuyo nombre no incluya las letras ‘ch’
Aquellos usuarios cuyo nombre solo incluya las letras ‘ch’ */

-- Aquellos usuarios cuyo nombre comience con la letra ‘J’
Select * 
From system_user
where first_name like 'j%';

select first_name from system_user where first_name like "J%";

-- Aquellos usuarios cuyo apellido contenga la letra ‘W’
Select *
From system_user
where last_name like '%W';

-- Aquellos usuarios cuyo nombre contenga la letra ‘i’ en segundo lugar
Select *
from system_user
where first_name like '_i%';

-- Aquellos usuarios cuyo nombre finalice con la letra ‘k’
Select *
from system_user
where first_name like '%k';

-- Aquellos usuarios cuyo nombre no incluya las letras ‘ch’
Select *
from system_user
where  first_name not like '%ch%';

/*Aquellos usuarios cuyo nombre solo incluya las letras ‘ch’*/
select first_name
from system_user
where first_name like '%ch%';

-- ***************************************************************************
                                # SUBCONSULTAS 
-- ****************************************************************************

-- Trae el maximo id_user_type de la tabla user_type
SELECT max(id_user_type) FROM user_type; -- 500

-- Trae la id y el apellido del usuario que contenga el maximo id del tipo de usuario 
SELECT id_system_user, last_name
FROM system_user
WHERE id_user_type = (SELECT max(id_user_type) FROM user_type);

-- Busquemos los usuarios que votaron con un puntaje superior al promedio.
-- Nota: La función floor convierte float a entero.

 -- saca el promedio de votos
SELECT FLOOR(AVG(value)) 
                    FROM vote; 
  SELECT AVG(value)
                    FROM vote;                   
SELECT id_system_user
FROM vote 
WHERE value > (SELECT FLOOR(AVG(value)) 
                    FROM vote);

-- Podemos también obtener los votos totales de un juego específico, por ejemplo el de menor id:
SELECT SUM(value) 
FROM vote
WHERE id_game = (SELECT min(id_game) FROM game);

-- los usuarios que votaron por encima del promedio total de votos.
SELECT id_system_user 
FROM vote
WHERE value > (SELECT avg(value) FROM vote);

#Ordenamiento de consultas con subconsultas

SELECT id_system_user, last_name
FROM system_user
WHERE id_user_type = (SELECT max(id_user_type) FROM user_type)
ORDER BY last_name desc;

# Obtener la suma de votos por juego, solo de aquellos juegos de nivel 1.
SELECT id_game 
FROM game WHERE id_level = 1; -- (87,54,77,62,37,99)


SELECT id_game, SUM(value) AS votos
FROM vote 
WHERE id_game  IN (SELECT id_game
                   FROM game 
                   WHERE id_level = 1)
GROUP BY id_game;


-- Seleccionaremos los juegos pero sólo aquellos que hayan tenido más de un voto.
SELECT id_game, name
FROM game
WHERE id_level = 1 AND
id_game IN 
(SELECT id_game
FROM vote
GROUP BY id_game
HAVING count(*) > 1);
-- ******************************************************************************************
--                                SUBLENGUAJE DDL
-- ****************************************************************************************
# SENTENCIA CREATE 

-- Creación de una base de datos;
CREATE SCHEMA prueba_coder; -- notacion snake_case, evitar acentos, espacio entre palabras y los caracteres especiales 
-- Me posisciona en la base de datos que deseo usar 
USE prueba_coder; 

--  Creación de  la tabla usuario
CREATE TABLE usuarios(
id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50)NOT NULL,
dni  INT,
/*email VARCHAR(70),
direccion VARCHAR(80),
telefono VARCHAR(20),*/
contacto ENUM ('email','telefono','direccion') not null,
valor_contacto VARCHAR(70) not null
);

-- **************************************************************************************

CREATE DATABASE prueba;
USE prueba;

CREATE TABLE alumnos (
id_alumnos INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
dirreccion varchar(50) NOT NULL,
telefono VARCHAR(15),
email VARCHAR(30) 
-- PRIMARY KEY (id_alumnos,nombre,apellido)
);

CREATE TABLE materias(
id_materia INT UNSIGNED AUTO_INCREMENT,
nombre VARCHAR(50) not null,
turno ENUM('mañana', 'tarde'),
PRIMARY KEY (id_materia)
);

CREATE TABLE profesores(
id_profesor INT AUTO_INCREMENT,
nombre  VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
fecha_ingreso DATE NOT NULL,
materia INT UNSIGNED,
PRIMARY KEY (id_profesor),
CONSTRAINT FK_PROFESOR_MATERIA FOREIGN KEY (materia) REFERENCES materias (id_materia)
);

# SENTENCIA ALTER 

-- Otra forma de poner la llave foranea es con la sentencia ALTER
ALTER TABLE profesores ADD 
CONSTRAINT FK_PROFESOR_MATERIA 
FOREIGN KEY (materia) 
REFERENCES materias (id_materia);

-- Cambiar el nombre, redefinir y reordenar columnas
#Las cláusulas CHANGE, MODIFY, RENAME COLUMNy ALTER permiten modificar los nombres y definiciones de columnas existentes. Tienen estas características comparativas:
/*
CHANGE:
1- Puede cambiar el nombre de una columna y cambiar su definición, o ambas cosas.
2-Tiene más capacidad que MODIFY o RENAME COLUMN, pero a expensas de la conveniencia para algunas operaciones. 
CHANGE requiere nombrar la columna dos veces si no se la renombra, y requiere volver a especificar la definición de la columna si solo se la renombra.
3- Con FIRST o AFTER, puede reordenar las columnas.

CHANGE [COLUMN] old_col_name new_col_name column_definition
        [FIRST | AFTER col_name]
        
MODIFY:
1-Puede cambiar la definición de una columna, pero no su nombre.
2-Es más conveniente que CHANGE cambiar la definición de una columna sin cambiarle el nombre.
3- Con FIRST o AFTER, puede reordenar las columnas.

MODIFY [COLUMN] col_name column_definition
        [FIRST | AFTER col_name]
        
RENAME COLUMN:
1- Puede cambiar el nombre de una columna, pero no su definición.
2- Más conveniente que CHANGE cambiar el nombre de una columna sin cambiar su definición.

RENAME COLUMN old_col_name TO new_col_name

*/

ALTER TABLE alumnos ADD fecha_nac DATE after apellido;--
ALTER TABLE alumnos ADD UNIQUE(email);
ALTER TABLE alumnos MODIFY email VARCHAR(60);
ALTER TABLE alumnos CHANGE COLUMN email mail VARCHAR(30);
ALTER TABLE alumnos RENAME COLUMN dirreccion TO direccion;
ALTER TABLE alumnos DROP COLUMN fecha_nac;

ALTER TABLE alumnos ADD UNIQUE(email);
# Aclaración
-- CHANGE COLUMN: Permite renombrar una columna existente a la vez que se modifican sus propiedades.
-- MODIFY COLUMN: No permite renombrar columnas.

ALTER TABLE alumnos CHANGE COLUMN email mail VARCHAR(30);

ALTER TABLE alumnos MODIFY mail VARCHAR(60);

#Para renombrar una columna
-- ALTER TABLE t1 RENAME COLUMN b TO a;
ALTER TABLE alumnos RENAME COLUMN dirreccion TO direccion;

#Para renombrar una tabla completa 
ALTER TABLE alumnos RENAME estudiantes;

# Para borrar de la tabla estudiante la columna telefono 
ALTER TABLE estudiantes DROP COLUMN telefono;

DROP TABLE estudiantes;

#  OPERACIONES CON DROP
ALTER TABLE ejemplo DROP COLUMN nombre;
-- Elimina la columna 'nombre' de la tabla 'ejemplo'.
ALTER TABLE ejemplo DROP COLUMN nombre, DROP COLUMN paterno;
-- Elimina más de una columna.
ALTER TABLE ejemplo DROP COLUMN nombre, DROP COLUMN paterno;
-- Elimina más de una columna
ALTER TABLE ejemplo DROP PRIMARY KEY;
-- Elimina la llave primaria de la tabla 'ejemplo'
ALTER TABLE ejemplo DROP FOREIGN KEY id_usuario;
-- Elimina de la tabla 'ejemplo' la llave foranea 'id_usuario'.

# OPERACIONES CON CHANGE Y MODIFY
ALTER TABLE ejemplo CHANGE monto cantidad FLOAT(8,2);
-- Cambia el nombre de la columna 'monto' al nuevo nombre 'cantidad' con la definición del tipo de datos.
ALTER TABLE ejemplo CHANGE cantidad cantidad FLOAT(10,2);
-- Cambia solo el tipo de datos de la columna, conservando el mismo nombre.
ALTER TABLE ejemplo MODIFY cantidad FLOAT(10,2);
-- Cambia solo el tipo de datos de la columna, conservando el mismo nombre. (Igual que el anterior)
ALTER TABLE ejemplo MODIFY cantidad FLOAT(6,2) NOT NULL;
-- Cambia el tipo de datos de la columna 'cantidad' y especifica que no admite nulos.
ALTER TABLE ejemplo MODIFY paterno VARCHAR(30);
-- Modifica el tamaño de la columna 'paterno'.



# OPERACIONES CON ADD
ALTER TABLE ejemplo ADD fecha DATE;
-- Añade una columna llamada 'fecha' del tipo 'DATE' al final de todas las demás existentes.
ALTER TABLE ejemplo ADD UNIQUE(email);
-- Añade a la columna 'email' un índice del tipo único, no puede haber dos iguales.
ALTER TABLE ejemplo ADD materno VARCHAR(20) AFTER paterno;
-- Añade la columna 'materno' después de la columna 'paterno'.
ALTER TABLE ejemplo ADD id INT FIRST;
-- Añade la columna 'id' en primer lugar con respecto a las existentes.
ALTER TABLE usuarios ADD FOREIGN KEY(id) REFERENCES entradas(id_user);
-- Añade un 'Foreign key' en la columna 'id' de la tabla 'usuarios' que apunta a la columna 'id_user' de la tabla 'entradas'.

-- SOBRE LA TABLA
ALTER TABLE personas RENAME usuarios;
-- Cambia el nombre de la tabla 'personas' a 'usuarios'

#  OPERACIONES CON DROP
ALTER TABLE ejemplo DROP COLUMN nombre;
-- Elimina la columna 'nombre' de la tabla 'ejemplo'.
ALTER TABLE ejemplo DROP COLUMN nombre, DROP COLUMN paterno;
-- Elimina más de una columna.
ALTER TABLE ejemplo DROP COLUMN nombre, DROP COLUMN paterno;
-- Elimina más de una columna
ALTER TABLE ejemplo DROP PRIMARY KEY;
-- Elimina la llave primaria de la tabla 'ejemplo'
ALTER TABLE ejemplo DROP FOREIGN KEY id_usuario;
-- Elimina de la tabla 'ejemplo' la llave foranea 'id_usuario'.

# Para hacer un copia de la tabla estudiantes 
CREATE TABLE alumnos_backup 
LIKE alumnos;

INSERT INTO alumnos_backup  
SELECT * FROM estudiantes;
# Para copiar todos los registros que tuviera la tabla estudiantes
