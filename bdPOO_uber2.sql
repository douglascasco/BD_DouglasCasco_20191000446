create database bdPOO_uber2;
use bdPOO_uber2;


create table solictudCliente(
	idSolicitud varchar (25) primary key,
    nombreCliente varchar(25),
    apellidoCliente varchar(25),
    ubicacionCliente varchar(25),
    destinoCliente varchar(25)
    
);


create table conductor(
 idConductor varchar(25) primary key,
 nombreConductor varchar(50),
 apellidoConductor varchar(50),
 estadoConductor boolean,
 idSolicitud varchar(25),
 foreign key(idSolicitud) references solictudCliente(idSolicitud)
);