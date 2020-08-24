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
Productions nécessaires : <br>
	[x] [Guide des bonnes pratiques](guide_bonnes_pratiques.md) <br>
	[x] Phasage d'intégration de données <br>
	[x] [Organisation de la base de données](organisation_bdd.md) <br>
	[] Ensemble de procédures <br>
	[x] Modèle de dictionnaire de données <br>
	[] Calendrier de mise à jour annuel des données <br>
	[] Catalogue de données <br>
	[] Liste des référentiels géographiques utilisés auparavant <br>
	[] Schéma d'alimentation des données (admin SIG, cartographe, métier, ...) <br>
	[] ... <br>
*******

</br>

***Abandon du serveur de fichiers SHAPE ?***

Si non : 
- Le conserver pour quoi faire ? 
- Qui le gére ?
- ...

</br>

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

</br>

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

[Organisation de la base de données](organisation_bdd.md)
</br></br>



### Règles de dénomination des objets de la base de données (hors données issu de producteurs officiels)



### Dictionnaire des données

Le dictionnaire de données est utilisé pour standardiser le contenu, le contexte et la définition des données ainsi que pour assurer la cohérence et la réutilisabilité, tout en augmentant la qualité des données dans l'organisation. En définissant les éléments, ils permettent :
	* une standardisation entre les données
	* des informations de meilleure qualité
	* une meilleure compréhension
	* une intégration facile et une communication optimale entre les systèmes
	* une liste unique d'entités et d'informations
	* des informations utilisées comme descriptions
	* des relations d'entité à entité

 >[Modèle de dictionnaire de données ...](modele_dictionnaire_donnees.md)
 



	


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
