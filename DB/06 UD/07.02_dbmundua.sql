# MIKEL MARTIN CASTELO

 #drop database db_mundua;

create database if not exists db_mundua
collate utf8mb4_spanish_ci;

use db_mundua;

create table CITY (
city_id int primary key ,
city_name  varchar(50) not null,
country_code varchar(3)not null,
district varchar(100)not null,
population int

);

create table country(
country_code varchar(3) primary key,
country_name varchar(150)not null,
continent varchar(40)not null,
region varchar(100)not null,
surface_area int,
independence_year year,
population int,
life_expectancy float,
gnp float,
gnp_old varchar(50),
local_name varchar(50),
government_form varchar(200),
head_of_state varchar(100),
capital int, 
country_code2 varchar(2)

);

create table LanguageTable(
language_code varchar(3),
language_language varchar(30),
laguage_official char(1),
language_percentage float,

primary key(language_code, language_language)

);

alter table city
add
foreign key (country_code) references country (country_code);


alter table LanguageTable
add
foreign key (language_code) references country (country_code);






#----------------------------------------------------------------


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