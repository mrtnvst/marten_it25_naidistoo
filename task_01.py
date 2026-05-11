import os
import random

os.system('cls' if os.name == 'nt' else 'clear')

# Tee leidmine (üks tase üles)
base_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
source_file = os.path.join(base_path, "laiendid.txt")
output_file = os.path.join(base_path, "random.txt")

if os.path.exists(source_file):
    with open(source_file, 'r', encoding='utf-8') as f:
        extensions = [line.strip() for line in f if line.strip()]
    
    if extensions:
        print("Lisan automaatselt 100 laiendit...")
        with open(output_file, 'a', encoding='utf-8') as f:
            # Automaatne tsükkel 100 korda
            for _ in range(100):
                chosen = random.choice(extensions)
                f.write(chosen + '\n')
        print(f"Valmis. Faili {output_file} lisati 100 rida.")
    else:
        print(f"Viga: {source_file} on tühi.")
else:
    print(f"Viga: {source_file} puudub.")