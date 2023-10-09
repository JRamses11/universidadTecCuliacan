DROP TABLE ARTICULOS
CREATE TABLE ARTICULOS(CLAVE INT PRIMARY KEY, NOMBRE NVARCHAR(50), CODIGOBARRA CHAR(10) UNIQUE)

INSERT ARTICULOS VALUES(5,'PALA 5', '00000005')
INSERT ARTICULOS VALUES(11,'PALA 11', '000000011')
INSERT ARTICULOS VALUES(4,'PALA 4', '00000004')
INSERT ARTICULOS VALUES(6,'PALA 6', '00000006')
INSERT ARTICULOS VALUES(2,'PALA 1', '00000001')
INSERT ARTICULOS VALUES(7,'PALA 7', '00000007')

SELECT*FROM ARTICULOS

