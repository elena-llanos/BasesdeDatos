use empresa2;
/*Muestre por cada centro de trabajo, su nombre y dirección, así como el número de
 departamentos en que se divide y el presupuesto máximo y mínimo de sus departamentos.*/
 
 select c.NomCen, c.DirCen, count(CodDep) 'Num departamentos' , max(PreAnu) 'PresMax', min(PreAnu) 'PresMin'
 from centro c join departamento d on c.CodCen = d.CodCen
 group by c.NomCen;
 
 /*Muestre por cada habilidad su código y descripción, el número de empleados que la poseen y el nivel medio de dicha habilidad.*/
 
 select ha.CodHab, ha.DesHab , count(NomEmp) 'Num empleados', avg(NivHab)'Nivel medio'
 from empleado e join habemp he on e.CodEmp = he.CodEmp join habilidad ha on he.CodHab = ha.CodHab
 group by ha.CodHab, ha.DesHab ;