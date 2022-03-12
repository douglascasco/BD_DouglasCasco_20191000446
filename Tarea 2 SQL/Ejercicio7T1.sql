create database Ejercicio7T1;
use Ejercicio7T1;

create table autor(
	codigo_autor int primary key identity(1,1)not null,
	nombre_autor varchar(120) not null
	);
insert into autor values('Daniel Keyes')
insert into autor values('Sosa')
select *from autor

create table usuario(
	codigo_usuario varchar(30) primary key not null,
	nombre varchar(80) not null,
	direccion varchar(255) not null,
	telefono varchar(30) 	
	);
	insert into usuario values('0804-1994-20001','Fernando Rodriguez','colonia los pinos','9494-6161')
	insert into usuario values('0804-1994-20002','Florencia Sosa','colonia los valles','9594-6161')
	select *from usuario
create table libro(
	codigo_libro int primary key identity(1,1) not null,
	titulo varchar(255) not null,
	ISBN varchar(200) not null,
	num_pag int	not null
	);
	insert into libro values ('"Flores Para algernon" mi libro favorito se lo recomiendo','9788467511468',208)
	insert into libro values('Corazon Mecanico','9788439721956',176)
	select *from libro

create table ejemplar(
	cod_ejemplar int identity (1,1) primary key not null,
	localizacion varchar(255) not null,
	codigo_libro int foreign key references libro(codigo_libro)
	);
	insert into ejemplar values('Libreria unah',1)
	insert into ejemplar values('Libreria Centro Navarro',2)
	select *from ejemplar

create table autor_libro(
	codigo_autor int foreign key references autor(codigo_autor) not null,
	codigo_libro int foreign key references libro(codigo_libro)not null,
	primary key (codigo_autor,codigo_libro)
	);
	insert into autor values (1,1)
	insert into autor values (1,2)
	select *from autor
	
create table ejemplar_paquete(
	cod_ejemplar int foreign key references ejemplar(cod_ejemplar) not null,
	cod_usuario varchar(30) foreign key references usuario(codigo_usuario) not null,
	primary key (cod_ejemplar,cod_usuario)
	);
	insert ejemplar_paquete values (1,'0804-1994-20001')
	insert ejemplar_paquete values (2,'0804-1994-20001')
	select *from ejemplar_paquete