Organisation de la base de données "information géographique"
====

Ce document nous permet de définir un certain nombre de règles et bonnes pratiques pour organiser et gérer au mieux la base de données *"information géographique"*.

* Organiser et structurer les données de référence et métier en lien avec l’information géographique
* Gérer et maintenir les données de référence
* Maintenir le bon fonctionnement des bases de données
* Distribuer et faciliter l’accessibilité aux données


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
    




titre 2 
====

titre 3
-----

### Schéma

* Ne pas utiliser les mots réservés
    https://www.postgresql.org/docs/9.2/sql-keywords-appendix.html
    
    Exemples : date, and, all, ...

* Ne pas utiliser de caractères spéciaux

* Eviter les majuscules
    Pour écrire 2 mots, il faut privilégier l’utilisation d’un underscore. 
    
    Exemple : il faut plutôt utiliser "date_inscription" que "DateInscription"
    
* Eviter l'utilisation d'abréviation 


== Noms de tables

* Utiliser un nom représentatif du contenu

* Utiliser un seul mot lorsque c'est possible

* Privilégier le singulier

* Penser à des noms génériques

* Préfixer les noms des tables
