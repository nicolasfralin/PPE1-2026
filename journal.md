# Journal de bord du projet encadré

## Séance de travail : Configuration SSH et Git
- Résolution des problèmes d'authentification SSH avec GitHub (clé Ed25519).
- Clonage du dépôt distant `PPE1-2026` via le protocole SSH.
- Initialisation et premier commit du fichier `journal.md` au format Markdown.

### Suivi détaillé des manipulations et difficultés surmontées
- **Authentification et Sécurité SSH** :
  - *Problème rencontré* : Utilisation obligatoire du protocole SSH pour les interactions avec GitHub suite à la sécurisation des dépôts.
  - *Solution* : Configuration d'une clé SSH Ed25519 depuis le poste Linux pour permettre les publications sans erreur.
- **Gestion du dépôt et versionnement** :
  - *Clonage et Synchronisation* : Validation du dépôt local via `git clone` et vérification continue par `git status`.
  - *Bonnes pratiques* : Mise en place du fichier `.gitignore` pour filtrer les fichiers superflus.
  - *Jalon* : Pose du tag `gitintro` pour marquer la fin de la séance d'introduction.

## Projet : Pipelines et manipulation de flux sous Unix
- **Objectif** : Maîtriser la manipulation des flux de données et l'écriture de pipelines de commandes sous Unix (Bash) à l'aide d'un corpus d'annotations textuelles (`.ann`).
- **Génération du corpus de test** : 
  - Création de la structure de dossiers (`ann/2016`, `ann/2017`, `ann/2018`) via le script `gen_corpus.py`.
- **Comptage global** :
  - Génération du fichier `Exercices/comptes.txt` pour comptabiliser les lignes par année.
- **Filtrage thématique** :
  - Extraction des entités de type `Location` et production du fichier `Exercices/locations.txt`.
- **Classements statistiques** :
  - Utilisation de pipelines avancés (`cat`, `grep`, `cut`, `sort`, `uniq -c`, `tail`) pour extraire le top 15 des lieux par an et pour le mois de mars.
  - Production des fichiers `classement_2016.txt`, `classement_2017.txt`, `classement_2018.txt` et `classement_mars.txt`.
- **Documentation** :
  - Centralisation de l'intégralité des commandes fonctionnelles dans `Exercices/pipelines.txt`.# Journal de bord du projet encadré

## Séance de travail : Configuration SSH et Git
- Résolution des problèmes d'authentification SSH avec GitHub (clé Ed25519).
- Clonage du dépôt distant `PPE1-2026` via le protocole SSH.
- Initialisation et premier commit du fichier `journal.md` au format Markdown.

### Suivi détaillé des manipulations et difficultés surmontées
- **Authentification et Sécurité SSH** : 
  - *Problème rencontré* : Utilisation obligatoire du protocole SSH pour les interactions avec GitHub suite à la sécurisation des dépôts[cite: 2, 3].
  - *Solution* : Configuration d'une clé SSH Ed25519 depuis le poste Linux pour permettre les publications sans erreur.
- **Gestion du dépôt et versionnement** :
  - *Clonage et Synchronisation* : Validation du dépôt local via `git clone` et vérification continue par `git status`[cite: 3, 4].
  - *Bonnes pratiques* : Mise en place du fichier `.gitignore` pour filtrer les fichiers superflus.
  - *Jalon* : Pose du tag `gitintro` pour marquer la fin de la séance d'introduction.
