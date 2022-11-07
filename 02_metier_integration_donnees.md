Intégration des données métiers
=
*Process d’intégration*
==

* Statut
  - [ ] à rédiger
  - [x] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision
  
* Objectif :
  * Avoir une vision claire et commune des étapes nécessaire pour l'intégration
  * Définir des process d'intégration de donnée


Définition
===

Opérations qui consistent à charger des informations dans une base de données.

L’intégration de données regroupe généralement plusieurs opérations : contrôle de la source, adaptation du modèle de données et conversion de format. La procédure d’intégration dépend essentiellement de la fréquence de mise à jour de la donnée.
L’exécution peut être réalisée de manière :
* Unique, si la source n’est utilisée qu’une fois (par exemple lors de la migration d’un SGBD vers un autre).
* Continue dans le cas de données provenant en permanence de capteurs IOT
* Planifiée pour synchroniser deux systèmes à intervalle régulier
* A la demande, lorsque le producteur de données décide lui-même d’envoyer les informations dont il dispose dans le système d’information.


But
===

L’intégration de données va permettre d’homogénéiser les données et ainsi de faire « parler » les données entre elles. Cela permettra, par la suite, de répondre aux interrogations des décideurs et thématiciens grâce à des représentations et analyses plus poussées (cartographies, tableaux de bords, analyses spatiales, études …). 

Cycle du traitement de l’information.
[schéma traitement de l'information]


Etapes clés d’intégration des données
===

1. Explorer et évaluer la source

2. Définir et concevoir l’intégration

3. Effectuer des tests avec des données réelles

4. Validation des données et services


Workflow du traitement des données
===

[Schéma du workflow du traitement des données]


**_1. Réception/Collecte des données_**

La collecte des données est la première étape du traitement des données.

La source de données peut avoir plusieurs formes :
+ fichier,
+ base de données,
+ flux temps réel ou application via une API.
	
Et plusieurs origines :
+ interne,
+ open data,
+ producteur de données,
+ partenaire, administration publique.
	
**Il est important que les sources de données disponibles soient fiables et correctement structurées pour que les données importées (et utilisées par la suite sous forme d'information ou de connaissance) soient de la meilleure qualité possible.**
</br></br>

**_2. Contrôle / préparation des données_**

Après la collecte des données suit la préparation de celles-ci. La préparation des données est l’étape pendant laquelle les données brutes sont nettoyées et structurées en vue de l'étape suivante du traitement des données. Pendant cette phase de préparation, les données brutes sont vérifiées avec soin afin de déceler d'éventuelles erreurs.

Pour permettre une consolidation de données, on doit retravailler les données sources pour pouvoir analyser l'ensemble et avoir une correspondance.
On peut citer, pour une consolidation de données :
+ Codes INSEE 
++	5 caractères
++	champ au format texte

+ Civilité
++	Mr pour Monsieur
++	Mme pour Madame

+ Oui/Non à la place de 0/1 ou o/n

+ Découpage des champs
NOM Prénom dans deux champs (NOM et Prénom)

+ Conversion des dates
01/01/20017 à la place de 01 janv 2017

Il est aussi import de vérifier la dénomination et le typage des champs pour que l’importation des données puisse se faire correctement.


**L'objectif est d'éliminer les données de mauvaise qualité (redondantes, incomplètes ou incorrectes) et de commencer à créer les données de bonne qualité pour garantir la qualité des résultats.**

</br></br>

**_3. Traitement des données_**

Pendant cette étape, les données importées dans le système lors de l'étape précédente sont traitées pour interprétation. Le traitement s'effectue par exécution d'algorithmes de machine learning. Le traitement s'effectue par exécution d'algorithmes de machine learning. Toutefois, le processus peut varier légèrement selon la source des données (data lakes, réseaux sociaux, équipements connectés, etc.) et l’emploi prévu de ces données (analyse de modèles publicitaires, diagnostic médical à partir d'équipements connectés, détermination des besoins des clients, etc.).
</br></br>

**_4.	Importation des données_**

Les données propres sont ensuite importées dans leur emplacement de destination (par exemple, un système CRM tel que Salesforce ou un data warehouse tel que Redshift), et converties vers un format supporté par cette destination. L'importation des données est la première étape au cours de laquelle les données brutes commencent à se transformer en information exploitable.
</br></br>

**_5.	Stockage des données_**

La dernière étape du traitement des données est le stockage. Une fois les données traitées, elles sont stockées pour une utilisation ultérieure (certaines données sont susceptibles d’être utilisées immédiatement). De plus, les données doivent être stockées correctement afin de répondre aux exigences réglementaires en matière de protection des données telles que le RGPD. Cela permet également aux employés d’y accéder facilement et rapidement, si besoin.
</br></br>

**_6. Sortie et interprétation des données_**

Lors de l'étape de sortie/interprétation, les données deviennent exploitables par tous les employés, y compris ceux qui n'ont pas les compétences d'un data scientist. Elles sont converties, deviennent lisibles et sont généralement présentées sous forme de graphiques, vidéos, photos, texte brut, etc. Les employés disposent alors d'un accès en libre-service aux données nécessaires à leurs projets d'analytique.
</br></br>


Proposition
===

**_Proposition 1_**

Les étapes 1, 2 et 3 sont faites par le responsable du projet.
Les étapes 4 et 5 sont faites par les gestionnaires de la base de données

Plus :
Délai d’intégration et de mise à disposition plus court

Moins :



**_Proposition 2_**

Toutes les étapes sont faites par les gestionnaires de la base de données

Plus :
Cohérence du contenu (liste de domaine, formatage des champs, gestion des doublons, …)
Interopérabilité avec les autres données
Modélisation

Moins :
Délai d’intégration et de mise à disposition plus long





Données (Données internes, externes, open data, …)
Modélisation
Conception
Optimisation
Diffusion

Droits d’accès/d’utilisation


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
	[] Suivi/tableau de bord des données <br>
	[] ... <br>
*******
