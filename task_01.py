import os
import sys
import random

# Puhastame terminali (nagu 'clear' Bashis)
os.system('cls' if os.name == 'nt' else 'clear')

# Määrame failide asukohad
script_dir = os.path.dirname(os.path.realpath(__file__))
source_file = os.path.join(script_dir, "extensions.txt")
output_file = "random.txt"

# Võtame kasurealt korduste arvu, vaikimisi 1
count = int(sys.argv[1]) if len(sys.argv) > 1 else 1

# Kontrollime, kas lähtefail on olemas
if os.path.exists(source_file):
    # Loeme laiendid failist listi
    with open(source_file, 'r') as f:
        extensions = [line.strip() for line in f if line.strip()]
    
    # Kontrollime, kas fail oli tühi
    if not extensions:
        print(f"Viga: '{source_file}' on tühi.")
        sys.exit(1)

    print(f"Lisan {count} suvalist laiendit faili '{output_file}'...")
    
    # Lisame suvalised laiendid väljundfaili
    with open(output_file, 'a') as f:
        for _ in range(count):
            random_ext = random.choice(extensions)
            f.write(random_ext + '\n')
            
    print("Valmis")
else:
    print(f"Viga: Faili '{source_file}' ei leitud.")
    sys.exit(1)