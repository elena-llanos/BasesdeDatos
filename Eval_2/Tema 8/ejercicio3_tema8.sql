use geografia;
/*Obtenga los nombres de las comunidades autónomas formadas por una sola provincia.*/

select c.nombre ,count(n_provincia)
from comunidades c join provincias p on c.id_comunidad = p.id_comunidad
group by c.nombre
having count(n_provincia) = 1;

/*Muestre por cada provincia, su nombre, su superficie, su población y su densidad poblacional 
redondeada a 2 decimales (columna Densidad poblacional). Este último dato se calcula dividiendo 
la población de la provincia entre su superficie. Ordene los datos por provincias desde la menos 
densamente poblada hasta la más densamente poblada. */

select p.nombre , p.superficie,  sum(poblacion) , round(sum(poblacion)/superficie , 2) 'Densidad'
from localidades l join provincias p on l.n_provincia = p.n_provincia
group by p.nombre , p.superficie
order by round(sum(poblacion)/superficie , 2);