# Skriptimise projekt: Kolm keelt

See projekt demonstreerib samaväärse funktsionaalsuse loomist Bashis, Pythonis ja PowerShellis. Projekt on sünkroonitud GitHubi abil Linuxi ja Windowsi masinate vahel.

## Kaustapuu struktuur
```text
marten/
├── extensions.txt       # Lähtefail 10 laiendiga
├── random.txt           # Skriptide poolt genereeritud fail
├── task_01.sh           # Bash: Genereerimine
├── task_02.sh           # Bash: Loendamine
├── task_01.py           # Python: Genereerimine
├── task_02.py           # Python: Loendamine
└── TwoTask/             # PowerShell moodul
    ├── TwoTask.psm1     # Mooduli funktsioonid
    └── TwoTask.psd1     # Mooduli manifest
Juhised käivitamiseks
1. Bash (Linux)
Esmalt anna skriptidele käivitusõigus:
chmod +x task_01.sh task_02.sh

Käivitamine:

./task_01.sh 100 (lisab 100 juhuslikku rida)

./task_02.sh .jpg (loendab esinemised)

2. Python (Windows/Linux)
Veendu, et sul on paigaldatud Python ja MS-Python laiendus VS Code-is.

Käivitamine:

python task_01.py 100

python task_02.py .jpg

3. PowerShell Moodul (Windows)
Liigu projekti kausta ja laadi moodul sisse:
Import-Module .\TwoTask\TwoTask.psd1

Kasutamine:

Task01 -Count 100

Task02 -Extension ".jpg"

Versioonihaldus
Projekti arendamisel kasutati GitHubi, et hoida kood sünkroonis Linuxi (Bash) ja Windowsi (Python/PowerShell) keskkondade vahel.

Autor: Marten