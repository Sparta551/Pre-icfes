#punto 1
create database Mascotas;
use Mascotas;

#punto 2

create table Producto(
codigoProducto int(11) primary key,
nombreProducto varchar(15) not null,
marca varchar(15) not null,
precio float not null,
cedulaClienteFK int(11)
);

create table Cliente(
cedulaCliente int(11) primary key,
nombreCliente varchar(15) not null,
apellidoCliente varchar(15) not null,
direccionCliente varchar(10),
telefono int(10) not null,
idMascotaFK int(11)
);

create table Mascota(
idMascota int(11) primary key,
nombreMascota varchar(15) not null,
generoMascota varchar(15) not null,
razaMascota varchar(15) not null,
cantidad int(10)
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

alter table mascota_vacuna rename detalleVacuna;

#///////////////////////////////////////////////////////////////

insert into Mascota values (1,'mamahuevo','M','criollo',1);
insert into Mascota values (0,'Tommy','M','labrador dorado',1);
insert into Mascota values (2,'pepe','F','criollo',1);

describe producto;

insert into vacuna values (1,'mirada', 3, 'bilirubina'), (2,'Watagatapitusberry', 8, 'tristeza');

describe mascota;

insert into Cliente values (1234,'josh','kakaka','Peru',0000,1),(111111,'mauricio','moveit moveit','MADAGASCAR',300894,2);

insert into producto values (0,'shampoo','heat ant sholdeas', 10500, 111111,1),(1,'penisilina','MyHuevos', 500,111111,9);

insert into detalleVacuna values (1,2,'mira y no me mira'),(2,1,'que es lo que significa?');

select cedulaCliente as 'Documento', direccionCliente 'Direccion' from Cliente;
select nombreProducto as 'Nombre', precio 'Valor' from Producto;
select nombreMascota as 'Nombre', razaMascota 'Raza' from Mascota;
select nombreVacuna as 'Vacuna', dosisVacuna'Dosis', enfermedad from Vacuna;
