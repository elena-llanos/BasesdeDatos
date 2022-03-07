create database bd_maquina_tickets;
use bd_maquina_tickets;

create table cliente (
cod_cliente int auto_increment primary key,
dni_nie char(9) not null,
nombre varchar(20) not null,
apellido varchar(20) not null,
contrasena varchar(10) not null
);

INSERT INTO cliente(dni_nie, nombre, apellido, contrasena) VALUES ('80920461K', 'Elena', 'Llanos Barajas', 'fC5#jI');
INSERT INTO cliente(dni_nie, nombre, apellido, contrasena) VALUE ('Z1329348E', 'Eder', 'Lucena Ruiz', 'hP4~iG3#bB');
INSERT INTO cliente(dni_nie, nombre, apellido, contrasena) VALUE ('89730667P', 'Valeria', 'Valencia Bautista', 'nB1$jB4_');

create table municipio(
cod_municipio char(4) primary key,
nom_municipio varchar(20) not null
);

INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('020','Bilbao');
INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('054','Leioa');
INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('017','Bermeo');
INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('069','Mungia');
INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('013','Barakaldo');
INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('015','Basauri');
INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('036','Galdakao');
INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('003','Amorebieta-Etxano');
INSERT INTO municipio(cod_municipio, nom_municipio) VALUES ('027','Durango');

create table direcciones(
cod_direccion int auto_increment primary key,
calle varchar(30) not null,
numero int,
cod_postal int not null,
cod_municipio char(4),
constraint fk_direcciones_cod_municipio foreign key (cod_municipio) references municipio (cod_municipio)
);

INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Hurtado Amezaga','15','48001', '020');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Campo Volantin','2','48007', '020');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Campo Volantin','9','48007', '020');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Campo Volantin','33','48014', '020');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Ibarrekolanda','19','48015', '020');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Leioa UPV', NULL,'48940', '054');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Lamera','1','48430', '017');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Herri Bide','11','48430', '017');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Kale Nagusia','2','48430', '017');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Santa Klara','5','48430', '069');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Beko Kalea','11','48100', '069');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Beko Kalea','13','48100', '069');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Mungia Etorbidea','1','48100', '069');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('La Paz','10','48901', '013');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Gran Via','1','48001', '020');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Kareaga Goikoa','20','48970', '015');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Juan Bautista Uriarte','16','48960', '036');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('San Pedro','1','48340', '003');
INSERT INTO direcciones(calle, numero, cod_postal, cod_municipio) VALUES ('Plaza Estación', NULL,'48200', '027');

create table linea_de_autobus(
cod_linea_autobus char(3) primary key,
nombre varchar(20) unique not null,
hora_inicio_asc time not null,
hora_fin_asc time not null,
hora_inicio_desc time not null,
hora_fin_desc time not null,
frecuencia int not null,
precio_linea double not null
);

INSERT INTO linea_de_autobus(cod_linea_autobus, nombre, hora_inicio_asc, hora_fin_asc, hora_inicio_desc, hora_fin_desc, frecuencia, precio_linea) 
VALUES ('L01','Bilbao-UPV/EHU','9:00', '21:00', '9:00', '21:00', '60', '0.20');
INSERT INTO linea_de_autobus(cod_linea_autobus, nombre, hora_inicio_asc, hora_fin_asc, hora_inicio_desc, hora_fin_desc, frecuencia, precio_linea) 
VALUES ('L02', 'Bermeo-Mungia', '8:00', '20:00', '9:00', '21:00', '30', '0.30');
INSERT INTO linea_de_autobus (cod_linea_autobus, nombre, hora_inicio_asc, hora_fin_asc, hora_inicio_desc, hora_fin_desc, frecuencia, precio_linea) 
VALUES ('L03', 'Barakaldo-Durango', '10:00', '18:00', '10:00', '18:00', '60', '0.20');

create table parada(
num_orden int,
cod_linea_autobus char(3),
cod_direccion int not null,
nom_parada varchar(30) unique not null,
intervalo int not null,
primary key (num_orden, cod_linea_autobus),
constraint fk_cod_linea_autobus foreign key (cod_linea_autobus) references linea_de_autobus(cod_linea_autobus),
constraint fk_cod_direccion_direcciones foreign key(cod_direccion) references direcciones(cod_direccion)
);

INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('1','L01','1','Bilbao/Abando', '5');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('2', 'L01', '2', 'Ayuntamiento/Udaletxea', '3');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('3', 'L01', '3', 'Campo Volatin 9', '7');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('4', 'L01', '4', 'Deustuko Unibertsitatea', '10');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('5', 'L01', '5', 'Ibarrekolanda', '20');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('6', 'L01', '6', 'EHU Laboa Plaza', '0');

INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('1','L02','7','Lamera Parkea', '10');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('2', 'L02', '8', 'Herri Bide 11', '10');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('3', 'L02', '9', 'Bolatoki', '8');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('4', 'L02', '10', 'Santa Klara', '5');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('5', 'L02', '11', 'Beko Kalea 11', '5');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('6', 'L02', '12', 'Beko Kalea 23', '6');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('7', 'L02', '13', 'Mungia / Ayuntamiento', '0');

INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('1','L03','14','Barakaldo / Ayuntamiento', '15');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('2', 'L03', '15', 'Bilbao / Plaza Circular', '15');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('3', 'L03', '16', 'Basauri / Mercado', '10');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('4', 'L03', '17', 'Galdakao / Ayuntamiento', '20');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('5', 'L03', '18', 'Amorebieta / Rotonda', '20');
INSERT INTO parada(num_orden, cod_linea_autobus, cod_direccion, nom_parada, intervalo) VALUES ('6', 'L03', '19', 'Durango  / Estación', '0');

create table billete(
cod_billete int auto_increment primary key,
cod_linea_autobus char(3) not null,
num_orden_ini int not null,
num_orden_fin int not null,
cod_cliente int  not null,
fecha_hora_salida datetime not null,
fecha_hora_llegada datetime not null,
importe_billete double,
constraint fk_cod_linea_autobus_billete foreign key (cod_linea_autobus) references parada(cod_linea_autobus),
constraint fk_dni_nie_billete foreign key (cod_cliente) references cliente(cod_cliente),
constraint fk_num_orden_ini_billete foreign key (num_orden_ini) references parada (num_orden),
constraint fk_num_orden_fin_billete foreign key (num_orden_fin) references parada (num_orden)
);

INSERT INTO billete(cod_linea_autobus, num_orden_ini, num_orden_fin, cod_cliente, fecha_hora_salida, fecha_hora_llegada, importe_billete) 
VALUES ('L01', '1', '4', '1', '2022-01-04 14:00', '2022-01-04 14:30', '0.80');
INSERT INTO billete(cod_linea_autobus, num_orden_ini, num_orden_fin, cod_cliente, fecha_hora_salida, fecha_hora_llegada, importe_billete) 
VALUES ('L03', '2', '4', '3', '2022-01-02 10:00', '2022-01-02 10:30', '0.60');
select * from cliente;
