use Northwind
--TRANSACCIONES
--ES UN CONJUNTO DE INSTRUCCIONES DE TRANSACT-SQL INTERPRETADAS
--JUNTA, LAS INSTRUCCIONES SE ENVIAN JUNTAS Y LA PALABRA RESERVADA GO
--MARCA EL FINAL DE UN LOTE
--REGLAS DE LOTE:
--1.TODAS LAS INSTRUCCIONES SE COMPILAN JUNTAS

--2.ALGUNAS INSTRUCCIONES DENTRO DE UN LOTE
--CREATE DATEBASE, TABLE, INDEX

--3.ALGUNAS INSTRUCCIONES NO SE PUEDEN COMBINAR CON OTRA INSTRUCCION DENTRO DE UN LOTE
--CREATE RULE                        -CREATE DEFAULT
--CREATE TRIGGER                     -CREATE VIEW
--CREATE PROC

--4.TODAS LAS INSTRUCCIONES SE COMPILAN JUNTAS SI HAY UN ERROR DE SINTAXIS SE CANCELA EL LOTE

--5. ALGUNAS INSTRUCCIONES SE PUEDE COMBINAR CON OTRA INSTRUCCION DENTRO DE UN LOTE
--CREATE RULE                        -CREATE DEFAULT
--CREATE TRIGGER                     -CREATE VIEW
--CREATE PROC

--6. NO SE PUEDE ALTERAR UNA TABLA Y LUEGO USAR LAS NUEVAS COLUMNAS DENTRO DEL MISMO LOTE