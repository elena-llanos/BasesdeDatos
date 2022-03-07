use carreras;

/*1 Indicar la sentencia SQL necesaria que  muestre, para los atletas procedentes de GETXO, las carreras en las que ha 
participado, indicándose nombre y apellidos del corredor, descripción de la carrera y puesto conseguido en cada una de ellas. */

select a.nombre, a.apellidos, c.descripcion, r.puesto, count(c.Cod_carrera) 'Num Carreras'
from carreras c join resultados r on c.Cod_carrera = r.Cod_Carrera join atletas a on Cod_Atleta = a.DNI
where ciudad = 'getxo'
group by a.nombre, a.apellidos, c.descripcion, r.puesto;


/*2 Obtener el número de carreras en las que ha participado cada atleta. Se debe indicar el DNI del atleta y el número de participaciones. 
Solo aparecerán aquellos atletas que hayan participado en alguna carrera. Se deberá ordenar el resultado por número de participaciones, 
apareciendo en primer lugar los atletas con mayor número de participaciones.*/
select a.DNI, count(Cod_carrera) 'Participaciones'
from atletas a join resultados r on a.DNI = r.Cod_Atleta
group by a.DNI
having count(Cod_Carrera) > 0
order by count(Cod_Carrera) desc;


/*3 Indicar la sentencia SQL necesaria que  muestre, para los atletas que hayan participado en 2 o más carreras,
el número de carreras en las que ha participado, indicándose el nombre y apellidos del atleta. Se debe ordenar 
el resultado por número de participaciones y por apellidos del atleta.*/

select Nombre, Apellidos , count(Cod_Carrera) 'Num Carreras'
from atletas a join resultados r on a.DNI = r.Cod_Atleta
group by a.DNI
having count(Cod_Carrera) > 2
order by  count(Cod_Carrera) and Apellidos;

/*4 Indicar la sentencia SQL necesaria que  muestre una lista de todos aquellos atletas que han conseguido 
algún podio en alguna carrera. Se debe indicar, para cada uno de ellos, el DNI, Nombre, Apellidos y el número de podios conseguidos.*/

select DNI, Apellidos, Nombre ,count(Puesto) 'Num podios'
from  atletas a join resultados r on a.DNI = r.Cod_Atleta
where puesto = 1 or puesto = 2 or puesto = 3
group by DNI, Apellidos, Nombre;
 


/*5 Obtener el DNI de aquellos atletas que han accedido al podio en alguna carrera,es decir, se han clasificado alguna 
vez entre los 3 primeros. No deberán aparecer duplicados.*/

select distinct DNI
from  atletas a join resultados r on a.DNI = r.Cod_Atleta
where puesto = 1 or puesto = 2 or puesto = 3;


/*6 Obtener un listado de las procedencias de los atletas, indicando la ciudad y el número de atletas procedentes 
de cada una de ellas. Se debe ordenar alfabéticamente en orden descendente por nombre de ciudad/país.
El listado deberá mostrar información en el siguiente formato:
 
 */
 
 select concat('Hay ' ,  count(Cod_Atleta), '  Atletas procedentes de  ', Ciudad) as 'Procedencia de los atletas' 
 from  atletas a join resultados r on a.DNI = r.Cod_Atleta
 group by Ciudad
 order by Ciudad;
 
 
/*7¿En cuántas carreras ha participado el ganador de la Kosta Trail 2019? */
select Cod_Atleta, count(Descripcion) 'Carreras'
from carreras c join resultados r on c.Cod_carrera = r.Cod_Carrera 
where puesto = 1
group by Cod_Atleta
having count(Descripcion) = 'Kosta Trail 2019';

/*8 Por error, el número de dorsal del ganador de la Kosta Trail 2019 figura mal en la base de datos y 
se desea corregir, siendo 675 el número correcto de dorsal. 
Indicar la sentencia SQL necesaria para realizar la corrección.*/
update  resultados 
set dorsal = 675
where puesto = 1 and 
Cod_Carrera = (select Cod_Carrera from carreras where UPPER(descripcion) = 'Kosta Trail 2019');

/*9 Se desea añadir un nuevo atleta a la base de datos con los siguientes datos:

DNI: 12345678G
Nombre: John
Apellidos: Houston Williams
Ciudad: la misma que el ganador de la Bilbao Night Marathon*/
/*
insert into atletas 
select distinct  '12345678G', 'john', 'houston williams', ciudad
 from  atletas a join resultados r on a.DNI = r.Cod_Atleta
 where ciudad = (select ciudad from */

/*10 Se desea eliminar de la base de datos los resultados de la carrera Herri Krosa Mungia 2020.*/

delete from resultados 
where Cod_Carrera = (select Cod_Carrera from carreras where (descripcion) = 'Herri krossa muniga 202');

/*11¿Cuál es el mejor puesto que ha conseguido Gontzal Bilbao Pérez? */


/*12Se desea saber el número de atletas participantes en cada carrera, que lo indicará el mayor 
número de dorsal de cada carrera. Se indicará, por cada carrera, su número de participantes. */


