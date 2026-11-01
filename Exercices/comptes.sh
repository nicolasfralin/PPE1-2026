#!/usr/bin/bash
for annee in 2016 2017 2018; do
    echo -n "$annee : "
    grep -r "Location" ann/$annee/ | wc -l
done
