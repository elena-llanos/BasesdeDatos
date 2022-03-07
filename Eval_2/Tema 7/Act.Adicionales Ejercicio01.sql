USE EMPRESA2_daw;

/*Ejercicio 01a Act. adicionales T7
Liste el NIF, nombre y complemento familiar (con dos decimales) 
de los empleados con hijos, sabiendo que el complemento familiar 
se calcula de acuerdo con la siguiente fórmula:
Complemento familiar = ((4 x Número de hijos) / 100 ) x Salario
*/
select NIFEmp, NomEmp, round (((4* NumHi)/100)  * SalEmp,2) ComFam
from empleado
where NumHi > 0 ;

/* Ejercicio 01b Act. Adicionales T7
Muestre ordenados alfabéticamente los nombres de los empleados
 del centro Fábrica Zona Sur que tienen hijos nacidos antes de 
 su contratación por la empresa.*/
 
 select distinct nomemp
 from empleado e 
 join departamento d on e.coddep = d.coddep 
 join centro c  on d.codcen = c.CodCen 
 join hijo h on e.CodEmp = h.CodEmp 
 where fecnahi < fecinemp and nomcen = 'fabrica zona sur'
 order by nomemp;
 
 /* Ejercicio 01c Act. Adicionales T7
 Muestre los nombres de los departamentos donde haya al menos un 
 trabajador cuyo salario suponga más del 25% del presupuesto del departamento.*/
 
 select NomCen
 
 /* Ejercicio 01d Act. Adicionales t7
 Muestre para los empleados que poseen habilidades con nivel superior o igual a 9, 
 el nombre del empleado, la descripción de la habilidad y el nivel./*
 
 
