CREATE DATABASE prueba663;

USE prueba663;

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados(
	documento CHAR(8),
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    sueldo DECIMAL(6,2),
    cantidadhijos INT,
    seccion VARCHAR(8),
    PRIMARY KEY(documento)
);
DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
  codigo INT AUTO_INCREMENT,
  titulo VARCHAR(40),
  autor VARCHAR(30),
  editorial VARCHAR(20),
  precio DECIMAL(5,2),
  PRIMARY KEY(codigo) 
 );
 
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    gama VARCHAR(50),
    precio DECIMAL(10,2)
);

-- 2- Ingrese algunos registros:
insert into empleados (documento, nombre, apellido, sueldo, cantidadhijos, seccion)
values ('22222222', 'Juan', 'Perez', 300.00, 0, 'Desconocido');
insert into empleados (documento, nombre, apellido, sueldo, cantidadhijos, seccion)
values ('22333333', 'Mauricio', 'Morales', 500.00, 1, 'Aprendiz');
insert into empleados (documento, nombre, apellido, sueldo, cantidadhijos, seccion)
values ('22444444', 'Marta', 'Martinez', 600.00, 2, 'Desconocido');
insert into empleados (documento, nombre, apellido, sueldo, cantidadhijos, seccion)
values ('22555555', 'Susana', 'Castrillon', 700.00, 2, 'Desconocido');
insert into empleados (documento, nombre, apellido, sueldo, cantidadhijos, seccion)
values ('22666666', 'Jose', 'Arboleda', 900.00, 0, 'Desconocido');
insert into empleados (documento, nombre, apellido, sueldo, cantidadhijos, seccion)
values ('22777777', 'Ordogen', 'Arcila', 400.00, 1, 'Aprendiz');
insert into empleados (documento, nombre, apellido, sueldo, cantidadhijos, seccion)
values ('22888888', 'Samuel', 'Marin', 200.00, 0, 'Aprendiz');

insert into libros (titulo,autor,editorial,precio) 
  values ('Uno','Richard Bach','Planeta',15);
 insert into libros (titulo,autor,editorial,precio) 
  values ('Ilusiones','Richard Bach','Planeta',12);
 insert into libros (titulo,autor,editorial,precio) 
  values ('El aleph','Borges','Emece',25);
 insert into libros (titulo,autor,editorial,precio) 
  values ('Aprenda PHP','Mario Molina','Nuevo siglo',50);
 insert into libros (titulo,autor,editorial,precio) 
  values ('Matematica estas ahi','Paenza','Nuevo siglo',18);
 insert into libros (titulo,autor,editorial,precio) 
  values ('Puente al infinito','Bach Richard','Sudamericana',14);
 insert into libros (titulo,autor,editorial,precio) 
  values ('Antología','J. L. Borges','Paidos',24);
 insert into libros (titulo,autor,editorial,precio) 
  values ('Java en 10 minutos','Mario Molina','Siglo XXI',45);
 insert into libros (titulo,autor,editorial,precio) 
  values ('Cervantes y el quijote','Borges- Casares','Planeta',34);

INSERT INTO productos (nombre, gama, precio) VALUES
('Producto 1', 'Gama A', 100.00),
('Producto 2', 'Gama A', 150.50),
('Producto 3', 'Gama B', 200.00),
('Producto 4', 'Gama A', 120.75),
('Producto 5', 'Gama C', 180.30),
('Producto 6', 'Gama B', 250.00),
('Producto 7', 'Gama A', 130.00),
('Producto 8', 'Gama C', 190.60);

SELECT * FROM prueba663.empleados;

SET sql_safe_update = 0;

-- sueldos de los empleados
DELIMITER $$
CREATE PROCEDURE Pa_sueldo()
BEGIN
SELECT sueldo
	FROM empleados;
END$$
DELIMITER ;

CALL Pa_sueldo;

-- apellidos y sueldos de los empleados
DELIMITER //
CREATE PROCEDURE Pa_empleados_sueldo()
BEGIN
SELECT nombre, apellido, sueldo
	FROM empleados;
END//
DELIMITER ;

CALL Pa_empleados_sueldo;

-- nombres, apellidos y cantidad de hijos de los empleados
DELIMITER //
CREATE PROCEDURE Pa_empleados_cantidadhijos()
BEGIN
	SELECT nombre, apellido, cantidadhijos
		FROM empleados 
    WHERE cantidadhijos > 0;
END//
DELIMITER ;

CALL Pa_empleados_cantidadhijos;

-- Crear un procedimiento almacenado que traiga el promedio del sueldo de todos los empleados
DROP PROCEDURE IF EXISTS Pa_empleados_sueldo_promedio;
DELIMITER //
CREATE PROCEDURE Pa_empleados_sueldo_promedio()
BEGIN
	SELECT AVG(sueldo) AS sueldo_promedio
		FROM empleados;
END//
DELIMITER ;

CALL Pa_empleados_sueldo_promedio;

--
DROP PROCEDURE IF EXISTS Pa_libros_autor;
DELIMITER //
CREATE PROCEDURE Pa_libros_autor(in p_autor VARCHAR(30))
BEGIN
	SELECT titulo, autor, editorial
		FROM libros 
    WHERE autor = p_autor;
END//
DELIMITER ;

CALL Pa_libros_autor('Richard Bach');

--
DROP PROCEDURE IF EXISTS Pa_libros_editorial;
DELIMITER //
CREATE PROCEDURE Pa_libros_editorial(in t_titulo VARCHAR(30), e_editorial VARCHAR(30))
BEGIN
	SELECT titulo, editorial
		FROM libros 
    WHERE titulo = t_titulo && editorial = e_editorial;
END//
DELIMITER ;

CALL Pa_libros_editorial('uno', 'Planeta');

/*Dijimos que los procedimientos almacenados pueden devolver información; para ello se emplean parámetros de salida. 
El valor se retorna a quien realizó la llamada con parámetros de salida. 
Para que un procedimiento almacenado devuelva un valor se debe declarar una variable con la palabra clave "out" al crear el procedimiento:*/

 create procedure NOMBREPROCEDIMIENTO 
 (out NOMBREPARAMETRO TIPODEDATO)
 begin
 end
-- Como ejemplo implementaremos un procedimiento almacenado que le enviemos dos enteros y nos retorne el promedio de dichos valores:
 drop procedure if exists pa_promedio;
 delimiter //
 create procedure pa_promedio(
   in n1 float,
   in n2 float,
   out resultado float)
 begin
   select (n1+n2)/2 into resultado;
 end //
 delimiter ;
 
 /*El procedimiento almacenado tiene tres parámetros, los dos primeros son de entrada y el último es de salida. 
 Mediante un select calculamos el promedio de los parámetros n1 y n2, guardamos en el parámetro 'resultado' el promedio de los dos primeros parámetros.*/

/*Cuando llamamos al procedimiento almacenado debemos pasar dos valores numéricos y como último dato una variable donde se almacene el resultado:*/
call pa_promedio(10, 5, @resu);

/*Luego imprimimos el valor almacenado en la variable @resu:*/
select @resu;

DROP PROCEDURE IF EXISTS Pa_promedio_precio_libros;
DELIMITER //
CREATE PROCEDURE Pa_promedio_precio_libros(
IN precio1 decimal(6.2),
IN precio2 decimal(6.2),
OUT suma decimal(6.2),
OUT libros float)
BEGIN
	SELECT SUM(precio1+precio2) into Suma; 
    SELECT (precio1+precio2)/2 AS Promedio into libros;
END//
DELIMITER ;

CALL Pa_promedio_precio_libros(50, 101, @s, @l);

SELECT @s, @l;

DROP PROCEDURE IF EXISTS Pa_autor_sumarypromedio;
DELIMITER //
CREATE PROCEDURE Pa_autor_sumarypromedio(
IN p_autor VARCHAR(30),
OUT suma DECIMAL(6,2),
OUT promedio float)
BEGIN
	SELECT titulo, editorial, precio
    FROM libros
    WHERE autor=p_autor;
    SELECT SUM(precio) into suma
    FROM libros
    WHERE autor=p_autor;
    SELECT AVG(precio) into promedio
    FROM libros
    WHERE autor=p_autor;
END//
DELIMITER ;

CALL Pa_autor_sumarypromedio('Richard Bach', @s, @p);
SELECT @s, @p;

call pa_autor_sumaypromedio('Borges', @s,@p);
 select @s, @p;

-- En estos ejemplos vamos a crear procedimientos sin sentencias SQL:
-- Ejemplo 1:
/* El procedimiento calcular_area_circulo recibe como entrada el radio de un círculo y devuelve como salida el área del círculo.*/
DROP PROCEDURE IF EXISTS Pa_calcular_area_circulo;
DELIMITER //
CREATE PROCEDURE Pa_calcular_area_circulo(
	IN p_radio FLOAT,
    OUT p_area DECIMAL(10,2))
BEGIN
	SELECT PI() * p_radio * p_radio INTO p_area;
END//
DELIMITER ;

CALL Pa_calcular_area_circulo(5, @rad);
SELECT @rad;

/* El procedimiento calcular_volumen_cilindro recibe como entrada el radio y la altura, y devuelve como salida el volumen del cilindro. 
Este procedimiento hará uso del procedimiento calcular_area_circulo.*/
DROP PROCEDURE IF EXISTS Pa_calcular_volumen_cilindro;
DELIMITER //
CREATE PROCEDURE Pa_calcular_volumen_cilindro(
	IN p_radio FLOAT,
    IN p_altura FLOAT,
    OUT p_volumen DECIMAL(10,2))
BEGIN
	SELECT PI() * p_radio * p_radio * p_altura INTO p_volumen;
END//
DELIMITER ;

CALL Pa_calcular_volumen_cilindro(5, 10, @vol);
SELECT @vol;

-- Ejemplo 2:
/*Escriba un procedimiento llamado contar_productos que reciba como entrada el nombre de la gama y devuelva el número de productos que existen dentro de esa gama. 
Resuelva el ejercicio de dos formas distintas, utilizando SET y SELECT ... INTO.*/
-- Forma 1:
DROP PROCEDURE IF EXISTS Pa_contar_productos;
DELIMITER //
CREATE PROCEDURE Pa_contar_productos(
    IN p_gama VARCHAR(50),
    OUT p_num_productos INT)
BEGIN
    -- Contar el número de productos dentro de la gama
    SELECT COUNT(*) INTO p_num_productos
    FROM productos
    WHERE gama =p_gama;
END//
DELIMITER ;

CALL Pa_contar_productos('Gama A', @num_prod);

SELECT @num_prod;

-- Forma 2:
DROP PROCEDURE IF EXISTS Pa_contar_productos_select;
DELIMITER //

CREATE PROCEDURE Pa_contar_productos_select(
    IN p_gama VARCHAR(50),
    OUT p_num_productos INT
)
BEGIN
    SELECT COUNT(*) INTO p_num_productos
    FROM productos
    WHERE gama = p_gama;
END//
DELIMITER ;

CALL Pa_contar_productos_select('Gama B', @num_productos);
SELECT @num_productos;

-- Ejemplo 3:
/*Escribe un procedimiento que se llame calcular_max_min_media, que reciba como parámetro de entrada el nombre de la gama de un producto y devuelva como salida tres parámetros. 
El precio máximo, el precio mínimo y la media de los productos que existen en esa gama. 
Resuelva el ejercicio de dos formas distintas, utilizando SET y SELECT ... INTO.*/
-- Forma 1:
DROP PROCEDURE IF EXISTS Pa_calcular_max_min_media;
DELIMITER //

CREATE PROCEDURE Pa_calcular_max_min_media(
    IN p_gama VARCHAR(50),
    OUT p_max_precio DECIMAL(10,2),
    OUT p_min_precio DECIMAL(10,2),
    OUT p_media_precio DECIMAL(10,2)
)
BEGIN
    SELECT MAX(precio) INTO p_max_precio
    FROM productos
    WHERE gama = p_gama;
    SELECT MIN(precio) INTO p_min_precio
    FROM productos
    WHERE gama = p_gama;
    SELECT AVG(precio) INTO p_media_precio
    FROM productos
    WHERE gama = p_gama;
END//
DELIMITER ;

CALL Pa_calcular_max_min_media('Gama A', @max, @min, @med);
SELECT @max, @min, @med;

-- Forma 2:
DROP PROCEDURE IF EXISTS Pa_calcular_max_min_media_select;
DELIMITER //

CREATE PROCEDURE Pa_calcular_max_min_media_select(
    IN p_gama VARCHAR(50),
    OUT p_max_precio DECIMAL(10,2),
    OUT p_min_precio DECIMAL(10,2),
    OUT p_media_precio DECIMAL(10,2)
)
BEGIN
    SELECT 
        MAX(precio), 
        MIN(precio), 
        AVG(precio)
    INTO 
        p_max_precio, 
        p_min_precio, 
        p_media_precio
    FROM productos
    WHERE gama = p_gama;
END//
DELIMITER ;

CALL Pa_calcular_max_min_media_select('Gama A', @max, @min, @media);
SELECT @max, @min, @media;