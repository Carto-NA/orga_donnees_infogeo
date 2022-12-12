#-------------------------------------------------------------------------------
# Name:        00_jeux_classes_entites
# Purpose:     Script qui permet de gérer les jeux de classes d'entités dans la geodatabase ESRI
#
# Author:      vincentto
#
# Created:     12/12/2022
# Copyright:   (c) vincentto 2022
# Licence:     <your licence>
#-------------------------------------------------------------------------------

#!/usr/bin/python
# -*- coding: utf-8 -*-
# coding: utf-8

#---------------------------------#
# Import des librairies

import arcpy, os, pandas as pd, numpy as np
from datetime import date
from arcpy import env

#---------------------------------#
# On définit l'espace de travail

# On demande de saisir l'environnement de travail (prod ou preprod)
environnement_travail = input("Saisir l'environnement de travail (prod ou preprod): ")

# On test et on déclare la variable
if environnement_travail == "preprod":
    conn = "conn_preprod/preprod_metier.sde"
elif environnement_travail == "prod":
    conn = "conn_prod/prod_metier.sde"
    
# Dossier du projet
projet = r"Modele_AdminDonnees/"

# Espace de travail
arcpy.env.workspace = r"\\fileruser2\Users\vincentto\Mes documents\ArcGIS\Projects/" + projet + conn

print("Votre espace de travail est : {}".format(arcpy.env.workspace))

  
#---------------------------------#
# On définit les variables

## Creating a spatial reference object
spatial_ref = arcpy.SpatialReference(2154) # Lambert93
txt_ref_4326 = 'GEOGCS["GCS_WGS_1984",DATUM["D_WGS_1984",SPHEROID["WGS_1984",6378137.0,298.257223563]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]];-400 -400 1000000000;-100000 10000;-100000 10000;8.98315284119521E-09;0.001;0.001;IsHighPrecision'


################################################################################
## Création des jeux de classe d'entité
################################################################################

#---------------------------------#
#### 01- Jeux de classe d'entité "référentiel"

# ANCT (Agence National de la Cohésion des Territoires)
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "anct", spatial_ref)

# SEOLIS (Fournisseur d'éléctricité, de gaz et de services associés)
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "seolis", spatial_ref)

# SOREGIES (Fournisseur de gaz et d'éléctricité de la Vienne)
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "soregies", spatial_ref)

# GRDF (Gaz Réseau Distribution France)
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "grdf", spatial_ref)

# GRTgaz (GRTgaz)
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "grtgaz", spatial_ref)

# TEREGA (Anciennement TIGF)
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "terega", spatial_ref)

#---------------------------------#
#### 02- Jeux de classe d'entité "thématique"

# Territoire
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "territoire", spatial_ref)

# Economie
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "economie", spatial_ref)

# Environnement
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "environnement", spatial_ref)

# Environnement
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "energie", spatial_ref)

# Lycée
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "lycee", spatial_ref)

# z_test (sert pour les tests)
arcpy.CreateFeatureDataset_management(arcpy.env.workspace, "z_test", spatial_ref)
