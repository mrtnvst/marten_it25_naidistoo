#!/bin/bash
clear

# Teed failideni (üks tase kõrgemal)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SOURCE_FILE="$SCRIPT_DIR/../laiendid.txt"
OUTPUT_FILE="$SCRIPT_DIR/../random.txt"

if [ -f "$SOURCE_FILE" ]; then
    mapfile -t extensions < "$SOURCE_FILE"
    if [ ${#extensions[@]} -eq 0 ]; then
        echo "Viga: '$SOURCE_FILE' on tühi."
        exit 1
    fi

    echo "Lisan automaatselt 100 laiendit..."
    # Automaatne tsükkel 100 korda
    for i in {1..100}; do
        random_ext="${extensions[$(( RANDOM % ${#extensions[@]} ))]}"
        echo "$random_ext" >> "$OUTPUT_FILE"
    done
    
    echo "Valmis. Faili $OUTPUT_FILE lisati 100 rida."
else
    echo "Viga: Faili '$SOURCE_FILE' ei leitud."
    exit 1
fi