create database Ejercicio1T2;
use Ejercicio1T2;

create table arbitro(
	pasaporteArbitro varchar(100) primary key not null,
	nacionalidad varchar (100) not null,
	añoinicioActividad int not null,
	nombre_arbitro varchar(120) not null,
	apellido_arbitro varchar(120) not null,
	pasaportearbitroRemplazo varchar(100)  
	);
	insert into arbitro values (
	'0801-1999-20394','hondureña',2013,'Allan','Agurcia',null	
	)
	insert into arbitro values (
	'0801-1999-20395','hondureña',2013,'Josue','Flores'	,'0801-1999-20394'
	)
	UPDATE arbitro
SET pasaportearbitroRemplazo = '0801-1999-20395'
WHERE pasaporteArbitro='0801-1999-20394';
	select *from arbitro
	
create table estadio(
nombre varchar(120) primary key not null,
ciudad varchar(60) not null,
capacidadmaxima int not null
);
	insert into estadio values(
	'Estadio1','TGU',25000
	)
	insert into estadio values(
	'Estadio2','San Pedro Sula',6000
	)
	select *from estadio

create table partido (
IDpartido int primary key identity(1,1) not null,
hora varchar(10) not null,
dia varchar (10) not null,
duracion varchar (20) not null,
instancia varchar (60) not null,
pasaporteArbitro varchar(100) foreign key references arbitro(pasaporteArbitro) not null,
nombre_estadio varchar(120) foreign key references estadio(nombre) not null
);
insert into partido values (
 '7 pm','lunes','90 minutos','semifinales','0801-1999-20394','Estadio1'
)
insert into partido values (
 '6 pm','martes','90 minutos','finales','0801-1999-20394','Estadio2'
)
select *from partido

create table equipo(
nombreselecion varchar(50) primary key not null,
nombreDT varchar(120) not null,
lugarEntrenamiento varchar(120) not null,
miembroEquipoTecnico varchar(255) 
);
insert into equipo values (
'Real Juventud','NONE','cancha 1','rogelio,san felipe'
);
insert into equipo values (
'Olimpia','Roger F','cancha 2','MESSI,Reparto de juga pelotas'
);
select *from equipo 

create table aficionado(
NroTicket int primary key identity(1,1) not null,
Vestimenta varchar(255) not null,
NroAsiento int not null,
Fila int not null ,
zona varchar(30) not null
);
insert into aficionado values(
'Camisa roja',1,1,'sombra'
)
insert into aficionado values(
'Camisa azul',2,2,'palco'
)
select *from aficionado

create table estadio_aficionado(
fkestadio  varchar(120) foreign key references estadio(nombre) not null,
fkaficionado int foreign key references aficionado(NroTicket) not null,
primary key (fkestadio,fkaficionado )
);

insert into estadio_aficionado values(
'Estadio1',1
)
insert into estadio_aficionado values(
'Estadio2',1
)
select *from estadio_aficionado

create table jugador (
numCamiseta int primary key not null,
posicion varchar(30) not null,
nombreJugador varchar(80) not null,
apellido varchar(80) not null,
apodo varchar(80) not null,
fknombreSeleccion varchar(50) foreign key references equipo(nombreselecion)
);

insert into jugador values(
10,'delantero','CR7','Ronaldo','goleador','Olimpia')
insert into jugador values(
7,'defensa','Messi','Ronaldo','Defendedor','Real Juventud')
select *from jugador







