Create database proyecto;
use proyecto;

Create table cliente (
usuario varchar(50) primary key not null,
correo varchar(50),
nombre_cliente varchar(255) not null,
direccion varchar (255),
tel_cel varchar (30),
tel_fijo varchar (30),
f_nacimiento date,
pass varchar (120) not null
);
create table categoria(
id_categoria int primary key identity (1,1),
desc_categoria varchar(50)
);
create table producto(
cod_producto int primary key identity (1,1)not null,
precio_venta money not null,
precio_compra money not null,
descripcion varchar(200),
fotografia image null,
id_categoria int foreign key references categoria(id_categoria) not null
);
create table promocion (
id_promocion int primary key identity(1,1) not null,
f_inicio date not null,
f_final date not null,
descuento real check (descuento<0.80) default 0
);
create table sucursal(
id_sucursal int primary key identity (1,1),
desc_sucursal varchar (100)
);
create table inventario (
id_inventario int primary key identity (1,1) not null,
existencias int,
id_sucursal int foreign key references sucursal(id_sucursal),
cod_producto int foreign key references producto(cod_producto)
);
Create table pedido(
id_pedido int primary key identity (1,1) not null,
cant_producto money not null,
total_pago money,
fecha_pedido smalldatetime not null default GETDATE(),
fk_usuario varchar(50) foreign key references cliente(usuario),
fk_producto int foreign key references producto(cod_producto),
fk_promocion int foreign key references promocion(id_promocion),
fk_sucursal int foreign key references sucursal(id_sucursal)
);

create table producto_sucursal(
cod_producto int  foreign key references producto(cod_producto) not null,
id_sucursal int foreign key references sucursal(id_sucursal),
primary key (cod_producto,id_sucursal)
 );
 create table proveedor(
id_proveedor int primary key not null,
des_proveedor varchar(150)
);

create table producto_proveedor(
cod_producto int  foreign key references producto(cod_producto) not null,
id_proveedor int foreign key references proveedor(id_proveedor)
);


--importante
go
alter Trigger modificacion_pedido on pedido
after insert,update
as 
 begin
update pe
set pe.total_pago = (prod.precio_venta*i.cant_producto)-((prod.precio_venta * i.cant_producto)*p.descuento), pe.fk_promocion = p.id_promocion 
from promocion as p,producto as prod,pedido pe
inner join inserted i on i.id_pedido = pe.id_pedido
where i.fecha_pedido BETWEEN p.f_inicio AND p.f_final;
end
go
--triger importante

go
alter Trigger mod_inventario on pedido
after insert,update
as
update inv
set existencias = existencias -i.cant_producto
from inventario inv
inner join inserted i on i.fk_producto = inv.cod_producto
inner join sucursal s on s.id_sucursal = inv.id_sucursal
where inv.id_sucursal =i.fk_sucursal and i.cant_producto = inv.cod_producto
go

--insert de cliente
insert into cliente values ('A','herreradouglas919@gmai.com','a','TGU','9846-6688','#','10/04/1998','123');
insert into cliente values ('B','herreradouglas919@gmai.com','b','TGU','9846-6688','#','10/04/2000','123');
insert into cliente values ('C','herreradouglas919@gmai.com','c','TGU','9846-6688','#','10/04/1999','123');
insert into cliente values ('D','herreradouglas919@gmai.com','d','TGU','9846-6688','#','11/04/1999','123');
insert into cliente values ('E','herreradouglas919@gmai.com','e','TGU','9846-6688','#','10/04/1997','123');
insert into cliente values ('F','herreradouglas919@gmai.com','f','TGU','9846-6688','#','10/04/1983','123');
insert into cliente values ('G','herreradouglas919@gmai.com','g','TGU','9846-6688','#','10/04/1995','123');
insert into cliente values ('H','herreradouglas919@gmai.com','h','TGU','9846-6688','#','10/04/1998','123');
insert into cliente values ('I','herreradouglas919@gmai.com','i','TGU','9846-6688','#','10/04/1999','123');
insert into cliente values ('J','herreradouglas919@gmai.com','j','TGU','9846-6688','#','10/04/1989','123');
insert into cliente values ('K','herreradouglas919@gmai.com','k','TGU','9846-6688','#','10/04/1999','123');
insert into cliente values ('L','herreradouglas919@gmai.com','l','TGU','9846-6688','#','10/04/1999','123');
insert into cliente values ('M','herreradouglas919@gmai.com','m','TGU','9846-6688','#','10/04/1985','123');
insert into cliente values ('N','herreradouglas919@gmai.com','n','TGU','9846-6688','#','10/04/1991','123');
insert into cliente values ('Ñ','herreradouglas919@gmai.com','ñ','TGU','9846-6688','#','10/04/2001','123');

--categorias
insert into categoria values ('A')
insert into categoria values ('B')
insert into categoria values ('C')
insert into categoria values ('D')
insert into categoria values ('E')

---producto
insert into producto (precio_compra,precio_venta,descripcion,id_categoria)values (100,90,'desinfectante',1)
insert into producto (precio_compra,precio_venta,descripcion,id_categoria)values (100,80,'Cel',2)
insert into producto (precio_compra,precio_venta,descripcion,id_categoria)values (100,70,'acetaminofen',3)
insert into producto (precio_compra,precio_venta,descripcion,id_categoria)values (100,60,'Panadol',3)
insert into producto (precio_compra,precio_venta,descripcion,id_categoria)values (100,50,'mascarrilla',3)
insert into producto (precio_compra,precio_venta,descripcion,id_categoria)values (100,40,'Gel',1)

--promociones
insert into promocion values ('11/29/2021','05/02/2021',0.10);
insert into promocion values ('03/28/2019','04/28/2019',0.20);
insert into promocion values ('10/04/2022','10/18/2022',0.50);
insert into promocion values ('07/04/2012','08/04/2012',0.10);
insert into promocion values ('03/29/2018','04/28/2018',0.15);
insert into promocion values ('01/01/2011','06/28/2011',0.18);
insert into promocion values ('10/04/2012','10/18/2012',0.34);

--sucursal
insert into sucursal values('1');
insert into sucursal values('2');
insert into sucursal values('3');
insert into sucursal values('4');
insert into sucursal values('5');

--inventario************************************************************************************************************
insert into inventario values (1000,1,3)
insert into inventario values (800,2,5)
insert into inventario values (1000,2,2)
insert into inventario values (1000,2,3)
insert into inventario values (1000,2,4)
insert into inventario values (1000,4,4)
insert into inventario values (1000,5,5)

select *from inventario
--pedidos realizados
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,4);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,3);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,4);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',3,2);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,2);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,5);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,5);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,6);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,6);
insert into pedido (cant_producto,total_pago,fecha_pedido,fk_sucursal,fk_producto)values (10,10*10,'10/04/2022',2,4);

/*
 Reportes
a. Consultas
i. Edad promedio de los clientes */
	SELECT (Year(GETDATE())-AVG(YEAR(f_nacimiento))) as promedio_edad
	from cliente

--10 productos más vendidos

select distinct top 3 pro.cod_producto as mayores
from producto pro
inner join pedido p on p.fk_producto = pro.cod_producto
order by cod_producto desc

--Cantidad de productos por categoría
select distinct id_categoria,COUNT(*) as total_productos
from producto
group by id_categoria

--Listar los productos más bajos en ventas
select distinct top 3 pro.cod_producto as mayores
from producto pro
inner join pedido p on p.fk_producto = pro.cod_producto
order by cod_producto asc
-- Listado de productos agrupados por categoría


select * from  producto as p
order by p.id_categoria


--Reporte mensual de ventas por sucursal
go
Create View vista1 as
select distinct pedido.fk_sucursal,MONTH(GETDATE()) as mes,COUNT(*) as pedidos
from pedido
group by fk_sucursal
go
select *from vista1

go

--Reporte de ventas mensual por producto
Create View vista2 as
select distinct pedido.fk_producto,MONTH(GETDATE()) as mes,COUNT(*) as pedidos
from pedido
group by fk_producto
go
select *from vista2

--Total ventas por categoría
go
CREATE view vista3 
as
select c.id_categoria, COUNT(*) as total_por_Categoria
from pedido p
inner join producto pr on pr.cod_producto = p.fk_producto
inner join categoria c on c.id_categoria = pr.id_categoria
group by c.id_categoria
go
select *from vista3

--Productos en el inventario con cantidad menor
go
create view vista4 as
select  top 3 existencias,id_sucursal from inventario
where existencias <900
order by existencias asc
go
select *from vista4

/*Listado de clientes que no han realizado
ningún pedido durante el mes*/
go
create view vista5 as
(select distinct c.* from cliente c
left join pedido p on c.usuario = p.fk_usuario
where p.fk_usuario is null )
 go
 select *from vista5

 
 --Procedimientos almacenados
 /*I.  Función para búsqueda de clientes por
nombre*/
go
create PROCEDURE busqueda_cliente(@nombre varchar(255))
as
BEGIN
   SELECT *
   FROM cliente
   WHERE nombre_cliente = @nombre
 END 
 execute busqueda_cliente @nombre='b'

-- Eliminar clientes por id

 go
create PROCEDURE elimina_cliente(@usuario varchar(50))
as
BEGIN
   delete cliente
   WHERE usuario = @usuario
 END 
 execute elimina_cliente @usuario='c'


