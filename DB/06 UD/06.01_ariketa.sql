/* DatuBasea sortzeko*/
create database if not exists db_retailer
collate utf8mb4_spanish_ci;

/* DatuBasea erabiltzeko*/
use db_retailer;
/* Taula sortu pk barruan*/
create table FABRICANTES(
cod_fabricante smallint primary key,
nombre varchar(15),
pais varchar(15)

);
/* TAULA ALDATU MURRIZKETAK JARTZEKO letrak larriak*/
alter table FABRICANTES
ADD 
check ( nombre = UPPER(nombre)),
ADD 
check ( pais = UPPER(pais));

/* TAULA ALDATU MURRIZKETAK JARTZEKO*/
describe fabricantes;

/* Taula sortu pk batekin baina 4 atributurekin eta Foreing Key deklaratu*/
CREATE TABLE ARTICULOS (
    articulo VARCHAR(20),
    COD_FABRICANTE SMALLINT,
    peso SMALLINT,
    categoria ENUM('Primera','Segunda','Tercera'),
    precio_venta FLOAT,
    precio_costo FLOAT,
    existencias INT,
    PRIMARY KEY (articulo , cod_fabricante , peso , categoria),
    FOREIGN KEY (cod_fabricante)
	REFERENCES FABRICANTES (cod_fabricante),
    /* TAULA ALDATU MURRIZKETAK JARTZEKO 0 > Handiago behar da*/
    CHECK (precio_venta > 0 AND precio_costo > 0 AND peso > 0)
);

--  06.01.02 ZATIA ARIKETA
create table  TIENDAS(
	nif varchar(10),
    nombre varchar(20),
    direccion varchar(20),
    poblacion varchar(20),
    provincia varchar(20),
    codpostal int
    
);

alter table TIENDAS
add
primary key(nif);

alter table TIENDAS
add
check (provincia = upper(provincia));
/*  Aldatu taularen informazioa */
alter table TIENDAS
modify
nombre varchar(30);
/* Ikusi taularen informazioa  */
describe tiendas;

alter table Tiendas
add
check (provincia <> 'TOLEDO');

create table PEDIDOS(
nif varchar(10),
articulo varchar(20),
cod_fabricante smallint,
peso smallint,
categoria ENUM('Primera','Segunda','Tercera'), 
fecha_pedido date,
unidades_pedidas smallint,
primary key(nif,articulo, cod_fabricante, peso, categoria, fecha_pedido),
/* FK DEITZEKO*/
foreign key (cod_fabricante) references fabricantes (cod_fabricante) ,
foreign key (nif) references tiendas (nif),
foreign key (articulo, cod_fabricante, peso, categoria) 
	references articulos (articulo, cod_fabricante, peso, categoria),
check (unidades_pedidas > 0)    
);


/*DATUAK TXERTATUKO DITUGO MURRIZKETAK KONPROBATZEKO*/

insert into fabricantes values(3,'Mattel','USA');

insert into tiendas values('C35453251','EROSKI','Lehenedakari Agirre','Bilbo',"Bizkaia", "48950");

insert into articulos values('A1641268','3','400','Primera',"69","23","18");

