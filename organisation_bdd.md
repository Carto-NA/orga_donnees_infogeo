## Organisation de la base de données

Les données seront stockées dans deux schémas, un pour les référentiels _[referentiel]_ et un deuxième pour les données métiers _[metier]_.

Voici la proposition de l'organisation de la base (celle-ci pourra être amené à changer en fonction des tests et remontés des utilisateurs) :


| Schéma | Description |
| :--: | :--: |
| arcgis | Faut-il le conserver ? |
| information_schema | Le schéma d'information consiste en un ensemble de vues contenant des informations sur les objets définis dans la base de données courante. |
| pg_catalog | Le schéma contient les tables systèmes et tous les types de données, fonctions et opérateurs intégrés. |
| public | Ce schéma peut servir pour les données public et est également utilisé par Postgresql pour stocker des données complémentaires. Ainsi, si le module Postgis, qui permet de manipuler des informations géographiques, est déclaré dans la base de données, environ un millier de fonctions différentes sont créées dans le schéma public.  |
| sde | Faut-il le conserver ? |
| referentiel | Contient les données issues de producteur connu ou étant concidérées comme un  référentiel par la collectivité |
| metier | Contient les données métiers gérés par la collectivité et structurées par la l'unité SIT/SIG |


Concernant les données utiles dans des projets "ponctuels", pour l'instant, nous n'avons pas fait de choix. 
	Où et comment les stocker ?
	Qui gère cette donnée ? Les cartographes, les directions métiers, … 
Mais nous sommes d'accord que cela ne peut pas être géré au niveau de la DITP, pour les raisons suivantes :
o	Délai de mise en œuvre trop court pour une intégration en base de données
o	Données exploitables à un instant t

	Pour répondre à ces besoins ponctuels, il sera proposé l'utilisation du Data Store.



Choisir la dénomination des schémas
Exemple : ref_ign_geofla_region_fr



Pour la dénomination des tables, elles seront préfixées en fonction du producteur du référentiel et pour les données métiers cela se fera en fonction de la thématique.




- referentiel (données issues de référentiel ou étant concidéré comme des référentiels par la collectivité)
	|- r_ign_geofla_region_fr **OU** ign_ref_geofla_region_fr


- metier (données métiers gérés par la collectivité)
	|-m_agr_ **OU** m_agriculture_
	|-m_eco_
	|-m_env_
	|-m_ser_
	|-m_tou_
	|-m_com_
	|-m_emp_
	|-m_for_
	|-m_lyc_
	|-m_san_
	|-m_urb_
	|-m_tra_
	|-m_log_
	|-m_ele_
	|-m_zon_

 
- xapplication (données pré-traitées pour les applications web SIG ou liés à des projets)
	|-xapp_portail_tiers_lieu
	|-


| Préfixe | Thématique | Description |
| :--: | :--: | :--: |
| m_agr | Agriculture | ... |
| m_eco | Economie | ... |
| m_env | Environnement | ... |
| m_ser | Services | ... |
| m_tou | Tourisme loisirs | ... |
| m_com | Communication TIC | ... |
| m_emp | Emploi | ... |
| m_for | Formation | ... |
| m_lyc | Lycées | ... |
| m_san | Santé | ... |
| m_urb | Urbanisme | ... |
| m_tra | Transport | ... |
| m_log | Logement | ... |
| m_ele | Election | ... |
| m_zon | Zonage | ... |
| ... | ... | ... |
