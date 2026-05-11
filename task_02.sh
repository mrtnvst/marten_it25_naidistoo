#!/bin/bash

# Kontrollime, kas kasutaja sisestas laiendi kasurealt
if [ -z "$1" ]; then
    echo "Kasutamine: $0 <laiend>"
    echo "Näide: $0 .jpg"
    exit 1
fi

EXTENSION=$1
INPUT_FILE="random.txt"

# Kontrollime, kas fail random.txt on olemas
if [ ! -f "$INPUT_FILE" ]; then
    echo "Viga: Faili '$INPUT_FILE' ei leitud. Käivita esmalt esimene skript."
    exit 1
fi

# Loeme kokku, mitu korda laiend failis esineb
# -x tähendab täpset vastet (terve rida), et .js ei klapiks .json-iga
count=$(grep -x "$EXTENSION" "$INPUT_FILE" | wc -l)

if [ "$count" -gt 0 ]; then
    echo "Laiendit '$EXTENSION' leiti failist $count korda."
else
    echo "Laiendit '$EXTENSION' ei leitud."
fi