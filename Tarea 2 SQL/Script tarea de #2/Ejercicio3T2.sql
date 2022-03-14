CREATE DATABASE Ejercicio3T2;
use Ejercicio3T2;

create table agencia(
codigo_agencia int primary key identity(1,1) not null,
fechainicio varchar(20) not null,
ciudad varchar(80) not null
);
insert into agencia values('11/4/2010','TGU')
insert into agencia values('12/3/2010','San Pedro Sula')
select *from agencia

create table paquete_turistico(
cod_paquete int primary key identity(1,1) not null,
pais varchar(60) not null,
precio money not null,
fkcodigo_agencia int foreign key references agencia(codigo_agencia)
);

insert into paquete_turistico values(
'Honduras',15000,1)
insert into paquete_turistico values(
'Guatemala',16000,2)
select *from paquete_turistico

create table recursivo_paquete(
cod_paquete1 int foreign key references paquete_turistico(cod_paquete) not null,
cod_paquete2 int foreign key references paquete_turistico(cod_paquete) not null,
primary key (cod_paquete1,cod_paquete2)
);
insert into recursivo_paquete values(1,2)
insert into recursivo_paquete values(2,1)
select *from recursivo_paquete

CREATE TABLE cliente(
DNI_cliente varchar(30) primary key not null,
domicilio varchar(255) not null,
nombre_cliente varchar(100) not null,
apellido_cliente varchar(100) not null
);
insert into cliente values('0801-1999-20347','****','a','a')
insert into cliente values('0801-1999-20348','****','b','b')
select *from cliente

CREATE TABLE paquete_cliente(
cod_paquete int foreign key references paquete_turistico(cod_paquete) not null,
DNI_cliente varchar(30) foreign key references cliente(DNI_cliente) not null,
primary key (cod_paquete,DNI_cliente)
);

insert into paquete_cliente values(1,'0801-1999-20348')
insert into paquete_cliente values(2,'0801-1999-20348')
select *from paquete_cliente

CREATE TABLE banco(
nombre_banco varchar(60) primary key not null,
sucursal varchar(90) not null
);
insert into banco values('Sagrada','1')
insert into banco values('occidente','2')
select *from banco

CREATE TABLE forma_pago(
tipo varchar(60) not null,
monto money not null,
pkcliente varchar(30) foreign key references cliente(DNI_cliente) not null,
primary key (tipo,pkcliente)
);
insert into forma_pago values('A',3000,'0801-1999-20347')
insert into forma_pago values('B',2500,'0801-1999-20348')
select *from forma_pago

CREATE TABLE forma_banco(
fecha_validez varchar(30) not null,
tipo varchar(60) not null,
pkcliente varchar(30) not null,
fknombre_banco varchar(60) foreign key references banco(nombre_banco) not null,
foreign key (tipo,pkcliente) references forma_pago(tipo,pkcliente),
);

insert into forma_banco values('14/3/2010','A','0801-1999-20347','Sagrada')
insert into forma_banco values('13/3/2010','B','0801-1999-20348','occidente')
select *from forma_banco