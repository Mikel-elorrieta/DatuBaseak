# Mikel Martin Castelo



#1) Hautatu Karibeko herrialde guztiak (region = “Caribbean”)
use db_mundua;
select country_name
from country
where region = "caribbean";
#2) Hautatu 1900 urtea ondoren independizatu diren herrialde guztia
select country_name, independence_year
from country
where independence_year > 1900;
#3) Hautatu errepublika diren herrialdeak.
select country_name, government_form
from country
where government_form like "republic";

#4) Hautatu 10 milioi biztanle baino gehiago dituzten Europako herrialde guztiak.

select country_name, population, continent
from country
where population >= 1000000 and continent like "europe";

#5) Hautatu Asian hitz egiten diren hizkuntza guztiak

select country_name, language_language
from country
inner join languagetable on country_code = country_code
where continent = "Asia"; 
#6) Aukeratu ingelesa hizkuntza ofiziala duten herrialde guztiak.

select country_name, language_language, language_code, laguage_official
from country
inner join languagetable on country_code = language_code
where language_language = "English" and laguage_official = "T"
order by country_name desc; 


#7) Zerrendatu kontinentearen arabera taldekatutako herrialde guztiak.

select country_name, continent
from country
order by continent ;



#8) Gaztelania hitz egiten den herrialde guztiak hautatu

select country_name, language_language, language_code
from country
inner join languagetable on country_code = language_code
where language_language = "Spanish"; 