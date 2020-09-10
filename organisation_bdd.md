## Organisation de la base de données

<br><br>
Les données seront stockées dans deux schémas, un pour les référentiels _[referentiel]_ et un deuxième pour les données métiers _[metier]_. Les autres schémas sont utilisés par postgre pour contenir des informations.

Voici la proposition de l'organisation de la base (celle-ci pourra être amené à changer en fonction des tests et remontés des utilisateurs) :

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

Les données de références seront stockées dans leurs formes d’origines (nom de colonne, contenu, ...).

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
>    _|- ign_geofla_region_fr_<br>
>    _|- ..._<br>
>    _|- gisco_nuts_<br>
>    _|- ..._<br>
>    _|- mnhn_pnr_<br>
>    _|- ..._<br>
	
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

