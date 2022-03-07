create database suministros character set utf8mb4;
use suministros;

create table proveedor
(codprov int constraint ch_codprov check (codprov > 0) primary key,
nomprov varchar (20) unique not null,
dirprov  varchar (20) not null);

create table materiaprima
(codmp int constraint ch_codmp check (codmp > 0) primary key,
nommp varchar (15) not null,
codprov int ,
constraint foreign key fk_codprov (codprov) references proveedor (codprov) on update cascade);

create table componente 
(codcomp char (4) primary key,
nomcomp char (15) not null,
stockcomp int  constraint ch_stockcomp check (stockcomp > 0) not null,
stockmin int default 5 constraint ch_stockmin check (stockmin > 0) not null);

create table composicion
(codcompsup char (4),
codcompinf char(4),
cant int,
constraint pk_composicion  primary key  (codcompsup,codcompinf),
constraint foreign key fk_codcompsup (codcompsup) references componente (codcomp) on delete cascade,
constraint foreign key fk_codcompinf (codcompinf) references componente (codcomp) on delete cascade);
create table fabricacion 
(codmp int ,
codcomp char (4),
constraint pk_fabricacion primary key  (codmp, codcomp) ,
constraint foreign key fk_codmp (codmp) references materiaprima (codmp) on delete cascade,
constraint foreign key fk_codcomp (codcomp) references componente (codcomp) on delete cascade);