#!/bin/bash

if [ -z "$1" ]
then
    echo "Erreur : Veuillez fournir un fichier d'URLs."
    exit 1
fi

FICHIER_URLS="$1"
FICHIER_HTML="miniprojet/tableaux/tableau-fr.html"
COMPTEUR=1

# 1. Initialisation du fichier HTML et de l'en-tête du tableau
cat << EOF > "$FICHIER_HTML"
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8"/>
    <title>Tableau Récapitulatif - Mini-projet II</title>
</head>
<body>
    <table>
        <tr>
            <th>#</th>
            <th>URL</th>
            <th>Code HTTP</th>
            <th>Encodage</th>
            <th>Nb Mots</th>
        </tr>
EOF

# 2. Boucle de lecture des URLs et génération des lignes du tableau
while read -r url; do
    [ -z "$url" ] && continue

    # Récupération du code HTTP et téléchargement temporaire de la page
    http_code=$(curl -s -L -o temp_page.html -w "%{http_code}" "$url")

    # Détection de l'encodage (via entête HTTP)
    encoding=$(curl -s -I "$url" | grep -i "charset" | head -n 1 | cut -d '=' -f 2 | tr -d '\r')
    [ -z "$encoding" ] && encoding="Inconnu"

    # Calcul du nombre de mots si la page est accessible (code 200)
    if [ "$http_code" -eq 200 ]; then
        nb_mots=$(lynx -dump -nolist temp_page.html 2>/dev/null | wc -w)
    else
        nb_mots=0
    fi

    # Ajout de la ligne HTML dans le fichier
    echo "        <tr>" >> "$FICHIER_HTML"
    echo "            <td>$COMPTEUR</td>" >> "$FICHIER_HTML"
    echo "            <td><a href=\"$url\">$url</a></td>" >> "$FICHIER_HTML"
    echo "            <td>$http_code</td>" >> "$FICHIER_HTML"
    echo "            <td>$encoding</td>" >> "$FICHIER_HTML"
    echo "            <td>$nb_mots</td>" >> "$FICHIER_HTML"
    echo "        </tr>" >> "$FICHIER_HTML"

    COMPTEUR=$((COMPTEUR + 1))
done < "$FICHIER_URLS"

# 3. Clôture de la structure HTML
cat << EOF >> "$FICHIER_HTML"
    </table>
</body>
</html>
EOF

# Nettoyage du fichier temporaire
rm -f temp_page.html

echo "Génération du fichier HTML terminée : $FICHIER_HTML"
