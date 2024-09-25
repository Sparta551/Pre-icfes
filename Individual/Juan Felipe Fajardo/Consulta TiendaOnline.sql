use TiendaOnline;

select * from Producto;
select * from Ventas;
select * from Usuario;
select * from Clientes;

select nombreProducto as 'Producto' from producto order by precio asc;
select nombreCliente as 'Nombre', cedulaCliente 'Cedula' from clientes where month(nacimientoCliente) = 01;
select * from usuario where rol='Empleado';
select usuarioFK as 'Vendedor', fechaVenta 'Fecha' from ventas where month(fechaVenta) = 03 or month(fechaVenta) = 06;
select nombreProducto as Producto, marca from producto where nombreProducto like '%r%';
select ventaFK as 'codigo de venta' from venta_producto where (total/cantidadProducto) = 15000 or (total/cantidadProducto) = 30000;

select sum(Total) from venta_producto;
select min(Total) from venta_producto;
