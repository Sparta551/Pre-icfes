use TiendaOnline;

select * from Producto;
select * from Ventas;
select * from Usuario;
select * from Clientes;



select nombreProducto as 'Producto' from producto order by precio asc;
select * from usuario where rol='Empleado';

select sum(Total) from venta_producto;
select min(Total) from venta_producto;