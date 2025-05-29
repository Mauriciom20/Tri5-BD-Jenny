-- Ejercicio1

/*Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
1- Eliminamos la tabla, si existe y la creamos:*/
create database ejercicio1;

use ejercicio1;

drop table if exists empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos int,
  seccion varchar(20),
  primary key(documento)
 );

-- 2- Ingrese algunos registros:
 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

-- 3- Elimine el procedimiento llamado "pa_empleados_sueldo" si existe:
 drop procedure if exists pa_empleados_sueldo;

-- 4- Cree un procedimiento almacenado llamado "pa_empleados_sueldo" que seleccione los nombres, 
-- apellidos y sueldos de los empleados.

delimiter //
	create procedure pa_empleados_sueldo()
	begin 
		select nombre, apellido, sueldo from empleados;
    end //
delimiter ;

-- 5- Ejecute el procedimiento creado anteriormente.
 call pa_empleados_sueldo();

-- 6- Elimine el procedimiento llamado "pa_empleados_hijos" si existe:
 drop procedure if exists pa_empleados_hijos;

-- 7- Cree un procedimiento almacenado llamado "pa_empleados_hijos" que seleccione los nombres, 
-- apellidos y cantidad de hijos de los empleados con hijos.

delimiter //
	create procedure pa_empleados_hijos()
    
    begin
		select nombre, apellido, cantidadhijos from empleados;
    end //
delimiter ;


-- 8- Ejecute el procedimiento creado anteriormente.

call pa_empleados_hijos();

-- 9-Crear un procedimiento almacenado que traiga el promedio del sueldo de todos los empleados
delimiter //
create procedure pa_promedioSueldoEmpleados()
begin
	select avg(sueldo) as promedio_sueldo from empleados;
end //
delimiter ;

call pa_promedioSueldoEmpleados();

-- Ejercicio 2
create database biblioteca;
use biblioteca;
drop table if exists libros;

 create table libros(
  codigo int auto_increment,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo) 
 );

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
  
  -- Realizar un procedimiento almacenado donde consulte titulo, editorial y precio del libro según sea su autor.
delimiter //
	create procedure pa_informacion_libros(in p_autor varchar(30))
    
    begin
		select titulo, editorial, precio from libros where autor = p_autor;
    end //
delimiter ;

 -- Llama al procedimiento almacenado
 
 call pa_informacion_libros("Borges");
 
 /*crear un procedimiento almacenado que busque 
 el titulo del libro y su precio según sea su autor y editorial*/
DROP PROCEDURE IF EXISTS Pa_libros_editorial;
DELIMITER //
CREATE PROCEDURE pa_libros_editorial(in p_autor VARCHAR(30), p_editorial VARCHAR(20))
BEGIN
	SELECT titulo, precio
		FROM libros 
    WHERE autor= p_autor && editorial = p_editorial;
END//
DELIMITER ;
 
-- Llamar al procedimiento almacenado creado

CALL Pa_libros_editorial('Richard Bach', 'Planeta');

/*con esta misma tabla  crear un procedimiento almacenado con un parámetro
de entrada mostrando al autor y precio del libro 
y otro con tres parámetros de entrada mostrando el precio del libro*/

-- A
DROP PROCEDURE IF EXISTS Pa_promedio_precio_libros;
	DELIMITER //
	CREATE PROCEDURE pa_autorprecio_libros(
	IN p_titulo varchar(40))
		BEGIN
			select autor, precio from libros where titulo = p_titulo;
		END//
DELIMITER ;

CALL pa_autorprecio_libros("Uno");

-- B
delimiter //
	create procedure pa_precio_libros(in p_titulo varchar(40), in p_autor varchar(30), p_editorial varchar(20))
    begin
		select precio from libros where titulo = p_titulo && autor = p_autor && editorial = p_editorial;
    end //
delimiter ; 

call pa_precio_libros('Matematica estas ahi','Paenza','Nuevo siglo');

-- Ejercicio 3

-- Problema
-- Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla "provincias" donde registra los nombres de las provincias.

-- Borramos las tablas si existen y procedemos a crearlas:

create database ejercicio3;

use ejercicio3;

 drop table if exists clientes;
 drop table if exists provincias;

 create table clientes (
  codigo int unsigned auto_increment,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint unsigned,
  telefono varchar(11),
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint unsigned auto_increment,
  nombre varchar(20),
  primary key (codigo)
 );
 
-- Cargamos una serie de registros en las tablas:

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');
 insert into provincias (nombre) values('Misiones');
 insert into provincias (nombre) values('Salta');
 insert into provincias (nombre) values('Buenos Aires');
 insert into provincias (nombre) values('Neuquen');

 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Marcos', 'Colon 111', 'Córdoba',1,'null');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Perez Ana', 'San Martin 222', 'Cruz del Eje',1,'4578585');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Garcia Juan', 'Rivadavia 333', 'Villa Maria',1,'4578445');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Perez Luis', 'Sarmiento 444', 'Rosario',2,null);
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Pereyra Lucas', 'San Martin 555', 'Cruz del Eje',1,'4253685');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Gomez Ines', 'San Martin 666', 'Santa Fe',2,'0345252525');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Torres Fabiola', 'Alem 777', 'Villa del Rosario',1,'4554455');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Carlos', 'Irigoyen 888', 'Cruz del Eje',1,null);
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Ramos Betina', 'San Martin 999', 'Cordoba',1,'4223366');
 insert into clientes (nombre,domicilio,ciudad,codigoProvincia,telefono)
  values ('Lopez Lucas', 'San Martin 1010', 'Posadas',4,'0457858745');

-- Crearemos un procedimiento almacenado que le enviemos como parámetro los nombres de dos provincias y 
-- genere como resultado la cantidad de clientes que tenemos en cada una de dichas provincias:

delimiter //
	create procedure pa_ciudadclientes(in p_ciudad1 varchar(20), in p_ciudad2 varchar(20))
    
    begin
		select count(nombre) as "Cantidad de clientes por provincia 1" from clientes where ciudad = p_ciudad1;
        select count(nombre) as "Cantidad de clientes por provincia 2" from clientes where ciudad = p_ciudad2;
    end //
delimiter ;

drop procedure pa_ciudadclientes;
call pa_ciudadclientes('Cordoba', "Cruz del Eje");


-- Ejercicio 4
/*Crear un procediento para encontrar el menor de cuatro números*/

delimiter //
	create procedure pa_numeromenor(in num1 float, in num2 float, in num3 float, in num4 float)
    begin 
		select least(num1, num2, num3, num4) as "Numero menor";
    end //
delimiter ;


call pa_numeromenor(4,1,5,2);

