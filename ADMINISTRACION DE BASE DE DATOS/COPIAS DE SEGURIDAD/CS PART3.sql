CREATE DATABASE NorthwindLog ON
(NAME= NorthwindLog,
FILENAME=
'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NorthwindLog.mdf',
SIZE= 3MB)
LOG ON
(NAME= 'NorthwindLog_log',
FILENAME= 
'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NorthwindLog_log.LDF',
SIZE= 512KB, MAXSIZE=1MB)

--VERIFICAR LAS OPCIONES DE LA BD
sp_helpdb NorthwindLog

--TAMA�O MAXIMO DEL REGISTRO EN 1MB, LO DISMINUIMOS
ALTER DATABASE NorthwindLog
MODIFY FILE (NAME= 'NorthwindLog_log', MAXSIZE=704KB )

--DISMINUIMOS EL FACTOR DE CRECIMIENTO
ALTER DATABASE NorthwindLog
MODIFY FILE (NAME= 'NorthwindLog_log', FILEGROWTH=0)

--LLENAMOS EL REG DE TRANSACCIONES AL HACER INSERCIONES EN LA TABLA PRUEBABACK
Use NorthwindLog 
Create table PRUEBACHECK
(clave INT PRIMARY KEY, nombre CHAR(100), description char (100))

go 
DECLARE @T INT
SELECT @T=1
WHILE @T<=150000
BEGIN
     INSERT PRUEBACHECK VALUES
	 (@T, 'DATOS DE PRUEBAXDATOS DE PRUEBAXDATOS DE PRUEBAXDATOS', 'DE PRUEBAXDATOS
	 DE PRUEBAXDATOS')
	 SELECT @T=@T+1
END

--NOSE PUEDE EJECUTAR UNA MODIFICACION DE DATOS
DELETE PRUEBACHECK

SELECT COUNT(*) FROM PRUEBACHECK

sp_helpdb NorthwindLog

--LA UNICA MANERA DE OPERAR DE NUEVO LA BD ES ELIMINADO EL REG DE TRANSACCIONES

--OPCION 1 REALIZAR CSRT
sp_addumpdevice 'disk', 'Truncamiento2022',
'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Truncamiento2022.bak'

--UNA COPIA DE SEGURIDAD COMPLETA
BACKUP DATABASE NorthwindLog to Truncamiento2022

--UNA COPIA DE SEGURIDAD DEL REGISTRO DE TRANSACCIONES
BACKUP LOG NorthwindLog to Truncamiento2022

sp_helpdb NorthwindLog

--OPCION 2
--LA UNICA MANERA DE OPERAR DE NUEVO LA BD ES ELIMINADO EL REG DE TRANSACCIONES
--SE RESPALDA A DISCO DONDE SE GRABA A UN ARCHIVO VACIO, SE EJECUTA VARIAS VECES EL
--COMANDO HASTA QUE PERMITA ELIMINAR LOS REGISTROS

BACKUP LOG NorthwindLog TO DISK='NUL:'

--VERIFICAMOS SI SE PUEDE EJECUTAR UN COMANDO
sp_helpdb NorthwindLog
--VERIFICAMOS SI SE PUEDE EJECUTAR UN COMANDO
DELETE PRUEBACHECK

SELECT*FROM REGION
INSERT REGION VALUES(5,'PRUEBA')
INSERT REGION VALUES(6,'PRUEBA')
INSERT REGION VALUES(7,'PRUEBA')

--OPCION 3 AUMENTAR EL TAMA�O DEL ARCHIVO DE REG DE TRAN PAULATIVAMENTE HASTA QUE TE PERMITA REALIZAR 
--EL DELETE
sp_helpdb NorthwindLog

ALTER DATABASE NorthwindLog
MODIFY FILE(NAME='NorthwindLog_log',MAXSIZE=200MB)
ALTER DATABASE NorthwindLog
MODIFY FILE(NAME='NorthwindLog_log',FILEGROWTH=100%)

--VERIFICAMOS SI SE PUEDE EJECUTAR EL COMANDO
DELETE PRUEBACHECK

sp_helpdb NorthwindLog





