#!/usr/bin/bash
if [ $# -ne 3 ]
then
    echo "Erreur : Ce programme attend 3 arguments (l'année, le mois et le nombre de lieux)."
    exit 1
fi

ANNEE=$1
MOIS=$2
NB=$3

grep -r "Location" ann/$ANNEE/$MOIS*.ann 2>/dev/null | cut -d '|' -f 2 | sort | uniq -c | sort -nr | head -n $NB
