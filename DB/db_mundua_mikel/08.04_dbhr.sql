use db_hr;

/*1) Erakutsi bere izenak 8 karaktere baino gehiago dituen langileen xehetasunak (izena - >
first_name).*/

select first_name as izena
from employees
where length(first_name) > 8;

/*2) Erakutsi langile kodea, izena eta abizena eta langilea kontratatua izan zen hilabetea.*/

select employee_id, first_name, last_name, monthname(hire_date) as Kontratatuta
from employees;

select employee_id, first_name, last_name, mid(hire_date, 6,2) as Kontratatuta
from employees;


/*3) Erakutsi teléfono zenbaki guztien azken 4 karaktereak.*/

select first_name , substring(phone_number,-4)
from employees;

select first_name , right(phone_number,4)
from employees;

/*4) Erakutsi langileen izena eta bere izenaren luzera (karaktere kopurua) baldin eta izena
bera A, J edo M letrekin hasten den. Zutabe bakoitzari (as ) etiketa egokia esleitu. Ordenatu
emaitza langilearen izenaren arabera.*/

select first_name as izena, length(first_name) as luzera
from employees
where first_name like "a%" or  first_name like "j%" or  first_name like "m%" 
order by first_name;

/*5) Ekainean kontratatuak izan ziren langileen izena eta abizena erakutsi, ordenatuta,
dataren arabera.*/

select first_name as Izena, last_name as Abizena, monthname(hire_date)
from employees
where month(hire_date) = 06;

/*6) Erakutsi lanpostu bakoitzak dituen langileen ID-ak. Outputa honelako zerbait izango
da: */

select job_id, group_concat(employee_id) as "Employees ID"
from employees 
group by job_id;
