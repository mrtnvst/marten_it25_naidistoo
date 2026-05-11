See on väga hea põhi! Kuna sa oled nüüdseks läbi teinud ka Linuxi testimise, SSH seadistamise ja automaatse mälust laadimise, siis tasub README-sse lisada just need "profi" elemendid. See näitab õpetajale, et sa ei teinud lihtsalt koodi valmis, vaid mõtlesid ka sellele, kuidas seda erinevates keskkondades mugavalt hallata.

Siin on uuendatud versioon, mis on struktureeritum, sisaldab Linuxi/Windowsi erisusi ja SSH näpunäidet.

Skriptimise Ülesanded: Universaalne Failianalüüs (Bash, Python, PowerShell)
See projekt on loodud õppetöö raames, et demonstreerida samaväärse funktsionaalsuse realiseerimist kolmes erinevas skriptimiskeeles. Rakendus on testitud ja ühildub nii Windowsi kui ka Linuxi (Debian) keskkondadega.

Projekti kirjeldus
Rakendus võimaldab manipuleerida faililaienditega:

Genereerimine: Valib lähtefailist extensions.txt suvalised laiendid ja salvestab need faili random.txt.

Loendamine: Otsib failist random.txt konkreetse laiendi esinemissagedust.

Failide struktuur
extensions.txt – Sisendfail lubatud faililaienditega (üks laiend real).

task_01.py / task_01.sh – Genereerimise skriptid (Python & Bash).

task_02.py / task_02.sh – Loendamise skriptid (Python & Bash).

TwoTask/ – PowerShelli mooduli kaust.

TwoTask.psd1 – Mooduli manifest (metadata).

TwoTask.psm1 – Mooduli funktsioonid Task01 ja Task02.

random.txt – Skriptide poolt genereeritav väljundfail.

Kasutamine erinevates keskkondades
1. PowerShell (Universaalne lahendus)
PowerShelli lahendus on ehitatud moodulina, mis kasutab dünaamilisi failiteid (Join-Path), muutes selle kasutatavaks nii Windowsis kui Linuxis (pwsh).

Mooduli laadimine otse mällu:

PowerShell
Import-Module ./TwoTask/TwoTask.psd1 -Force
Käivitusnäited:

PowerShell
Task01 -Count 100
Task02 -Extension ".jpg"
2. Python
Töötab ristiplatvormselt. Linuxis on soovitatav kasutada python3 käsku.

Bash
# Genereerimine
python3 task_01.py 100

# Loendamine
python3 task_02.py .png
3. Bash (Linux)
Enne käivitamist on vajalik anda skriptidele käivitusõigus:

Bash
chmod +x task_01.sh task_02.sh
./task_01.sh 50
./task_02.sh .txt
Administraatori märkused ja Tõrkeotsing
Execution Policy (Windows): Kui PowerShell blokeerib mooduli laadimise, kasuta:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Linuxi toetus: Mooduli testimisel Linuxis (Debian) on kasutatud pwsh (PowerShell Core) keskkonda.

Git & SSH: Projekt on seadistatud kasutama SSH-autentimist (git@github.com:...), mis välistab terminalis paroolide sisestamise vajaduse ja on turvalisem viis sünkroonimiseks.

Failiteed: Kood kasutab suhtelisi teid, eeldades, et extensions.txt asub projekti juurkaustas.

Autor
Marten
IT-süsteemide nooremspetsialisti õpe

Mis muutus?
Struktuur: Lisasin selgelt Bash skriptid ja .psd1 faili kirjelduse.

Mälust laadimine: Tõin esile -Force ja suhtelise tee ./ kasutamise, mis töötab mõlemas OS-is.

SSH märge: Lisasin märke SSH kohta – see näitab, et sa jagad biiti ka turvalisest versioonihaldusest.

Terminoloogia: Kasutasin korrektseid termineid nagu "ristplatvormne" ja "mooduli manifest".
