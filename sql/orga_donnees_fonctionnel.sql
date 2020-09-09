-- Requête pour extraire les commentaires sur les schémas
select t1.*, t2.description
from
(
  select 
    table_schema, table_name, table_type 
  from 
    information_schema.tables 
   where table_schema not in ('information_schema','pg_catalog')
) t1
inner join 
(
SELECT
  pg_class_objoid.relname AS "Table/View Name",
  pg_description.*
FROM
  pg_description
LEFT JOIN
  pg_class AS pg_class_objoid   ON pg_description.objoid   = pg_class_objoid.oid
LEFT JOIN
  pg_class AS pg_class_classoid ON pg_description.classoid = pg_class_classoid.oid
WHERE
  pg_class_classoid.relname = 'pg_class' 
) t2
ON 
t2."Table/View Name"!='tcl_sytral.tcllignemf'
and 
t1.table_name=t2."Table/View Name"
 order by t1.table_schema, t1.table_name asc;
