Organisation de la base de données sur l'information "géographique et territoriale"
====

Ce document nous permet de définir un certain nombre de règles et bonnes pratiques pour organiser et gérer au mieux la base de données sur l'information *"géographique et territoriale"*.

Les objectifs :

	* Organiser et structurer les données de référence et métier en lien avec l’information géographique
	* Gérer et maintenir les données de référence
	* Maintenir le bon fonctionnement des bases de données
	* Distribuer et faciliter l’accessibilité aux données
</br>

>**_Préconnisations de l'audit :_**
>	+ *_Harmoniser les pratiques en matière de chargement et de stockage des données._*
>	+ *_Améliorer et décrire les processus et les méthodes de production d'un lot de données._*
</br>

*******
Productions nécessaires :

	[x] Guides des bonnes pratiques pour la bdd
	[x] Phasage d'intégration de données
	[] Organisation de la base de données
	[] Ensemble de procédures
	[x] Modèle de dictionnaire de données
	[] Calendrier de mise à jour annuel des données
	[] Catalogue de données
	[] Liste des référentiels géographiques utilisés auparavant
	[] Schéma d'alimentation des données (admin SIG, cartographe, métier, ...)
	[] ...
*******
</br></br>

***Abandon du serveur de fichiers SHAPE ?***

Si non : 
- Le conserver pour quoi faire ? 
- Qui le gére ?
- ...
</br></br>

## Quelques définitions

* **Référentiel géographique et statistique**

	*Un référentiel géographique et statistique est un ensemble minimal de données complémentaires, cohérentes et maintenues, permettant de localiser directement ou indirectement des données et de produire d'autres informations géographiques (données métier, …).*

	*Ces référentiels sont produits et entretenus par des producteurs nationaux (ministère, institut, agence, ...) et locaux sont considérées comme des référentiels.* 

	*Les référentiels géographiques peuvent exister à différentes échelles, des plus petites (précision 1 km) aux plus grandes (précision quelques cm).*

* **Référentiel métier**

	*C'est une donnée thématique construite pour répondre aux besoins des services de la Région.
Les directions métiers ont la responsabilité de cette information.*

* **Identifiant signifiant**

	*C’est un identifiant qui comporte tout ou partie de l’information contenu dans les éléments de données décrivant l’objet auquel il se rapporte.*

* **Identifiant non signifiant**
	*C’est un identifiant qui ne comporte qu’une seule information : celle nécessaire à distinguer l’objet qu’il cible de son environnement.*


 ## Choix du référentiel géographique métier

Jeu de données validé par l’unité SIT/SIG comme étant un produit géographique sur lesquels peuvent s'appuyer de nouvelles constructions géométriques.

Il est ainsi possible pour l'utilisateur de :
	* superposer le référentiel géographique métier et les données métiers,
	* créer, numériser ses données métiers et les localiser sur un référentiel géographique commun.

Le choix du référentiel est capital car l'usage d'un référentiel non adapté génère des erreurs de localisation des objets pouvant avoir des conséquences importantes.
L'usage d'un référentiel géographique est indispensable pour garantir la bonne superposition des couches des différentes couches d'objets (voir exemple 1) échanger des données avec des partenaires : l'usage de référentiels différents entre partenaires ne permet pas de réutiliser les données dans de bonnes conditions, certaines aberrations pouvant apparaître (voir exemple 2)

Les objectifs du projet et son échelle influent sur le référentiel à utiliser.
Le choix du référentiel est la première étape dans le choix des données, une fois le projet défini.

***Quel référentiel géographique doit-on utiliser ?***

</br></br>

## Base de données

SIT

	Nom de la machine : [hostname]
	Adresse IP : xx.xx.xx.xx
	Port : xxxx

SIG

	Nom de la machine : [hostname]
	Adresse IP : xx.xx.xx.xx
	Port : 5432


***Dans quel cas on utilise la géométrie :***
- ESRI
	*Et quoniam apud eos ut in capite mundi morborum acerbitates celsius dominantur, ad quos vel sedandos omnis professio medendi torpescit, excogitatum est adminiculum sospitale nequi amicum perferentem similia videat, additumque est cautionibus paucis remedium aliud satis validum, ut famulos percontatum missos quem ad modum valeant noti hac aegritudine colligati, non ante recipiant domum quam lavacro purgaverint corpus. ita etiam alienis oculis visa metuitur labes.*

- PostGIS
	*Et quoniam apud eos ut in capite mundi morborum acerbitates celsius dominantur, ad quos vel sedandos omnis professio medendi torpescit, excogitatum est adminiculum sospitale nequi amicum perferentem similia videat, additumque est cautionibus paucis remedium aliud satis validum, ut famulos percontatum missos quem ad modum valeant noti hac aegritudine colligati, non ante recipiant domum quam lavacro purgaverint corpus. ita etiam alienis oculis visa metuitur labes.*


## Organisation de la base de données

- referentiel (données issues de référentiel ou étant concidéré comme des référentiels par la collectivité)
	|- r_ign_geofla_region_fr **OU** ign_ref_geofla_region_fr


- metier (données métiers gérés par la collectivité)
	|-m_agr_ **OU** m_agriculture_
	|-m_eco_
	|-m_env_
	|-m_tou_
	

 
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
| ... | ... | ... |

</br></br>


* Dictionnaire des données

Le dictionnaire de données est utilisé pour standardiser le contenu, le contexte et la définition des données ainsi que pour assurer la cohérence et la réutilisabilité, tout en augmentant la qualité des données dans l'organisation. En définissant les éléments, ils permettent :
	* une standardisation entre les données
	* des informations de meilleure qualité
	* une meilleure compréhension
	* une intégration facile et une communication optimale entre les systèmes
	* une liste unique d'entités et d'informations
	* des informations utilisées comme descriptions
	* des relations d'entité à entité



Règles de dénomination des objets de la base de données (hors données issu de producteurs officiels)
----
	
1. Les noms de schéma, table, champ, vue, ... doivent être écrit en minuscule pour éviter l’utilisation des guillemets "[nom_table]" dans les requêtes sql.

2. Pour écrire 2 mots, il faut privilégier l’utilisation d’un underscore. 
    >Exemple : il faut plutôt utiliser "date_inscription" que "DateInscription"

3. Noms de table
    * Préfixer le nom des tables
    * Utiliser un nom représentatif du contenu
    * Utiliser un seul mot lorsque c'est possible
    * Privilégier le singulier
    * Penser à des noms génériques
    

4. Noms de colonne
    * Préfixer toutes les colonnes
        >Plus pratique lorsqu’il convient d’effectuer des jointures.

    * Lorsqu’une clé étrangère est utilisée ("Foreign Key"), il est pratique de l’indiquer dans le nom de la colonne. 
        La colonne peut contenir "fk" pour Foreign Key, le préfixe,  puis le nom de la table et enfin se terminer par le nom de la colonne "code". 
        >Exemple : une colonne pourrait s’intituler "fk_m_agr_user_code" (cf. préfixe "m_agr", foreign key sur la table "user" de la colonne "code").

    * Toujours intitulé de façon similaire certain champs tel que : code INSEE, nom commune, date de mise à jours (date_maj), date de création (date_sai), ...

    >[Dénomination des champs communs ...](nom_champ.md)
    
5. Noms d'index
    * Préfixer le nom de l'index (idx_)
    * 
    
    -- Index: sidx_m_gen_dsi_localisation_site_geom
-- DROP INDEX met_gen.sidx_m_gen_dsi_localisation_site_geom;
CREATE INDEX sidx_m_gen_dsi_localisation_site_geom
    ON met_gen.m_gen_dsi_localisation_site USING gist
    (geom);



Commenter les objets
----

Les objets (schéma, table, attribut, vue, trigger, ...) contenu dans la base de données doit être commenté comme suit :

* un schéma : description succincte du contenu et de l'usage générique des données
* une table : description succincte du contenu, de l'usage et des particularités si besoin
* un attribut : libellé complet et description succincte si besoin
* une séquence : description de l'usage, de la table et de l'attribut cible
* un trigger / une fonction / une règle : description succincte de son fonctionnement
* une vue : description succincte de son contenu et de son usage

Les contraintes sur les attributs ainsi que les indexes n'ont pas d'obligation de commentaires.




titre 2 
====

titre 3
-----

### Schéma

* Dénomination des schémas

| Thématique |  Nom du schéma | Description |
| :----: | :----: | :----: |
| Agriculture | met_agr | Données métiers sur l'agriculture |
| Economie | met_eco | Données métiers sur l'économie |
| Infrastructure | met_inf | Données métiers sur les infrastructures/batiments structurant de la région | 
