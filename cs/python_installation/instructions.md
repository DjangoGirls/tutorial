> Tato podkapitola čerpá z Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django je napsán v Pythonu. Na to, abys mohla cokoliv dělat v Djangu, potřebuješ Python. Začněme s instalací! Chceme, aby sis nainstalovala verzi Python 3.4, takže pokud máš starší verzi, musíš ji upgradovat.

### Windows

Python pro Windows můžeš stáhnout z webové stránky https://www.python.org/downloads/release/python-343/. Po stažení **msi** souboru, by sis jej měla spustit (poklepáním na něj) a postupovat podle uvedených pokynů. Je důležité si zapamatovat cestu (k adresáři), kam jsi Python nainstalovala. Později jej budeš potřebovat!

Pozor na jednu věc: na druhé obrazovce průvodce instalací, označené "Přizpůsobit", se ujisti, že máš zvolenou možnost "Add python.exe to the Path":

![Nezapomeň přidat Python do cesty](../python_installation/images/add_python_to_windows_path.png)

### Linux

Je velmi pravděpodobné, že již máš Python nainstalován v základní instalaci. Chceš-li zkontrolovat, zda jej máš nainstalován (a o jakou verzi se jedná), otevři konzoli a zadej následující příkaz:

```
    $ python3 – version
    Python 3.4.2
```  

Pokud Python nemáš nainstalovaný, nebo pokud chceš nainstalovat jinou verzi, můžeš postupovat takto:

#### Debian nebo Ubuntu

Zadej tento příkaz do konzole:

```
    sudo apt-get install python3.4
```

#### Fedora (do verze 21)

Použij tento příkaz v konzoli:

```
    sudo yum install python3.4
```

#### Fedora (22 +)

Použij tento příkaz v konzoli:

```
    $ sudo dnf nainstalovat python3.4
```

#### openSUSE

Použij tento příkaz v konzoli:

```
    $ sudo zypper install python3
```

### OS X

Musíš jít na web https://www.python.org/downloads/release/python-342/ a stáhnout si instalátor Python:

  * Stáhni *Mac OS X 64-bit/32-bit installer* soubor,
  * Poklepej na *python-3.4.3-macosx10.6.pkg* Chceš-li spustit instalační program.

Ověř, zda instalace proběhla úspěšně, otevři aplikaci *Terminal* a spusť příkaz `python3`:

```
    $ python3 – version
    Python 3.4.2
```

* * *

Pokud máš nějaké pochybnosti nebo se něco při instalaci nepovedlo a ty nemáš ponětí, co dělat dál - zeptej se svého kouče! Někdy se věci nevyvíjejí hladce a je lepší požádat o pomoc někoho s více zkušenostmi.
