# Journal de bord du projet encadré

---

## Séance 1 : Configuration SSH et Git I
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
*(Note : Corpus de données .ann généré par script, faute de sources originales trouvables.)*
- **Exercice 2.a** : Commit de l'erreur (`I AM ERROR`) et ajout de la ligne correctrice.
- **Exercice 2.b** : Annulation de l'historique public via `git revert` pour supprimer l'erreur proprement.
- **Exercice 2.c** : Création et publication du tag `git-seance2-defaire`.
- **Exercice 3** : Gestion des fichiers non suivis avec `rm` (test sur `oups.md`) pour retrouver un espace de travail propre.
- **Exercices git** : 
  - Ajout de la ligne : `Cette ligne doit rester après correction`.

---

## Séance 3b : Scripts Bash et Automatisation
*(Rappel : Corpus de fichiers .ann généré par script, faute de sources originales trouvables.)*
- **Exercice 1** : Écriture du script `comptes.sh` utilisant une boucle `for` pour parcourir les années.
- **Exercice 2** : Création des scripts paramétrés `compte_par_type.sh`, `compte_par_type_par_an.sh` et `compte_lieux.sh` (avec prise en charge du joker `*`).
- **Exercice 3** : Ajout de la validation des arguments via des structures conditionnelles `if` et arrêt du script par `exit` en cas d'erreur.
- **Exercice 4** : Vérification de l'utilisation des boucles et documentation de l'analyse de code (dernière diapositive du cours : boucle `while read` et expressions régulières pour la validation des URLs).

---

## Séance 4 : Scripting Bash avancé – Automatisation de l'analyse lexicale Wikipédia
==> Date du TD : Lundi 9 novembre 2026 (réalisé en autonomie et en continu)

### Ce que j'ai fait

- **De l'exploration manuelle au script automatisé** :
  - Structuration d'un pipeline complet en ligne de commande sous Linux associant l'aspiration (`wget`), la conversion textuelle (`lynx -dump`), le nettoyage par expression régulière (`sed`, `grep`), et le calcul fréquentiel (`tr`, `awk`, `sort`, `uniq`).
  - Transformation de cette chaîne de commandes en un script Bash autonome, paramétrable et exécutable (`frequence_wiki.sh`) grâce à l'attribution des droits d'exécution (`chmod +x`).

- **Diagnostic et résolution des biais de structure (Le piège du sommaire)** :
  - **Mise en évidence du problème** : Un premier découpage naïf basé sur le premier motif `[rR]éférences` trouvé dans le texte conduisait à une troncature prématurée du fichier (bloqué à ~139 lignes) car le mot apparaissait dès la table des matières initiale.
  - **Solution technique mise en œuvre** : Utilisation conjointe de `grep` et `tail -n 1` (`grep -a -n "Références" | tail -n 1`) pour cibler de manière chirurgicale la *dernière* occurrence du mot, correspondant au véritable chapitre bibliographique en bas de page.
  - **Dynamisation du script** : Injection de cette logique dans le script Bash pour qu'il s'adapte automatiquement à la longueur variable de n'importe quel article Wikipédia.

- **Gestion des flux binaires et encodages (`grep: binary file matches`)** :
  - Analyse des alertes émises par `grep` lors du traitement de flux textuels générés par `lynx` (présence de caractères non-ASCII, d'espaces insécables ou de tirets typographiques).
  - Application systématique de l'option `-a` (`--text`) sur les commandes `grep` pour forcer le traitement en mode texte brut et fluidifier l'exécution sans erreur système.

- **Normalisation et filtrage lexicale rigoureux** :
  - Suppression automatique des notes de bas de page entre crochets à l'aide de expressions régulières (`sed -E 's/\[[0-9]+\]//g'`).
  - Filtrage des résidus techniques de mise en page et d'interface hérités de l'aspiration HTML (`file`, `html`, `parser`, `thumbnail`, `button`, `section`, `afficher`, `http`, `https`, etc.).
  - Écartement des mots-outils grammaticaux (stop-words) polluant les fréquences lexicales brutes.

- **Validation empirique par analyse comparative** :
  - Test et validation croisée du script sur deux articles aux profils contrastés : **Chat** et **Chien**.
  - Observation de la pertinence des résultats obtenus : le top 20 met en évidence les spécificités sémantiques de chaque domaine (ex. surreprésentation de la taxinomie *felis / catus / domestique* pour le chat face à l'approche morphologique et sociale *races / canis / loups / homme* pour le chien).

### Pendant le cours
- **Itérations et debug pas à pas** : Analyse des sorties intermédiaires du terminal (`wc -l`, affichage des tops erronés) pour comprendre les comportements inattendus du processeur textuel.
- **Apprentissage des permissions Linux** : Manipulation concrète de la commande `chmod +x` pour comprendre la différence entre un simple fichier texte et un script exécutable doté d'un shebang (`#!/bin/bash`).
- **Gestion des arguments positionnels** : Utilisation de la variable `$1` et de la structure conditionnelle `if [ -z "$1" ]` pour sécuriser l'appel du script avec une URL obligatoire.

### Après le cours
- **Documentation méthodologique** : Structuration rigoureuse de la chaîne de traitement linguistique (acquisition -> conversion -> nettoyage -> analyse fréquentielle).
- **Consolidation du projet** : Préparation de l'intégration des scripts et des notes dans l'historique du dépôt Git du projet.

### Solutions que je veux partager
- **L'extraction de la fin de document par indexation inversée** : La combinaison de `grep -a -n "Références" | tail -n 1` couplée à `cut -d: -f1` est une astuce redoutable en Bash pour automatiser la coupe de documents structurés longs (comme les pages Wikipédia) sans se faire parasiter par les occurrences multiples situées en amont (sommaire).
- **Le contournement des alertes binaires** : L'ajout de l'option `-a` sur les `grep` d'un pipeline textuel évite que des outils comme `lynx` (qui injectent parfois des caractères spéciaux) ne bloquent ou ne polluent l'affichage standard des résultats.

### Questions à discuter
- Comment structurer un script Bash pour qu'il puisse lire itérativement un fichier contenant une liste d'URLs (ex. `urls.txt`) et exécuter ce pipeline en boucle sur chaque article, tout en gérant proprement les codes d'erreur HTTP renvoyés par les serveurs ?

---

## Mini-projet I : Récolte, métadonnées et structuration tabulaire (TSV)

**Objectif :** Récolte de corpus web à partir d'une liste d'URLs, extraction des métadonnées (code HTTP, encodage, comptage de mots) et structuration en TSV.

### Ce que j'ai fait
- **Mise en place de l'automatisation de la collecte :**
  - Écriture d'un script Bash (`miniprojet/programmes/miniprojet.sh`) gérant la lecture d'un fichier d'URLs (`urls/fr.txt`) passé en argument.
  - Intégration d'une validation des arguments positionnels (`[ -z "$1" ]`) pour interrompre immédiatement le script (`exit 1`) si le fichier en entrée est manquant.
  - Utilisation d'une boucle `while read -r line` sécurisée.
- **Extraction des métadonnées de collecte :**
  - Utilisation de `curl` pour le téléchargement et la récupération dynamique des codes de statut HTTP (`200`).
  - Récupération de l'encodage des pages.
  - Utilisation de `lynx -dump` combiné à `wc -w` pour le comptage textuel des pages valides.
  - Structuration de la sortie sous la forme d'un flux tabulaire textuel rigoureux (séparation par des tabulations), consigné dans le dossier `miniprojet/tableaux/tableau-fr.tsv`.
- **Gestion et versionnement du projet :**
  - Respect de l'arborescence attendue du dépôt (`miniprojet/programmes/`, `miniprojet/urls/`, `miniprojet/tableaux/`).
  - Création et publication sur GitHub du tag `miniprojet-1` pour valider et figer cette première étape de récolte.
- **Suivi en autonomie de l'énoncé du PDF :**
  - Réalisation pas à pas des exercices de récolte et de structuration des flux textuels en suivant les consignes de l'énoncé.

### Difficultés résolues
- Gestion des chemins relatifs lors de l'appel du script depuis la racine du dépôt et vérification de la présence des dossiers cibles.

### Compléments et tâches supplémentaires
- Approfondissement de la robustesse du script en anticipant les erreurs de liaison réseau et en structurant rigoureusement le formatage tabulaire brut pour faciliter la transition future vers des formats web.
- Amorce de la sélection du mot polysémique à étudier pour le projet de groupe en s'appuyant sur les heuristiques conseillées.

### Solutions que l'on veut partager
- L'utilisation systématique de l'option `-r` dans la boucle `while read` pour éviter que les caractères spéciaux ou les antislashs présents dans les URLs ne perturbent la lecture de ligne.
- Le couplage d'un compteur de lignes à la volée avec l'affichage tabulaire pour garder une traçabilité précise de chaque URL analysée.

---

## Mini-projet II : Transformation du flux TSV en page HTML

- **Objectif :** Remplacer le format tabulaire textuel brut par une page HTML normalisée (`tableau-fr.html`) contenant un en-tête et un corps structurés.
- **Réalisations :**
  - Adaptation du script `miniprojet/programmes/miniprojet.sh` pour générer dynamiquement du code HTML structuré (`<!DOCTYPE html>`, `<html>`, `<head>`, `<meta charset="UTF-8"/>`, `<body>`, `<table>`, `<tr>`, `<th>`, `<td>`).
  - Génération du fichier `miniprojet/tableaux/tableau-fr.html`.
  - Suppression de l'ancien fichier TSV du suivi Git.
  - Versionnage et publication du tag Git `miniprojet-2` sur GitHub.
  - Création et envoi du fichier `lien_tag_miniprojet2.txt` pointant vers la release du tag.
- **Difficultés résolues :**
  - Correction de la syntaxe et de la fermeture des balises HTML au sein de la boucle séquentielle du script.
- **Solutions partagées :**
  - Utilisation de blocs multilignes `cat << EOF` pour injecter proprement la structure statique du document HTML tout en y imbriquant l'itération dynamique des données.
