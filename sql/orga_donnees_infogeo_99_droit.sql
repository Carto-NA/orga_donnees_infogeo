/* ORGA_DONNEES_INFOGEO V1.0 */
/* Creation des droits sur l'ensemble des objets */
/* orga_donnees_infogeo_99_droit.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */

------------------------------------------------------------------------
-- Schéma Geo
------------------------------------------------------------------------
GRANT USAGE ON SCHEMA geo TO "pre-sig-ro";
GRANT ALL ON SCHEMA geo TO "pre-sig-usr";


------------------------------------------------------------------------
-- Schéma met_plan_urgence
------------------------------------------------------------------------
GRANT USAGE ON SCHEMA met_plan_urgence TO "pre-sig-ro";
GRANT ALL ON SCHEMA met_plan_urgence TO "pre-sig-usr";


------------------------------------------------------------------------
-- Schéma met_plan_urgence
------------------------------------------------------------------------
GRANT ALL ON SCHEMA met_zon TO "pre-sig-usr";
GRANT USAGE ON SCHEMA met_zon TO "pre-sig-ro";
