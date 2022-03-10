CREATE DATABASE Ejercicio3T1;
use Ejercicio3T1;
create table presentador(
	cod_presentador int primary key identity(1,1) not null,
	dni char(8) not null,
	apellido varchar(120) not null,
	fecha_comienzo date not null
	);
create table evento(
	codigo_evento  int primary key identity(1,1) not null,
	descripcion varchar(255),
	precio smallmoney not null,
	domicilio varchar(255) not null,
	valor_base smallmoney not null,
	cod_presentador int foreign key references presentador(cod_presentador) not null
);
create table cliente(
	num_cliente int primary key not null,
	domicilio varchar(255) not null,
	telefono varchar(20),
	apellido varchar(60)
	);
create table cliente_evento(
num_cliente int foreign key references cliente(num_cliente) not null,
codigo_evento int foreign key references evento(codigo_evento) not null,
);
--estuve practicando como crear una primaria con cuando ya esta hecha la tabla por eso el ALTER
ALTER table cliente_evento add primary key (num_cliente,codigo_evento);

create table disfraz(
	cod_disfraz int primary key identity(1,1) not null,
	personaje varchar(60) not null,
	caracteristica varchar(255) not null,
	precio float not null
);

create table animador(
	cod_animador int primary key identity(1,1),
	dni char(8),
	apellido varchar(100),
	cod_disfraz int foreign key references disfraz(cod_disfraz)
	);

create table evento_animador(
	codigo_evento int foreign key references evento(codigo_evento) not null,
	cod_animador int foreign key references animador(cod_animador),
	primary key(codigo_evento,cod_animador)
	);
