![Préparation des données pour un organisme de santé publique](https://raw.githubusercontent.com/Sengsathit/OCR_data_scientist_assets/main/header_fruits.png?raw=true)

# PROJET : Réalisation d’un traitement dans un environnement Big Data sur le Cloud

Soit l'entreprise **Fruits!** une start-up spécialisée dans l'AgriTech. L’entreprise développe des solutions innovantes pour préserver la biodiversité et faciliter la récolte des fruits à l’aide de robots intelligents. Dans ce cadre, la start-up souhaite proposer une application mobile permettant aux utilisateurs d'identifier des fruits en prenant simplement une photo. Cette application sensibilisera à la biodiversité et servira de base pour le développement d’un moteur de classification d’images.

Afin de gérer les données générées par cette application, une architecture Big Data est nécessaire pour permettre le traitement et le stockage à grande échelle.

## Objectifs

1. Reprendre et compléter la chaîne de traitement existante :
- Adapter la diffusion des poids d’un modèle TensorFlow sur les clusters (broadcast des "weights").
- Élaborer une étape de réduction de dimension avec la méthode PCA, implémentée en PySpark.
2. Configurer une architecture Big Data sur le Cloud :
- Déployer et configurer un cluster AWS EMR pour exécuter les calculs distribués.
- Respecter les contraintes du RGPD en veillant à utiliser des serveurs situés en Europe.
- Optimiser les coûts d’exploitation en limitant l’utilisation des instances EMR aux tests.
- Proposer un retour critique sur la solution, incluant ses forces et ses limites.

## Structure du dépôt

- `infrastructure_as_code` : Ce dossier contient les fichiers Terraform nécessaires à la configuration et à la gestion des buckets S3 dans un environnement AWS. Ces buckets servent à stocker les données utilisées et générées dans le projet, notamment les images brutes, les features extraites et les résultats des traitements Big Data.
- `1_notebook.ipynb` : Ce notebook PySpark documente la chaîne de traitement Big Data, en reprenant et améliorant le prototype initial fourni. Il illustre toutes les étapes nécessaires pour traiter des données massives dans un environnement Cloud.
- `2_images` : Ce dossier contient les features extraites des images, au format parquet, grâce au modèle MobileNet, ainsi que les features réduites après application de la méthode PCA.
- `requirements.txt` : Liste des dépendances Python nécessaires pour exécuter les notebooks.

---