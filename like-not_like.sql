CREATE DATABASE Patrones;

USE Patrones;

CREATE TABLE Usuarios(
id_em INT AUTO_INCREMENT PRIMARY KEY ,
nombres VARCHAR(30) NOT NULL,
apellidos VARCHAR(30)NOT NULL,
codigo INT,
telefono VARCHAR(30)NOT NULL,
email CHAR(30)
);

SELECT * FROM Usuarios;

INSERT INTO Usuarios(nombres, apellidos, codigo, telefono, email)VALUES
('laura camila', 'loaiza vásquez', '302', 3004005000, 'camil123@gmail.com'),
('jorge luis', 'meneses mesa', '301', 3004526809, 'jorgeM@gmail.com'),
('juan pablo', 'tobar torres', '304', 490287730073, 'juan_pablo@soy.sena.edu.co'),
('laura valeria', 'lopez garcia', '305', 3006254378, 'laura_valeria@soy.sena.edu.co');


SELECT * FROM Usuarios WHERE nombres LIKE 'la%';
SELECT * FROM usuarios WHERE CONCAT(nombres, ' ', apellidos) LIKE '%laura%lopez%';
SELECT * FROM Usuarios WHERE apellidos NOT LIKE  'lo%';
SELECT * FROM Usuarios WHERE codigo like '__5%';
SELECT * FROM Usuarios WHERE telefono NOT LIKE '3004526809';
SELECT * FROM Usuarios WHERE email like '%soy.sena.edu.co' AND apellidos LIKE '%torres';
