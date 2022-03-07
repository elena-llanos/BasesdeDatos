create database if not exists liga_de_futbol collate utf8mb4_spanish_ci;

use liga_de_futbol;

create table equipos
(id_equipo int primary key auto_increment,
nombre varchar (20) not null unique,
estadio varchar (20) not null,
aforo int default 2000 constraint ch_aforo check (aforo > 100),
fundacion int constraint ch_fundacion check (fundacion between 1950 and 2050),
ciudad varchar (20) not null);

create table jugadores 
(id_jugador int   auto_increment primary key,
nombre varchar (30) not null unique,
fecha_nac date  not null,
id_equipo int not null,
constraint fk_id_equipo foreign key (id_equipo) references equipos (id_equipo));  



create table partidos
(id_equipo_casa int,
id_equipo_fuera int,
fecha_partido date  not null,
goles_casa int not null default 0 constraint ch_goles_casa check (goles_casa > 0),
goles_fuera int not null default 0 constraint ch_goles_fuera check (goles_fuera > 0),
observaciones varchar  (100),
constraint PK_partidos_Primary_key primary key (id_equipo_casa, id_equipo_fuera),
 constraint fk_id_equipo_casa_partido foreign key (id_equipo_casa) references equipos (id_equipo),
 constraint fk_id_equipo_fuera_partido  foreign key (id_equipo_fuera) references equipos (id_equipo));

create table goles 
(id_equipo_casa int,
id_equipo_fuera int,
minuto datetime constraint ch_minuto check (minuto between 0 and 130),
descr_gol varchar (100) not null,
id_jugador int,
constraint pk_goles primary key (id_equipo_casa, id_equipo_fuera, minuto),
constraint fk_equipos_goles foreign key (id_equipo_casa, id_equipo_fuera) references partidos (id_equipo_casa, id_equipo_fuera),
constraint fk_jugadores_goles foreign key (id_jugador) references jugadores (id_jugador) on delete cascade on update cascade);


