create database multas CHARACTER SET utf8mb4;
use multas;

create table vehiculos
(matricula char (7) primary key,
marcaModelo varchar (15) not null,
impuesto float default 50 not null constraint ch_impuesto check (impuesto >= 10));

create table guardias
(codigo int  primary key,
codigoJefe int ,
nomApe varchar (30) not null);

create table recetas
(Nmulta int auto_increment primary key,
codigo int  not null,
matricula char(7) not null,
fecha datetime default current_timestamp not null,
lugar varchar(30) not null,
descri varchar(50) not null,
importe float not null constraint ch_importe check (importe between 15 and 600),
pagada enum ('si' , 'no') not null,
constraint foreign key fk_codigo  (codigo) references guardias (codigo));
