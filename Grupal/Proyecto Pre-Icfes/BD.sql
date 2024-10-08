create database preIcfes;
use preIcfes

create table usuario(
idUsuario int primary key auto_increment,
tipoDocUsuario varchar(5) not null,
documentoUsuario int not null,
nombreUsuario varchar(20) not null,
apellidoUsuario varchar(20) not null,
telefonoUsuario varchar(15) not null,
emailUsuario varchar(40) not null,
direccionUsuario varchar(30) not null,
nivelEstudioUsuario varchar(20) not null,
regionalUsuario varchar(10) not null,
localidadUsuario varchar(10) not null
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
add constrain Descripcion_Usuario
foreign key (idUsuarioFK)
reference usuario(idUsuario);

Alter table colegioDes
add constrain Descripcion_Colegio
foreign key (idColFK)
reference colegio(idCol);

Alter table venta
add constrain Venta_Usuario
foreign key (idUsuarioFK)
reference usuario(idUsuario);

Alter table venta
add constrain Venta_Colegio
foreign key (idColFK)
reference colegio(idCol);

Alter table DVenta
add constrain Detalle_Venta
foreign key (idVentaFK)
reference venta(idVenta);

Alter table DVenta
add constrain Detalle_Producto
foreign key (idProductoFK)
reference producto(idProducto);
