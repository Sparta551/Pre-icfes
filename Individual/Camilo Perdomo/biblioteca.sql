drop database biblioteca;

create database biblioteca;
use biblioteca;

create table Cliente (
idCliente varchar(20) primary key,
nomCliente varchar(20) not null,
apeCliente varchar(20) not null
);

create table Libro(
idLibro int primary key,
tituloLibro varchar(30) not null,
AutorLibro varchar(30),
precioLibro int not null,
stockLibro int not null
);

create table Pedido(
idPedido int primary key auto_increment,
idClienteFK varchar(20) not null,
idLibroFK int not null,
detallePedido int not null,
fechaPedido date not null
);

alter table Pedido
add constraint FKidCliente
foreign key (idClienteFK)
references Cliente(idCliente);

alter table Pedido
add constraint FKidLibro
foreign key (idLibroFK)
references Libro(idlibro);

insert into Cliente values(25325748,'Juanito', 'Alcachofa'), (1021512275, 'Pedrito', 'Jimenez'), (277353, 'tomas', 'oliveira'), (987654321, 'juan', 'nutriales');
insert into Libro values(5478, '100 años de soledad', 'Gabriel Garcia Marquez', 35000, 25), (1234, 'frases de amor', '', 15000, 14), (5698, 'el libro de la selva', 'Rudyard Kipling', 34500, 8), (7456, 'Asterios Polyp', 'David Mazzucchelli', 86900, 3);
insert into Pedido values('', 1021512275, 5478, 1, '2024-05-24'), ('', 1021512275, 7456, 1, '2024-01-14'), ('',277353, 1234, 1, '2023-08-30'), ('', 25325748, 5698, 2, '2022-11-27');

select nomCliente as nombre, apeCliente as apellido, idClienteFK as cedula, idLibroFK as Libro, detallePedido as cantidad from Pedido inner join cliente on idClienteFK=idCliente where idClienteFK = 1021512275;
select nomCliente as nombre, apeCliente as apellido, idClienteFK as cedula, (select sum(detallePedido) from Pedido where idClienteFK=idCliente)as libros_pedidos from Pedido inner join cliente on idClienteFK=idCliente where max(libros_pedidos);

DELIMITER //

create procedure agregar_pedido(idClienteFK varchar(20), idLibroFK int, detallePedido int, fechaPedido date)
begin
    insert into pedido values ('', idClienteFK, idLibroFK, detallePedido, fechaPedido);
    update Libro set stockLibro = stockLibro - detallePedido where idLibro = idLibroFK;
end //

DELIMITER ;

select * from pedido;
select * from libro;

call agregar_pedido(277353, 5478, 1, '2024-10-7');

select idLibro as id, tituloLibro as titulo, autorLibro as autor, precioLibro as precio from Libro where precioLibro > 20000;

select idPedido, idClienteFK, idLibroFK from Pedido where fechaPedido > '2024-10-01';

select * from Libro order by PrecioLibro desc;

