/*------------*parte 1    -------------------------------------------------*/
/*------------*ejercicio 1 con empresa   -------------------------------------------------*/

/*a--Indique por cada oficio que sea desempeñado por más de dos empleados, 
el nombre del oficio, el número de empleados que lo desempeñan (columna NºEmpleados), 
la suma de sus salarios (columna SumaSalarial), la suma de sus comisiones (columna SumaComisiones),
 el salario máximo y el salario mínimo (columnas SalMax y SalMín). 
 Ordene el resultado por suma salarial en orden descendente.*/
 
 
select oficio, count(apellido) NºEmpleados, sum(salario) SumaSalarial, sum(comision) SumaComisiones, max(salario) salmax, min(salario) salmin 
from emple group by oficio having count(apellido) > 2 order by sum(salario) desc
 


/* b)--Solo consideraremos a los empleados no analistas. Pues bien, indique por cada departamento 
con un salario medio de sus empleados no analistas superior a 1200 €, el número del departamento, 
el número de empleados no analistas y su salario medio, ordenando el resultado 
por el número de empleados de cada departamento. 
Lo dificil es ver la agrupacion por que hay que hacerla, en este caso es por departamento */

select dept_no, count(emp_no) 'nº de empleados', round(avg(salario),2) 'salariomedio' 
from emple where oficio != 'analista' group by dept_no having avg(salario) >1200 order by count(emp_no);

/*c)--Indique por cada número de departamento y oficio, el número de empleados 
que desempeñan ese oficio en ese departamento, 
así como su salario mínimo y máximo. Ordene el resultado por número de departamento y oficio. */

select dept_no, oficio, count(emp_no) 'nº de empleados', 
min(salario) 'salario mínimo' ,  max(salario) ' salario máximo'
from  emple 
group by dept_no, oficio
order by dept_no , oficio;

use empresa;

/*d)--Indique para los departamentos con salario medio superior a 1400 € 
su número, nombre, el salario medio de sus empleados y el salario máximo y mínimo.*/

select d.dept_no, d.dnombre, avg(salario) 'Salario medio', min(salario) 'Salario mínimo', max(salario) 'Salario máximo'
from depart D join emple E 
on  d.dept_no = e.dept_no
group by d.dept_no, d.dnombre
having avg(salario)> 1400;

/* e) --Indique para todos los empleados que trabajan en el departamento de VENTAS 
su apellido, salario, comisión, apellido de su jefe (columna Jefe), 
salario de este (columna Salario Jefe) y el resultado de dividir el 
salario del jefe entre el del empleado (columna Factor Multiplicador) redondeado a dos decimales. */

select e.apellido, e.salario, e.comision, dir.apellido 'Jefe', dir.salario 'salario jefe',
round((dir.salario/e.salario),2) 
from emple E 
join depart D on e.dept_no = d.dept_no 
join emple DIR on E.dir = dir.emp_no
where dnombre = 'Ventas'; 

/* f)-- Visualice el número de vendedores del departamento de VENTAS.*/

select  count(emp_no) as vendedores
from emple e
join depart d on e.dept_no = d.dept_no 
where oficio = 'Vendedor' and dnombre = 'Ventas';

/*------------*ejercicio  2 con empresa 2  -------------------------------------------------*/

/* a) --Muestre por cada centro de trabajo, su nombre y dirección, 
así como el número de departamentos en que se divide y el 
presupuesto máximo y mínimo de sus departamentos.*/
select c.NomCen, c.DirCen, count(d.CodDep) 'Numero departamentos' , max(PreAnu) 'Presu Max', min(PreAnu) 'Presu Min'
from centro c
join departamento d on c.CodCen = d.CodCen
group by c.NomCen, c.DirCen

/*b) --Muestre por cada habilidad su código y descripción, 
el número de empleados que la poseen y el nivel medio de dicha habilidad.*/

select h.CodHab, h.DesHab, count(he.CodEmp) 'numero empleados', avg(NivHab) 'Nivel habilidad' 
from habilidad h
join habemp he on he.CodHab = h.CodHab
group by h.CodHab, h.DesHab

/*--------------ejercicio 3 con geografia  -------------------------------------------------*/

use geografia;
/* a) --Obtenga los nombres de las comunidades autónomas formadas por una sola provincia.*/

select c.nombre 
from comunidades c
join provincias p on p.id_comunidad = c.id_comunidad
group by c.nombre
having count(n_provincia) = 1;
 
 /*b)--Muestre por cada provincia, su nombre, su superficie, su población 
 y su densidad poblacional redondeada a 2 decimales (columna Densidad poblacional). 
 Este último dato se calcula dividiendo la población de la provincia entre su superficie. 
 Ordene los datos por provincias desde la menos densamente poblada hasta la más densamente poblada.*/
 
 select p.nombre, p.superficie, sum(l.poblacion)'poblacion', 
 round(sum(l.poblacion/p.superficie),2) 'Densidad'
 from provincias p join localidades l
 on p.n_provincia = l.n_provincia
 group by p.nombre, p.superficie
 order by sum(l.poblacion)/p.superficie
 
 /* ------------------ACTIVIDADES ADICIONALES------------------------------------
----ejercicio 1 Para las tablas Emple y Depart cree las siguientes consultas:*/

/*a) Indique por cada departamento su nombre y localidad, así como el número de empleados
 que trabajan en él y el salario medio redondeado a dos decimales,  */

use empresa;
select  d.dnombre, d.loc, count(e.emp_no) 'Numero empleados', round(avg(salario),2)'Salario Medio'
from depart d join emple e
on d.dept_no = e.dept_no
group by  d.dnombre, d.loc
order by avg(salario);
 
 /*b)--Indique por cada departamento y oficio, el nombre del departamento y el oficio, 
 el salario medio y la comisión media. Ordene el resultado por salario medio de mayor a menor.*/
 
select d.dnombre, e.oficio, avg(salario)'Salario medio', avg(comision) 'Comision media'
 from depart d join emple e
 on d.dept_no = e.dept_no
 group by d.dnombre, e.oficio
 order by avg(salario) desc;
 
 /*c)--Visualice por cada oficio de los empleados del departamento de VENTAS, el nombre del oficio
 y  la suma de salarios de los empleados con dicho oficio*/
 
 select e.oficio, count(e.oficio)'Ventas', sum(salario) 
 from depart d join emple e 
 on d.dept_no = e.dept_no
 group by e.oficio;

 /*d)--Visualice el número de empleados de cada departamento cuyo oficio sea 
 EMPLEADO, indicando el nombre del departamento y el número de empleados. */
 select d.dept_no,d.dnombre, count(emp_no)'Empleado'
 from depart d join emple e 
 on d.dept_no = e.dept_no
 where oficio = 'empleado'
 group by d.dept_no, d.dnombre;
 
 /* e) --Muestre el apellido, oficio y salario de los empleados del departamento 
 de ARROYO y que tengan un salario mayor que el de ARROYO.*/
select apellido, oficio, salario
from emple
where dept_no = (select dept_no from emple where apellido = 'ARROYO')
and salario > (select salario from emple where apellido = 'ARROYO');
 
 /*f)Muestre para todos los departamentos su nombre y localidad y 
 además el número de empleados que trabajan en él. 
 Si en un departamento no trabaja ningún empleado, deberá ponerse un 0 en el número de empleados.*/
 
 select d.dnombre, d.loc, count(e.emp_no) 'Numero empleados'
 from depart d left join emple e on d.dept_no = e.dept_no
 group by d.dept_no;
 select * from depart;
 
 /* Ejercicio 2--------------------------------------------------------*/
 
 /*a) Muestre por cada departamento de la empresa con más de dos empleados, 
 el nombre del departamento, el nombre del centro al que pertenece, 
 su número de empleados y el salario medio de sus empleados 
 con dos decimales. Ordene el resultado por número de empleados de cada departamento de mayor a menor. */
 
 use empresa2_daw;
 
 select d.NomDep, c.NomCen, count(NomEmp)'Num Empleados', avg(SalEmp) 'Salario medio'
 from departamento d join centro c on d.codCen = c.codCen
 
 /* -------------------Parte 2 con empresa---------------------------------------*/
 /*Ejercicio 1*-------------------------------------------------------------------*/
 use empresa;
 /*Para las tablas Emple y Depart cree las siguientes consultas:
 /*a)  --Visualice los nombres de los departamentos en los que 
 el salario medio es mayor o igual que la media de todos los salarios.*/
 
 select d.dnombre
from depart d join emple e on e.dept_no = d.dept_no
group by d.dnombre
having avg(E.salario) >= (select avg(salario) from emple);

/*b) -- Seleccione el apellido, oficio y localidad de los empleados 
que trabajan en los departamentos donde trabajan los analistas.*/
select e.apellido, e.oficio, d.loc 
from emple e join depart d on d.dept_no = d.dept_no 
where d.dept_no in (select dept_no from emple where oficio = 'ANALISTA');


/*c)--Muestre el apellido, oficio, salario y fecha de alta de los empleados que
 desempeñen el mismo oficio que JIMÉNEZ o que tengan un salario mayor o igual que el de ARROYO.*/
 
 select apellido, oficio, salario, fecha_alt
 from emple 
 where oficio = (select oficio from emple where apellido = 'JIMÉNEZ') 
or salario >= (select salario from emple where apellido = 'ARROYO');

/* d)-- Muestre los apellidos y oficios de los empleados que tienen el mismo 
oficio que JIMÉNEZ, excluido este.*/

select apellido, oficio
from emple
where oficio = (select oficio from emple where apellido = 'JIMENEZ' )
and apellido != 'JIMÉNEZ';
 
 /*e) Obtenga los nombres de los departamentos en los que trabajen más de dos empleados
mediante una consulta de resumen con combinación de tablas y mediante una consulta
con subconsulta.*/
select dnombre
from depart d join emple e on e.dept_no = d.dept_no
group by dnombre
having count(e.emp_no) > 2;

select dnombre
from depart 
where dept_no in (select dept_no from emple group by dept_no having count(emp_no) > 2);

/*f) Cree una nueva tabla llamada Vendedores con el número, apellido y salario de los
empleados con tal oficio y el nombre del departamento en el que trabajan y la
localidad.*/
create table Vendedores as select e.emp_no, e.apellido, e.salario, d.dnombre, d.loc
from emple e join depart d on e.dept_no = d.dept_no
where e.oficio = 'VENDEDOR';

select * from Vendedores;

/*g) Cree una nueva tabla llamada DeparEmple que almacene por cada departamento su
número, nombre y localidad, así como el número de empleados que trabajan en él y su
salario medio redondeado a dos decimales. A estos dos últimos datos nómbrelos NEmp
y SalMedio respectivamente.*/
create table DepartEmple as select d.dept_no, d.dnombre, d.loc, count(E.emp_no) 'NEmp', 
round(avg(E.salario), 2) 'SalMedio' 
from emple e join depart d on e.dept_no = d.dept_no
group by d.dept_no, d.dnombre, d.loc;

select * from DepartEmple;

/*h) Muestre para los empleados con mayor salario de su departamento, el apellido del
empleado, su salario y el nombre del departamento en el que trabajan.*/
select d.dnombre, e.apellido, e.salario
from emple e join depart d on e.dept_no = d.dept_no
where e.salario in (select max(salario) from emple group by dept_no);

/*i) Muestre para todos los departamentos y oficios con más de dos empleados que
desempeñen ese oficio en ese departamento, el nombre del departamento, el oficio y el
número de empleados que desempeñan dicho oficio en dicho departamento. Ordene el
resultado por número de empleados de mayor a menor.*/
select d.dnombre, e.oficio, count(E.emp_no) 'Nº Empleados'
from emple e join depart d on e.dept_no = d.dept_no
group by e.oficio, d.dnombre 
having count(e.emp_no) >= 2
order by count(e.emp_no) desc;

 /*Ejercicio 2 -------------------------------------------------------------------*/
 
 /*a) -- Para todos los departamentos con un presupuesto superior a la media, 
 muestre el código del departamento,  su nombre, su presupuesto, 
 su tipo de director y el nombre de su director.*/
 
 use empresa2_daw;
 select d.CodDep, d.NomDep, d.PreAnu, d.TiDir, e.NomEmp
 from empleado e join departamento d on d.CodEmpDir = e.CodEmp
 where PreAnu > (select avg(PreAnu) from departamento);
 
 /*b)--Para todos los empleados que cobren más que el salario 
 medio de todos los empleados, muestre el nombre del empleado, 
 su salario, su extensión telefónica, el  nombre del departamento 
 en el que trabaja y el nombre del centro en el que está ubicado su departamento.*/
 
 select e.NomEmp, e.SalEmp, e.ExTelEmp, d.CodDep, d.CodCen
  from empleado e join departamento d on d.CodDep = e.CodDep
  where SalEmp > (select avg(SalEmp) from empleado);
  
  /*d)Obtenga la descripción de la habilidad con nivel más alto mediante
  una consulta con una subconsulta y mediante una consulta con dos subconsultas anidadas.*/
  
  
  
  /*Ejercicio 3--------------------------------------------------------------------------------*/
  
  /*a)Obtenga el nombre y número de habitantes de las localidades que 
  tienen más población que la ciudad de Vitoria.*/
  select l.nombre, p.nombre,l.poblacion
  from localidades l join provincias p on l.n_provincia = p.n_provincia
  where poblacion > (select 
  
  /*b)Indique para las localidades con más población que toda la provincia de Álava, 
  el nombre de la localidad, el nombre de la provincia a la que pertenece y 
  la población de la localidad, ordenando el resultado por población de la ciudad 
  más poblada a la menos poblada.
  (NOTA. La población de una provincia se calcula sumando la población de todas sus localidades).*/
  
  /*Ejercicio 4-------------------------------------------------------------------------------------------*/
  
  /*a)Obtenga los DNIs y nombres de todos los alumnos acerca de los cuales disponemos de datos, es decir, de todos 
  los que aparecen en cualquiera de las tres tablas, sin que aparezcan filas repetidas en el resultado.*/
  use alumnado;
  
  select DNI, NOMBRE
  from alumnos 
  union select DNI, NOMBRE from antiguos
  union select DNI, NOMBRE from nuevos;
  
  /*b)Obtenga los DNIs y nombres de todos los alumnos que aparecen simultáneamente en las tres tablas. */
  select a.DNI, a.nombre
  from alumnos a join antiguos an on 
  where 
  
  
  /*c)Obtenga de dos maneras diferentes los DNIs y nombres de todos los alumnos matriculados este curso, 
  pero que no se matricularon en cursos pasados ni están matriculados para el próximo curso. */
  
  select dni, nombre
  from alumnos 
  where dni not in (select dni from antiguos) and dni not in (select dni from nuevos);
  
  
  select dni, nombre
  from alumnos
  where dni not in (select dni from antiguos union select dni from nuevos);