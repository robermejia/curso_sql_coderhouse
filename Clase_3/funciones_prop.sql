# Funciones y aperadores Matematicos 
/*
Nombre	Descripción
%,MOD	Operador módulo
*	Operador de multiplicación
+	Operador de adición
-	Operador menos
-	Cambiar el signo del argumento
/	Operador de división
ABS()	Devuelve el valor absoluto
ACOS()	Devuelve el arco coseno
ASIN()	Devuelve el arco seno
ATAN()	Devuelve el arco tangente
ATAN2(),ATAN()	Devuelve el arco tangente de los dos argumentos
CEIL()	Devuelve el valor entero más pequeño no menor que el argumento
CEILING()	Devuelve el valor entero más pequeño no menor que el argumento
CONV()	Convertir números entre diferentes bases numéricas
COS()	Devuelve el coseno
COT()	Devuelve la cotangente
CRC32()	Calcular un valor de comprobación de redundancia cíclica
DEGREES()	Convertir radianes a grados
DIV	División entera
EXP()	Elevar al poder de
FLOOR()	Devuelve el valor entero más grande que no sea mayor que el argumento
LN()	Devuelve el logaritmo natural del argumento.
LOG()	Devuelve el logaritmo natural del primer argumento
LOG10()	Devuelve el logaritmo en base 10 del argumento
LOG2()	Devuelve el logaritmo en base 2 del argumento
MOD()	Devolver el resto --MOD(N,M), , N % MN MOD M Operación módulo. Devuelve el resto de N dividido por M.
PI()	Devuelve el valor de pi
POW()	Devuelve el argumento elevado a la potencia especificada
POWER()	Devuelve el argumento elevado a la potencia especificada
RADIANS()	Devuelve el argumento convertido a radianes
RAND()	Devuelve un valor de punto flotante aleatorio
ROUND()	Redondear el argumento
SIGN()	Devuelve el signo del argumento
SIN()	Devuelve el seno del argumento.
SQRT()	Devuelve la raíz cuadrada del argumento.
TAN()	Devuelve la tangente del argumento.
TRUNCATE()	Trunca al número especificado de decimales

#Funciones de fecha y hora

Nombre	Descripción
ADDDATE()	Agregar valores de tiempo (intervalos) a un valor de fecha
ADDTIME()	Agregar tiempo
CONVERT_TZ()	Convertir de una zona horaria a otra
CURDATE()	Devuelve la fecha actual
CURRENT_DATE(),CURRENT_DATE	Sinónimos de CURDATE()
CURRENT_TIME(),CURRENT_TIME	Sinónimos de CURTIME()
CURRENT_TIMESTAMP(),CURRENT_TIMESTAMP	Sinónimos de AHORA()
CURTIME()	Devuelve la hora actual
DATE()	Extraer la parte de fecha de una expresión de fecha o fecha y hora
DATE_ADD()	Agregar valores de tiempo (intervalos) a un valor de fecha
DATE_FORMAT()	Formatear la fecha como se especifica
DATE_SUB()	Restar un valor de tiempo (intervalo) de una fecha
DATEDIFF()	Restar dos fechas
DAY()	Sinónimo de DIA DEL MES()
DAYNAME()	Devuelve el nombre del día de la semana
DAYOFMONTH()	Devuelve el día del mes (0-31)
DAYOFWEEK()	Devuelve el índice del día de la semana del argumento
DAYOFYEAR()	Devolver el día del año (1-366)
EXTRACT()	Extraer parte de una fecha
FROM_DAYS()	Convertir un número de día en una fecha
FROM_UNIXTIME()	Formatear la marca de tiempo de Unix como una fecha
GET_FORMAT()	Devuelve una cadena con formato de fecha
HOUR()	Extraer la hora
LAST_DAY	Devuelve el último día del mes para el argumento.
LOCALTIME(),LOCALTIME	Sinónimo de AHORA()
LOCALTIMESTAMP,LOCALTIMESTAMP()	Sinónimo de AHORA()
MAKEDATE()	Crear una fecha a partir del año y el día del año.
MAKETIME()	Crear tiempo a partir de horas, minutos y segundos
MICROSECOND()	Devuelve los microsegundos del argumento
MINUTE()	Devuelve el minuto del argumento
MONTH()	Devuelve el mes a partir de la fecha transcurrida
MONTHNAME()	Devuelve el nombre del mes
NOW()	Devuelve la fecha y hora actuales
PERIOD_ADD()	Agregar un período a un año-mes
PERIOD_DIFF()	Devuelve el número de meses entre períodos
QUARTER()	Devuelve el trimestre a partir de un argumento de fecha
SEC_TO_TIME()	Convierte los segundos al formato 'hh:mm:ss'
SECOND()	Devuelve el segundo (0-59)
STR_TO_DATE()	Convertir una cadena en una fecha
SUBDATE()	Sinónimo de DATE_SUB() cuando se invoca con tres argumentos
SUBTIME()	Restar veces
SYSDATE()	Devuelve el momento en el que se ejecuta la función.
TIME()	Extrae la parte de tiempo de la expresión pasada
TIME_FORMAT()	Formato como hora
TIME_TO_SEC()	Devuelve el argumento convertido a segundos
TIMEDIFF()	Restar tiempo
TIMESTAMP()	Con un solo argumento, esta función devuelve la expresión de fecha o fecha y hora; con dos argumentos, la suma de los argumentos.
TIMESTAMPADD()	Agregar un intervalo a una expresión de fecha y hora
TIMESTAMPDIFF()	Devuelve la diferencia de dos expresiones de fecha y hora, utilizando las unidades especificadas
TO_DAYS()	Devuelve el argumento de fecha convertido a días
TO_SECONDS()	Devuelve el argumento de fecha o fecha y hora convertido a segundos desde el año 0
UNIX_TIMESTAMP()	Devuelve una marca de tiempo de Unix
UTC_DATE()	Devuelve la fecha UTC actual
UTC_TIME()	Devuelve la hora UTC actual
UTC_TIMESTAMP()	Devuelve la fecha y hora UTC actuales
WEEK()	Devolver el número de semana
WEEKDAY()	Devuelve el índice de días de la semana
WEEKOFYEAR()	Devuelve la semana del calendario de la fecha (1-53)
YEAR()	Devolver el año
YEARWEEK()	Devuelve el año y la semana

#Funciones y operadores de cadenas

Nombre	Descripción
ASCII()	Devuelve el valor numérico del carácter más a la izquierda
BIN()	Devuelve una cadena que contiene la representación binaria de un número
BIT_LENGTH()	Devuelve la longitud del argumento en bits
CHAR()	Devuelve el carácter de cada entero pasado
CHAR_LENGTH()	Devuelve el número de caracteres en el argumento
CHARACTER_LENGTH()	Sinónimo de CHAR_LENGTH()
CONCAT()	Devuelve una cadena concatenada
CONCAT_WS()	Devolver concatenar con separador
ELT()	Devuelve una cadena en el número de índice
EXPORT_SET()	Devuelve una cadena tal que por cada bit establecido en los bits de valor, obtienes una cadena activada y por cada bit no establecido, obtienes una cadena desactivada
FIELD()	Índice (posición) del primer argumento en argumentos subsiguientes
FIND_IN_SET()	Índice (posición) del primer argumento dentro del segundo argumento
FORMAT()	Devuelve un número formateado con un número específico de decimales
FROM_BASE64()	Decodificar cadena codificada base64 y devolver resultado
HEX()	Representación hexadecimal de un valor decimal o de cadena
INSERT()	Insertar subcadena en la posición especificada hasta el número especificado de caracteres
INSTR()	Devuelve el índice de la primera aparición de la subcadena.
LCASE()	Sinónimo de INFERIOR()
LEFT()	Devuelve el número de caracteres más a la izquierda según lo especificado
LENGTH()	Devuelve la longitud de una cadena en bytes
LIKE	Coincidencia de patrones simples
LOAD_FILE()	Cargue el archivo nombrado
LOCATE()	Devuelve la posición de la primera aparición de la subcadena.
LOWER()	Devuelve el argumento en minúsculas
LPAD()	Devuelve el argumento de cadena, relleno a la izquierda con la cadena especificada
LPAD(str,len,padstr)
-- Devuelve la cadena str, rellenada a la izquierda con la cadena padstrhasta una longitud de lencaracteres. Si stres más largo que len, el valor de retorno se reduce a lencaracteres.
LTRIM()	Eliminar espacios iniciales
MAKE_SET()	Devuelve un conjunto de cadenas separadas por comas que tienen el bit correspondiente en bits establecido
MATCH()	Realizar búsqueda de texto completo
MID()	Devuelve una subcadena comenzando desde la posición especificada
NOT LIKE	Negación de la coincidencia de patrones simples
NOT REGEXP	Negación de REGEXP
OCT()	Devuelve una cadena que contiene la representación octal de un número.
OCTET_LENGTH()	Sinónimo de LONGITUD()
ORD()	Código de carácter de retorno para el carácter más a la izquierda del argumento.
POSITION()	Sinónimo de LOCALIZAR()
QUOTE()	Escapar del argumento para su uso en una declaración SQL
REGEXP	Si la cadena coincide con la expresión regular
REGEXP_INSTR()	Índice inicial de subcadena que coincide con la expresión regular
REGEXP_LIKE()	Si la cadena coincide con la expresión regular
REGEXP_REPLACE()	Reemplazar subcadenas que coincidan con la expresión regular
REGEXP_SUBSTR()	Devolver subcadena que coincida con expresión regular
REPEAT()	Repetir una cadena el número de veces especificado
REPLACE()	Reemplazar apariciones de una cadena especificada
REVERSE()	Invertir los caracteres de una cadena.
-- REVERSE(str) Devuelve la cadena strcon el orden de los caracteres invertido, o NULL si stres NULL.
RIGHT()	Devuelve el número de caracteres especificado más a la derecha
 -- RIGHT(str,len)Devuelve los len caracteres situados más a la derecha de la cadena str, o NULLsi algún argumento lo es NULL.
RLIKE	Si la cadena coincide con la expresión regular
RPAD()	Agregar cadena el número especificado de veces
RTRIM()	Eliminar espacios finales
SOUNDEX()	Devolver una cadena Soundex
SOUNDS LIKE	Comparar sonidos
SPACE()	Devuelve una cadena del número especificado de espacios.
STRCMP()	Compara dos cadenas
SUBSTR()	Devuelve la subcadena como se especifica
SUBSTRING()	Devuelve la subcadena como se especifica
SUBSTRING_INDEX()	Devuelve una subcadena de una cadena antes del número especificado de apariciones del delimitador
TO_BASE64()	Devuelve el argumento convertido a una cadena en base 64.
TRIM()	Eliminar espacios iniciales y finales
UCASE()	Sinónimo de SUPERIOR()
UNHEX()	Devuelve una cadena que contiene la representación hexadecimal de un número
UPPER()	Convertir a mayúsculas
WEIGHT_STRING()	Devuelve la cadena de peso para una cadena.

*/