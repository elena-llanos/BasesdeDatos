CREATE DATABASE EMPRESA2 collate utf8mb4_spanish_ci;

USE EMPRESA2;

CREATE TABLE HABILIDAD
(CodHab CHAR (5) PRIMARY KEY,
DesHab VARCHAR(30) NOT NULL UNIQUE);

INSERT INTO HABILIDAD VALUES ('FONTA', 'Fontaner�a');
INSERT INTO HABILIDAD VALUES ('GEREN', 'Gerencia');
INSERT INTO HABILIDAD VALUES ('GESCO', 'Gesti�n Contable');
INSERT INTO HABILIDAD VALUES ('MARKE', 'M�rketing');
INSERT INTO HABILIDAD VALUES ('MECAN', 'Mecanograf�a');
INSERT INTO HABILIDAD VALUES ('RELPU', 'Relaciones P�blicas');
INSERT INTO HABILIDAD VALUES ('TELEF', 'Telefonista');

CREATE TABLE CENTRO
(CodCen CHAR(4) PRIMARY KEY,
CodEmpDir int,
NomCen VARCHAR(30) NOT NULL,
DirCen VARCHAR(50) NOT NULL);

ALTER TABLE CENTRO ADD (PobCen VARCHAR(20) NOT NULL);

INSERT INTO CENTRO VALUES ('DIGE', 1, 'Direcci�n General', 'Av. Constituci�n 88', 'Murcia');
INSERT INTO CENTRO VALUES ('FAZS', 6, 'F�brica Zona Sur', 'Pol. Industrial Gral. Bastarreche', 'Cartagena');
INSERT INTO CENTRO VALUES ('OFZS', 6, 'Oficinas Zona Sur', 'Pl. Espa�a 14', 'Cartagena');

CREATE TABLE DEPARTAMENTO 
(CodDep CHAR(5) PRIMARY KEY,
CodEmpDir int,
CodDepDep CHAR(5),
foreign key (CodDepDep) references Departamento (CodDep) on delete cascade,
CodCen CHAR(4),
foreign key (CodCen) REFERENCES Centro (CodCen) ON DELETE CASCADE,
NomDep VARCHAR(40) NOT NULL,
PreAnu float NOT NULL,
TiDir enum('F', 'P') NOT NULL);

INSERT INTO DEPARTAMENTO VALUES ('DIRGE', 1, NULL,'DIGE', 'Direcci�n General', 156000, 'P');
INSERT INTO DEPARTAMENTO VALUES ('INYDI', 2, 'DIRGE', 'DIGE', 'Investigaci�n y Dise�o', 150000, 'P');
INSERT INTO DEPARTAMENTO VALUES ('JEFZS',6, 'DIRGE',NULL, 'Jefatura F�brica Zona Sur', 37200, 'F');
INSERT INTO DEPARTAMENTO VALUES ('ADMZS', 5,'JEFZS', NULL,  'Administraci�n Zona Sur', 84000, 'P');
INSERT INTO DEPARTAMENTO VALUES ('PROZS', 9, 'JEFZS', 'FAZS',  'Producci�n Zona Sur', 600000, 'P');
INSERT INTO DEPARTAMENTO VALUES ('VENZS', 3, 'ADMZS','OFZS', 'Ventas Zona Sur', 81000, 'F');

 
CREATE TABLE EMPLEADO
(CodEmp int PRIMARY KEY,
CodDep CHAR(5),
foreign key (CodDep) REFERENCES Departamento (CodDep) ON DELETE CASCADE,
ExTelEmp int,
FecInEmp DATE NOT NULL, 
FecNaEmp DATE NOT NULL,
NIFEmp CHAR(9) NOT NULL UNIQUE,
NomEmp VARCHAR (40) NOT NULL,
NumHi int DEFAULT 0 NOT NULL,
SalEmp float NOT NULL);

INSERT INTO EMPLEADO  VALUES (5, 'ADMZS', 1239,  '1976/08/07', '1958/03/08', '38223923T', 'Alada Veraz, Juana', 1, 37200); 
INSERT INTO EMPLEADO  VALUES (7, 'PROZS', NULL,  '1994/06/30', '1975/08/07', '47123132D', 'Forzado L�pez, Galeote', 0, 9600); 
INSERT INTO EMPLEADO VALUES (6, 'JEFZS', 23838, '1991/08/01', '1969/06/03', '26454122D', 'Gozque Altanero, C�ndido', 1, 30000); 
INSERT INTO EMPLEADO  VALUES (9, 'PROZS', 12124, '1987/06/10', '1968/07/19', '11312121D', 'Mando Correa, Rosa', 2, 18600); 
INSERT INTO EMPLEADO  VALUES (2, 'INYDI', 2233, '1991/06/14', '1970/06/08', '21231347K', 'Manrique Bacterio, Luc�a', 0, 27000); 
INSERT INTO EMPLEADO VALUES (8, 'PROZS', NULL,  '1994/08/15', '1976/06/15', '32132154H', 'Mascullas Alto, Elo�sa', 1, 9600); 
INSERT INTO EMPLEADO  VALUES (3, 'VENZS', 2133, '1984/06/08','1965/12/07', '23823930D', 'Monforte Cid, Rold�n', 1, 31200); 
INSERT INTO EMPLEADO  VALUES ( 10, 'PROZS', NULL,  '1993/11/02','1975/01/07', '32939393D', 'Mox Almuerta, Mario', 0, 7800); 
INSERT INTO EMPLEADO VALUES (1, 'DIRGE', 1111, '1982/07/01','1961/08/07', '21451451V', 'Saladino Manda, Augusto', 1, 43200); 
INSERT INTO EMPLEADO  VALUES (4, 'VENZS', 3838, '1990/08/09', '1970/02/21', '38293923L', 'Topaz Illan, Carlos', 0, 19200); 


ALTER TABLE CENTRO
ADD CONSTRAINT FK_Director_Centro FOREIGN KEY (CodEmpDir) REFERENCES EMPLEADO (CodEmp) ON DELETE CASCADE;

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT FK_Director_Departamento FOREIGN KEY (CodEmpDir) REFERENCES EMPLEADO (CodEmp) ON DELETE CASCADE;

CREATE TABLE HIJO 
(CodEmp int,
foreign key (CodEmp) REFERENCES EMPLEADO (CodEmp) ON DELETE CASCADE,
NumHij int,
FecNaHi DATE NOT NULL,
NomHi VARCHAR(40) NOT NULL,
PRIMARY KEY (CodEmp, NumHij));

INSERT INTO HIJO VALUES (8,1, '1994/03/14', 'Fuerte Mascullas, Anacleto');
INSERT INTO HIJO VALUES (9,1, '1988/02/28', 'Le�n Mando, Elvira');
INSERT INTO HIJO VALUES (9,2, '1990/07/18', 'Le�n Mando, Pl�cido'); 
INSERT INTO HIJO VALUES (3,1, '1990/09/12', 'Monforte Lemos, Jes�s'); 
INSERT INTO HIJO VALUES (5,1, '1982/02/06', 'Pastora Alada, Mateo'); 
INSERT INTO HIJO VALUES (1,1, '1989/06/07', 'Saladino Oropel, Flavia');

CREATE TABLE HABEMP
(CodHab CHAR (5),
foreign key (CodHab) REFERENCES HABILIDAD (CodHab) ON DELETE CASCADE,
CodEmp int,
foreign key (CodEmp) REFERENCES EMPLEADO (CodEmp) ON DELETE CASCADE,
NivHab int DEFAULT 5 NOT NULL CHECK (NivHab BETWEEN 0 AND 10),
PRIMARY KEY (CodHab, CodEmp));

INSERT INTO HABEMP VALUES ('GEREN', 1, 10);
INSERT INTO HABEMP VALUES ('RELPU', 1, 9);
INSERT INTO HABEMP VALUES ('MARKE', 3, 9);
INSERT INTO HABEMP VALUES ('MARKE', 4, 6);
INSERT INTO HABEMP VALUES ('GESCO', 5, 9);
INSERT INTO HABEMP VALUES ('RELPU', 5, 8);
INSERT INTO HABEMP VALUES ('FONTA', 8, 7);

COMMIT;




