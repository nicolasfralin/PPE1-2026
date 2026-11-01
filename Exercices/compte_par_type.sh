#!/usr/bin/bash
ANNEE=$1
TYPE=$2
grep -r "$TYPE" ann/$ANNEE/ | wc -l
