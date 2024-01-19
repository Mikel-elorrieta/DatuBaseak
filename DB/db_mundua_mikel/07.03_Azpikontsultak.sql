# MIKEL MARTIN CASTELO


use db_hr;


#1) Idatzi SQL agindua, 163 kodea duen langileak baino soldata handiagoa duten langileen
#izen abizenak erakusteko.

SELECT first_name, last_name, salary, employee_id
FROM employees
WHERE salary < (SELECT salary FROM employees WHERE employee_id = 163);

#2) Idatzi SQL agindua, 169 kodea duen langilearen departamentu berean lan egiten duten
#langileen izen abizenak, soldata, departamentu id-ea eta lan id-ea erakusteko.

SELECT first_name, last_name, salary, department_id, job_id
FROM employees
WHERE department_id = (SELECT department_id 
						FROM employees 
                        WHERE employee_id = 169);

#3) Idatzi SQL agindua, Payam managerraren agindupean dauden langileen izen abizenak,
#langile kodea eta soldata erakusteko.

SELECT first_name, last_name, salary, department_id, job_id
FROM employees
WHERE manager_id = (SELECT employee_id 
					FROM employees 
					WHERE  first_name like "Payam") ;


#4) Idatzi SQL agindua, Finance sailean lan egiten duten langile guztien izen abizenak
#erakusteko.

SELECT first_name, last_name, salary, department_id, job_id
FROM employees
WHERE department_id = (SELECT department_id 
					FROM departments 
					WHERE  department_name like "Finance") ;

#5) Idatzi SQL agindua, 134, 159 edo 183 departamentuetan lan egiten duten langileen
#datuak erakusteko.

SELECT *
From employees
where department_id in (70,80,90);

#6) Idatzi SQL agindua, 100. eta 200. Bitartean kodea duen managerrek lan egiten duten
#departamentuetatik kanpo lan egiten duten langileen datu guztiak erakutsi.

SELECT *
from employees
where department_id not in (select department_id from departments where department_id between 100 and 200);

#7) Idatzi SQL agindua, T letra izenean duten langileen departamentuetan lan egiten duten
#langile guztien zerrenda erakutsi (id-ea eta izen abizenak).

select *
from employees
where department_id in (select department_id from employees where first_name like "%T%");

#8) Idatzi SQL aginuda: Toronton lan egiten duten langile guztien izena eta abizena,
#langilearen identifikazioa eta kargua erakutsi.

select *
from employees
where department_id in (select department_id from departments where location_id = (select location_id from locations where city  LIKE "Toronto"));

#9) Idatzi SQL agindua, Ozer jaunak baino gehiago nork irabazten duen zehazteko.



#10) Idatzi SQL agindua, sail bat kudeatzen duten langileen xehetasunak lortzeko.
