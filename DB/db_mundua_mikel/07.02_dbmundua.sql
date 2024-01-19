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