Domaines de valeurs - source du référentiel géographique métier
====

*Listes de valeur qui permettent d'avoir une cohérence dans la saisie de champ commun à plusieurs bases ou tables.*


-- ################################################################# Listes de valeurs  ###############################################

-- Table: r_objet.lt_type_localisation

-- DROP TABLE r_objet.lt_type_localisation;

CREATE TABLE r_objet.lt_type_localisation
(
  code character varying(2) NOT NULL, -- Code de la liste énumérée relative au type de référentiel géométrique
  valeur character varying(254) NOT NULL, -- Valeur de la liste énumérée relative au type de référentiel géométrique
  CONSTRAINT lt_src_geom_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE r_objet.lt_type_localisation
  OWNER TO postgres;
GRANT ALL ON TABLE r_objet.lt_type_localisation TO postgres;
COMMENT ON TABLE r_objet.lt_type_localisation
  IS 'Code permettant de décrire le type de référentiel géométrique';
COMMENT ON COLUMN r_objet.lt_type_localisation.code IS 'Code de la liste énumérée relative au type de référentiel géométrique';
COMMENT ON COLUMN r_objet.lt_type_localisation.valeur IS 'Valeur de la liste énumérée relative au type de référentiel géométrique';

INSERT INTO r_objet.lt_type_localisation(
            code, valeur)
    VALUES
    ('01', 'Commune'),
    ('02', 'XY'),
    ('03', 'EPCI'),
    ('04', 'RPCU'), 
    ('99', 'Autre'),
    ('00', 'Non renseigné');
