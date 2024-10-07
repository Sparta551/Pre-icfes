create database biblioteca_OnlineBD;
use biblioteca_OnlineBD;

create table clientes(
idCliente int primary key auto_increment,
tipoIdentificacionCliente varchar(15) not null,
identificacionCliente varchar (20) not null,
nombreCliente varchar(20) not null,
apellidoCliente varchar(20) not null,
edadCliente int
);

create table libro(
idLibro int primary key auto_increment,
tituloLibro varchar(30) not null,
autorLibro varchar(30) not null,
precioLibro float not null,
cantidadLibro int
);

create table pedidos(
idPedido int primary key auto_increment,
idClienteFK int,
idLibroFK int,
totalPedido float,
fechaPedido date
);

alter table pedidos
add constraint cliente_pedidos
foreign key (idClienteFK)
references clientes(idCLiente);

alter table pedidos
add constraint libro_pedidos
foreign key (idLibroFK)
references libro(idLibro);

insert into libro values ('','Cien años de compañia','Gabri Garza',40000.0,4),('','Harambe','San Joaquen',15000.0,12),('','La divina tragedia','Bante Alghero',60000,6),('','1000 lenguas de viaje aereo','Hernesto',20000.0,2);
insert into clientes values ('','CC','1112049876','Juan Felipe','Sanchez',24),('','TI','758364912','Alberto','Mejilla',16),('','CE','92745631','Anastasia','Cubidos',54),('','CC','4937451756','Luisa Alejandra','Vanessa',32);
insert into pedidos values ('',1,3,60000.0,'2024-05-23'),('',1,4,20000.0,'2024-02-17'),('',2,1,40000.0,'2024-05-03'),('',4,2,15000.0,'2024-07-29');

update libro set cantidadLibro=3 where idLibro=1;
update libro set cantidadLibro=11 where idLibro=2;
update libro set cantidadLibro=5 where idLibro=3;
update libro set cantidadLibro=1 where idLibro=4;

select nombreCliente 'Cliente', tituloLibro 'Libro', autorLibro 'Autor', precioLibro 'Precio'
from pedidos inner join libro on idLibroFK=idLibro
inner join clientes on idClienteFK=idCliente where idCLiente=1;


/*select nombreCliente 'Cliente', (select count(idClienteFK) from pedidos where idclienteFK=1) 'Cantidad de pedidos'
from clientes inner join pedidos on idCLienteFK=idCliente;*/

delimiter //
create procedure hacer_Pedido(Cliente int, Libro int, precio float, fecha date)
begin
insert into pedido values ('',Cliente,Libro,precio,fecha);
update libro set cantidadLibro=(cantidadLibro-1) where idLibro=Libro;
end //
delimiter ;
