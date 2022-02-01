create database biblioteca;
use biblioteca;

create table libros
(cod_libro int (5) auto_increment primary key,
isbn varchar (20)  not null unique,
autor varchar (50) not null,
titulo varchar (100) not null);

create table usuarios
(dni_usuario varchar (10) not null unique,
nombre_usuario varchar (30),
apellido_usuario varchar (30));

select * from usuarios;
select * from libros;

insert into libros (isbn, autor, titulo) values ( '978032150362_6' , 'Steve Freeman', 'Growing Object-Oriented Software, guided by tests') ;
insert into libros (isbn, autor, titulo) values ('978013235088_4' , 'Robert C MArtin', 'Clean Code, a handbook of Agile Software Craftmanship') ;
insert into libros (isbn, autor, titulo) values ('978020161622_4' , 'Andrew Hunt and David Thomas', 'The Pragmatic Programmer') ;
insert into libros (isbn, autor, titulo) values ('B09CRY46MZ' , 'Luis Artola', 'Software Economics') ;
insert into libros (isbn, autor, titulo) values ('978194278833_1' , 'Nicole Forsgren, Jez Humble, Gene Kim', 'Accelerate') ;
insert into libros (isbn, autor, titulo) values ('978059651838_7' , 'David H. Hoover', 'Apprenticeship Patterns') ;

select * from libros;