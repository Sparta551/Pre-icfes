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
nacimientoCliente varchar(20)
);
 
create table Ventas(
idVenta int auto_increment primary key,
fecha varchar(20) not null,
totalVentas varchar(50) not null,
productosV varchar(50) not null,
idClienteFK int not null,
idUsuarioFk int not null
);
create table detallesVentas(
idDetalleV int auto_increment primary key,
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

insert into Clientes value('','jose alexander',60154036615,'may-19-2000'),('','maria estefania',079809578022,'ene-01-1983'),('','Lulut Ajiman Prasasta S.IP',1481260,'dic-24-2003'),('','Gbeminiyi Iyalla',08108206337,'jul-23-1989');

insert into Ventas value('','mar-20-2020',15000,'sal,asucar',1,1),('','jun-01-2015',60000,'pollo',2,2),('','ene-19-2010',30000,'calzones,azucar',3,3),('','may-09-2022',19000,'calsones,sal',4,4);

insert into detallesVentas value('',1,1,15000,13),('',2,2,60000,36),('',3,3,30000,13),('',4,4,19000,19);

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

/*crear una base de datos llamada tienda online 
2 habilitar la bd
3 crear tablas producto(id auto increment, codigo de barras  ) , usuario , clientes( id auto incement ) ,ventas(auto increment, numero de ventas ) 
4 realizar relaciones (atributos los que queramos )
un cliente puede realizar muchas ordenes o ventas 
un usuario puede realizar muchas ordenes 
un cliente puede comprar mucho productos 
una orden puede tener muchos productos
un producto puede ser comprado muchas veces 
5 4 inserciones por tabla 
6 realizar las siguientes consultas 
 consulta general de todos los productos 
 ordenar productos por precio de menor precio a mayor 
 consultar los clientes que nacen en enero 
 consultar los usuarios con rol empleado 
 consultar las ordenes generadas entre marzo y junio 
 consultar productos que contenga la letra r
 consultar las ventas que tengan productos con precio de 15 mil o 30 mil
promedio de ventas
e total de ventas 
cantidad de clientes
venta mas economica realizada
consultar el cleinte de la maxima venta echa 
usuario y cliente de una venta especifica
consultar los productos que compro un cliente especifico
consultar todos los clientes que han echo una orden*/