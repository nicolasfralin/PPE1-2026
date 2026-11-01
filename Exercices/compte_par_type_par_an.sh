#!/usr/bin/bash
TYPE=$1
for annee in 2016 2017 2018; do
    echo -n "$annee : "
    ./Exercices/compte_par_type.sh $annee $TYPE
done
