# MIKEL MARTIN CASTELO


use db_hr;

#1. Idatzi kontsulta bat SQLn, langile bakoitzaren izena, abizena, sailaren zenbakia eta sailaren
# izena erakusteko


select first_name, last_name, departments.department_id, department_name
from employees 
inner join departments on employees.department_id = departments.department_id;

 #2. Idatzi kontsulta bat SQLn, langile bakoitzaren izen-deiturak, saila, hiria eta probintzia
 #erakusteko.

select E.first_name, E.last_name, D.department_id,  D.department_name,L.city, L.state_province
from employees E inner join departments D
											on E.department_id = D.department_id
				inner join locations L
											on D.location_id = L.location_id;
                                            
#3. Idatzi kontsulta bat SQLn, langile guztien izena, abizena eta soldata erakusteko.


select first_name, last_name, salary
from employees;
										
                                            
#4. Idatzi kontsulta bat SQLn, izena, abizena, sailaren zenbakia eta sailaren izena bistaratzeko,
#80 edo 40 sailetako enplegatu guztientzat.

select E.first_name, E.last_name, D.department_id,  D.department_name
from employees E inner join departments D on E.department_id = D.department_id
where D.department_id  in (40 , 80) ;  
				

#5. Idatzi kontsulta bat SQLn, euren izenean z letra duten langileak erakusteko eta euren
#abizena, saila, hiria eta estatuko probintzia erakusteko.	

select E.first_name, E.last_name, D.department_id,  D.department_name,L.city, L.state_province
from employees E inner join departments D
											on E.department_id = D.department_id
				inner join locations L
											on D.location_id = L.location_id
where E.first_name like "%z%";

#6. Idatzi kontsulta bat SQLn, langilerik ez duten sailak erakusteko.

select first_name, last_name, department_id
from employees
where department_id IS NULL;

#7. Idatzi kontsulta bat SQLn, 182 zenbakia duen enplegatuak irabazten duena baino gutxiago irabazten duten langileen izen-deiturak eta soldata erakusteko.

SELECT first_name, last_name, salary, employee_id
FROM employees
WHERE salary < (SELECT salary FROM employees WHERE employee_id = 182);

SELECT E2.first_name, E2.last_name, E2.salary, E2.employee_id
FROM employees E1 inner join employees E2
	on E1.salary > E2.salary
WHERE E1.employee_id = 182;

#8. Idatzi kontsulta bat SQLn, langile guztien izena eta kudeatzailearen izena (manager) erakusteko


SELECT concat( L.first_name ," " ,  L.last_name ) "Langile" ,concat(  M.first_name," " , M.last_name  ) "Manager"
from employees L inner join employees M
		on L.manager_id = M.employee_id;



SELECT first_name, last_name, salary, employee_id , manager_id
FROM employees
where manager_id is not null;

#12. Idatzi kontsulta bat SQLn, Taylor abizena duen langilearen departamentu berean lan egiten
#duten langileen izena, abizena eta sailaren zenbakia bistaratzeko.

select E1.first_name, E1.last_name , D.department_name
from employees E1 inner join employees E2
				on E1.department_id = E2.department_id
                inner join departments D
                on E2.department_id = D.department_id
where E2.last_name = "Taylor";

select E1.first_name, E1.last_name , D.department_name
from employees E1 inner join employees E2
			USING (department_id)
                inner join departments D
			USING (department_id)
where E2.last_name = "Taylor";

#14. Idatzi kontsulta bat SQLn, lanpostua, langilearen izen osoa (izena eta abizena) eta laneko
#gehieneko soldataren eta langilearen soldataren arteko aldea erakusteko.


SELECT concat( L.first_name ," " ,  L.last_name ) "Izen Abizena" , J.max_salary - L.salary AS "SOLDATA ALDEA"
from employees L inner join jobs J
		using (job_id);

#16. Idatzi kontsulta bat SQLn, langileen izen osoa (izena eta abizena), kargua eta beren lanean
#dituzten soldata-aldeak erakusteko, ID 80 duen sailean lan egiten duten langileentzat.

SELECT concat( L.first_name ," " ,  L.last_name ) "Izen Abizena" , J.job_title , L.department_id,  J.max_salary - L.salary AS "SOLDATA ALDEA"
from employees L inner join jobs J
		using (job_id)
where L.department_id = 80 ;
#17. Idatzi kontsulta bat SQLn, herrialdearen, hiriaren eta bertan dauden sailen izenak erakusteko.

select L.city, L.state_province, D.department_name
from locations L inner join departments d
USING (location_id);

#18. Idatzi kontsulta bat SQLn, sailaren izena eta kudeatzailearen izen osoa (izena eta abizena) erakusteko.


select D.department_name , concat( E.first_name ," " ,  E.last_name ) "Kudeatzailea", D.manager_id
from employees E inner join departments D
ON D.manager_id = E.employee_id;

#20. Idatzi kontsulta bat SQLn, gaur egun 12.000 soldata edo handiagoa irabazten duen edozein
#langilek egindako lanen xehetasunak erakusteko.

select E.salary , concat( E.first_name ," " ,  E.last_name ) "IZEN ABIZENA", J.job_title
from employees E inner join jobs J
using (job_id)
where E.salary >= 12000;

#22. Idatzi kontsulta bat SQLn, sailaren izena, kudeatzailearen izen osoa (izena eta abizena) eta
#euren hiria erakusteko.

select D.department_name , concat( E.first_name ," " ,  E.last_name ) "Kudeatzailea", D.manager_id, L.city
from employees E inner join departments D
ON D.manager_id = E.employee_id
inner join locations L
using (location_id);

#23. Idatzi kontsulta bat SQLn, langilearen identifikazioa, lanaren izena eta 80. sailean lan
#horietarako lan egindako egun-kopurua erakusteko.

SELECT concat( L.first_name ," " ,  L.last_name ) "Izen Abizena" , J.job_title , L.department_id,  DATEDIFF(end_date, start_date) as "lan egindako egun-kopurua"
from employees L inner join jobs J
		using (job_id)
        inner join job_history
        using (employee_id)
where L.department_id = 80 ;



select employee_id, job_title, DATEDIFF(end_date, start_date)
from job_history natural join jobs
where department_id = 80 ;


#24. Idatzi kontsulta bat SQLn, izen osoa (izen-abizenak) eta Londresko edozein
#departamentutan lan egiten duten langileen soldata erakusteko
SELECT concat( L.first_name ," " ,  L.last_name ) "Izen Abizena", L.salary , D.department_name, l2.city
from employees L inner join departments D
		using(department_id)
		inner join locations L2
		using(location_id)
WHERE city = "London";
#27. Idatzi kontsulta bat SQLn langilearen izen osoa (izena eta abizena) bistaratzeko, lanean ari
#den herrialdearen identifikazioarekin eta izenarekin.

SELECT concat( L.first_name ," " ,  L.last_name ) "Izen Abizena", D.department_name, C.country_name, C.country_id
from employees L inner join departments D
		using(department_id)
		inner join locations L2
		using(location_id)
        inner join countries C
        using (country_id) ;
