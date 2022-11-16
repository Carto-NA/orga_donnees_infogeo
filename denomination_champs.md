Dénomination des champs communs
====

*Afin d'éviter les problèmes d'export des données, notamment au format shape, il est recommandé de limiter à 10 caractères le nom des attributs.*

La dénomination des attributs reste libre mais doit-être explicite et faire l'objet d'un commentaire.

Certains champs doivent respectés une règle de nommage, un type et doivent être présents dans l'ensemble des classes d'entités et tables de donnée gérées par l'unité SIG lorsque cela est nécessaire :
| Champ| Type | Contrainte | Descritpion |
|----|----|----|----|
|id | serial | not null | Identifiant non signifiant |
| numcom | varchar(5) | | Code INSEE de la commune |
| insee_com | varchar(5) | | Code INSEE de la commune |
| nomcom | varchar(150) | | Libellé de la commune |
| insee_com | varchar(150) | | Libellé de la commune |
| sirencom | varchar(9) | |  Code SIREN de la commune |
| numreg | varchar(2) | |  Code de la région |
| code_reg | varchar(2) | |  Code de la région |
| nomreg | varchar(150) | |  Libellé de la région |
| nom_reg | varchar(150) | |  Libellé de la région |
| numreg2015 | varchar(2) | |  Code de la région avant le 31 décembre 2015 |
| nomreg2015 | varchar(150) | |  Libellé de la région avant le 31 décembre 2015 |
| numdep | varchar(2) | |  Code du département |
| code_dep | varchar(2) | |  Code du département |
| nomdep | varchar(150) | |  Libellé du département |
| nom_dep | varchar(150) | |  Libellé du département |
| numepci | varchar(9)  | | Code EPCI |
| siren_epci | varchar(9)  | | Code EPCI |
| nomepci | varchar(150) | |  Libellé d'EPCI |
| typeepci | varchar(2) | |  Type d'EPCI |
| numtc | varchar(9) | |  Code du territoire de contractualisation |
| code_tc | varchar(9) | |  Code du territoire de contractualisation |
| nomtc | varchar(200) | |  Nom du territoire de contractualisation |
| nom_tc | varchar(200) | |  Nom du territoire de contractualisation |
| numcadet | varchar(11) | |  Code du territoire CADET |
| nomcadet | varchar(150) | |  Libellé du territoire CADET |
| numte | varchar(5)  | | Code du territoire d'élu |
| nomte | varchar(150) | |  Libellé du territoire d'élu |
|  |  | |  |
| adresse | text | |  Adresse >10 rue de la vallée |
| adr_cplt | text | |  Complément de l'adresse >Bâtiment 3 |
| code_post | varchar(5) | |  Code postal de la commune |
| courriel | varchar(254) | |  Courriel |
| tel_fixe | varchar(10) | |  Numéro de téléphone fixe |
| tel_mobile | varchar(10) | |  Numéro de téléphone portable |
| fax | varchar(10) | |  Numéro de fax |
| photo | text | |  Url de la photo |
| style_code | varchar(7) | |  Code couelur en hexadécimal |
| commentaire | text | |  Commentaires |
| geom | varchar(10) | | Géométrie de l'objet |
| shape | varchar(10) | | Géométrie de l'objet |
| src_geom | varchar(10) | | Code du référentiel géographique utilisé pour la saisie (référence à la table de valeur lt_src_geom) |
| annee | varchar(4) |  | Année de la donnée |
| semantique_val | boolean | | La donnée sémantique est validée |
| geometrie_val | boolean | | La géométrie est validée |
| date_sai | | | Date d'import/ajout de la donnée dans la base |
| date_maj | | | Date de mise à jour de la donnée |
|  |  | | |
|  |  | | |

Pour les données ponctuelles devant être communiquées à l'extérieur en intégrant des champs X/Y, les attributs suivants peuvent être ajoutés :

| Champ | Type | Description |
|----|----|----|
| x_l93 | numeric(9,2) | Longitutde en lambert 93 |
| y_l93 | numeric(10,2) | Latitude en lambert 93 |
| x_wgs84 | numeric(2,7) | Longitutde en WGS84 |
| y_wgs84 | numeric(1,9) | Latitude en WGS84 |


        - adresse_cplt
        - prenom
        - nom
        - fonction
        - courriel
        - site_web
        - photo
        - telephone_fixe
        - telephone_mobile
        - commentaire
        - geom
        - numcom
        - nomcom
        - code_postal
        - numdep



