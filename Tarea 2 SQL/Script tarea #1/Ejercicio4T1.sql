CREATE database Ejercicio4T1;
use Ejercicio4T1;
create table camionero (
	dni char(16) primary key not null,
	nombre varchar(120) not null,
	direccion varchar(255) not null,
	salario smallMoney not null,
	telefono varchar(15) not null
	);
	insert into camionero values('0801-1999-20349','Fernando Norman','col vista hermosa',26000,'95656494')
	insert into camionero values('0801-1994-20349','Luis Espinal','col vista hermosa',26000,'95656494')
	select *from camionero

	create table camion(
	matricula char(12) primary key not null,
	modelo varchar(20) not null,
	tipo varchar(20) not null,
	potencia varchar(60) not null
	);
	insert into camion values('1456H','TOYOTA','deportivo','300 caballos')
	insert into camion values('154A','HYNDA','familiar','600 caballos')
	select *from camion

create table camionero_camion(
	dni char(16) foreign key references camionero not null,
	matricula char(12) foreign key references camion not null,
	primary key (dni,matricula)
	);
	insert into camionero_camion values('0801-1999-20349','1456H')
	insert into camionero_camion values('0801-1994-20349','154A')
	select *from camionero_camion

create table departamento(
	cod_departamento int primary key identity (1,1) not null,
	nombre_departamento varchar(150) not null
	);
	insert into departamento values('Yoro')
	insert into departamento values('Copán')
	select *from departamento
create table paquete(
	cod_paquete int primary key identity (1,1) not null,
	descripcion varchar(255) not null,
	destinatario varchar(120) not null,
	direccion_destinatario varchar(255) not null,
	dni_camionero char(16) foreign key references camionero(dni) not null,
	cod_departamento int foreign key references departamento(cod_departamento) not null
	);
	insert into paquete values(
	'Parte de una laptop DELL','Ricardo Ramon Fajardo','colonia ciudad modelo','0801-1999-20349',1
	)
	insert into paquete values(
	'Partes de auto','Douglas Casco','residencial el trapiche','0801-1994-20349',2
	)
	select *from paquete
