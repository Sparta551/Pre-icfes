create database votaciones2503816;
use votaciones2503816;

create table Genero(
idGenero int auto_increment primary key,
nomGenero varchar(10) not null,
estadoG bool not null
);

create table Jornada(
idJornada int auto_increment primary key,
nomJornada varchar(10) not null,
estadoJ bool not null
);

create table TipoDocumento(
idTipoDoc int auto_increment primary key,
nomTipoDoc varchar(20) not null,
estadoTD bool not null
);

create table TipoMiembro(
idTipoMiembro int auto_increment primary key,
nomTipoMiembro varchar(10) not null,
estadoTM bool not null
);

create table Curso(
idCurso int auto_increment primary key,
nomCurso varchar(10) not null,
estadoCu bool not null
);

create table Concejo(
idConcejo int auto_increment primary key,
nomConcejo varchar(10) not null,
estadoCO bool not null
);

create table Cargo(
idCargo int auto_increment primary key,
nomCargo varchar(20) not null,
idConcejoFK int,
estadoC bool not null
);

create table Eleccion(
idEleccion int auto_increment primary key,
fechaEleccion year not null,
anioEleccion year not null,
estadoCu bool not null
);

create table Usuario(
idUsuario int auto_increment primary key,
noDocUsuario varchar(15) not null,
idTipoDocFK int,
nombreUsuario varchar(20) not null,
apellidoUsuario varchar(20) not null,
idGeneroFK int,
fechaNacUsuario date not null,
emailUsuario varchar(40),
passwordUsuario varchar(30),
fotoUsuario blob not null,
idJornadaFK int,
idTipoMiembroFK int,
idCursoFK int,
estadoU bool not null
);

create table Votacion(
idVotacion int auto_increment primary key,
horaVotacion time not null,
idUsuarioVotanteFK int,
idPostCandidatoFK int,
estadoV bool not null
);

create table Postulacion_candidato(
idPostCandidato int auto_increment primary key,
idUsuarioFK int,
idEleccionFK int,
idCargo int,
propusetas varchar(50) not null,
totalVotos int not null,
estadoCan bool not null
);

/* alter table 
add constraint 
foreign key 
references ;

alter table 
add constraint 
foreign key 
references ;

alter table 
add constraint 
foreign key 
references ;


insert into  values ();

Update  set  where ; */