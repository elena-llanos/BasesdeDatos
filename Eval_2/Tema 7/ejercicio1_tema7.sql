use empresa;
/*Muestre todos los datos de los empleados
 del departamento nº 10 ordenados por apellido de la A a la Z.*/
 select * from emple 
 where dept_no = 10
 order by apellido asc;
 /*Visualice el apellido, fecha de alta y salario de los 
 empleados  del departamento nº 20 cuyo oficio sea analista.*/
 
 select apellido, fecha_alt, salario from emple
 where dept_no = 20 and oficio = 'analista';
 
 /*Muestre el número y nombre de todos los departamentos.*/
 select dept_no, dnombre from depart;
 /*Seleccione el número, apellido y oficio de todos los empleados 
 cuyo apellido comience por la letra J.*/
 select emp_no, apellido, oficio from emple
 where apellido like 'J%';
 
 /*Seleccione todos los datos de los empleados cuyo apellido contenga 
 la letra E en la segunda posición.*/
 
 select * from emple
 where apellido like '_e%';
 
 /*Muestre los apellidos y oficios de los empleados cuyo oficio 
 sea VENDEDOR, ANALISTA o EMPLEADO, 
 ordenando el resultado por apellido.*/
 select apellido, oficio from emple
 where oficio in ('Vendedor' , 'analista' , 'empleado')
 order by apellido;
 
 /*Visualice todos los datos de los empleados que cobran más de 
 2000 € de salario o más de 300 € de comisión. */
 select * from emple
 where salario > 2000 or comision > 300;
/*Visualice todos los datos de los empleados que cobran más de 2000 € de salario
 y más de 300 € de comisión.  */
  select * from emple
 where salario > 2000 and comision > 300;
 
 /*Indique para todos los empleados que cobren más de 2000 € 
 su apellido, salario, oficio y comisión, así como el nombre 
 y la localidad del departamento en el que trabaja.*/
 
 select e.apellido, e.salario, e.oficio, e.comision , d.loc, d.dnombre
 from emple e join depart d on d.dept_no = e.dept_no
 where salario > 2000;
 
 /*Indique para todos los empleados que cobran comisión su 
 apellido, el nombre del departamento en el que trabajan, 
 la comisión que cobran, su salario y el porcentaje que supone 
 la comisión con respecto al salario (PorcenComisión). 
 Redondee este último dato a 2 decimales, para lo que puede
 hacer uso de la función round, que recibe como primer 
 parámetro el número que se desea redondear y como segundo 
 el número de decimales que se desean en el resultado.*/
 select e.apellido, d.dnombre, e.salario,
 round(salario/comision*100,  2  )   'PorcenComision'
 from emple e join depart d on d.dept_no = e.dept_no
 where comision > 0;
 
 /*Indique para el empleado que no tiene jefe o director 
 su apellido, oficio,
 nombre del departamento y localidad en la que trabaja.*/
 
 select e.apellido, e.oficio, d.dnombre, d.loc
 from emple e join depart d on d.dept_no = e.dept_no
 where dir is null;
 
 /*Añada un nuevo departamento a la tabla Depart, con código 40, nombre PRODUCCCIÓN y ubicado en BILBAO. Para ello emplee la siguiente orden:
INSERT INTO DEPART VALUES (40, 'PRODUCCIÓN', 'BILBAO');*/

insert into depart values (40, 'produccion' , 'bilbao');

 /*Muestre a continuación para los departamentos con número
 superior o igual a 30, su nombre y localidad y, en caso de que
 trabaje en él algún empleado,
 su apellido, salario y comisión.*/
 
 select d.dnombre, d.loc , e.apellido, e.salario, e.comision
 from depart d left outer join  emple e  on d.dept_no = e.dept_no
 where d.dept_no >= 30;
 
 
 
 
 
 
 
 
 
 
 