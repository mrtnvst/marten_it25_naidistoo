# Skriptimise Ülesanded: Faililaiendite Genereerimine ja Analüüs

See projekt on valminud õppetöö raames ning sisaldab lahendusi faililaienditega manipuleerimiseks. Rakendus on realiseeritud **Pythonis** ja **PowerShellis** (lisaks mainitud Bash-võimekusele).

## Projekti kirjeldus

Projekt koosneb kahest põhifunktsionaalsusest:
1. **Genereerimine:** Valib lähtefailist `extensions.txt` suvalised laiendid ja salvestab need faili `random.txt`.
2. **Loendamine:** Otsib failist `random.txt` konkreetse laiendi esinemissagedust.

## Failide struktuur

*   `extensions.txt` – Sisendfail, mis sisaldab nimekirja lubatud faililaienditest (üks laiend real).
*   `task_01.py` – Pythoni skript juhuslike laiendite genereerimiseks.
*   `task_02.py` – Pythoni skript laiendite loendamiseks.
*   `TwoTask/` – PowerShelli mooduli kaust.
    *   `TwoTask.psm1` – PowerShelli funktsioonid `Task01` ja `Task02`.
*   `random.txt` – Skripti käigus tekkiv väljundfail (genereeritud laiendid).

---

## Kasutamine

### Python

Veendu, et sul on Python 3 installitud.

**1. Laiendite genereerimine:**
Käivita skript ja lisa soovi korral arv, mitu rida soovid genereerida (vaikimisi 1).
```bash
python task_01.py 100
```

**2. Laiendite loendamine:**
Käivita skript ja määra otsitav laiend.
```bash
python task_02.py .jpg
```

---

### PowerShell (Moodul)

PowerShelli lahendus on üles ehitatud korduvkasutatava moodulina.

**1. Mooduli importimine:**
Liigu projekti juurkausta ja impordi moodul:
```powershell
Import-Module .\TwoTask\TwoTask.psm1
```

**2. Ülesanne 1 (Genereerimine):**
```powershell
Task01 -Count 50
```

**3. Ülesanne 2 (Loendamine):**
```powershell
Task02 -Extension ".pdf"
```

---

## Paigaldamine ja Git

Projekti kloonimiseks ja seadistamiseks:

```bash
# Klooni repositoorium
git clone <sinu-repo-url>

# Liigu kausta
cd <repo-kaust>

# Loo vajadusel extensions.txt, kui seda pole
echo ".txt" >> extensions.txt
echo ".jpg" >> extensions.txt
```

### Muudatuste üleslaadimine:
```powershell
git add .
git commit -m "Korrastatud kood ja täiendatud README"
git push origin main
```

## Autor
Marten
Skriptimise õppeaine raames loodud lahendus.

---

### Mõned näpunäited README täiendamiseks:
*   **Veaotsing:** Kui kasutad Windowsi ja PowerShell ei luba skripte käivitada, kasuta käsku: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`.
*   **Sisendfail:** Veendu, et `extensions.txt` asuks alati skriptidega samas kaustas (või muuda skriptis teed).
