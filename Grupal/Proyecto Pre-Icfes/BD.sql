create database preIcfes;
use preIcfes;

create table usuario(
idUsuario int primary key auto_increment,
tipoDocUsuario varchar(5) not null,
documentoUsuario int not null,
nombreUsuario varchar(100) not null,
telefonoUsuario varchar(15) not null,
emailUsuario varchar(40) not null,
direccionUsuario varchar(30) not null,
nivelEstudioUsuario varchar(20) not null,
regionalUsuario varchar(10) not null,
localidadUsuario varchar(10) not null,
estadoUsuario bool not null
);

create table colegio(
idCol int primary key auto_increment,
DANECol int not null,
nombreCol varchar(30) not null,
nivelAcademicoCol varchar(5) not null,
estratoSocioeconoCol int,
cantidadEstudiantesCol int not null
);

create table colegioDes(
idUsuarioFK int,
idColFK int,
dificultadDes int not null,
intencionDes varchar(20) not null,
quienDecDes varchar(30) not null,
contactoDes int not null,
obsDes varchar(50),
desvDes int,
fechaDes date
);

create table venta(
idVenta int primary key auto_increment,
idColFK int,
idUsuarioFK int,
totalVenta float not null,
fechaVenta date not null
);

create table producto(
idProducto int primary key auto_increment,
tipoProducto varchar(15) not null,
nombreProducto varchar(20) not null,
precioProducto float not null,
anioProducto year not null,
estadoProducto bool not null
);

create table DVenta(
idVentaFK int,
idProductoFK int,
cantidadDVenta int not null,
subtotalDVenta float not null,
estadoDVenta varchar(10)
);

Alter table colegioDes
add constraint Descripcion_Usuario
foreign key (idUsuarioFK)
references usuario(idUsuario);

Alter table colegioDes
add constraint Descripcion_Colegio
foreign key (idColFK)
references colegio(idCol);

Alter table venta
add constraint Venta_Usuario
foreign key (idUsuarioFK)
references usuario(idUsuario);

Alter table venta
add constraint Venta_Colegio
foreign key (idColFK)
references colegio(idCol);

Alter table DVenta
add constraint Detalle_Venta
foreign key (idVentaFK)
references venta(idVenta);

Alter table DVenta
add constraint Detalle_Producto
foreign key (idProductoFK)
references producto(idProducto);

select * from venta;

select DANECol 'DANE', nombreCol 'Colegio', dificultadDes 'Dificultad', intencionDes 'Intencion', desvDes 'Desviacion',quienDecDes 'Nombre de contacto', contactoDes 'Telefono', fechaDes 'Fecha'
from colegio inner join colegioDes on idCol=idColFK
where idCol=5;

select DANECol 'DANE', nombreCol 'Colegio', nombreUsuario 'Vendedor', totalVenta 'Total', fechaVenta 'fecha'
from venta inner join colegio on idCol=idColFK
inner join usuario on idUsuario=idUsuarioFK where totalVenta>=(select avg(totalVenta) from venta);

select * from usuario where estadoUsuario=true;

select * from producto where estadoProducto=true;

select DANECol 'DANE', nombreCol 'Colegio', idVenta 'Id de Venta', fechaVenta 'Fecha de Venta', desvDes 'Desviacion'
from colegio inner join venta on idCol=venta.idColFK
inner join colegioDes on idCol=colegioDes.idColFK
where nombreCol like '%bilingue%';

select DANECol 'DANE', nombreCol 'Colegio', count(idVenta) 'Cantidad de ventas'
from colegio inner join venta on idCol=idColFK
group by nombreCol;

/* Base del procedimiento de abajo
create view Productos_2022 as
select nombreProducto 'Producto', tipoProducto 'Tipo', precioProducto 'Precio' from producto where anioProducto=2022;*/

delimiter //
create procedure Crear_tabla_productos(anioPro year)
begin
set @sql =concat('create view Productos_',anioPro,' as
select nombreProducto, tipoProducto, precioProducto from producto where anioProducto=',anioPro,';');
prepare stmt from @sql;
execute stmt;
deallocate prepare stmt;
end //

create procedure Cambiar_estado_usuario(idUs int, nuevoEstado bool)
begin
update usuario set estadoUsuario=nuevoEstado where idUsuario=idUs;
end //

create procedure Cambiar_estado_producto(idPro int, nuevoEstado bool)
begin
update producto set estadoProducto=nuevoEstado where idProducto=idPro;
end //

create procedure Cambiar_localidad_usuario(idUs int, nuevaLocal varchar(10))
begin
update usuario set localidadUsuario=nuevaLocal where idUsuario=idUs;
end //

create procedure Cambiar_cantidadEstudiantes(idCo int, nuevaCantidad int)
begin
update colegio set cantidadEstudiantesCol=nuevaCantidad where idCol=idCo;
end //

create procedure Cambiar_estado_DVenta(idVenta int, idProducto int, nuevoEstado varchar(10))
begin
update DVenta set estadoDVenta=nuevoEstado where idVentaFK=idVenta and idProductoFK=idProducto;
end //

create procedure Eliminar_producto_venta(idPro int, idVen int)
begin
update Venta set totalVenta=totalVenta-(select sum(subtotalDVenta) from DVenta where idProductoFK=idPro and idVentaFK=idVen) where idVenta=idVen;
delete from DVenta where idProductoFK=idPro and idVentaFK=idVen;
end //

/*create trigger nombre_del_trigger
(before / after)(insert | select | update | delete)
on nombre_tabla
for each row
begin
--instrucciones de sql
end;
variable old y new (acceder a registros)
nwe: al nuevo valor que se va a insertar o modificar.
old: el valor anterior 
 
 ejemplo:
create trigger validar_precio
after insert on producto 
for each row 
begin 
	if new.precio<o then 
		signal sqlstate '45000'
		set message_text='el precio es incorrecto';
	end if ;
end;

create trigger registrar_cambio
after update on empleado
for each row 
	begin into historial_cambios values(old.id , old.nombre , new.nombre, now())
end;

create trigger actualizar_inventario
after update on venta
for each row 
	update inventario
    set cantidad=cantidad-new.cantidad_vendida
    where idProducto=new.idProducto;
end;

create trigger  regirstro_papelera
before delete on 
*/
delimiter ;


#select * from Productos_2022;
