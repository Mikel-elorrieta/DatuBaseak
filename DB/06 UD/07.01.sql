-- 1. Langile guztien datu guztiak lortzea.

select *
from employees;

-- 2. Departamentu edo sail guztien datu guztiak lortzea.
select *
from departments;

-- 3. Administrarien datu guztiak lortzea (ingelesez, CLERK).

select *
from employees
where job_id = "PU_CLERK" OR job_id = "ST_CLERK" OR job_id = "SH_CLERK"; 

	-- FILTRAR VARIABLES EN JOB_ID
select *
from employees
where job_id LIKE "%CLERK%"; 
	-- PÀRA TODOS LAS VARIABLES QUE SE PAREZCAN A CLERK O TENGAN ALGO EN COMUN A EL EN JOB_ID

-- 4. Berdin, baina izenaren arabera ordenatuta.
-- ORDENAR ALFABETICAMENTE
select *
from employees
where job_id LIKE "%CLERK%"
order by first_name; 

-- 5. Lortu aurreko galderaren emaitza bera, baina aldatu SQL sententzia.
-- ORDENAR SELECCIONANDO LA COLUMNA NUMERO 2 EN VEZ DEL NOMBRE DE LA COLUMNA

select *
from employees
where job_id LIKE "%CLERK%"
order by 2; 

-- 6. Langileen zenbakia (kodea), izena eta soldata jaso.

select employee_id, first_name, salary
from employees
-- order by salary desc
;


-- 7. Departamentu guztien izenen zerrenda.
select department_name
from departments;
-- 8. Berdin, baina izenaren arabera ordenatuta.
select department_name
from departments
order by 1;
-- 9. Berdin, baina hiriaren arabera ordenatuta (emaitzan ez da hiria hautatu behar).
select department_name
from departments
order by location_id;

-- 10. Berdin, baina emaitza alderantzizko ordenan erakutsi behar da.

select department_name
from departments
order by location_id desc;

-- 11. Langile guztien izena eta enplegua lortzea, soldataren arabera ordenatuta.

select first_name, job_id
from employees
order by salary;

-- 12. Langile guztien izena eta lana lortzea, lehenik beren lanaren eta gero beren soldataren arabera ordenatuta.

select first_name, job_id
from employees
order by job_id,salary;

-- 13. Berdin, baina alderantzizko hurrenkeran, lanaren arabera eta, normal, soldataren arabera.

select first_name, job_id
from employees
order by job_id desc,salary asc;

-- 14. Eskuratu 30. departamentuko langileen soldatak eta komisioak.
select salary, commission_pct
from employees
where department_id = 30;
-- 15. Berdin, baina komisioaren arabera ordenatua.
select salary, commission_pct
from employees
where department_id = 30
order by commission_pct;
-- 16. (a) Langile guztien komisioak lortu.

select commission_pct
from employees;

--  (b) Ez errepikatu langileen komisioak.

select distinct commission_pct
from employees;

 
-- 17. Lortu langilearen izena eta komisioa errenkadak errepikaturik gabe.

select distinct first_name , commission_pct
from employees;

-- 18. Langileen izenak eta soldatak jaso, ez errepikatzea errenkadarik.

select distinct first_name , salary 
from employees;

-- 19. Langileen komisioak eta haien departamentu-zenbakiak jaso, errenkadak errepikatu gabe.

select distinct department_id , commission_pct
from employees;

-- 20. Bere soldataren erdia baino gehiagoko komisioa duten langileak aurkitu
select first_name as izena, last_name as Abizena
from employees
where commission_pct >= 0.2;
#21. Komisiorik ez duten langileak aurkitu, edo bai dutenak baina bere soldataren %25 edo gutxiago
#izatea

select concat(first_name, " " , last_name) as IzenAbizena
from employees 
where commission_pct is null or commission_pct <= 025;


#22. 150 baino kode handiagoa duten langileen izena, kodea, soldata eta komisioa aurkitu.

select employee_id , commission_pct, first_name, salary
from employees
where employee_id > 150;



#23. Izena J letratik aurrera, hau barne, duten langileen datuak jaso (ASCII ordenazioa irizpide).

select first_name 
from employees
where first_name >= "J";

#24. Lortu komisioa duten langileen soldata, komisioa eta soldata osoa (soldata+komisioa), eta
#ordenatu emaitza langile-kopuruaren arabera.

select employee_id as Kodea, salary as soldata, commission_pct as Komisioa, 
round( salary + (salary * commission_pct)) as "Soldata Komisioa" 
from employees
where commission_pct is not null
order by employee_id;

#25. Informazio bera eman, baina komisiorik ez duten langileentzat.

select employee_id as Kodea, salary as soldata, commission_pct as Komisioa, 
round( salary + (salary * commission_pct)) as "Soldata Komisioa" 
from employees
where commission_pct is null
order by employee_id;

#26. 120 kodea duen langilea nagusi duten langileen izena erakutsi, baldin eta soldata 1000 baino
#handiagoa duten.


select employee_id as ID, first_name as Izena, salary as Soldata
from employees
where salary > 1000  and  manager_id = 120;
#27. Aurreko kontsultaren gainontzeko balioak lortu (bere multzo osagarria).

select employee_id as ID, first_name as Izena, salary as Soldata
from employees
where not (salary > 1000  and  manager_id = 120);


select employee_id as ID, first_name as Izena, salary as Soldata
from employees
where  salary < 1000  or   manager_id <> 120;


#28. Langile bakoitzak duen komisioa bere soldataren gainean duen portzentajea aurkitu, eta emaitza
#haren arabera ordenatu.

select first_name as Izena , commission_pct as Komisioa 
from employees
order by commission_pct;

#29. Aurkitu LA katea ez duten 50. departamentuko langileak.

select First_name as Izena , Last_name as Abizena
from employees
where department_id = 50 and first_name not Like "%LA%";

#30. Jaso beste inork gainbegiratzen ez dituen langileak.

select First_name as Izena , Last_name as Abizena
from employees
where manager_id is null;
#-----------------------------------------------------------------------------------
#31. Salmentak (Sales) eta giza baliabideak (human resources) ez diren departamentuen izenak jaso.
#Emaitza ordenatu departamentuaren herriaren arabera.
#32. 10. departamentuan lan egiten ez duten langileen izena eta administrarien sailaren kodea
#(CLERK) ezagutu nahi ditugu, horien soldata 800 baino handiagoa bada; kontratazio-dataren
#arabera ordenatuta.
#33. Komisioa duten langileentzat, lortu haien izenak eta soldataren eta komisioaren arteko zatidura
#(komisioa zero denean izan ezik), eta ordenatu emaitza izenaren arabera.
#34. Izenak 5 karaktere duten langileei buruzko informazio guztia zerrenda bateanerakutsi.
#35. Gauza bera, baina gutxienez bost letra dituzten langileentzat.
#-----------------------------------------------------------------------------------
#40. Lana MAN letrekin amaitu eta izena A letrarekin hasten diren langileen izenak eta lanak
#zerrendatu.
select First_name as Izena , job_id as Lana
from employees
where first_name Like "A%" AND job_id like "%MAN";


#41. Programatzaileak ez diren langileen (IT_PROG) izen-zerrenda eta kontratazio-data.

select concat (First_name, " ", last_name )as "Izen Abizena", hire_date as "Kontratazio data"
from employees
where job_id  not like "it_prog";

#42. Lor ezazu zenbaki hauetako bat duten enplegatuen informazioa: 78, 79, 75, 72, 177, 179, 178 eta
#69, baina ez bada hauetako bat: 90, 45, 26 eta 37. Ez konplikatu kontsultarekin!!

select First_name as Izena , employee_id as Kode_lana
from employees
where employee_id IN (78, 79, 75, 72, 177, 179, 178); #buscar por rangos

#43. Bere kodea baino handiagoa duen langile bat buru duten langileentzat, eskuratu 1000tik gorako
#eta 2000tik beherako soldata jasotzen dutenak edo 30. departamentuan daudenak.

select concat (First_name, " ", last_name )as "Izen Abizena", employee_id as Kode_lana, department_id as Departamentua, manager_id , employee_id, salary
from employees
where department_id = 30 and employee_id < manager_id and salary between 1000 and 2000;