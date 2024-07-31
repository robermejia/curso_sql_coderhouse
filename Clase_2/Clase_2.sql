-- Active: 1722113607352@@127.0.0.1@3306@gammers
################################## CLASE 2 (Creación de BD y primeras consultas)#####################
-- CREACIÓN DE BD
create database nombre_bd; -- sintaxis
create database gammers; -- ejemplo clase

-- POSICIONARSE EN UNA BD CREADA
use nombre_bd; -- sintaxis
use gammers; -- ejemplo clase

-- CREACIÓN DE TABLA Y CAMPOS
create table nombre_tabla (
    Id_nombre int primary key not null,
    campo_1 varchar (30) not null,
    campo_2 decimal (3,2),
    campo_3 date 
);

-- INSERTAR REGISTROS EN UNA TABLA
insert into nombre_tabla(Id_nombre, campo1, campos2, campo3) -- sintaxis
    value (1, "valor1", 123.00, "2024-01-01");

-- SELECCIÓN EN PARTICULAR
select campo1, campo2 from nombre_tabla; -- sintaxis
select id_class,description from class; -- ejemplo clase

-- SELECCIÓN DE TODOS LOS CAMPOS DE UNA TABLA
select * from nombre_tabla; -- sintaxis
select * from class; -- ejemplo clase

-- EVITAR REGISTROS DUPLICADOS DE UNA TABLA
select distinct nombre_campo1,nombre_campo2 from nombre_tabla; -- sintaxis
select distinct first_name from system_user; -- ejemplo clase

-- HACER UNA BUSQUEDA CON UNA CONDICIÓN EN ESPECIAL
select campo1, campo2 from nombre_tabla where campo1 = "valor1"; -- sintaxis
select first_name, last_name from system_user where id_user_type = 334; -- ejemplo clase
select first_name from system_user where 'Tyson'; -- ejemplo clase
select * from commentary where comment_date >= "2019-01-01"; -- ejemplo clase

-- HACER UNA BUSQUEDA CON UNA CONDICIÓN ESPECIAL, USANDO OPERADOR IN
select campo1 from tabla1 where campo1 = valor1 in (valorx,valory,valorz); -- sintaxis
select name, id_level from game where id_level in (14,5,9); -- ejemplo clase
select name from game where name = 'Riders Republic' or name = 'The Dark Pictures: House Of Ashes'; -- con operadores lógicos

-- BUSQUEDA DE CARACTERES CON OPERADOR LIKE
select campo1 from where campo1 like "comience%"; -- sintaxis
select campo1 from where campo1 like "%termine"; -- sintaxis
select campo1 from where campo1 like "%tenga%"; -- sintaxis
select * from game where name like "Gran%"; -- ejemplo clase

-- USANDO LIMITES (restringe el número de registros)
-- (paramétro1 = primeros registros ignorados)
-- (paramétro2 = muestra esos registros)
SELECT * FROM nombre_tabla ORDER BY campo1 LIMIT 3;  -- sintaxis 
select campo1, campo2 from nombre_tabla where campo1 < un_numero order by campo1 desc limit 10; -- sintaxis
select id_level, name from game where id_level < 30 order by id_level desc limit 10; -- solo 10 registros
select campo1, campo2 from nombre_tabla where campo1 < 30 order by campo1 desc limit 15,5; -- sintaxis 
select id_level, name from game where id_level < 30 order by id_level desc limit 15,5; -- ejemplo clase
SELECT * FROM commentary ORDER BY id_system_user LIMIT 3;  -- ejemplo clase

-- ORDENAR REGISTROS SEGUN EL CAMPO SELECCIONADO
select campo1 from nombre_tabla order by campo1; -- sintaxis
select id_level, name from game order by id_level; -- ejemplo clase
select id_level, name from game where id_level < 30 order by id_level; -- ejemplo clase
select id_level, name from game where id_level < 30 order by id_level desc; -- ejemplo clase
SELECT * FROM commentary ORDER BY id_system_user desc; -- ejemplo clase
select campo1, campo2 from nombre_tabla where campo1 < numero order by campo1 desc, campo2; -- sintaxis
select id_level, name from game where id_level < 30 order by id_level desc, name; -- ejemplo clase


-- USANDO ALIAS
select campo1 as alias_campo1, campo2 as alias_campo2 from nombre_tabla; -- sintaxis
select id_level as nivel_del_juego, name as nombre_juego from game; -- ejemplo clase

-- USO DE FUNCIONES
select count(campo1) from nombre_bd.nombre_tabla; -- sintaxis (muestra total de registros)
select count(id_class) from gammers.class; -- ejemplo clase
SELECT COUNT(id_system_user) AS comments, id_system_user FROM commentary GROUP BY id_system_user; -- ejemplo clase
select sum(campo1) from nombre_bd.nombre_tabla; -- sintaxis (muestra la suma de registros) 
select sum(id_class) from gammers.class; -- ejemplo clase
select avg(campo1) from nombre_bd.nombre_tabla; -- sintaxis (muestra el promedio de registros) 
select avg(id_class) from gammers.class; -- ejemplo clase 

-- AGRUPANDO LAS SELECCIONES (agrupa valores similares)
select campo1 as alias_campo1 from nombre_tabla group by campo1; -- sintaxis 
select id_system_user as usuario from play group by id_system_user; -- ejemplo clase
-- Ejercicio en clase


-- USANDO HAVING
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