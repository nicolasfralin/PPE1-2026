# Journal de bord du projet encadré

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
