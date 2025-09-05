--Esto en el servidor de BDs SERVIDOR_PRINCIPAL
use bdlab1
go

/* Asignar permisos al usuario USERW2 
sobre la base de datos 'bdlab1' */
sp_grantdbaccess 'USERW2'

/* Conceder permisos para el usuario 'USERW2'
para poder crear tablas en la bds 'bdlab1' */
grant create table to USERW2
go

select * from USERW2.product 

insert into USERW2.product values (5,'gaseosa')