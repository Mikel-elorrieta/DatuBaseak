use information_schema;

/* Foreign key ikusteko*/
select *
from referential_constraints
where constraint_schema = 'db_herriak2';

/*Check ikusteko*/
select *
from check_constraints
where constraint_schema = 'db_herriak2';

/*Taula murrizketak ikusteko*/
select table_name, constraint_name, constraint_type
from table_constraints
where constraint_schema = 'db_herriak2' ;
