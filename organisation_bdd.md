## Organisation de la base de données

<br><br>
Les données seront stockées dans deux schémas, un pour les référentiels _[referentiel]_ et un deuxième pour les données métiers _[metier]_.

Voici la proposition de l'organisation de la base (celle-ci pourra être amené à changer en fonction des tests et remontés des utilisateurs) :

### Schéma

| Schéma | Description |
| :--: | :--: |
| arcgis | Faut-il le conserver ? |
| information_schema | Le schéma d'information consiste en un ensemble de vues contenant des informations sur les objets définis dans la base de données courante. |
| pg_catalog | Le schéma contient les tables systèmes et tous les types de données, fonctions et opérateurs intégrés. |
| public | Ce schéma peut servir pour les données public et est également utilisé par Postgresql pour stocker des données complémentaires. Ainsi, si le module Postgis, qui permet de manipuler des informations géographiques, est déclaré dans la base de données, environ un millier de fonctions différentes sont créées dans le schéma public.  |
| sde | Faut-il le conserver ? |
| referentiel | Contient les données issues de producteur connu ou étant concidérées comme un  référentiel par la collectivité |
| metier | Contient les données métiers gérés par la collectivité et structurées par la l'unité SIT/SIG |


<br><br>
Concernant les données utiles dans des projets "ponctuels", pour l'instant, nous n'avons pas fait de choix. 
* Où et comment les stocker ?
* Qui gère cette donnée ? Les cartographes, les directions métiers, … 
Mais nous sommes d'accord que cela ne peut pas être géré au niveau de la DITP, pour les raisons suivantes :
o Délai de mise en œuvre trop court pour une intégration en base de données
o Données exploitables à un instant t

==> **Pour répondre à ces besoins ponctuels, il sera proposé l'utilisation du Data Store.**

<br><br>
### Table

Pour la dénomination des tables, les données de références seront préfixées en fonction du producteur et pour les données métiers cela se fera en fonction de la thématique.

#### Référentiel

| Préfixe | Producteur | Description |
| :--: | :--: | :--: |
| ign_ | IGN | Institut national de l'information géographique et forestière |
| gisco_ | GISCO | Geographic Information System of the COmmission |
| magr_ |  | Ministère de l'agriculture |
|  |  |  |
|  |  |  |
|  |  |  |
|  |  |  |
|  |  |  |
|  |  |  |

_*Exemple :*
- referentiel (données issues de référentiel ou étant concidéré comme des référentiels par la collectivité)
	|- ign_geofla_region_fr
	|- ...
	|- gisco_nuts
	|- ...
	|- mnhn_pnr
	|- ..._
	

#### Métier

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



<br>
- metier (données métiers gérés par la collectivité)
	|- agr_ 
	|- eco_
	|- env_
	|- ser_
	|- tou_
	|- com_
	|- emp_
	|- for_
	|- lyc_
	|- san_
	|- urb_
	|- tra_
	|- log_
	|- ele_
	|- zon_

 <br>
- xapplication (données pré-traitées pour les applications web SIG ou liés à des projets)
	|-xapp_portail_tiers_lieu
	|-



