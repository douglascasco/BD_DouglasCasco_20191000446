CREATE database Ejercicio2T1;
USE Ejercicio2T1;
create table departamento(
	id_departamento int primary key identity (1,1) not null,
	nombre_depto varchar(60) not null
	);
	insert into departamento values('Francisco Morazán')
	insert into departamento values('El Paraiso')
	select *from departamento

create table municipio(
	codigo_municipio int primary key identity(1,1) not null,
	nombre_municipio varchar(50) not null,
	id_departamento int foreign key references departamento(id_departamento) not null
	);
	insert into municipio values(
	'tegucigalpa',1
	)
	insert into municipio values(
	'El paraiso',2
	)
	select *from municipio

create table localidad (
	codigo_localidad int primary key identity(1,1) not null,
	nombre_localidad varchar(60) not null,
	codigo_municipio int foreign key references municipio(codigo_municipio)
	);
	insert into localidad values('Carnitas keyla',1)
	insert into localidad values('Bodega 08',2)
	select *from localidad

create table ciudadano(
	idCiudadano varchar(20) not null,
	salario smallmoney not null,
	nombre varchar(80) not null,
	telefono varchar(20),
	codigo_localidad int foreign key references localidad(codigo_localidad) not null,
	);
	insert into ciudadano values(
	'0801-1999-20349',11600,'Gerson Alexander','98984664',1
	)
	insert into ciudadano values(
	'0801-1999-20340',20600.65,'Gerson Herrera','94946565',2
	)
	select *from ciudadano