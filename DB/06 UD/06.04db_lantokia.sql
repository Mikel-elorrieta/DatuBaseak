/* DatuBasea sortzeko*/
/* MIKEL MARTIN CASTELO DATU BASEA*/
-- drop database db_lantokia;
create database if not exists db_lantokia
collate utf8mb4_spanish_ci;

/* DatuBasea erabiltzeko*/
use db_lantokia;
/* Taula sortu pk barruan*/

create table SAILA(	
kodesaila char(5) primary key,
izenaSaila varchar(40) unique,
aurrekontua float,
kodelantokia int unsigned,
kodesailaburua char(5),
foreign key (kodesailaburua) references SAILA (izenasaila)
);
create table LANTOKIA(
kodelantokia int unsigned  primary key,
izenalant varchar(40) unique,
helbidea varchar(40),
aurrekontua float,
kodehiria int unsigned
);
create table HIRIA(
kodehiria int unsigned  primary key,
izenahiria varchar(40),
probintzia varchar(30),
hiriburua boolean

);

alter table SAILA
add
foreign key (kodelantokia) references LANTOKIA (kodelantokia);

alter table LANTOKIA
add
foreign key (kodehiria) references HIRIA (kodehiria);

alter table SAILA
modify 
aurrekontua float not null;

alter table HIRIA
modify
probintzia enum("BIZKAIA", "ALABA", "GUIPUZKOA")default "BIZKAIA";

insert into HIRIA values (1, "BILBO", "BIZKAIA", 1);
insert into LANTOKIA values (1, "Nagusia", "GRAN VIA, 80", 1200000, 1);
insert into SAILA values ("ZUZEN", "Zuzendaritza", 5000000, 1, NULL);

describe SAILA;


