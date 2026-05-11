import os
import sys

# Kontrollime, kas kasutaja sisestas laiendi kasurealt
if len(sys.argv) < 2:
    print(f"Kasutamine: {sys.argv[0]} <laiend>")
    print(f"Näide: {sys.argv[0]} .jpg")
    sys.exit(1)

extension = sys.argv[1]
input_file = "random.txt"

# Kontrollime, kas fail random.txt on olemas
if not os.path.isfile(input_file):
    print(f"Viga: Faili '{input_file}' ei leitud. Käivita esmalt esimene skript.")
    sys.exit(1)

# Loeme kokku täpsed vasted (nagu grep -x)
count = 0
with open(input_file, 'r') as f:
    for line in f:
        if line.strip() == extension:
            count += 1

# Väljastame tulemuse vastavalt leitud arvule
if count > 0:
    print(f"Laiendit '{extension}' leiti failist {count} korda.")
else:
    print(f"Laiendit '{extension}' ei leitud.")