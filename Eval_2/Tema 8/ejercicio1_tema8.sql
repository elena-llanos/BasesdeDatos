use empresa;
/*Indique por cada oficio que sea desempeñado por más de dos
 empleados, el nombre del oficio, el número de empleados que 
 lo desempeñan (columna NºEmpleados), la suma de sus salarios 
 (columna SumaSalarial), la suma de sus comisiones 
 (columna SumaComisiones), el salario máximo y el salario mínimo
 (columnas SalMax y SalMín). Ordene el resultado por suma 
 salarial en orden descendente.*/

select oficio, sum(emp_no) 'NºEmpleados' , round(sum(salario), 2) SumaSalarial, 
round(sum(comision),2) 'SumaComisiones' , round(max(salario),2) 'SalMAx', round(min(salario),2) 'salMin'
from emple
group by oficio
having count(oficio)>2
order by 'SumaSalarial'desc;

/*Solo consideraremos a los empleados no analistas. Pues bien, indique por cada departamento con un 
salario medio de sus empleados no analistas superior a 1200 €, el número del departamento, 
el número de empleados no analistas y su salario medio, ordenando el resultado por el número de empleados de cada departamento.*/
select d.dept_no, count(emp_no) , round(avg(salario),2)
from depart d join emple e on d.dept_no = e.dept_no 
where oficio != 'analista'
group by dept_no
having avg(salario)>1200
order by count(emp_no);








/*Indique por cada número de departamento y oficio, el número de empleados que desempeñan 
ese oficio en ese departamento, así como su salario mínimo y máximo. 
Ordene el resultado por número de departamento y oficio.*/
select dept_no, oficio , count(emp_no)'NumEmpleados', max(salario)'Salario máximo', min(salario)'Salario minimo'
from emple
group by dept_no, oficio
order by dept_no, oficio;

/*Indique para los departamentos con salario medio superior a 
1400 € su número, nombre, el salario medio 
de sus empleados y el salario máximo y mínimo.*/

select d.dept_no, d.dnombre, avg(salario), max(salario), min(salario)
from emple e join depart d on d.dept_no = e.dept_no
group by d.dept_no, d.dnombre
having avg(salario)> 1400;

/*Indique para todos los empleados que trabajan en el 
departamento de VENTAS su apellido, salario, comisión, 
apellido de su jefe (columna Jefe), salario de este 
(columna Salario Jefe) y el resultado de dividir el salario 
del jefe entre el del empleado (columna Factor Multiplicador) 
redondeado a dos decimales. */

Select es.apellido, round(es.salario,2) Salario, round(es.comision,2) Comisión, ej.apellido Jefe, round(ej.salario, 2) "Salario Jefe",
round (ej.salario / es.salario, 2) "Factor Mutiplicador"
From emple es join emple ej on es.dir=ej.emp_no join depart d on es.dept_no=d.dept_no
Where dnombre ='VENTAS';

/*Visualice el número de vendedores del departamento de VENTAS.*/

select count(emp_no) 'Vendedores'
from emple e join depart d on d.dept_no = e.dept_no
where dnombre= 'ventas';








