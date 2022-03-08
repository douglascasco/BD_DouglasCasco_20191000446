CREATE database Ejercicio2T1;
USE Ejercicio2T1;
create table departamento(
	id_departamento int primary key identity (1,1) not null,
	nombre_depto varchar(60) not null
	);
create table municipio(
	codigo_municipio int primary key identity(1,1) not null,
	nombre_municipio varchar(50) not null,
	id_departamento int foreign key references departamento(id_departamento) not null
	);
create table localidad (
	codigo_localidad int primary key identity(1,1) not null,
	nombre_localidad varchar(60) not null,
	codigo_municipio int foreign key references municipio(codigo_municipio)
	);
create table ciudadano(
	idCiudadano varchar(20) not null,
	salario smallmoney not null,
	nombre varchar(80) not null,
	telefono varchar(20),
	codigo_localidad int foreign key references localidad(codigo_localidad) not null,
	);