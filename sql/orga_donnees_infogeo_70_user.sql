/* ORGA_DONNEES_INFOGEO V1.0 */
/* Requêtes pour la création des utilisateurs */
/* orga_donnees_infogeo_7O_user.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */

-- Tony VINCENT
IF NOT EXISTS (SELECT * FROM pg_user WHERE username = 'vincentt')
BEGIN
  -- Création du rôle
  CREATE ROLE vincentt LOGIN PASSWORD 'my_password';
END;

-- Emmanuel CAPELLI
IF NOT EXISTS (SELECT * FROM pg_user WHERE username = 'capellie')
BEGIN
  -- Création du rôle
  CREATE ROLE capellie LOGIN PASSWORD 'my_password';
END;

-- Cyril LIDIER
IF NOT EXISTS (SELECT * FROM pg_user WHERE username = 'c-lidier')
BEGIN
  -- Création du rôle
  CREATE ROLE vincentt LOGIN PASSWORD 'my_password';
END;
