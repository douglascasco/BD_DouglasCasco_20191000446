CREATE database BDtarea4;
use BDtarea4

-- importante usar este codigo para el funcionamiento de la tarea 
set language español
-- solucion al formato de la fecha que esta en MM-DD-AAAA pero en queremos DD-MM-AAAA 
create table proveedor(
id_proveedor int primary key identity (1,1) not null,
nombre varchar(255) not null,
categoria varchar(100),
ciudad varchar(100) 
);
insert into proveedor values ('Roberto','A','TGU')
insert into proveedor values ('Douglas','B','SPS')
insert into proveedor values ('Josue','C','Choluteca')
insert into proveedor values ('Carlos','D','TGU')
insert into proveedor values ('Diana','E','TGU')

create table producto(
id_articulo int primary key identity(1,1) not null,
descripcion varchar(200) not null,
ciudad varchar(100),
precio money not null
);
insert into producto values('lapiz','TGU',10)
insert into producto values('cuaderno','SPS',150)
insert into producto values('mochila','TGU',900)
insert into producto values('audifonos','Comayagua',350)
insert into producto values('Resma de Papel','TGU',400)

create table cliente(
id_cliente varchar(30) primary key not null,
nombre varchar(255),
ciudad varchar(100)
);
insert into cliente values ('0801-1999-20349','Juan1','TGU')
insert into cliente values ('0801-1999-20350','Juan2','TGU')
insert into cliente values ('0801-1999-20351','Juan3','TGU')
insert into cliente values ('0801-1999-20352','Juan4','TGU')
insert into cliente values ('0801-1999-20353','Juan5','TGU')

create table pedido (
id_pedido int primary key identity (1,1) not null,
fecha_pedido date,
cantidad int,
total money,
id_articulo int foreign key references producto(id_articulo),
id_cliente varchar(30) foreign key references cliente(id_cliente),
id_proveedor int foreign key references proveedor (id_proveedor)
);
insert into pedido values(CONVERT(date,'01-01-2021'),30,30*(select precio from producto where id_articulo=1),1,'0801-1999-20350',1)
insert into pedido values(CONVERT(date,'01-01-2022'),10,30*(select precio from producto where id_articulo=3),3,'0801-1999-20349',1)
insert into pedido values(CONVERT(date,'02-02-2022'),80,30*(select precio from producto where id_articulo=5),2,'0801-1999-20352',2)
insert into pedido values(CONVERT(date,'20-03-2022'),7,30*(select precio from producto where id_articulo=2),2,'0801-1999-20352',1)
insert into pedido values(CONVERT(date,'19-03-2022'),6,30*(select precio from producto where id_articulo=1),1,'0801-1999-20350',1)

create table inventario(
id_inventario int primary key identity(1,1) not null,
id_producto int foreign key references producto(id_articulo),
fecha date,
cantidad int 
);
insert into inventario values (1,CONVERT(date,'26-03-2022'),600)
insert into inventario values (2,CONVERT(date,'26-03-2022'),1200)
insert into inventario values (3,CONVERT(date,'26-03-2022'),600)
insert into inventario values (4,CONVERT(date,'26-03-2022'),300)
insert into inventario values (5,CONVERT(date,'26-03-2022'),1500)

--Consultas
--1. Encontrar el id y nombre del proveedor que proveen el producto con id=1
SELECT pro.id_proveedor,pro.nombre 
from pedido as pe
INNER JOIN proveedor as pro
ON pe.id_proveedor = pro.id_proveedor
where pe.id_articulo = 1

--2. Encontrar los clientes (nombre cliente) que realizaron pedidos de los productos proveídos por el proveedor con id=1
SELECT cli.nombre 
from pedido as pe
INNER JOIN cliente as cli
ON pe.id_cliente = cli.id_cliente
where pe.id_proveedor = 1

--3. Encontrar los proveedores que suministran todos los productos cuyo precio es mayor al precio promedio de los productos
SELECT pro.nombre
from producto,pedido pe
INNER JOIN proveedor pro
ON pe.id_proveedor= pro.id_proveedor
where precio > (select AVG(precio) from producto) AND pe.id_articulo = producto.id_articulo

--4.  Listar los proveedores a los cuales no se les haya solicitado ningún producto
SELECT pro.nombre,pro.id_proveedor
from pedido pe
FULL join proveedor pro
ON pe.id_proveedor = pro.id_proveedor
where pe.id_proveedor IS NULL

--5. Listar los nombres de los clientes que hayan pedido más de un producto y que el precio sea mayor a 100
SELECT c.nombre
FROM cliente c
INNER JOIN pedido P
ON p.id_cliente=c.id_cliente
INNER JOIN producto pro
ON p.id_articulo=pro.id_articulo
where pro.precio>100
GROUP BY c.nombre
HAVING COUNT (DISTINCT pro.id_articulo)>1

/*6. Listar la cantidad y el precio de cada producto que hayan sido pedido por los clientes entre las fechas 01-01-2022 y 
20-03-2022,se requiere visualizar el nombre del cliente, el nombre del producto, nombre del proveedor,
cantidad y precio del producto.*/

SELECT c.nombre,p.descripcion,pro.nombre,pe.fecha_pedido
from pedido pe
inner join proveedor pro ON pe.id_proveedor = pro.id_proveedor
inner join cliente c ON pe.id_cliente = c.id_cliente
inner join producto p ON pe.id_articulo = p.id_articulo
--group by c.nombre,p.descripcion,pro.id_proveedor
where pe.[fecha_pedido] between '01-01-2022' AND '20-03-2022'

--7. Listar los nombres de los clientes que hayan solicitado más de un producto
SELECT c.nombre
FROM cliente c
INNER JOIN pedido P
ON p.id_cliente=c.id_cliente
INNER JOIN producto pro
ON p.id_articulo=pro.id_articulo
GROUP BY c.nombre
HAVING COUNT (DISTINCT pro.id_articulo)>1