## Organisation de la base de données

<br><br>
Les données seront stockées dans plusieurs schémas, un pour les référentiels _[referentiel]_ et plusieurs pour les données métiers qui seront organisés par thématique _[agriculture]_, _[environnement]_, _[culture]_, _[...]_. Les autres schémas sont utilisés par postgre pour contenir des informations.

Voici la proposition de l'organisation de la base (celle-ci pourra être amené à changer en fonction des tests et remontés des utilisateurs) :


### Rôle

| Rôle | Description | 
| :--: | :--: |
| sde |  |
| referentiel |  |
| metier |  |
| agriculture_ro | Rôle pour le schéma "agr" |
| culture_ro |  |
| economie_ro |  |
| environnement_ro |  |
| viewer_ro |  |
| editor_ro |  |
| publisher_ro |  |
| viewer_all_schema_ro | Rôle permettant de regrouper les utilisateurs qui ont le droit de lecture sur tout les schémas  |
| culture_schema_ro | Rôle permettant de regrouper les utilisateurs qui ont le droit de lecture sur le schéma "culture" |
| agriculture_schema_ro | Rôle permettant de regrouper les utilisateurs qui ont le droit de lecture sur le schéma "agriculture" |
| environnement_schema_ro | Rôle permettant de regrouper les utilisateurs qui ont le droit de lecture sur le schéma "environnement" |
| environnement_schema_ro | Rôle permettant de regrouper les utilisateurs qui ont le droit de lecture sur le schéma "environnement" |


### Compte utilisateur 

| Compte utilisateur | Description | appartient à |
| :--: | :--: | :--: |
| sde |  |  |
| referentiel |  |  |
| metier | _A supprimer_  |  |
| agr | Utilisateur pour le schéma "agr" | view_all_schema_ro, agriculture_ro |
| eco | Utilisateur ayant les droits de lecture sur le schéma "eco" | view_all_schema_ro, economie_ro |
| env | Utilisateur ayant les droits de lecture sur  le schéma "env" | view_all_schema_ro, environnement_ro |
| cul | Utilisateur ayant les droits de lecture sur  le schéma "cul" | view_all_schema_ro, culture_ro |
| user1 |  | editor_ro |
| user2 |  | editor_ro |
| user3 |  | editor_ro, publisher_ro |
| user4 |  |  |
| user5 |  |  |
| cartographe | Compte utilisé par les cartographes | view_all_schema_ro |
| vincentto |  |  |
| capellie |  |  |
| c-lidier |  |  |
| chollonjj |  |  |
| v-janvier |  |  |


donner l’accès en lecture à un utilisateur, sur l’ensemble des objets d’une base de données (schémas, tables, vues, séquences…)

Il faut donc procéder en plusieurs étapes.

autoriser le user sur le schéma.
ma_base=# GRANT USAGE ON SCHEMA mon_schema TO mon_user_read_only ;


Connecté en tant que user postgres, autoriser le user en lecture sur toutes les tables, vues et séquences existantes du schéma :
ma_base=# GRANT SELECT ON ALL TABLES IN SCHEMA mon_schema TO mon_user_read_only ;
ma_base=# GRANT SELECT ON ALL SEQUENCES IN SCHEMA mon_schema TO mon_user_read_only ;

 
Connecté en tant que user postgres, autoriser le user en lecture sur toutes les futures tables, vues et séquences qui seront créées dans le schéma par le user postgres :
ma_base=# ALTER DEFAULT PRIVILEGES IN SCHEMA mon_schema GRANT SELECT ON TABLES TO mon_user_read_only ;
ma_base=# ALTER DEFAULT PRIVILEGES IN SCHEMA mon_schema GRANT SELECT ON SEQUENCES TO mon_user_read_only ;


### Droits attribués

Les commandes doivent être tapées en étant connecté dans la base de données.

#### En lecture

grant usage on schema referentiel to viewer_ro;
grant select on all tables in schema reerentiel to viewer_ro;
grant execute on all functions in schema public to viewer_ro;

#### En écriture

grant usage on schema public to group base_rw;
grant select, insert, update, delete on all tables in schema public to group editor_ro;
grant all on all functions in schema public to group editor_ro;
grant all on all sequences in schema public to group editor_ro;


#### Définir les droits par défaut

*Ne s'applique que pour les objets créés par la suite dans la base*

Connecté en tant que referentiel :

alter default privileges in schema referentiel grant select on tables to group viewer_all_schema_ro;
alter default privileges in schema referentiel grant execute on  functions to group viewer_all_schema_ro;
 

=====

grant usage on schema referentiel to viewer_all_schema_ro;
grant select on all tables in schema referentiel to viewer_all_schema_ro;
--grant execute on all functions in schema public to viewer_all_schema_ro;
alter default privileges in schema referentiel grant select on tables to viewer_all_schema_ro;
--alter default privileges in schema referentiel grant execute on  functions to viewer_all_schema_ro;


### Schéma

| Schéma | Description |
| :--: | :--: |
| arcgis | Faut-il le conserver ? |
| information_schema | Ce schéma contient un ensemble de vues contenant des informations sur les objets définis dans la base de données courante. |
| pg_catalog | Ce schéma contient les tables systèmes et tous les types de données, fonctions et opérateurs intégrés. |
| public | Ce schéma peut servir pour les données public et est également utilisé par Postgresql pour stocker des données complémentaires. Ainsi, si le module Postgis, qui permet de manipuler des informations géographiques, est déclaré dans la base de données, environ un millier de fonctions différentes sont créées dans le schéma public.  |
| sde | Faut-il le conserver ? |
| **referentiel** | Ce schéma contient les données issues de producteur connu ou étant concidérées comme un  référentiel par la collectivité |
| **metier** | Ce schéma contient les données métiers gérés par la collectivité et structurées par la l'unité SIT/SIG |


<br><br>
Concernant les données utiles à des projets "ponctuels", pour l'instant, nous n'avons pas fait de choix. 
* Où et comment les stocker ?
* Qui gère cette donnée ? Les cartographes, les directions métiers, … 
Mais nous sommes d'accord que cela ne peut pas être géré au niveau de la DITP, pour les raisons suivantes :
o Délai de mise en œuvre trop court pour une intégration en base de données
o Données exploitables à un instant t

==> **Pour l'instant, la réponse  qui peut être apportée, c'est l'utilisation du Data Store (personnel).**

<br><br>
### Table

Pour la dénomination des tables, les données de références seront préfixées en fonction du producteur et les données métiers cela se fera en fonction de la thématique.

>_*Les données du SIT nécessaire aux applications SIG seront dupliquées d'une base à l'autre (base SIT --> base ESRI).*_


##### Référentiel

Les données de références seront stockées dans leurs formes d’origines (nom de colonne, contenu, ...). Avec à l'intérieur des jeux de classe d'entité pour ranger le données par fournisseur (IGN, BRGE, Sandre, ...) .

<br>

| Préfixe | Acronyme | Producteur | Description |
| :--: | :--: | :--: | :--: |
| ign_ | IGN | Institut national de l'information géographique et forestière | L’Institut national de l'information géographique et forestière est un établissement public à caractère administratif ayant pour mission d'assurer la production, l'entretien et la diffusion de l'information géographique de référence en France. |
| gisco_ | GISCO | Geographic Information System of the COmmission | GISCO est chargé de répondre aux besoins d'information géographique de la Commission européenne à 3 niveaux: l'Union européenne, ses pays membres et ses régions. |
| magr_ |  | Ministère de l'agriculture | Le ministère de l’Agriculture et de l'Alimentation est l’administration chargée de la politique agricole, halieutique, alimentaire et forestière.  |
| insee_ | INSEE | Institut national de la statistique et des études économiques | L’Institut national de la statistique et des études économiques est chargé de la production, de l'analyse et de la publication des statistiques officielles en France : comptabilité nationale annuelle et trimestrielle, évaluation de la démographie nationale, du taux de chômage, etc.  |
| brgm_ | BRGM | Bureau de Recherches Géologiques et Minières | Le BRGM est l'organisme public français de référence dans le domaine des sciences de la Terre pour la gestion des ressources naturelles et des risques du sol et du sous-sol. C'est le service géologique national français |
| inra_ | INRA | Institut national de la recherche agronomique | L'Institut national de la recherche agronomique (INRA) était un organisme français de recherche en agronomie existant de 1946 à 2019. L'institut fusionne le 1er janvier 2020 avec l'IRSTEA pour former l'Institut national de recherche pour l'agriculture, l'alimentation et l'environnement (INRAE). |
| menv_ |  | Ministère de l'environnement |  |
| mnhn_ | MNHN | Muséum national d'histoire naturel | Le Muséum national d'histoire naturelle est un établissement français d'enseignement, de recherche et de diffusion de la culture scientifique naturaliste. |
| cren_ | CREN | Conservatoire régional des espaces naturels |  |
|  |  |  |  |


>_**Exemple :**_<br>
> _referentiel_<br>
>   _|ign
>>    _|- ign_ade_region_fr_<br>
>>    _|- ign_ade_departement_fr_<br>
>>    _|- ign_geofla_region_fr_<br>
>>    _|- ..._<br>
>   _|gisco
>>    _|- gisco_nuts_<br>
>>    _|- ..._<br>
>   _|mnhn
>>    _|- mnhn_pnr_<br>
>>    _|- ..._<br>
	
<br><br>

##### Métier

<br>

>_*Pas de règle particulière pour la dénomination des éléments (tables, champs, clé,…), chacun fait comme bon lui semble.*_

<br>

| Préfixe | Thématique | Description |
| :--: | :--: | :--: |
| agr_ | Agriculture | Retrouvez ici les données relatives aux thèmes suivants: Plan de Compétitivité et d’Adaptation des Exploitations agricoles (PCAE), ...  |
| com_ | Communication TIC | ... |
| cul_ | Culture | Retrouvez ici les données relatives aux thèmes suivants :  spectacle vivant, … |
| dat_ | DATAR | Retrouvez ici les données relatives aux thèmes suivants :  CMT, AMI, CADET, SRADDET, … |
| eco_ | Economie | ... |
| ele_ | Election | ... |
| emp_ | Emploi | ... |
| env_ | Environnement | Retrouvez ici les données relatives aux thèmes suivants : écologie, développement durable, énergie… |
| for_ | Formation | ... |
| log_ | Logement | Retrouvez ici les données relatives aux thèmes suivants :  logement... |
| lyc_ | Lycées | ... |
| san_ | Santé | Retrouvez ici les données relatives aux thèmes suivants : les établissements de santé... |
| ser_ | Services | ... |
| tou_ | Tourisme loisirs | ... |
| tra_ | Transport | Schéma pour les données métiers sur le Transport |
| urb_ | Urbanisme | ... |
| zon_ | Zonage | ... |
| ... | ... | ... |


>_**Exemple :**_<br>
> _metier_<br>
>    _|- agr_<br>
>    _|- eco_<br>
>    _|- env_<br>
>    _|- serv_<br>
>    _|- tou_<br>
>    _|- ..._<br>

 <br>
 
 **En attente de validation**
 Données pré-traitées pour les applications web SIG ou liés à des projets
 <br>
 
>_**Exemple :**_<br>
> _xapplication_<br>
>    _|- xapp_portail_tiers_lieu<br>
>    _|- ..._<br>

