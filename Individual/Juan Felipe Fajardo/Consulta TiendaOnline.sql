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

#consultar el cliente con mayor venta
#consultar usuario y cliente de una venta especifica
#consultar los productos que compro un cliente especifico
#consultar todos los clientes que han hecho ventas

select nombreCliente, total
from ventas v 
inner join clientes c on c.codigoCliente=v.clienteFK
inner join venta_producto vp on vp.ventaFK=v.codigoVenta where (select max(total) from venta_producto)=vp.total;
