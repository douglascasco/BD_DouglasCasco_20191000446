CREATE DATABASE Ejercicio2T2;
use Ejercicio2T2;

create table autor(
nombre_autor varchar(90) primary key not null,
nacionalidad varchar(60) not null,
anioNacimiento int not null
);
insert into autor values(
'Pablo Neruda','hondureña jaja',1986
)
insert into autor values(
'Pablo Coelo','Brasileña',1980
)
select *from autor

create table libro(
titulo varchar(60) primary key not null,
genero varchar(30),
texto varchar(30),
fecha varchar(20),
revista varchar(15)
);
insert into libro values(
'a','a','a','13/3/2010','a'
)
insert into libro values(
'b','b','b','13/03/2011','b'
)
select *from libro

create table librorecursivo(
fk_titulo varchar(60) foreign key references libro(titulo) not null,
fk_titulo_referido varchar(60) foreign key references libro(titulo) not null,
primary key(fk_titulo,fk_titulo_referido)
);
insert into librorecursivo values('a','b')
insert into librorecursivo values('b','a')
select *from librorecursivo

create table autor_libro(
fk_nombre varchar(90) foreign key references autor(nombre_autor) not null,
fk_titulo varchar(60) foreign key references libro(titulo) not null,
primary key(fk_nombre,fk_titulo)
);
insert into autor_libro values('Pablo Coelo','a')
insert into autor_libro values('Pablo Coelo','b')
select *from autor_libro

create table edicion (
ISBN int primary key identity not null,
anio int ,
idioma varchar(30) not null
);
insert into edicion values(1,'español')
insert into edicion values(1,'frances')
select *from edicion

create table copia(
numerocopia int identity (1,1) not null,
fkISBN int foreign key references edicion(ISBN) not null
primary key (numerocopia,fkISBN)
);
insert into copia values(1)
insert into copia values(2)
select *from copia

create table usuario(
DNI varchar(20) primary key not null,
email varchar(90),
nombreUsuario varchar(90) not null,
apellidoUsuario varchar(90) not null
);
insert into usuario values('0801-1999-20347','herreradouglas920@gmail.com','Douglas J.','Casco H')
insert into usuario values('0801-1999-20348','herreradouglas919@gmail.com','Douglas J.','Casco H')
select *from usuario

create table copia_usuario(
DNI_usuario varchar(20) foreign key references usuario(DNI) not null,
fecha_prestamo varchar(20) not null,
fecha_dev varchar(20) not null,
fkcopia int not null,
fkISBN int not null,
foreign key(fkcopia,fkISBN) references copia(numerocopia,fkISBN),
primary key (fkcopia,fkISBN,DNI_usuario)
);
/* Para que el valor se pueda insertar la copia debe de tener un ISBN que va estar 
relacionado con su numero de copia porque es una entidad debil */
insert into copia_usuario values('0801-1999-20347','5/3/2022','13/3/2022',1,1)
insert into copia_usuario values('0801-1999-20348','5/3/2022','13/3/2022',2,2)
select *from copia_usuario





