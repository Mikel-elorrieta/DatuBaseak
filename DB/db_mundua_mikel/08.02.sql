use db_LFP;

#Erakutsi datu-baseko jokalari gazteenari bere izena, jaioteguna eta jolasten duen
#taldearen izena.

select j.nombre, j.fecha_nac, e.nombre
from jugadores j join equipos e 
using (id_equipo)
where j.fecha_nac = (select max(fecha_nac) from jugadores);

#) Villa hiriko taldean gol bat baino gehiago sartu duten jokalariaren izena, jaioteguna eta
#sartutako gol kopurua erakutsi. 


select j.nombre, j.fecha_nac, count(*) as "numero goles"
from jugadores j join goles g using (id_jugador)
				join equipos e using (id_equipo)
                where e.ciudad = "villa"
                group by j.nombre, j.fecha_nac
having count(*) > 1;

#c) Ligako gol goiztiarrenarentzat (partida batean arinen sartu dena), erakutsi gola sartu
#zeneko minutua, haren deskribapena, jokalari goleatzailearen izena eta jokalari hori
#zein taldetakoa den

select j.nombre, j.id_equipo,e.nombre,  g.minuto, g.descripción
from goles g join jugadores J using (id_jugador)
			join equipos e using (id_equipo)
        where g.minuto = (select min(minuto) from goles);

            
#d) 1970 baino lehen sortutako taldeek tokiko talde moduan jokatutako partida guztietan,
#adierazi taldearen izena, jokatutako partiden kopurua (ezizena Partida kopurua),
#sartutako gol kopuru totala (ezizena Golak etxean), jasotako gol kopuru osoa (ezizena
#Golak kanpoan) eta golen aldea (ezizena Golen aldea). Ordenatu emaitza golen arteko
#aldearen arabera, handitik txikira.


SELECT e.nombre AS nombre_equipo, count(p.Fecha) as "Partida kopurua" , sum(p.Goles_casa) as "Sartutako gol kopuru", 
		sum(p.Goles_fuera) as "Jasotako gol kopuru",(sum(p.Goles_casa) - sum(p.Goles_fuera)) as Golen_aldea
from equipos e inner join partidos p on e.id_equipo = p.id_equipo_casa
WHERE e.año_fundación < 1970
group by nombre_equipo
order by Golen_aldea desc;


#1990 baino lehen jaiotako jokalari guztientzat, erakutsi jokalariaren izena, jaioteguna,
#jolasten den taldearen izena eta taldearen kapitainaren izena (ezizena Kapitaina).
#Ordenatu emaitza, lehenbizi jokalari gazteenak ager daitezen, eta, ondoren, zaharrenak.

select j.nombre,j.id_jugador, j.fecha_nac, e.nombre AS nombre_equipo, 
(SELECT nombre FROM jugadores WHERE id_jugador = e.capitán) AS nombre_capitan
from jugadores j join equipos e using (id_equipo)
where j.fecha_nac < "1990-01-01"
order by j.fecha_nac desc;

select j.nombre, j.id_jugador, j.fecha_nac, e.nombre as nombre_equipo , c.nombre  AS nombre_capitan 
from jugadores j join equipos e using (id_equipo)
join jugadores c on E.capitán = c.id_jugador
where j.fecha_nac < "1990-01-01"
order by j.fecha_nac desc;


select j.nombre, j.id_jugador, j.fecha_nac, e.nombre as nombre_equipo , c.nombre  AS nombre_capitan 
from jugadores j join equipos e using (id_equipo)
join jugadores c on E.capitán = c.id_jugador
where year(j.fecha_nac) < 1990
order by j.fecha_nac desc;

#f) Partidari buruzko oharretan zerbait duten alderdi guztietan, erakutsi tokiko taldearen
#izena, talde bisitariaren izena, partidaren data eta oharrak

select el.nombre, ef.nombre,p.Fecha, p.Observaciones
from equipos el join partidos p on el.id_equipo = p.id_equipo_casa
				join equipos ef on ef.id_equipo = p.id_equipo_fuera
where p.observaciones is not null;

#g) Villa F.C. taldeak bere jokalarien sailkapen bat lortu nahi du; bertan adieraziko delarik
#jokalari bakoitzaren izena, sartu duen gol kopurua eta gola markatzen duen
#batazbesteko minutua (biribilduta, hamartarrik gabeko). Gola sartu ez duten jokalariak
#ere sailkapen honetan agertu behar dira. Sailkapenean, jokalariak ordenatuta agertuko
#dira, handienetik txikienerako gol kopuruaren arabera.

select e.nombre as nombre_equipo, j.nombre as nombre_jugador, count(g.id_jugador) as goles_jugador, round(avg(g.minuto),0)
from equipos e join jugadores j on j.id_equipo = e.id_equipo
				left join goles g on j.id_jugador = g.id_jugador
                where e.nombre like "%villa%"
                group by j.nombre
                order by goles_jugador desc;

#h) Erakutsi golen bat sartu duten Villa hiriko jokalari guztientzat bere izena, adina eta
#sartutako gol kopurua. Ordenatu emaitza adinaren arabera, eta berdinketarik izanez
#gero, gol kopurua handienetik txikienera. Adina kalkulatzeko, timestampdiff(denbora
#unitatea, data1, data2) funtzioa erabil dezakezu. Funtzio horrek denbora-unitate bat
#eta bi data hartzen ditu parametro gisa, data2 data1 baino handiagoa izanik. Funtzioak
#bi data horien arteko aldea ematen du lehen parametrotzat adierazitako denboraunitatean. Denbora unitateak year, month, week, day, hour, minute, second… izan
#daitezke


select j.nombre as nombre_jugador, TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE()) AS "adina" ,count(g.id_jugador) as goles_jugador
from equipos e join jugadores j on j.id_equipo = e.id_equipo
				join goles g on j.id_jugador = g.id_jugador
                where e.ciudad like "%villa%"
                group by j.nombre, 2 
                order by adina;