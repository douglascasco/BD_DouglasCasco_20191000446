create database Ejercicio6T1;
use Ejercicio6T1;

create table ciudad(
	codigo_postal varchar(10) primary key not null,
	nombre varchar(50) not null
	);
insert into ciudad values(
	'11101','Francisco Morazán'
)
insert into ciudad values(
	'11102','Comayagua'
)
select *from ciudad

create table farmacia(
	ID_farmacia int primary key identity(1,1) not null,
	direccion_farmacia varchar(255) not null,
	dia_guardia varchar(90) not null,
	codigo_postal varchar(10) foreign key references ciudad(codigo_postal) not null
	);
	insert into farmacia values(
	'Frente al mall premier cercano al puente carrizal','lunes,martes,miercoles','11101'
	)
	insert into farmacia values(
	'Frente al mall premier cercano al puente carrizal','domingo, jueves, sabados','11102'
	)
	select *from farmacia

create table laboratorio(
	nombre_laboratorio varchar(60) primary key not null,
	apellido_propietario varchar(20) not null
	);
	insert into laboratorio values (
	'Farmacia Siman','Casco'	
	)
	insert into laboratorio values (
	'Farmacia San Angel','Herrera'	
	)
	select *from laboratorio

create table medicamento(
	nombre_medicamento varchar(100) primary key not null ,
	presentacion varchar(100) not null,
	precio smallmoney not null ,
	apellido_propietario varchar(100) not null,
	nombre_laboratorio varchar (60) foreign key references laboratorio(nombre_laboratorio) not null
	);
	insert into medicamento values ('Acetaminofen MK','capsula',10,'Zelaya','Farmacia San Angel')
	insert into medicamento values ('Amoxicilina','Bote',120,'Rodriguez','Farmacia Siman')
	select *from medicamento 

create table farmacia_medicamento(
	ID_farmacia int foreign key references farmacia(ID_farmacia) not null,
	nombre_medicamento varchar(100) foreign key references medicamento(nombre_medicamento) not null,
	primary key (ID_farmacia,nombre_medicamento)
	);
	insert into farmacia_medicamento values (
	1,'Acetaminofen MK'
	)
	insert into farmacia_medicamento values (
	1,'Amoxicilina'
	)
	select *from farmacia_medicamento 
	

create table empleado(
	Id_empleado varchar(30) primary key not null,
	nombre_empleado varchar(80) not null,
	fechaIngreso varchar(30) not null,
	enfermedades_contraidas varchar(255) not null,
	ID_farmacia int foreign key references farmacia(ID_farmacia) not null
	);
	insert into empleado values ('0801-1989-10359','Douglas Casco','11/3/2020','Gripe',1)
	insert into empleado values ('0801-1999-10359','Fernanda Gutierrez','11/2/2020','Dengue',1)
	select *from empleado

create table accionTerapeutica(
	nombre varchar(80) primary key not null,
	tiempo varchar(60) not null,
	nombre_medicamento varchar(100) foreign key references medicamento(nombre_medicamento) not null
	);
	insert into accionTerapeutica values('relaja los musculos','8 horas','Acetaminofen MK')
	insert into accionTerapeutica values('mata las infecciones','permanente','Amoxicilina')
	select *from accionTerapeutica

create table componentes(
	nombre_cientifico varchar(80) primary key not null,
	nombre_comercial varchar(80) not null,
	cantidad_uso varchar(50) not null
	);
	insert into componentes values('MK','rip','2 gramos')
	insert into componentes values('AM','acetaminofen','30 gramos')
	select *from componentes

create table medicamento_componente(
	nombre_medicamento varchar(100) foreign key references medicamento(nombre_medicamento) not null,
	nombre_cientifico varchar(80) foreign key references componentes(nombre_cientifico),
	primary key (nombre_medicamento,nombre_cientifico)
	);
	insert into medicamento_componente values('Acetaminofen MK','MK')
	insert into medicamento_componente values('Amoxicilina','AM')
	select *from medicamento_componente
	
