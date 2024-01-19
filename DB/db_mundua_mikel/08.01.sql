use db_hr;

#1. EMPLOYEES taulatik abiatuta, erakutsi “Sales” departamentuko lanpostu bakoitzeko
#soldaten gehiketa.

select job_title , sum(salary)
from jobs j inner join employees e
	on j.job_id = e.job_id
inner join departments departments	
		using (department_id)
						where (department_name like "sales")
group by job_title;



select job_title , sum(salary), department_name
from jobs j inner join employees e
	on j.job_id = e.job_id
inner join departments departments	
		using (department_id)
						
group by job_title , department_name;

#2. Erakutsi EMPLOYEES taulako langileen izen abizenak baldin eta euren soldata,
#departamentuko bataz-besteko soldataren berdina bada.

select concat(First_name, " " , last_name) as "Employee", salary, department_name
from employees E join departments D using (department_id)
where (salary, department_id) in (select avg(salary), department_id from employees
group by department_id);


select concat(First_name, " " , last_name) as "Employee", salary, department_name
from employees E join departments D using (department_id)
where (salary, department_id) in (select avg(salary), department_id from employees
group by department_id);

#3. Erakutsi EMPLOYEES taulako langileen izen abizenak baldin eta euren soldata,
#departamentuko bataz-besteko soldata baino handiagoa bada.
#38 erregistro dira emaitza.


#4. EMPLOYEES taulatik abiatuta erakutsi departamentu bakoitzean dagoen langile kopurua.


select department_id, count(*)
from employees 
group by department_id
order by 1 desc;

#5. EMPLOYEES taulatik abiatua erakutsi zein departamentuk duen langile gehien.

select department_id, count(*)
from employees 
group by department_id
order by count(*) desc
limit 1;
                    

SELECT department_id, COUNT(*) 
FROM employees 
GROUP BY department_id
HAVING COUNT(*) = (
    SELECT MAX(department_count)
    FROM (
        SELECT COUNT(*) as department_count
        FROM employees
        GROUP BY department_id
    ) as counts
);

#6. Erakutsi zeintzuk departamentuk dute langile bi baino gehiago lanpostu berean lanean.



select department_id,job_id, count(*)
from employees
group by department_id, job_id
having count(*) > 2;

         



