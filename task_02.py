import os
import sys

# Kontrollime kasurea argumenti
if len(sys.argv) < 2:
    print(f"Kasutamine: {sys.argv[0]} <laiend>")
    sys.exit(1)

extension = sys.argv[1]

# Määrame asukoha (skriptist üks tase ülalpool)
script_dir = os.path.dirname(os.path.realpath(__file__))
parent_dir = os.path.dirname(script_dir)
input_file = os.path.join(parent_dir, "random.txt")

if not os.path.isfile(input_file):
    print(f"Viga: Faili '{input_file}' ei leitud.")
    sys.exit(1)

# Loeme kokku täpsed vasted
count = 0
with open(input_file, 'r', encoding='utf-8') as f:
    for line in f:
        if line.strip() == extension:
            count += 1

if count > 0:
    print(f"Laiendit '{extension}' leiti failist {count} korda.")
else:
    print(f"Laiendit '{extension}' ei leitud.")