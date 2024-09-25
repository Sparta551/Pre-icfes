# -10 puntos

create database TiendaOnline;
use TiendaOnline;

create table producto(
codigoProducto int auto_increment primary key,
nombreProducto varchar(15) not null,
marca varchar(15),
cantidadProducto int,
precio int
);

create table usuario(
cedulaUsuario varchar(15) primary key,
nombreUsuario varchar(20) not null,
telefono int,
direccion varchar(20),
rol varchar(20)
);

create table clientes(
codigoCliente int auto_increment primary key,
nombreCliente varchar(20),
cedulaCliente varchar(15),
nacimientoCliente date
);

create table ventas(
codigoVenta int auto_increment primary key,
usuarioFK varchar(15),
clienteFK int,
fechaVenta date
);

create table venta_producto(
ventaFK int not null,
productoFK int not null,
cantidadProducto int,
total int not null
);

alter table ventas
add constraint FKusuario
foreign key (usuarioFK)
references usuario(cedulaUsuario);

alter table ventas
add constraint FKcliente
foreign key (clienteFK)
references clientes(codigoCliente);

alter table venta_producto
add constraint FKventa
foreign key (ventaFK)
references ventas(codigoVenta);

alter table venta_producto
add constraint FKproducto
foreign key (productoFK)
references producto(codigoProducto);

alter table usuario add genero varchar(5);

insert into producto values ('','Chorizo','cochinera',4,5000),('','mazorca','chicken little', 2, 3000),('','leche','Halpina',1,4000),('','huevos','MyHuevos',12,15000);
insert into clientes values ('','Mauricio','145550287','1984-10-01'),('','Andres','13657893','2001-12-15'),('','Compae','1134780185','1999-01-27'),('','Laura','101567328','2005-03-05');
insert into usuario values ('1234567890','Carol','3068970213','Colombia','Empleado','F'),('0987654321','Rex','3067891234','Suba','Empleado','M'),('1325498760','Harold','3057894632','Colombia','Empleado','M'),('8976345017','Cata','3108036422','Peru','Administrador','F');
insert into ventas values ('','1234567890',1,'2023-03-15'),('','8976345017',2,'2024-06-24'),('','8976345017',4,'2023-06-04'),('','0987654321',3,'2024-02-18');
insert into venta_producto values (1,1,3,15000),(2,4,2,30000),(3,2,1,3000),(4,3,3,12000);