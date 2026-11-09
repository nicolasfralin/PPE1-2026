# PPE1-2026
Programmation et Projet Encadré 1

Ce dépôt regroupe les travaux pratiques, scripts et mini-projets réalisés dans le cadre du module **PPE1** (Programmation pour les Sciences du Langage / Plurital).

## Structure du dépôt

- `miniprojet/` : Contient les éléments du **Mini-projet I** (récolte de corpus et métadonnées) :
  - `programmes/` : Scripts Bash d'automatisation (`miniprojet.sh`).
  - `urls/` : Listes de liens cibles (`fr.txt`).
  - `tableaux/` : Fichiers de résultats tabulés au format TSV (`tableau-fr.tsv`).
- `Exercices/` : Travaux pratiques et exercices abordés en cours.
- `journal.md` : Journal de bord retraçant l'historique des réalisations, les choix méthodologiques et les difficultés résolues.

## Utilisation du Mini-projet I

Pour exécuter le script de récolte et de métadonnées depuis la racine du dépôt :

```bash
./miniprojet/programmes/miniprojet.sh miniprojet/urls/fr.txt
