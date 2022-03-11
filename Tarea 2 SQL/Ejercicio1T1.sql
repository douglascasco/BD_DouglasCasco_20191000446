CREATE database Ejercicio1T1;
USE Ejercicio1T1;
create table profesor(
	id_docente varchar(18) primary key not null,
	nombre varchar(60)  not null,
	telefono varchar(13)
	);
	insert into profesor values(
	'0801-1992-13122','Cindy Euceda','9898-5656')
	insert into profesor values(
	'0801-1900-13122','Pedro Euceda','9626-5656')
	select *from profesor

create table asignatura(
	codigo_asignatura varchar(15) primary key not null,
	nombre varchar (35),
	unidadesvalorativas int,
	FK_id_docente varchar(18) foreign key references profesor(id_docente)
    );
	insert asignatura values (
	'ISB-301','HACKEAR FB',6,'0801-1900-13122'
	)
	insert into asignatura  values (
	'ISB-302','HACKEAR videojuegos',5,'0801-1992-13122'
	)
	select *from asignatura

create table alumno(
	numeroCuenta bigint primary key not null,
	nombreAlumno varchar(60) not null,
	FechaNacimiento varchar(12),
	telefonoEstudiante varchar(13)
    );
	insert into alumno  values (20191000446,'Douglas Josue Casco Herrera','04/10/1999','98466688')
	insert into alumno  values (20191000694,'Diana Rut Garcia Amador','16/6/2000','96994813')
	select *from alumno

create table alumno_asignatura(
	numeroCuenta bigint foreign key references alumno(numeroCuenta) not null,
	codigo_asignatura varchar(15) foreign key references asignatura(codigo_asignatura) not null, 
	primary key (numeroCuenta,codigo_asignatura)
    );
	insert into alumno_asignatura values(
	20191000446,'ISB-302'	
	)
	insert into alumno_asignatura values(
	20191000694,'ISB-302'	
	)
	select *from alumno_asignatura