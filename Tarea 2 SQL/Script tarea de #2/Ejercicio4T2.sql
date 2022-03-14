CREATE DATABASE Ejercicio4T2;
USE Ejercicio4T2;

CREATE TABLE producto(
cod_producto int identity(1,1) primary key not null,
domicilio varchar(120) not null,
alto varchar(30) ,
ancho varchar(30),
peso varchar(30),
);
insert into producto values ('colonia el paraiso','2 mts','1 m', '30 kg')
insert into producto values ('colonia real','2 mts','1 m', '30 kg')
select *from producto

CREATE TABLE cupon(
numero_cupon int primary key identity(1,1) not null,
hora_vto int not null,
importe varchar (30) not null,
fecha varchar(30) not null,
fkcod_producto int foreign key references producto(cod_producto)
);
insert into cupon values (7,'#','13/3/2021',1)
insert into cupon values (6,'#','13/3/2020',2)
select *from cupon

CREATE TABLE super_cupon(
numero_cupon int foreign key references cupon(numero_cupon) not null,
numero_super_cupon int foreign key references cupon(numero_cupon) not null
primary key (numero_cupon,numero_super_cupon)
);
insert into super_cupon values(1,1)
insert into super_cupon values(2,2)
select *from super_cupon

CREATE TABLE cliente(
dni_cliente varchar(30) primary key not null,
nombre_cliente varchar(120) not null,
email varchar(120),
area_telefono varchar(5),
numero_telefono varchar(10)
);
insert into cliente values ('0801-1999-20347','Ana','#','+504','9898-6564')
insert into cliente values ('0801-1999-20348','Josue','#','+504','9696-6564')
select *from cliente

CREATE TABLE cupon_cliente(
numero_cupon int foreign key references cupon(numero_cupon),
dni_cliente varchar(30) foreign key references cliente(dni_cliente),
primary key (numero_cupon,dni_cliente)
);
insert into cupon_cliente values(1,'0801-1999-20347')
insert into cupon_cliente values(2,'0801-1999-20348')
select *from cupon_cliente

CREATE TABLE proveedor(
cuit varchar(60) primary key not null,
telefono varchar(20) not null,
Razon_social varchar (255)
);

insert into proveedor values('11-2222-33','9846-6665','electrodomesticos')
insert into proveedor values('12-2222-34','9846-6666','venta de calzado')
select *from proveedor

CREATE TABLE producto_proveedor(
fkcod_producto int foreign key references producto(cod_producto),
fkcuit varchar (60) foreign key references proveedor(cuit),
primary key (fkcod_producto,fkcuit)
);
insert into producto_proveedor values(1,'11-2222-33')
insert into producto_proveedor values(2,'11-2222-33')
select *from producto_proveedor











