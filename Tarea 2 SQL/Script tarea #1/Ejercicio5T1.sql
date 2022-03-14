Create database Ejercicio5T1;
use Ejercicio5T1;

create table proveedor(
	RTN varchar(30) primary key not null,
	nombre_proveedor varchar(120) not null,
	direccion_proveedor varchar(255) not null
	);
	insert into proveedor values('0801-1999-20348','Douglas Josue Casco Herrera','PASAR LA CLASE')
	insert into proveedor values('1514-1999-20310','Inestroza ','NO PASAR LA CLASE')
	select *from proveedor

create table producto(
	codigo_producto int primary key identity (1,1) not null,
	nombre_producto varchar(120) not null,
	RTN_proveedor varchar(30) foreign key references proveedor(RTN) not null
	);
	insert into producto values('Muebles','0801-1999-20349')
	insert into producto values('Camas','0801-1999-20349')
	select *from producto

create table cliente(
	identidad varchar(20) primary key not null,
	nombreCliente varchar(120) not null,
	apellido varchar(120) not null,
	direccion varchar(255) not null,
	fecha_nacimiento varchar(20) not null
	);
	insert cliente values('1514-1953-20349','Pedro Antonio ','Flores Herrera',
	'colonia nueva danli por el cementerio divino paraiso','9/3/2022')
	insert cliente values('0801-1953-20349','Hector Fernando  ','Casco Herera',
	'colonia nueva La ESPERANZA','8/3/2022')
	select *from cliente


create table cliente_producto(
	id_cliente varchar(20) foreign key references cliente(identidad) not null,
	cod_producto int foreign key references producto(codigo_producto) not null,
	primary key(id_cliente,cod_producto)
	);
	insert into cliente_producto values(
	'1514-1953-20349',1)
	insert into cliente_producto values(
	'0801-1953-20349',1)
	select *from cliente_producto

