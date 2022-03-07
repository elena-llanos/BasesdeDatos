/*-----------------ACTIVIDADES TEMA 9------------------------------------------*/
/*------------------Ejercicio 1 -----------------------------------------------*/
SET SQL_SAFE_UPDATES = 0;
use empresa;
/*a)--Cree una tabla llamada Depart2 con el contenido de la tabla Depart, y otra llamada 
Emple2 con el contenido de la tabla Emple.*/
create table Depart2
(dept_no int primary key,
dnombre varchar (40),
loc varchar (40));
insert into Depart2
select dept_no, dnombre, loc from depart ;
select * from depart2;

create table Emple2
(emp_no int primary key,
apellido varchar (40),
oficio enum('EMPLEADO','VENDEDOR','DIRECTOR','ANALISTA','PROGRAMADOR','PRESIDENTE'),
 dir int,
 fecha_alt date,
 salario float,
 comision float,
 dept_no int,
 constraint fk_dept_no foreign key (dept_no) references Depart2 (dept_no));
 
 insert into Emple2
 select emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no from emple;
 select * from emple2;


/*b) -- Añada un nuevo departamento a la tabla Depart2 con código 50, nombre RRHH y ubicado en Burgos.*/

insert into depart2 values (50, 'RRHH', 'Burgos');
select * from depart2;

/*c)--Añada un empleado nuevo a la tabla Emple2 con número 4488, 
apellidado Gómez, oficio director, dado de alta el 23 de febrero de 2014, 
con salario 1800 €, comisión 0 € y número de departamento el 20.*/

insert into emple2 values ('4488', 'Gomez', 'Director', null, '2014-02-23', '1800', '0', '20'); 

/*-d)--Divida por 2 la comisión a todos los empleados de la tabla Emple2 que la cobran.*/

update emple2
set comision = comision / 2
where comision > 0;

/*e)--Asigne el departamento 10 a todos los directores de la tabla Emple2.*/

update emple2
set dept_no = 10
where oficio = 'Director';

/*f)--Elimine de la tabla Emple2 a los empleados con fecha de alta en el año 2016.*/

delete from emple2
where year (fecha_alt) = '2016';
 select * from emple2;

/*g)--Elimine de la tabla Depart2 los departamentos que no tengan empleados.*/

delete from depart2
where emp_no not in (select dept_no from depart2);

/*h)--Multiplique por 2 la comisión a todos los empleados del 
departamento de Ventas con una comisión inferior a 300 €.*/

update emple2
set comision = comision * 2
where dept_no = (select dept_no from depart2 where dnombre = 'Ventas') 
and comision < 300;


/*i)--El departamento de Contabilidad se va a trasladar a Málaga.
 Refleje esta modificación en la base de datos.*/
 
 update  depart2
 set loc = 'Malaga'
 where dnombre = 'contabilidad' ;
 
 /* j)--Añada un nuevo empleado a la tabla Emple2 con número 4000, 
 apellido BAUTE, fecha de alta, la del día de hoy, salario
 el mismo que el de AGUIRRE más el 15%, siendo el resto de los 
 datos los mismos que los de AGUIRRE*/
 
 insert into emple2 
 set emp_no = 4800, apellido = 'gomez', oficio = null,  dir = null, fecha_alt = current_date(), 
 salario = (salario = 'Aguirre' + 15*10/100),
 comision = (comision = 'Aguirre'), dept_no = (dept_no = 'Aguirre');


/*k)--Aumente un 2,5% el salario y disminuya un 1% la comisión a 
todos los empleados de la tabla Emple2 que trabajen el departamento de VENTAS.*/
update emple2
set salario = (salario + 2.5*10/100) and comision = (comision - 1*10/100)
where dnombre = (select dnombre from depart2 where dnombre = 'Ventas');



/*------------------Ejercicio 2 -----------------------------------------------*/

/*--a)Cree la tabla EmpDep (CodEmp, NomDep, NomEmp, SalEmp) cuyas columnas tienen el mismo 
tipo y tamaño que las homónimas de otras tablas existentes en la base de datos. 
Inserte en dicha tabla el código, nombre y salario de los empleados 
que trabajen en  centros ubicados en Murcia, así como el nombre del departamento en el que trabajan.*/
use empresa2_daw;

create table empdep
(select codEmp, nomDep, nomEmp, salEmp 
from empleado e 
join departamento d on e.codemp = d.codempdir
join centro c on d.CodCen = c.CodCen where PobCen = 'Murcia' );



/*--b)Incremente en la tabla EmpDep en un 8 % el sueldo de los empleados que trabajen en el departamento
 llamado Dirección General.*/
 
 update empdep 
 set salEmp = salEmp * (8*10/100)
 where nomDep = 'Direccion General';
 
 /*c)--Inserte en la tabla EmpDep un empleado con código 99, departamento Ventas Zona Sur,
 nombre  Pérez Ruiz, María y salario 15000 €.*/
 insert into empDep values (99, 'Ventas Zona Sur','Pérez Ruiz, María', 1500);
 
 /*d)--Borre de la tabla EmpDep a los empleados que cobren más de 20000 € y que 
 trabajen en el departamento con código INYDI.*/
 
 delete empDep
 from empDep e 
 join departamento d on e.nomDep = d.nomDep
 where salEmp > 2000
 and codDep = 'INYDI';
 
 /*e)--Asigne en la tabla EmpDep al empleado que trabaja en el departamento
 con código DIRGE, el salario máximo 
 de los empleados de la tabla Empleado que trabajan en el departamento con código VENZS.*/
 
 update empdep
 set salEmp = (select max(salEmp) from empleado where CodDep = 'VENZS');
 

/*----------------------ACTIVIDADES ADICIONALES--------------------------*/

/*--1 -Inserte una nueva habilidad en la base de datos con código OFIMA y 
descripción Ofimática. Asigne dicha habilidad a los empleados con códigos 1 y 2,
 asignándoles un 5 y un 8 como nivel de habilidad respectivamente.*/
 
 insert into habilidad values ('OFIMA', 'Ofimática')
 set CodHab = (
 
 
 /*--2--Incremente en un 5% el salario de los empleados que trabajen en 
 departamentos de la zona Sur. Tenga en cuenta que los departamentos de 
 la zona Sur son aquellos en cuyo nombre aparece ‘Zona Sur’. */
 
 /*--3--Asigne a los departamentos que no tienen asignado centro, 
 el único centro que está ubicado en Murcia.*/
 
 /*--4--Decremente en un 2,5% el salario a los empleados que trabajen en el
 departamento que no depende de ningún otro departamento:*/
 
 /* 5--A todos los empleados del departamento Ventas Zona Sur se les ha asignado 
 el departamento Producción Zona Sur. Refleje esta modificación en la base de datos.*/
 
 /* 6--Los empleados que trabajan en el departamento con código PROZS han 
 incrementado su nivel en la habilidad con descripción Márketing en 1 punto.
 Refleje esta modificación en la base de datos. */
 
 /* 7--Elimine todas las filas de la tabla HabEmp que hagan referencia 
 a la habilidad con descripción Ofimática. A continuación modifique la 
 descripción de esta habilidad, de manera que su nueva descripción sea Oficina informática.*/
 
 /* 8--El nuevo director del centro Oficinas Zona Sur va a ser la empleada directora del departamento 
 Producción Zona Sur. Refleje esta modificación en la base de datos.*/
 
 /*9--La empleada Juana Alada Veraz, con el código de empleado nº 5 acaba de tener su 
 segundo hijo, que en este caso es una niña. Se llama ‘Pastora Alada, Valentina’ y su 
 fecha de nacimiento es el 13 de febrero de 2016. Añada los datos de la hija de esta 
 empleada en la tabla Hijo. Además, incremente en una unidad el número de hijos de 
 Juana en la tabla Empleado.*/


