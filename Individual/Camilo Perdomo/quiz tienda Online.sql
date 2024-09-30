drop database dbTiendaONline;

create database dbTiendaONline;
use dbtiendaONline;
create table Producto(
idProducto int auto_increment primary key ,
codigoBacrras int unique,
nombre VARCHAR(100) NOT NULL,
precioProduto float NOT NULL,
cantidadProducto int  
);

create table Usuario(
idUsuario int auto_increment primary key,
rolUruario VARCHAR(50) NOT NULL,
nombre VARCHAR(100) NOT NULL,
telefono VARCHAR(20),
direccion VARCHAR(200)
);

create table Clientes(
idCLiente int auto_increment primary key,
nombreCliente VARCHAR(100) NOT NULL,
telefonoCliente VARCHAR(20),
nacimientoCliente date
);
 
create table Ventas(
idVenta int auto_increment primary key,
fecha date not null,
totalVentas varchar(50) not null,
productosV varchar(50) not null,
idClienteFK int not null,
idUsuarioFk int not null
);
create table detallesVentas(
idDetalleV int auto_increment primary key,
numVenta int,
idVentaFK int,
idProductoFk int,
totalProducto int,
cantidadVentas int
);
alter table Ventas
add constraint idCliente
foreign key (idClienteFK)
references Clientes(idCliente);

alter table Ventas
add constraint idUsuario
foreign key (idUsuarioFk)
references Usuario(idUsuario);

alter table detallesVentas
add constraint IdVenta
foreign key (idVentaFK)
references Ventas(idVenta);

alter table detallesVentas
add constraint idProducto
foreign key (idProductoFk)
references Producto(idProducto);

describe Producto;

describe Usuario;

describe Clientes;

describe Ventas;

describe detallesVentas;

insert into Producto value('',1968,'pollo',10500,16),('',15584,'sal',2600,50),('',198532,'azucar',1000,25),('',48685,'calzones',14000,43);

insert into Usuario value('','empleado','felipe castillo',8478497710,'6261 Cornell Station Apt. 975'),('','empleado','Rocio Moral Hijo',2593633313,'Carretera Delvalle, Nro 0'),('','comprador','العنود الحصين',3205426185,'54542 شارع هند الزامل'),('','comprador','Mabel Cummerata',5209184378,'3155 Pouros Grove Apt. 746');

insert into Clientes value('','jose alexander',60154036615,'2000-04-12'),('','maria estefania',079809578022,'1983-02-02'),('','Lulut Ajiman Prasasta S.IP',1481260,'2003-01-15'),('','Gbeminiyi Iyalla',08108206337,'2004-04-28');

insert into Ventas value('','2020-12-05',15000,'sal,asucar',1,1),('','2024-06-23',60000,'pollo',2,2),('','2023-11-24',30000,'calzones,azucar',3,3),('','2022-08-06',19000,'calsones,sal',4,4);

insert into detallesVentas value('',1,1,1,15000,13),('',2,2,2,60000,36),('',3,3,3,30000,13),('',4,4,4,19000,19);

select * from Producto;

select precioProduto as 'precio', nombre from Producto order by precio asc;

select nombreCliente,nacimientoCliente from Clientes where nacimientoCliente like 'ene%';

select nombre,rolUruario from Usuario where rolUruario='empleado';

select idClienteFK,fecha from Ventas where fecha like '%mar%' or fecha like '%abr%' or fecha like'%may%' or fecha like'%jun%';

select nombre  from Producto where nombre like '%r%';

select idClienteFK,totalVentas from Ventas where totalVentas=15000 or totalVentas=30000;

select avg(cantidadVentas) from detallesVentas;

select count(cantidadVentas) from detallesVentas;

select count(idCLiente) as 'cantidad de clientes' from Clientes;

select min(totalVentas) as 'venta mas economica' from Ventas;

select idClienteFK as 'cliente con precio mas alto', max(totalVentas) as 'venta mas alta' from Ventas;

select * from Ventas inner join Clientes on Ventas.idClienteFK = Clientes.idCliente; 

select V.*,C.idCliente from Ventas V inner join CLientes C  on V.idClienteFK = C.idCliente ;

select Ventas.idClienteFk ,CLientes.nombreCliente ,detallesVentas.totalProducto, max(totalProducto) from Ventas  inner join Clientes  on Ventas.idClienteFK = CLientes.idCliente 
inner join detallesVentas on Ventas.idVenta = detallesVentas.idVentaFK;

select Ventas.productosV ,Clientes.idCliente , Usuario.idUsuario from Ventas inner join Clientes on Ventas.idClienteFK = Clientes.idCliente
inner join Usuario on Ventas.idUsuarioFK = Usuario.idUsuario
where productosV like '%pollo%';

select Ventas.productosV ,Clientes.idCLiente from Ventas inner join Clientes on Ventas.idClienteFK = Clientes.idCliente
where Ventas.idClienteFK=1;

select Clientes.idCliente, Clientes.nombreCliente from Clientes inner join Ventas on Clientes.idCliente = Ventas.idClienteFK;

describe producto;
select * from ventas;
select * from Clientes;
select * from detallesventas;

insert Clientes value (150284632, 'Tatiana Cabrera Vargas', 5218156, '1983-12-30');
insert Usuario value (1021512275, 'Vendedor', 'Camilo Perdomo', 3173669726, 'cll45 #46-81');
insert Producto value ('', 123456, 'ropa de bebe', 50000, 15);
insert Ventas value ('', '2024-09-27', 1, 1, 150284632, 1021512275);
insert detallesventas value ( '', 5, 5, 5, 1, 1);

update clientes set idCliente = 55163118 where idCliente = 150284632;

insert Clientes value (55163118, 'Tatiana Cabrera Vargas', 3144606918, '1985-11-24');
update ventas set idClienteFK = 55163118 where idClienteFK = 150284632;
delete from Clientes where idCliente = 150284632;

/*
DELIMITER//
create procedure nombre_procedimiento (parametros):
begin
--logica de sentencia
end//
DELIMITER;
*/

DELIMITER //
create procedure agregar_producto (idProducto int(11), codBarras int(11), nombreProducto varchar (100), precioProducto float, cantidadProducto int(11))
begin

insert Producto values(idProducto, codBarras, nombreProducto, precioProducto, cantidadProducto);

end //
DELIMITER ;

call agregar_producto('',123, 'juguito tomsy', 2500, 26);

create view nombre_vista as
select * from clientes;

select * from nombre_vista

/*
de tienda online, crear 3 procedimientos:

inactivar un cliente
consultar los productos que ha comprado un cliente
modificar la fecha de nacimiento de un cliente

y 2 vistas

consulta, que cliente comopro un producto y cual fue su numero de orden
el cliente que mas compras haya hecho
*/