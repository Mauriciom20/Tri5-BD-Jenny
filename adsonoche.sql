CREATE DATABASE adsonoche;

USE adsonoche;

DROP TABLE IF EXISTS cargo;

CREATE TABLE cargo (
	id_cargo INT PRIMARY KEY,
    nom_cargo VARCHAR (20)
);

DROP TABLE IF EXISTS departamento;

CREATE TABLE departamento (
id_dep INT PRIMARY KEY,
nom_dep VARCHAR(20),
ciudad_dep VARCHAR(20),
director_dep INT
);

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	id_em INT PRIMARY KEY,
	nombre_em VARCHAR(30),
	sex_em VARCHAR(1),
	fecha_nac_em DATE,
	fech_incorporacion_em DATE,
	salario_em FLOAT,
    cargo_em INT,
    id_jefe_em INT,
    cod_depto_em int,
	FOREIGN KEY (cargo_em) REFERENCES cargo(id_cargo),
    FOREIGN KEY (cod_depto_em) REFERENCES departamento(id_dep)
);

-- Hacer las relaciones y registrar datos en cada tabla
ALTER TABLE empleados
ADD CONSTRAINT fk_id_jefe_em
FOREIGN KEY (id_jefe_em) REFERENCES empleados(id_em);

INSERT INTO cargo (id_cargo, nom_cargo) VALUES
(1, 'Gerente'),
(2, 'Director'),
(3, 'Jefe Ventas'),
(4, 'Investigador'),
(5, 'Jefe Mercadeo'),
(6, 'Vendedor'),
(7, 'Jefe Mecanicos'),
(8, 'Mecánico'),
(9, 'Asesor'),
(10, 'Secretaria'),
(11, 'Tecnico');

INSERT INTO departamento (id_dep, nom_dep, ciudad_dep, director_dep) VALUES
(1000, 'GERENCIA', 'CALI', 31840269),
(1500, 'PRODUCCIÓN', 'CALI', 16211383),
(2000, 'VENTAS', 'CALI', 31178144),
(3000, 'INVESTIGACIÓN', 'CALI', 16759060),
(3500, 'MERCADEO', 'CALI', 22222222),
(2100, 'VENTAS', 'POPAYAN', 31751219),
(2200, 'VENTAS', 'BUGA', 768782),
(2300, 'VENTAS', 'CARTAGO', 737689),
(4000, 'MANTENIMIENTO', 'CALI', 333333333),
(4100, 'MANTENIMIENTO', 'POPAYAN', 888888),
(4200, 'MANTENIMIENTO', 'BUGA', 11111111),
(4300, 'MANTENIMIENTO', 'CARTAGO', 444444);

INSERT INTO empleados (id_em, nombre_em, sex_em, fecha_nac_em, fech_incorporacion_em, salario_em, cargo_em, id_jefe_em, cod_depto_em) VALUES
(31840269, 'Maria Rojas', 'F', '1959-01-15', '1990-05-16', 6250000, 1, NULL, 1000),
(16211383, 'Luis Perez', 'M', '1956-02-25', '2000-01-01', 5050000, 2, 31840269, 1500),
(31178144, 'Rosa Angulo', 'F', '1957-03-15', '1998-08-16', 3250000, 3, 31840269, 2000),
(16759060, 'Dario Casas', 'M', '1960-04-05', '1992-11-01', 4500000, 4, 31840269, 3000),
(22222222, 'Carla López', 'F', '1975-05-11', '2005-07-16', 4500000, 5, 31840269, 3500),
(1751219, 'Melissa Roa', 'F', '1960-06-19', '2001-03-16', 2250000, 6, 31178144, 2100),
(768782, 'Joaquin Rosas', 'M', '1947-07-07', '1990-05-16', 2250000, 6, 31178144, 2200),
(737689, 'Mario Llano', 'M', '1945-08-30', '1990-05-16', 2250000, 6, 31178144, 2300),
(333333333, 'Elisa Rojas', 'F', '1979-09-28', '2004-06-01', 3000000, 7, 31840269, 4000),
(888888, 'Ivan Duarte', 'M', '1955-08-12', '1998-05-16', 1050000, 8, 333333333, 4100),
(11111111, 'Irene Diaz', 'F', '1979-09-28', '2004-06-01', 1050000, 8, 333333333, 4200),
(444444, 'Abel Gómez', 'M', '1939-12-24', '2000-10-01', 1050000, 8, 333333333, 4300),
(1130222, 'José Giraldo', 'M', '1985-01-20', '2000-11-01', 1200000, 9, 22222222, 3500),
(19709802, 'William Daza', 'M', '1982-10-09', '1999-12-16', 2250000, 4, 16759060, 3000),
(31174099, 'Diana Solarte', 'F', '1957-11-19', '1990-05-16', 1250000, 10, 31840269, 1000),
(1130777, 'Marcos Cortez', 'M', '1986-06-23', '2000-04-16', 2550000, 11, 333333333, 4000),
(1130782, 'Antonio Gil', 'M', '1980-01-23', '2010-04-16', 850000, 6, 16211383, 1500),
(333333334, 'Marisol Pulido', 'F', '1960-10-01', '1990-05-16', 3250000, 4, 16759060, 3000),
(333333335, 'Ana Moreno', 'F', '1992-01-05', '2004-06-01', 1200000, 10, 16759060, 3000),
(1130333, 'Pedro Blanco', 'M', '1987-10-28', '2000-10-01', 800000, 6, 31178144, 2000),
(1130444, 'Jesús Alfonso', 'M', '1988-03-14', '2000-10-01', 800000, 6, 31178144, 2000),
(333333336, 'Carolina Ríos', 'F', '1992-02-15', '2000-10-01', 1250000, 10, 16211383, 1500),
(333333337, 'Edith Muñoz', 'F', '1992-03-31', '2000-10-01', 800000, 6, 31178144, 2100),
(1130555, 'Julian Mora', 'M', '1989-07-03', '2000-10-01', 800000, 6, 31178144, 2200),
(1130666, 'Manuel Millán', 'M', '1990-12-08', '2004-06-01', 800000, 6, 31178144, 2300);

-- 1. Obtener los datos completos de los empleados.
SELECT * FROM empleados;

-- 2. Obtener los datos completos de los departamentos
SELECT * FROM departamento;

-- 3. Obtener los datos de los empleados con cargo 'Secretaria'.
SELECT * FROM empleados WHERE cargo_em = 10;

-- 4. Obtener el nombre y salario de los empleados.
SELECT nombre_em, salario_em FROM empleados;

-- 5. Obtener los datos de los empleados vendedores, ordenado por nombre.
SELECT * FROM empleados WHERE cargo_em = 6 ORDER BY nombre_em;

-- 6. Listar el nombre de los departamentos
SELECT nom_dep, ciudad_dep FROM departamento;

-- 7. Listar el nombre de los departamentos, ordenado por nombre
SELECT nom_dep, ciudad_dep FROM departamento ORDER BY nom_dep;

-- 8. Listar el nombre de los departamentos, ordenado por ciudad
SELECT nom_dep, ciudad_dep FROM departamento ORDER BY ciudad_dep;

-- 9. Listar el nombre de los departamentos, ordenado por ciudad, en orden inverso
SELECT nom_dep, ciudad_dep FROM departamento ORDER BY ciudad_dep DESC;

-- 10. Obtener el nombre y cargo de todos los empleados, ordenado por salario
SELECT nombre_em, cargo_em, salario_em FROM empleados ORDER BY salario_em;

-- 11. Obtener el nombre y cargo de todos los empleados, ordenado por cargo y por salario
SELECT nombre_em, cargo_em, salario_em FROM empleados ORDER BY cargo_em, salario_em;

-- 12. Obtener el nombre y cargo de todos los empleados, en orden inverso por cargo
SELECT nombre_em, cargo_em FROM empleados ORDER BY cargo_em DESC;

-- 13. Listar los salarios de los empleados del departamento 2000
SELECT nombre_em, salario_em FROM empleados WHERE cod_depto_em = 2000;

-- 14. Listar los salarios de los empleados del departamento 2000, ordenado por salario de menor a mayor
SELECT nombre_em, salario_em FROM empleados WHERE cod_depto_em = 2000 ORDER BY salario_em ASC;

-- 15. Listar los cargos
SELECT id_cargo, nom_cargo FROM cargo;

-- 16. Listar los cargos que sean diferentes, ordenada por valor
SELECT id_cargo, nom_cargo FROM cargo ORDER BY nom_cargo;

-- 17. Listar los diferentes salarios
SELECT nombre_em, salario_em FROM empleados;

-- 18. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una bonificación de $500.000, en orden alfabético del empleado
SELECT nombre_em, salario_em, 500000 AS bonificacion FROM empleados WHERE cod_depto_em = 3000 ORDER BY nombre_em;
SELECT COUNT(nombre_em)*500000 as "Total bonificaciones" FROM empleados WHERE cod_depto_em = 3000 ORDER BY nombre_em;

-- 19. Obtener la lista de los empleados que ganan sueldo superior a 1.000.000
SELECT nombre_em, salario_em FROM empleados WHERE salario_em > 1000000;

-- 20. Listar los empleados de sexo femenino con sueldo menor o igual 3.500.000.
SELECT nombre_em, sex_em, salario_em FROM empleados WHERE sex_em = 'F' AND salario_em <= 3500000;

-- 21. Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado
SELECT nombre_em AS 'Nombre', cargo_em AS 'Cargo', salario_em FROM empleados;

-- 22. Hallar el salario de aquellos empleados cuyo número de documento de identidad es superior al '19.709.802'
SELECT id_em, nombre_em, salario_em FROM empleados WHERE id_em > 19709802;

-- 23. Listar los empleados cuyo salario es menor o igual a 1.500.000 de sexo masculino
SELECT nombre_em, sex_em, salario_em FROM empleados WHERE sex_em = 'M' AND salario_em <= 1500000;

-- 24. Divida los empleados, generando un grupo cuyo nombre inicie por la letra J y termine en la letra Z. Liste estos empleados y su cargo por orden alfabético.
SELECT nombre_em AS'Nombre J-Z', cargo_em FROM empleados WHERE UPPER(nombre_em) LIKE 'J%Z' ORDER BY nombre_em;
SELECT nombre_em AS'Nombre J', cargo_em FROM empleados WHERE UPPER(nombre_em) LIKE 'J%' ORDER BY nombre_em;
SELECT nombre_em AS'Nombre Z', cargo_em FROM empleados WHERE UPPER(nombre_em) LIKE '%Z' ORDER BY nombre_em;

-- 25. Listar el salario, documento de identidad del empleado y nombre, de aquellos empleados que tienen sueldo superior a $1.100.000, ordenar el informe por el número del documento de identidad
SELECT id_em, nombre_em, salario_em FROM empleados WHERE salario_em > 1100000 ORDER BY id_em;

-- 26. Obtener un listado similar al anterior, pero de aquellos empleados que ganan hasta 3.300.000
SELECT id_em, nombre_em, salario_em FROM empleados WHERE salario_em <= 3300000 ORDER BY id_em;

-- 27. Hallar el nombre de los empleados que tienen un salario superior a $1.000.000, y tienen como jefe al empleado con documento de identidad '31.840.269'
SELECT nombre_em, salario_em FROM empleados WHERE salario_em > 1000000 AND id_jefe_em = 31840269;

-- 28. Hallar el conjunto complementario del resultado del ejercicio anterior.
SELECT nombre_em, salario_em FROM empleados WHERE NOT (salario_em > 1000000 AND id_jefe_em = 31840269);

-- 29. Hallar los empleados cuyo nombre no contiene la cadena “MA”.
SELECT nombre_em FROM empleados WHERE UPPER(nombre_em) NOT LIKE '%MA%';

-- 30. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI ‘MANTENIMIENTO’, ordenados por ciudad.
SELECT nom_dep, ciudad_dep FROM departamento WHERE UPPER(nom_dep) NOT IN ('VENTAS', 'INVESTIGACIÓN', 'MANTENIMIENTO') ORDER BY ciudad_dep;

-- 31. Obtener el nombre y el departamento de los empleados con cargo 'Secretaria' o 'Vendedor', que no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000, ordenados por fecha de incorporación.


-- 32. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres


-- 33. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres


-- 34. Listar los datos de los empleados cuyo nombre inicia por la letra 'M', su salario es mayor a $800.000 y trabajan para el departamento de 'VENTAS'


-- 35. Obtener los nombres, salarios de los empleados que reciben un salario promedio


-- 36. Suponga que la empresa va a aplicar un reajuste salarial del 7%. Listar los nombres de los empleados, su salario actual y su nuevo salario


-- 37. Obtener la información disponible del empleado cuyo número de documento de identidad sea: '31.178.144', '16.759.060', '1.751.219', '768.782', '737.689', '19.709.802', '31.174.099', '1.130.782'


-- 38. Entregar un listado de todos los empleados ordenado por su departamento, y alfabético dentro del departamento.


-- 39. Entregar el salario más alto de la empresa.


-- 40. Entregar el total a pagar por salario y el número de empleados que las reciben.


-- 41. Entregar el nombre del último empleado de la lista por orden alfabético.


-- 42. Hallar el salario más alto, el más bajo y la diferencia entre ellos.


-- 43. Conocido el resultado anterior, entregar el nombre de los empleados que reciben el salario más alto y más bajo. ¿Cuanto suman estos salarios?


-- 44. Entregar el número de empleados de sexo femenino y de sexo masculino, por departamento.


-- 45. Hallar el salario promedio por departamento.


-- 46. Hallar el salario promedio por departamento, considerando aquellos empleados cuyo salario supera $900.000, y aquellos con salarios inferiores a $575.000. Entregar el código y el nombre del departamento.


-- 47. Entregar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.


-- 48. Hallar los departamentos que tienen más de tres (3) empleados. Entregar el número de empleados de esos departamentos.


-- 49. Obtener la lista de empleados jefes, que tienen al menos un empleado a su cargo. Ordene el informe inversamente por el nombre.


-- 50. Hallar los departamentos que no tienen empleados


-- 51. Entregar un reporte con el número de cargos en cada departamento y cuál es el promedio de salario de cada uno. Indique el nombre del departamento en el resultado.


-- 52. Entregar el nombre del departamento cuya suma de salarios sea la más alta, indicando el valor de la suma.


-- 53. Entregar un reporte con el código y nombre de cada jefe, junto al número de empleados que dirige. Puede haber empleados que no tengan supervisores, para esto se indicará solamente el número de ellos dejando los valores restantes en NULL.

