/*Muestre por cada empleado su código, nombre, salario y el
 nombre del departamento en el que trabaja.*/
 
 select e.CodEmp, e.NomEmp, e.SalEmp, d.NomDep
 from departamento d join empleado e on d.CodDep=e.CodDep;
 
 /*Muestre por cada departamento su código, nombre y el
 nombre del empleado que lo dirige.*/
 
 select d.CodDep, d.NomDep, e.NomEmp
 from departamento d join empleado e on d.CodEmpDir = e.CodEmp;


/*Muestre por cada empleado su nombre y por cada una de las
 habilidades que posee, el código de la habilidad, la descripción 
 de la habilidad y el nivel correspondiente.*/
 select e.NomEmp, ha.CodHab, ha.DesHab, h.NivHab
 from empleado e join habemp h on e.CodEmp = h.CodEmp join habilidad ha on h.CodHab = ha.CodHab;
 
 /*Muestre el nombre y salario de todos los empleados con 
 salario superior a 30000 €, así como el porcentaje que
 supone su salario sobre el presupuesto de su departamento. 
 Redondee el resultado de esta última operación a 2 decimales. */
 
 select e.NomEmp, e.SalEmp , round((SalEmp/PreAnu) *100, 2) 'PorcenSalario'
  from departamento d join empleado e on d.CodDep=e.CodDep
  where SalEmp > 30000;
  
  /*Muestre por cada empleado nacido después de 1969 su nombre,
  extensión telefónica, fecha de nacimiento, 
  nombre del departamento en el que trabaja y 
  nombre del centro en el que este está ubicado. 
  Ordene el resultado por edad de los empleados del más joven 
  al de mayor edad.*/
  
  select e.ExTelEmp, e.FecNaEmp, d.NomDep, c.NomCen
  from empleado e join departamento d on e.CodDep = d.CodDep join centro c on d.CodCen = c.CodCen
  where year (FecNaEmp) > 1969
  order by FecNaEmp	;
  
  /* Muestre los nombres y salarios de los empleados 
  que tienen hijos nacidos   después del año 1990.*/
  
  select e.NomEmp, e.SalEmp
  from empleado e join hijo h on e.CodEmp = h.CodEmp
  where year(FecNaHi) > 1990;
  
  /* Muestre para todos los centros de trabajo, su nombre y 
  dirección, así como el nombre del empleado que lo dirige, 
  su extensión telefónica y su salario. Ordene el resultado 
  por nombre de centro.*/
  
  select c.NomCen, c.DirCen, e.NomEmp, e.ExTelEmp, e.SalEmp
  from empleado e join centro c on e.CodEmp = c.CodEmpDir
  order by NomCen;
  /*Muestre para el departamento que no depende de ningún otro 
  departamento, su nombre, presupuesto, el nombre del centro en 
  el que está ubicado, así como su dirección y el nombre del 
  empleado que dirige dicho departamento.*/
  
  select d.NomDep, d.PreAnu, c.NomCen, c.DirCen,e.NomEmp
  from departamento d join centro c on d.CodCen = c.CodCen join empleado e on c.CodEmpDir = e.CodEmp
  where CodDepDep is null;
  
  
  
  
  
  
  
  
  
 
 
 
 
 
 
 
 
 
 
 