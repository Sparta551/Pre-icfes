use TiendaOnline;

select * from Producto;
select * from Ventas;
select * from Usuario;
select * from Clientes;

select nombreProducto as 'Producto', precio from producto order by precio asc;
select nombreCliente as 'Nombre', cedulaCliente 'Cedula' from clientes where month(nacimientoCliente) = 01;
select * from usuario where rol='Empleado';
select usuarioFK as 'Vendedor', fechaVenta 'Fecha' from ventas where month(fechaVenta) = 03 or month(fechaVenta) = 06;
select nombreProducto as Producto, marca from producto where nombreProducto like '%r%';
select ventaFK as 'codigo de venta' from venta_producto where (total/cantidadProducto) = 15000 or (total/cantidadProducto) = 30000;

select sum(Total) from venta_producto;
select min(Total) from venta_producto;

select *
from clientes c right join ventas v left join venta_producto vp on v.codigoVenta=vp.ventaFK on v.clienteFK=c.codigoCliente;

select nombreCliente, total
from ventas v 
inner join clientes c on c.codigoCliente=v.clienteFK
inner join venta_producto vp on vp.ventaFK=v.codigoVenta order by vp.total desc;

select c.*,max(vp.total)
from clientes c right join ventas v left join venta_producto vp on v.codigoVenta=vp.ventaFK on v.clienteFK=c.codigoCliente;

select * from ventas v inner join clientes c on c.codigoCliente=v.clienteFK;
select * from ventas v left join clientes c on c.codigoCliente=v.clienteFK;

describe Clientes;
describe ventas;
describe venta_producto;

#consultar el cliente con mayor venta
#consultar usuario y cliente de una venta especifica
#consultar los productos que compro un cliente especifico
#consultar todos los clientes que han hecho ventas

select nombreCliente, total
from ventas v 
inner join clientes c on c.codigoCliente=v.clienteFK
inner join venta_producto vp on vp.ventaFK=v.codigoVenta where (select max(total) from venta_producto)=vp.total;

select * from clientes where codigoCliente=2;

delimiter //
create procedure registro_usuario(cedula varchar(15),nombre varchar(20),telefono int, direccion varchar(20),rol varchar(20), genero varchar(5))
begin
insert into usuario values (cedula,nombre,telefono,direccion,rol,genero);
end//

create procedure registro_producto(codigo int,nombre varchar(15),marca varchar(15),cantidad int, precio int)
begin
insert into producto values (codigo,nombre,marca,cantidad,precio);
end//

create procedure update_precio (price int, id int)
begin
update Producto set precio=price where codigoProducto=id;
end//
delimiter ;

call update_precio(4500,3);

call registro_usuario;

create view consultarCliente as select codigoCliente,nombreCliente, apellido from clientes;

select apellido from consultarCliente;


#pocedimiento para inactivar un cliente
#procedimiento para consultar los productos que ha comprado un cliente
#procedimiento para modificar la fecha de nacimiento
#crear vista que consulte que cliente compro un producto y su numero de orden
#crear vista que muestre el cliente que mas compras haya hecho

delimiter //
create procedure eliminar_cliente (idCliente int)
begin
delete from cliente where codigoCLiente=idCliente;
end//

create procedure consultar_productos_cliente (idCliente int)
begin
select codigoCliente 'Id', nombreCLiente 'Nombre', productoFK 'Producto'
from clientes c
left join ventas v on c.codigoCliente=v.usuarioFK
left join venta_producto vp on v.codigoVenta=vp.ventaFK
where codigoCliente=idCLiente;
end//

create procedure modificar_fechaNacimiento (idCliente int,nuevaFecha date)
begin
update clientes set nacimientoCliente=nuevaFecha where codigoCliente=idCLiente;
end//

delimiter ;

call consultar_productos_cliente (3);

drop view consltarProductoCliente2;
create view consltarProductoCliente as
select codigoCliente 'Id', nombreCLiente 'Nombre', productoFK 'Producto', ventaFK 'Numero de orden'
from clientes c
right join ventas v 
right join venta_producto vp on v.codigoVenta=vp.ventaFK on c.codigoCliente=v.usuarioFK;

create view consltarProductoCliente2 as
select * #codigoCliente 'Id', nombreCLiente 'Nombre', productoFK 'Producto', codigoVenta 'Numero de orden'
from ventas
inner join clientes on clientes.codigoCliente=ventas.usuarioFK
inner join venta_producto on ventas.codigoVenta=venta_producto.ventaFK;

select * from consltarProductoCliente2;

/* subconsultas son consultas anidadas dentro de otra consulta 
select campo2, campo3 from tablanegra
where columna2=(select columna2x from otratabla where condicion);

*/

/*consultar los datos de los empleados y su sueldo promedio
select idEmpleado, nombreEmpleado, salario, (select avg(salario) from empleado) as promedio
from empleado;

select idEmpleado, nombreEmpleado, idArea, nombreArea
from empleado
where idArea in (select id area from area where nombreEmpleado='Juan??';
*/

/*
Calcular los productos que se vendan a un precio mayor del promedio de todos los productos

Mostrar los clientes que el total de compra sea mayor al promedio de compras de la tienda

Mostrar el promedio de precios de productos comprados por clientes
*/

select id, nombreEmpleado, salario
from empleado;
