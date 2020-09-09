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
