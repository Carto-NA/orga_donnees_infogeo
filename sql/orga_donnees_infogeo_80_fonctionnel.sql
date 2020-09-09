/* ORGA_DONNEES_INFOGEO V1.0 */
/* Requêtes utiles au fonctionnement */
/* orga_donnees_infogeo_8O_fonctionnel.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */

-----------------------------------------------------------
-- Requêtes utilies pour le fonctionnement
-----------------------------------------------------------

-- Requête pour extraire les commentaires sur les schémas
SELECT 
  t1.*, t2.description
FROM
(
  SELECT 
    table_schema, table_name, table_type 
  FROM 
    information_schema.tables 
  WHERE table_schema NOT IN ('information_schema','pg_catalog')
) t1
INNER JOIN 
(
  SELECT
    pg_class_objoid.relname AS "Table/View Name", pg_description.*
  FROM
    pg_description
  LEFT JOIN
    pg_class AS pg_class_objoid ON pg_description.objoid = pg_class_objoid.oid
  LEFT JOIN
    pg_class AS pg_class_classoid ON pg_description.classoid = pg_class_classoid.oid
  WHERE
    pg_class_classoid.relname = 'pg_class' 
) t2
ON 
  t2."Table/View Name"!='tcl_sytral.tcllignemf' AND t1.table_name=t2."Table/View Name"
ORDER BY t1.table_schema, t1.table_name ASC;




=========================================================================================
=========================================================================================
-- A organiser
-----------------------------------------------------------------------------------------

Vous devriez pouvoir exécuter simplement select * from information_schema.tables pour obtenir une liste de toutes les tables gérées par Postgres pour une base de données particulière.

Vous pouvez également ajouter un where table_schema = 'information_schema' pour afficher uniquement les tables dans le schéma d'informations.
Ce document nous permet de définir un certain nombre de règles et bonnes pratiques pour organiser et gérer au mieux la base de données sur l'information *"géographique et territoriale"*.

1.Obtenez toutes les tables et vues de information_schema.tables, y compris celles de information_schema et pg_catalog.

select * from information_schema.tables
Les tables 2.get et les vues appartiennent à certains schémas

select * from information_schema.tables
    where table_schema not in ('information_schema', 'pg_catalog')
3.get tables seulement (presque\dt)

select * from information_schema.tables
    where table_schema not in ('information_schema', 'pg_catalog') and
    table_type = 'BASE TABLE'



-- Afficher que les schémas
SELECT DISTINCT table_schema FROM information_schema.tables WHERE table_type = 'BASE TABLE' AND table_schema NOT IN ('pg_catalog', 'information_schema') ORDER BY table_schema;
    
-- Afficher les schémas, tables et type de table de la base de données
select 
	--table_schema || '.' || table_name, * 
	table_schema, table_name, table_type
from information_schema.tables 
WHERE
    table_type = 'BASE TABLE'
AND
    table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_type, table_name;

-- Afficher les colonnes d'une tables et le type de champ
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'z_aire_urbaine_na';


-----------------------------------------------------
-- On peut aussi récupérer le commentaire comme ça :

-- récupère le commentaire d'une colonne de la table [0] --> Commentaire de la table
select col_description('2402848','0');
-- 	récupère le commentaire d'un objet de la base de données
select obj_description('2402848','0');
-- récupère le commentaire d'un objet partagé de la base de données
select shobj_description('2402848','0');


