#punto 1
create database Mascotas;
use Mascotas;

#punto 2

create table Producto(
codigoProducto int(11) primary key,
nombreProducto varchar(15) not null,
marca varchar(15) not null,
precio float not null,
cedulaClienteFK int(11) not null
);

create table Cliente(
cedulaCliente int(11) primary key,
nombreCliente varchar(15) not null,
apellidoCliente varchar(15) not null,
direccionCliente varchar(10) not null,
telefono int(10) not null,
idMascotaFK int(11) not null
);

create table Mascota(
idMascota int(11) primary key,
nombreMascota varchar(15) not null,
generoMascota varchar(15) not null,
razaMascota varchar(15) not null,
cantidad int(10) not null
);

create table mascota_vacuna(
codigoVacunaFK int(11) not null,
idMascotaFK int(11) not null,
enfermedad varchar(15) not null
);

create table Vacuna(
codigoVacuna int(11) primary key,
nombreVacuna varchar(15) not null,
dosisVacuna int(10) not null,
enfermedad varchar(15) not null
);

#punto 3

alter table Producto
add constraint FKproductoCliente
foreign key (cedulaClienteFK)
references Cliente(cedulaCliente);

alter table Cliente
add constraint FKClienteMascota
foreign key (idMascotaFK)
references Mascota(idMascota);

alter table mascota_vacuna
add constraint FKVacunaMascota
foreign key (idMascotaFK)
references Mascota(idMascota);

alter table mascota_vacuna
add constraint FKVacunaVac
foreign key (codigoVacunaFK)
references Vacuna(codigoVacuna);

#punto 4

alter table Producto add cantidad int not null;

#punto 5

alter table mascota change cantidad cantidadMascota int(10);

#punto 6

alter table mascota_vacuna rename detalle_vacuna;
