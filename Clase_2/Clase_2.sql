-- Active: 1722114782014@@127.0.0.1@3306@gammers
#### CLASE 2 (Creación de BD y primeras consultas)#####
-- Creación de una BD
create database nombre_bd;
-- Posicionarse en la bd creada
use gammers;
-- Seleccion en particular
select id_class,description from class;
-- Selección a toda la tabla
select * from class;
-- Evita los registros duplicados en una tabla
select distinct nombre_campo1,nombre_campo2 from nombre_tabla;
-- Hacer una busqueda con una condición en especial
select first_name, last_name from system_user where id_user_type = 334; -- con número
select first_name from system_user where 'Tyson'; -- con cadenas
select * from commentary where comment_date >= "2019-01-01"; -- con fechas y operadores
select name, id_level from game where id_level in (14,5,9); -- operador in
select name from game where name = 'Riders Republic' or name = 'The Dark Pictures: House Of Ashes'; -- con operadores lógicos
-- Busqueda por caracteres
select * from game where name like "Gran%"; -- que comience con...
-- Ordenar registros segun el campo seleccionado
select id_level, name from game order by id_level; -- odena campo seleccionado
select id_level, name from game where id_level < 30 order by id_level; -- con condición y operadores de comparación
select id_level, name from game where id_level < 30 order by id_level desc; -- lo mismo pero desendente
select id_level, name from game where id_level < 30 order by id_level desc, name; -- lo mismo pero desendente
-- Haciendo una selección con limites
select id_level, name from game where id_level < 30 order by id_level desc limit 10; -- solo 10 registros
select id_level, name from game where id_level < 30 order by id_level desc limit 15,5; -- param1 se ignora, param2 se muestra
-- Uso de alias
select id_level as nivel_del_juego, name as nombre_juego from game; -- se cambia el nombre del campo momentaneamente
-- Uso de funciones
select count(id_class) from gammers.class; -- muestra el total de registros 
select sum(id_class) from gammers.class; -- muestra la suma de registros 
select avg(id_class) from gammers.class; -- muestra el promedio de registros 
-- Agrupando las selecciones
select id_system_user as usuario from play group by id_system_user;
-- Ejercicio en clase
SELECT * FROM commentary ORDER BY id_system_user desc; 
SELECT * FROM commentary ORDER BY id_system_user LIMIT 3; 
SELECT COUNT(id_system_user) AS comments, id_system_user FROM commentary GROUP BY id_system_user;
SELECT COUNT(id_system_user) AS comments, id_system_user FROM commentary
GROUP BY id_system_user
HAVING comments > 2;
-- Selección de dos o más tablas (sin alias)
select 
g.id_game, 
c.id_game,
g.name,
g.description,
c.commentary
from game as g
left join commentary c
on c.id_game = g.id_game;
-- Selección de dos o más tablas (con alias)
select 
g.id_game as id_g_c, 
c.id_game as id_g_c,
g.name as nombre,
g.description as descripcion_juego,
c.commentary as comentario_juego 
from game as g
left join commentary as c
on c.id_game = g.id_game;