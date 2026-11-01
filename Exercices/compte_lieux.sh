#!/usr/bin/bash
ANNEE=$1
MOIS=$2
NB=$3

# Construction dynamique du chemin des fichiers en fonction des arguments (avec support du joker *)
grep -r "Location" ann/$ANNEE/$MOIS*.ann 2>/dev/null | cut -d '|' -f 2 | sort | uniq -c | sort -nr | head -n $NB
