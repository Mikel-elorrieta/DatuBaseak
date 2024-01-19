drop database db_herriak;
create database if not exists db_herriak;
use db_herriak;
create table Herriak(
id_herria int primary key,
izena varchar(20),
populazioa int,
kod_probintzia int
);

create table PROBINTZIAK(
	kod_probintzia smallint primary key,
    izena varchar(20),
    azalera int,
    id_hiriburua int,
    id_erkidegoa int,
	foreign key (id_hiriburua) references Herriak (id_herria)
);

create table KOMUNITATEAK(
	id_erkidegoa smallint primary key,
    izena varchar(20),
    id_hiriburua int,
    foreign key (id_hiriburua) references Herriak (id_herria)
);

alter table Herriak 
add
foreign key (kod_probintzia) references PROBINTZIAK (kod_probintzia);

alter table HERRIAK
modify
kod_probintzia smallint;

alter table PROBINTZIAK
modify
id_erkidegoa smallint;


alter table PROBINTZIAK
add
foreign key (id_erkidegoa) references KOMUNITATEAK(id_erkidegoa);

alter table HERRIAK
modify  
izena varchar(20) not null unique;

alter table HERRIAK
modify
populazioa int not null;

alter table HERRIAK
add
check (populazioa < 100000000 and populazioa > 0);

alter table HERRIAK
add
check (id_herria > 0 and id_herria < 9000);

alter table PROBINTZIAK
add
check (kod_probintzia > 0 and kod_probintzia < 53);

alter table PROBINTZIAK
modify
izena int not null unique;

alter table PROBINTZIAK
modify
azalera int not null;

alter table PROBINTZIAK
add
check (azalera > 0 and azalera < 150001 ) ;

alter table PROBINTZIAK
modify
id_hiriburua int not null unique;

alter table PROBINTZIAK
modify
id_erkidegoa smallint not null ;

alter table KOMUNITATEAK
add
check (id_erkidegoa > 0 and id_erkidegoa < 20);

alter table KOMUNITATEAK
modify
izena smallint not null unique;

alter table KOMUNITATEAK
modify
id_hiriburua int not null unique;