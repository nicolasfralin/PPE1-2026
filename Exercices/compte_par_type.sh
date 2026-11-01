#!/usr/bin/bash
if [ $# -ne 2 ]
then
    echo "Erreur : Ce programme attend exactement 2 arguments (l'année et le type d'entité)."
    exit 1
fi

ANNEE=$1
TYPE=$2
grep -r "$TYPE" ann/$ANNEE/ | wc -l
