CREATE DATABASE Ejercicio3T1;
use Ejercicio3T1;
create table presentador(
	cod_presentador int primary key identity(1,1) not null,
	dni char(15) not null,
	apellido varchar(120) not null,
	fecha_comienzo date not null
	);
	insert into presentador values(
	'0801199920349','Valle','10/3/1999'
	)
	insert into presentador values(
	'0801199920348','Rojas','10/3/1990'
	)
	select *from presentador
	   
create table evento(
	codigo_evento  int primary key identity(1,1) not null,
	descripcion varchar(255),
	precio smallmoney not null,
	domicilio varchar(255) not null,
	valor_base smallmoney not null,
	cod_presentador int foreign key references presentador(cod_presentador) not null
	);
	insert into evento values(
	'Fiesta de cumpleaños para mi hijo',12000,'Res. Las Hadas',6000,1
	)
	insert into evento values(
	'Fiesta de boda con tematica cosplay',12000,'Colonia Ciudad Modelo',6000,2
	)
	select *from evento 

create table cliente(
	num_cliente bigint primary key not null,
	domicilio varchar(255) not null,
	telefono varchar(20),
	apellido varchar(60)
	);
	insert into cliente values(0801199600321,'colonia nueva danli','222222222','Hernandez')
	insert into cliente values(1514198300077,'Colonia 21 de octubre','95468632','Rodriguez')
	select  *from cliente

create table cliente_evento(
	num_cliente bigint foreign key references cliente(num_cliente) not null,
	codigo_evento int foreign key references evento(codigo_evento) not null,
);
--estuve practicando como crear una primaria con cuando ya esta hecha la tabla por eso el ALTER
ALTER table cliente_evento add primary key (num_cliente,codigo_evento)
	insert into cliente_evento values(0801199600321,1)
	insert into cliente_evento values(1514198300077,2)
	select *from cliente_evento
	
create table disfraz(
	cod_disfraz int primary key identity(1,1) not null,
	personaje varchar(60) not null,
	caracteristica varchar(255) not null,
	precio float not null
	);
	insert into disfraz values('Eugeneo the art of online','viste de azul y con una espada de juguete',100000)
	insert into disfraz values('kirito','vestido de negro con unas botas',50000)
	select *from disfraz

create table animador(
	cod_animador int primary key identity(1,1),
	dni char(15),
	apellido varchar(100),
	cod_disfraz int foreign key references disfraz(cod_disfraz)
	);
	insert into animador values(
	'0801199632312','Gonzales',1
	)
	insert into animador values(
	'0801199860132','Lopez',2
	)
	select *from animador
	
create table evento_animador(
	codigo_evento int foreign key references evento(codigo_evento) not null,
	cod_animador int foreign key references animador(cod_animador),
	primary key(codigo_evento,cod_animador)
	);
	insert into evento_animador values(1,2)	
	insert into evento_animador values(2,1)
	select *from evento_animador