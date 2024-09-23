/*-10*/
drop database dbtiendaOnline;
create database dbtiendaOnline;
use dbtiendaOnline;

create table Producto(
idProducto int auto_increment primary key,
codigoBarras int (13) not null,
nombreProducto varchar(30) not null,
precioProduct int not null
);

create table Usuario(
idUsuario int auto_increment primary key,
nombreUsuario varchar(15) not null,
apellidoUsuario varchar(15) not null,
rolUsuario varchar(15)
);

create table Cliente(
cedulaCliente int(11) primary key,
nombreCliente varchar(15),
apellidoCliente varchar(15),
fechaNacimiento date
);

create table Venta(
idVenta int auto_increment primary key,
numOrden int(10),
fechaVenta datetime,
idClienteFK int(11),
idUsuarioFK int(11)
);

create table venta_producto(
idProductoFK int(10),
idVentaFK int(10),
cantidad int(10)
);

alter table Venta
add constraint FKidUsuario
foreign key (idUsuarioFK)
references Usuario(idUsuario);

alter table Venta
add constraint FKidCliente
foreign key (idClienteFK)
references Cliente(cedulaCliente);

alter table venta_producto
add constraint FKidProducto
foreign key (idProductoFK)
references Producto(idProducto);

alter table venta_producto
add constraint FKidVenta
foreign key (idVentaFK)
references Venta(idVenta);

select * from Usuario;
describe Usuario;
Insert into Usuario values('', 'Alejandro', 'Molina', 'vendedor'),('', 'catalina', 'ayala', 'Vendedor'),('', 'Daniela', 'Acosta', 'Administrador'),('', 'Thomas', 'Torres', 'Desarrollador');

select * from Cliente;
describe Cliente;
Insert into Cliente values(79745951, 'Harold', 'Puentes', 1976-11-30),(1021512275, 'Andres', 'Bermudez', 2004-04-28),(52589557, 'Diana', 'Esperanza', 1975-02-02),(1015689572, 'Martin', 'Lucero', 1999-01-31);

select * from Producto;
describe Producto;
Insert into Producto values('', 123456789, 'juguito tomsi', 2500),('', 987654321, 'papas bbq margarita', 3000),('', 111111111, 'cocacola 3L', 15000),('', 999999999, 'juego de mesa', 30000);

select * from Venta;
describe Venta;
Insert into Venta values('', 1, 2024-01-31, 79745951, 1),('', 2, 2024-05-15, 79745951, 1),('', 3, 2023-11-25, 52589557, 2),('', 4, 2024-08-15, 1021512275, 1);

select * from Venta_Producto;
describe Venta_Producto;
Insert into Venta_producto values(1, 5, 12),(3, 7, 2),(4, 7, 1),(2, 6, 2);

describe Cliente;

select * from Producto;
select nombreProducto codigoBarras from Producto order by precioProduct asc;
select cedulaCliente as identificacion, nombreCliente as nombre, apellidoCliente as apellido from Cliente where fechaNacimiento like 


