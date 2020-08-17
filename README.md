Organisation de la base de données "information géographique"
====

Ce document nous permet de définir un certain nombre de règles et bonnes pratiques pour organiser et gérer au mieux la base de données *"information géographique et territoriale"*.

Les objectifs :

	* Organiser et structurer les données de référence et métier en lien avec l’information géographique
	* Gérer et maintenir les données de référence
	* Maintenir le bon fonctionnement des bases de données
	* Distribuer et faciliter l’accessibilité aux données


	>	_**Audit :**_
	>		+ _Harmoniser les pratiques en matière de chargement et de stockage des données._
	>		+ _Améliorer et décrire les processus et les méthodes de production d'un lot de données._


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
