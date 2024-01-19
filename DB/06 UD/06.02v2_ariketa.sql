

create database if not exists db_herriak2
collate utf8mb4_spanish_ci;

use db_herriak2;

create table HERRIAK(
	id_herria int primary key , /* PK SORTU */
	izena varchar(50) not null, /* derrigorrezkoa da */
	populazioa int not null, /* derrigorrezkoa da */
	kod_probintzia smallint  not null unique, /* derrigorrezkoa da eta bakarra */
	check (id_herria >= 1 and id_herria <= 9000),
	check (populazioa between 1 and 10000000),
	unique (izena, kod_probintzia) -- bakarra eta balio bikotea
);

create table PROBINTZIAK(
	kod_probintzia smallint primary key,
    izena varchar(50) not null unique, /* derrigorrezkoa da eta bakarra */
    azalera float not null,
    id_hiriburua int not null unique,
    id_erkidegoa smallint not null,
    
    check (kod_probintzia between 1 and 52),
    check (azalera between 1 and 150000),
    
    foreign key (id_hiriburua) references HERRIAK (id_herria) on delete cascade on update cascade 
    -- para que se cambien los datos en cascada
    

);

create table KOMUNITATEAK(
	id_erkidegoa smallint primary key check (id_erkidegoa between 1 and 19),
	izena varchar(50) unique not null,
	id_hiriburua int unique not null,

	foreign key (id_hiriburua) references HERRIAK (id_herria) on delete cascade on update cascade 
    -- para que se cambien los datos en cascada

);

alter table probintziak
add
foreign key (id_erkidegoa) references komunitateak (id_erkidegoa) on update cascade;-- foreign key sortu

alter table herriak
add 
foreign key (kod_probintzia)references probintziak(kod_probintzia) on update cascade;
