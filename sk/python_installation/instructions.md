> Táto časť je založená na príručke Geek Girls Carrots (http://django.carrots.pl/)

Django je napísané v Pythone. Python potrebujeme na všetko, čo chceme robiť v Djangu. Začnime teda s inštaláciou! Chceme, aby si si nainštalovala Python 3.4, takže ak máš staršiu verziu, budeš ju musieť upgradovať.

### Windows

Python pre Windows si môžeš stiahnuť z webstránky https://www.python.org/downloads/release/python-343/. Po stiahnutí súboru ***.msi***, ho spusti (dvojklikom) a postupuj podľa inštrukcií. Je dôležité zapamätať si cestu (adresár), kde je nainštalovaný Python. Ešte to budeme potrebovať!

Jedna vec, na ktorú si treba dať pozor: na druhej obrazovke sprievodcu inštaláciou, označenej ako "Prispôsobiť" (Customize), nezabudni prejsť dole a vybrať možnosť "Pridať python.exe do Cesty", takto:

![Nezabudni pridať Python do Cesty](../python_installation/images/add_python_to_windows_path.png)

### Linux

Je veľmi pravdepodobné, že Python už máš predinštalovaný. Pre kontrolu, či je naozaj nainštalovaný (a ktorá verzia), spusti konzolu a napíš tento príkaz:

```
$ python3 -- version
Python 3.4.3
```

Ak nemáš Python nainštalovaný, alebo ak chceš inú verziu, môžeš ho nainštalovať takto:

#### Debian alebo Ubuntu

Zadaj do konzoly tento príkaz:

```
$ sudo apt-get install python3.4
```

#### Fedora (do verzie 21)

Použi v konzole tento príkaz:

```
$ sudo yum install python3.4
```

#### Fedora (od verzie 22)

Použi v konzole tento príkaz:

```
$ sudo dnf instal python3.4
```

#### openSUSE

Použi v konzole tento príkaz:

```
$ sudo zypper install python3
```

### OS X

Inštalačný program Pythonu si môžeš stiahnuť zo stránky https://www.python.org/downloads/release/python-343/:

  * Stiahni si súbor s *Mac OS X 64/32-bitovým inštalátorom*,
  * Dvojklikom na *python-3.4.3-macosx10.6.pkg* spusti inštalačný program.

Ak si chceš overiť, že inštalácia bola úspešná, otvor aplikáciu *Terminal* a spusti príkaz `python3`:

```
$ python3 -- version
Python 3.4.3
```

* * *

V prípade nejakých pochybností, alebo ak sa niečo pokazilo a nemáš tušenie, čo robiť ďalej - opýtaj sa svojho trénera! Niekedy veci nejdú úplne hladko a je lepšie požiadať o pomoc niekoho, kto má viac skúseností.
