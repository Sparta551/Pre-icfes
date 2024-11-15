use Mascotas;

select cedulaCliente as 'Documento', direccionCliente 'Direccion' from Cliente;
select nombreProducto as 'Nombre', precio 'Valor' from Producto;
select nombreMascota as 'Nombre', razaMascota 'Raza' from Mascota;
select nombreVacuna as 'Vacuna', dosisVacuna'Dosis', enfermedad from Vacuna;

select nombreMascota as 'Nombre', razaMascota 'Raza' from Mascota order by nombreMascota asc;
select nombreProducto as 'Nombre', precio 'Valor' from Producto order by precio desc;

select enfermedad from detalleVacuna where codigoVacunaFK >2;

select nombreProducto, precio from Producto where precio>1000 and cantidad=1;
select nombreVacuna as 'vacuna', enfermedad from Vacuna where dosisVacuna>1 and enfermedad='bilirubina';
select nombreMascota 'Nombre' from Mascota where generoMascota='F' or razaMascota='criollo';
select nombreCliente 'Nombre' from Cliente where idMascotaFK>=1 and direccionCliente!='Peru';

select nombreProducto from Producto where marca like '%y%';

select nombreProducto from Producto where marca not like '%y%';
