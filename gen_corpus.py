import os

# Données cibles extraites des corrections pour chaque année
donnees_2016 = {
    "France": 247, "Burundi": 130, "Rio": 105, "Paris": 82, "États-Unis": 73,
    "Syrie": 47, "Russie": 41, "Allemagne": 39, "Canada": 37, "Montpellier": 35,
    "Turquie": 34, "Italie": 34, "Chine": 31, "Espagne": 27, "Nice": 26
}

donnees_2017 = {
    "France": 282, "États-Unis": 79, "Syrie": 50, "Paris": 50, "Turquie": 37,
    "Russie": 36, "Italie": 35, "Irak": 28, "Europe": 26, "Royaume-Uni": 24,
    "Ukraine": 23, "Allemagne": 23, "Terre": 19, "Qatar": 18, "Israël": 17
}

donnees_2018 = {
    "France": 174, "Paris": 165, "Champs-Élysées": 76, "États-Unis": 37, "Russie": 36,
    "A9": 28, "A7": 24, "A8": 22, "Strasbourg": 21, "A62": 21,
    "A50": 21, "A61": 20, "A20": 20, "Élysée": 19, "place de la République": 18
}

# Fonction pour créer les fichiers .ann
def creer_ann(annee, dico):
    dossier = f"ann/{annee}"
    os.makedirs(dossier, exist_ok=True)
    lignes = []
    for lieu, freq in dico.items():
        for i in range(freq):
            # Format simulant une annotation : ID \t Type \t Nom_du_lieu
            lignes.append(f"T{i}\tLocation\t{lieu}\n")
    
    with open(f"{dossier}/corpus_{annee}.ann", "w", encoding="utf-8") as f:
        f.writelines(lignes)

creer_ann(2016, donnees_2016)
creer_ann(2017, donnees_2017)
creer_ann(2018, donnees_2018)

# Pour le fichier de mars (exercice 2.b)
os.makedirs("ann/2018", exist_ok=True)
donnees_mars = {
    "France": 107, "Paris": 23, "États-Unis": 20, "Montpellier": 16, "Europe": 14,
    "Russie": 13, "Terre": 12, "Royaume-Uni": 12, "Turquie": 11, "Bruxelles": 11,
    "Mars": 10, "Haïti": 10, "Syrie": 9, "Suisse": 9, "Irak": 9
}
lignes_mars = []
for lieu, freq in donnees_mars.items():
    for i in range(freq):
        lignes_mars.append(f"T{i}\tLocation\t{lieu}\n")
with open("ann/2018/2018_03_mars.ann", "w", encoding="utf-8") as f:
        f.writelines(lignes_mars)

print("Corpus de test généré avec succès !")
