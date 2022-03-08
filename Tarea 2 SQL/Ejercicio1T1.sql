CREATE database Ejercicio1T1;
USE Ejercicio1T1;
create table profesor(
	id_docente varchar(18) primary key not null,
	nombre varchar(60)  not null,
	telefono varchar(13)
	);
create table asignatura(
	codigo_asignatura varchar(15) primary key not null,
	nombre varchar (35),
	unidadesvalorativas int,
	FK_id_docente varchar(18) foreign key references profesor(id_docente)
    );
create table alumno(
	numeroCuenta int primary key not null,
	nombreAlumno varchar(60) not null,
	FechaNacimiento date,
	telefonoEstudiante varchar(13)
    );
create table alumno_asignatura(
	numeroCuenta int foreign key references alumno(numeroCuenta),
	codigo_asignatura varchar(15) foreign key references asignatura(codigo_asignatura) 
	primary key (numeroCuenta,codigo_asignatura)
    );
