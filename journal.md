# Journal de bord du projet encadré

---

## Séance 1 : Configuration SSH et Git
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

---

## Séance 2 : Projet - Pipelines et manipulation de flux sous Unix
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
  - Centralisation de l'intégralité des commandes fonctionnelles dans `Exercices/pipelines.txt`.

---

## Séance 3a : Git II - Correction d'erreurs et gestion de l'historique
*(Note : Les fichiers `.ann` sur lesquels je me suis appuyé afin de pouvoir compléter les exercices suivants ont été générés par un script que j'ai demandé à Gemini de créer car je ne sais pas où trouver les fichiers `.ann` d'origine.)*
- **Exercice 2.a** : Commit de l'erreur (`I AM ERROR`) et ajout de la ligne correctrice.
- **Exercice 2.b** : Annulation de l'historique public via `git revert` pour supprimer l'erreur proprement.
- **Exercice 2.c** : Création et publication du tag `git-seance2-defaire`.
- **Exercice 3** : Gestion des fichiers non suivis avec `rm` (test sur `oups.md`) pour retrouver un espace de travail propre.
- **Exercices git** : 
  - Ajout de la ligne : `Cette ligne doit rester après correction`.

---

## Séance 3b : Scripts Bash et Automatisation
*(Rappel : Les fichiers `.ann` sur lesquels je me suis appuyé afin de pouvoir compléter les exercices suivants ont été générés par un script que j'ai demandé à Gemini de créer car je ne sais pas où trouver les fichiers `.ann` d'origine.)*
- **Exercice 1** : Écriture du script `comptes.sh` utilisant une boucle `for` pour parcourir les années.
- **Exercice 2** : Création des scripts paramétrés `compte_par_type.sh`, `compte_par_type_par_an.sh` et `compte_lieux.sh` (avec prise en charge du joker `*`).
- **Exercice 3** : Ajout de la validation des arguments via des structures conditionnelles `if` et arrêt du script par `exit` en cas d'erreur.
- **Exercice 4** : Vérification de l'utilisation des boucles et documentation de l'analyse de code (dernière diapositive du cours : boucle `while read` et expressions régulières pour la validation des URLs).
