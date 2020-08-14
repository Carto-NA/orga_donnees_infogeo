Domaines de valeurs - source du référentiel géographique métier
====

*Listes de valeur qui permettent d'avoir une cohérence dans la saisie de champ commun à plusieurs bases ou tables.*


-- ################################################################# Listes de valeurs  ###############################################

-- Table: r_objet.lt_src_geom

-- DROP TABLE r_objet.lt_src_geom;

CREATE TABLE r_objet.lt_src_geom
(
  code character varying(2) NOT NULL, -- Code de la liste énumérée relative au type de référentiel géométrique
  valeur character varying(254) NOT NULL, -- Valeur de la liste énumérée relative au type de référentiel géométrique
  CONSTRAINT lt_src_geom_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_objet.lt_src_geom
  OWNER TO postgres;
GRANT ALL ON TABLE r_objet.lt_src_geom TO postgres;
COMMENT ON TABLE r_objet.lt_src_geom
  IS 'Code permettant de décrire le type de référentiel géométrique';
COMMENT ON COLUMN r_objet.lt_src_geom.code IS 'Code de la liste énumérée relative au type de référentiel géométrique';
COMMENT ON COLUMN r_objet.lt_src_geom.valeur IS 'Valeur de la liste énumérée relative au type de référentiel géométrique';

INSERT INTO r_objet.lt_src_geom(
            code, valeur)
    VALUES
    ('10', 'Cadastre'),
    ('11', 'PCI vecteur'),
    ('12', 'BD Parcellaire'),
    ('13', 'RPCU'),
    ('20', 'Ortho-images'),
    ('21', 'Orthophotoplan IGN'),
    ('22', 'Orthophotoplan partenaire'),
    ('23', 'Orthophotoplan local'),
    ('30', 'Filaire voirie'),
    ('31', 'Route BDTopo'),
    ('32', 'Route OSM'),
    ('40', 'Cartes'),
    ('41', 'Scan25'),
    ('50', 'Lever'),
    ('51', 'Plan topographique'),
    ('52', 'PCRS'),
    ('53', 'Trace GPS'),
    ('60', 'Geocodage'),
    ('61', 'Base Adresse Locale'),
    ('70', 'Plan masse'),
    ('71', 'Plan masse vectoriel'),
    ('72', 'Plan masse redessiné'),
    ('80', 'Thématique'),
    ('81', 'Document d''urbanisme'),
    ('82', 'Occupation du Sol'),
    ('83', 'Thèmes BDTopo'),
    ('99', 'Autre'),
    ('00', 'Non renseigné');
