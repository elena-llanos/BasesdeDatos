drop database if exists carreras;
create database carreras collate utf8mb4_spanish_ci;
use carreras;

CREATE TABLE atletas (
  DNI varchar(10) primary key,
  Nombre varchar(30) NOT NULL,
  Apellidos varchar(50) NOT NULL,
  Ciudad varchar(15) NOT NULL
);

CREATE TABLE carreras (
  Cod_carrera int primary key,
  Descripcion varchar(50) NOT NULL,
  Fecha date NOT NULL
);

CREATE TABLE resultados (
  Cod_Carrera int,
  Cod_Atleta varchar(10) NOT NULL,
  Dorsal int NOT NULL,
  Puesto int NOT NULL,
  CONSTRAINT primary key(Cod_Carrera, Cod_atleta),
  CONSTRAINT res_fk1 FOREIGN KEY (Cod_Carrera) REFERENCES carreras (Cod_carrera),
  CONSTRAINT res_fk2 FOREIGN KEY (Cod_Atleta) REFERENCES atletas (DNI)
  );
  
INSERT INTO atletas (DNI, Nombre, Apellidos, Ciudad) VALUES
('11111111A', 'MIKEL', 'SÁEZ DE LAFUENTE RUBIO', 'GETXO'),
('22222222F', 'GONTZAL', 'BILBAO PEREZ', 'SANTURTZI'),
('234242434D', 'AINTZANE ', 'PEREZ MORAN', 'GETXO'),
('23424876F', 'ANE ', 'ITURRASPE MEJIAS', 'LEKEITIO'),
('88888888A', 'AMOS', 'KIPROTICH KIPLAGAT', 'KENIA'),
('94638945F', 'IMANOL ', 'MARROKIN BAUTISTA', 'SOPELA'),
('984568G', 'IBON ', 'BENGOETXEA ZABALA', 'LEKEITIO'),
('99999999F', 'MARTIN', 'CHERUIYOT ', 'KENIA');

INSERT INTO carreras (Cod_carrera, Descripcion, Fecha) VALUES
(1, 'Bilbao Night Marathon', '2021-10-19'),
(2, 'Kosta Trail 2019', '2021-06-09'),
(3, 'Las Arenas- Bilbao 2022', '2020-01-26'),
(4, 'Herri Krosa Mungia 2022', '2020-01-12');

INSERT INTO resultados (Cod_Carrera, Cod_Atleta, Dorsal, Puesto) VALUES
(1, '88888888A', 2, 1),
(1, '99999999F', 1, 2),
(2, '11111111A', 5354, 1),
(2, '234242434D', 23, 2),
(2, '23424876F', 533, 3),
(2, '94638945F', 1, 4),
(3, '11111111A', 1406, 1),
(3, '22222222F', 1309, 2),
(3, '234242434D', 419, 5),
(3, '23424876F', 2, 3),
(3, '94638945F', 1060, 4),
(3, '984568G', 1, 6),
(4, '11111111A', 61, 3),
(4, '234242434D', 262, 2),
(4, '94638945F', 325, 1);