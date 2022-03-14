CREATE DATABASE Ejercicio5T2;
USE Ejercicio5T2;

create table cliente (
cod_cliente int primary key identity(1,1) not null,
nombre varchar(120) not null,
apellido varchar (120) not null,
nif varchar (60),
telefono  varchar (30),
email varchar(200),
fechaAlta varchar (20) not null,
numer_tarj varchar (20) 
);

insert into cliente values ('a','a','xxxx-xxx-x','xxxx-xxxx','xxxx@xxxx','13/2/2018','xxxx-xxxx-xxxx')
insert into cliente values ('a','a','xxxx-xxx-x','xxxx-xxxx','xxxx@xxxx','13/2/2018','xxxx-xxxx-xxxx')
select *from cliente

CREATE TABLE premium(
descuento float not null,
fecha_premium varchar(12) not null,
fkcod_cliente int foreign key references cliente(cod_cliente) not null,
);
 insert into premium values (12,'14/3/2020',1)
 insert into premium values (12,'14/3/2020',2)
 select *from premium

CREATE TABLE estandar(
fkcod_cliente int foreign key references cliente(cod_cliente) not null,
);
 insert into estandar values (1)
 insert into estandar values (2)
 select *from estandar

CREATE TABLE pedido(
numero_local  int primary key identity (1,1) not null,
importe_total money not null
);

insert into pedido values (1500)
insert into pedido values(1600)
select *from pedido

CREATE TABLE cliente_pedido (
fecha varchar(10),
hora varchar(10),
numero_local int foreign key references pedido(numero_local),
cod_cliente int foreign key references cliente (cod_cliente),
primary key (numero_local,cod_cliente)
);
insert into cliente_pedido values('12/02/2011','10 am' , 1,1)
insert into cliente_pedido values('12/02/2010','11 am' , 2,2)
select *from cliente_pedido

CREATE TABLE lineas_pedido(
numero int primary key identity (1,1) not null,
importe_linea varchar(30) not null,
numero_local int foreign key references pedido(numero_local)
);
 
 insert into lineas_pedido values('$$$$',1)
 insert into lineas_pedido values('$$$$',2)
 select *from lineas_pedido

CREATE TABLE articulo(
numero_referencia int primary key identity(1,1) not null,
nombre varchar(120) not null,
descripcion varchar(255),
pvp varchar(30)
);

insert into articulo values('lapiz','escribe','###')
insert into articulo values('borrador','borra','###')
select *from articulo

--se usa varchar para cantidad por si se usa una unidad de medidad por ejemplo 1 lb
CREATE TABLE lineas_pedido_articulo(
cantidad varchar(60) not null,
fknumero int foreign key references lineas_pedido(numero) not null,
fknumero_referencia int foreign key references articulo(numero_referencia),
primary key (fknumero,fknumero_referencia)
);
insert into lineas_pedido_articulo values('100 lbs', 1,1)
insert into lineas_pedido_articulo values('####', 2,2)
select *from lineas_pedido_articulo

CREATE TABLE provincia(
cod_provincia varchar(30) primary key not null,
nombre_provincia varchar(100) not null,
extension bigint not null,
numero_habitantes bigint not null
);
insert into provincia values('C-45','NONE',19122123,120000)
insert into provincia values('F-54','NONE',21313,51131)
select *from provincia

CREATE TABLE almacen(
cod_almacen int primary key identity (1,1) not null,
nombre_almacen varchar(100) not null,
fecha_apertura varchar(10),
direccion varchar(255),
telefono varchar(15),
gerente varchar(120),
fkcod_provincia varchar(30) foreign key references provincia(cod_provincia),
fkcod_provincia_ubicado varchar(30) foreign key references provincia(cod_provincia)
);
insert into almacen values ('a','##','##','##','#','C-45','F-54')
insert into almacen values ('b','##','##','##','#','F-54','C-45')
select *from almacen

CREATE TABLE articulo_almacen(
stock int ,
fknumero_referencia int foreign key references articulo(numero_referencia),
fkcod_almacen int foreign key references almacen(cod_almacen)
primary key(fknumero_referencia,fkcod_almacen)
);
insert into articulo_almacen values(1500,1,1)
insert into articulo_almacen values(1500,2,1)
select *from articulo_almacen

CREATE TABLE almacen_recursivo(
fkcod_almacen1 int foreign key references almacen(cod_almacen) not null,
fkcod_almacen2 int foreign key references almacen(cod_almacen) not null
primary key (fkcod_almacen1,fkcod_almacen2)
);
insert into almacen_recursivo values(1,2)
insert into almacen_recursivo values(2,1)
select *from almacen_recursivo








