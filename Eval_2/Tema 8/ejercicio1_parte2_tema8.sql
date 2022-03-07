use empresa;

/*Visualice los nombres de los departamentos en los que el salario medio es mayor o igual que la media de todos los salarios.*/
select d.dnombre 
from depart d join emple e on d.dept_no = e.dept_no
group by d.dnombre
having avg(salario) >= (select  avg(salario) from emple );

/*Seleccione el apellido, oficio y localidad de los empleados que trabajan en los departamentos donde trabajan los analistas.*/

select e.apellido, e.oficio, d.loc 
from depart d join emple e on d.dept_no = e.dept_no
where  d.dept_no in (select dept_no from depart where oficio = 'analista');

/*Muestre el apellido, oficio, salario y fecha de alta de los empleados que desempeñen el mismo
 oficio que JIMÉNEZ o que tengan un salario mayor o igual que el de ARROYO.*/
 
 select apellido, oficio, fecha_alt 
 from emple 
 where oficio = (select oficio from emple where apellido = 'Jimenez') or salario >= (select salario from emple where apellido = 'arroyo');
 
 /*Muestre los apellidos y oficios de los empleados que tienen el mismo oficio que JIMÉNEZ, excluido este.*/
 
 select apellido, oficio
 from emple
 where oficio = (select oficio from emple where apellido = 'jimenez')
 and apellido != 'jimenez';
 
 /*Obtenga los nombres de los departamentos en los que trabajen más de dos empleados
 mediante una consulta de resumen con combinación de tablas y mediante una consulta con subconsulta.*/
 
 select d.dnombre , count(emp_no) 'Num empleados'
 from depart d join emple e on d.dept_no = e.Dept_no
 group by d.dnombre
 having count(emp_no) > 2;
 
 select dnombre
 from depart
 where dept_no in (select dept_no from emple group by dept_no having count( emp_no) > 2);
 
 /*Cree una nueva tabla llamada Vendedores con el número, apellido y
 salario de los empleados con tal oficio y el nombre del departamento en el que trabajan y la localidad.*/
 
 create table vendedores
  as select e.emp_no, e.apellido , e.salario , d.dnombre ,d.loc from emple e join depart d on e.dept_no = d.dept_no where oficio = 'vendedor' ;
 
 select * from vendedores;
 
 /*Cree una nueva tabla llamada DeparEmple que almacene por cada departamento su número, nombre y localidad, así como el número de empleados 
 que trabajan en él y su salario medio redondeado a dos decimales. A estos dos últimos datos nómbrelos NEmp y SalMedio respectivamente. */
 
 
 create table deparemple
 as select d.dept_no, dnombre, loc , count(apellido)'NEmp' , round(avg(salario),2) 'SalMedio'
	from  depart d join emple e on d.dept_no = e.dept_no
	group by  d.dept_no, dnombre, loc ;
 
 /*Muestre para los empleados con mayor salario de su departamento, el apellido del empleado, 
 su salario y el nombre del departamento en el que trabajan.*/
 
 select e.apellido, round(salario,2), d.dnombre 
 from  depart d join emple e on d.dept_no = e.dept_no
 where salario = (select max(salario) from emple where dept_no = e.dept_no);
 
 
 
 /*Muestre para todos los departamentos y oficios con más de dos empleados que desempeñen ese 
 oficio en ese departamento, el nombre del departamento, el oficio y el número de empleados que desempeñan 
 dicho oficio en dicho departamento. Ordene el resultado por número de empleados de mayor a menor. */

select d.dnombre, e.oficio, count(apellido)
from    depart d join emple e on d.dept_no = e.dept_no
group by d.dnombre, e.oficio
having count(apellido) > 2
order by count(apellido) desc;
 
 
 