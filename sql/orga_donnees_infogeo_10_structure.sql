/* ORGA_DONNEES_INFOGEO V1.0 */
/* Creation des droits sur l'ensemble des objets */
/* orga_donnees_infogeo_1O_structure.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */


------------------------------------------------------------------------ 
-- Schéma : Création des schémas
------------------------------------------------------------------------

-- Schema: met_plan_urgence
CREATE SCHEMA IF NOT EXISTS met_plan_urgence;

COMMENT ON SCHEMA met_plan_urgence IS 'Schéma pour les données sur le plan d''urgence';


-- Schema: met_zon
CREATE SCHEMA IF NOT EXISTS met_zon;

COMMENT ON SCHEMA met_zon IS 'Schéma pour les données métiers sur les zonages';
