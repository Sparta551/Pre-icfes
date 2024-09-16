CREATE DATABASE biblioteca;
use biblioteca;
CREATE TABLE libro(
idLibro varchar(20) primary key ,
tituloLibro varchar(50) not null,
identificacionAutorFK varchar(50),
anoPublicacion year not null,
estadoLibro boolean
);

CREATE TABLE Autor(
identificacionAutor varchar(20) primary key ,
nombreAutor varchar(20) not null,
fechaNacimiento date
);

CREATE TABLE Miembro(
identificacionMiembro varchar(20) primary key ,
nombreMiembro varchar(20) not null,
direccionMiembro varchar(50),
fechaInscripcion date not null,
estadoMiembro boolean
);

CREATE TABLE Prestamo(
codigoPrestamo int AUTO_INCREMENT primary key ,
fechaPrestamo date not null,
fechaDevolucion date,
idLibroFK varchar(20) not null,
idMiembroFK varchar(20) not null,
estadoPrestamo boolean
);

alter table Libro
add constraint FKAutorLibro
foreign key (identificacionAutorFK)
references Autor(identificacionAutor);

alter table Prestamo
add constraint FKMiembroPrestamo
foreign key (idMiembroFK)
references Miembro(identificacionMiembro);

alter table Prestamo
add constraint FKLibroPrestamo
foreign key (idLibroFK)
references Libro(idLibro);
