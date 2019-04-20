/* REPORTES (Practica 6)
Daniel Emmanuel Ovalle Hernández -  1741780
*/

USE LabBase

SELECT * FROM Clientes
SELECT * FROM Multas

--Mostrando cantidad de idCliente mayores a 5
SELECT COUNT(idCliente) FROM Clientes WHERE idCliente > 5;

--Edad minima del sexo femenino
SELECT MIN(Edad) FROM Clientes WHERE Sexo = 'M';

--Cadena mas larga
SELECT MAX(Titulo) FROM Libro;

--Union de tablas
SELECT * FROM Clientes join Multas on Clientes.idCliente = Multas.ClientesID

--eliminacion de tabla
DROP TABLE Libros;

-- Cambiando nombre al titulo de la columna con AS
SELECT Titulo AS Novedades FROM Libro;

--Mostrando cantidad de idCliente mayores a 5
SELECT COUNT(idCliente) FROM Clientes WHERE idCliente > 5;

--promedio
SELECT AVG (Edad) FROM Clientes WHERE Sexo = 'F';


