# orga_donnees_infogeo
Organisation de la base de données "information géographique"


Bonnes pratiques

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
