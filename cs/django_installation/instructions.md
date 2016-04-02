> Část této kapitoly je založena na tutorialu Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
>
> Další část této kapitoly je založena na [django-marcador tutorial](http://django-marcador.keimlink.de/) licencováno pod Creative Commons Attribution-ShareAlike 4.0, mezinárodní licenci. Ochranou známku pro Django-marcador drží Markus Zapke-Gründemann et al.

## Virtuální prostředí

Než začneme instalovat Django, nainstalujeme si velmi užitečný nástroj, který pomůže udržet pořádek ve vývojovém prostředí na tvém počítači. Je možné tento krok přeskočit, ale je doporučován. Začít s nejlepším možným nastavením ti ušetří spoustu starostí v budoucnosti!

Takže pojďme vytvořit **virtuální prostředí** (tzv. *virtualenv*). Virtualenv bude izolovat nastavení Python/Django na základě projektu. To znamená, že změny provedené v jedné webové stránce neovlivní ostatní, které vyvíjíš. Elegantní, že?

Vše, co musíš udělat je jít do adresáře, ve kterém chceš vytvořit `virtualenv`; Například tvůj domovský adresář. V systému Windows by to mohlo vypadat takto `C:\Users\Name` (kde `Name` je jméno tvého uživatelského účtu).

Pro tento kurz budeme používat nový adresář `djangogirls` vytvořený v domovském adresáři:

```
    mkdir djangogirls
    cd djangogirls
```  

Vytvoříme virtualenv, s názvem `myvenv`. Obecný příkaz bude vypadat takto:

```
    Python3 -m venv myvenv
```  

### Windows

Chceš-li vytvořit nový `virtualenv`, je potřeba otevřít konzoli (mluvili jsme o tom v dřívější kapitole - vzpomínáš?) a spusť `C:\Python34\python -m venv myvenv`. Celý příkaz bude vypadat takto:

```
    C:\Users\Name\djangogirls > C:\Python34\python -m venv myvenv
```  

kde `C:\Python34\python` je adresář, kam jsme dříve nainstalovali Python a `myvenv` je název `virtualenv`. Můžeš použít i jiné jméno, ale používej malá písmena a nepoužívej mezery, diakritiku nebo speciální znaky. Je také dobrý nápad, abys zvolila krátké jméno - budeš ho používat častokrát!

### Linux a OS X

Vytvoření `virtualenv` na Linux a OS X je stejně jednoduché - spusť`python3 -m venv myvenv`. Celý příkaz bude vypadat takto:

```
    ~/djangogirls$ python3 -m venv myvenv
```  

`myvenv` je název `virtualenv`. Můžeš použít i jiné jméno, ale drž se těchto pravidel - používej v názvech malá písmena a bez mezer. Je dobrý nápad zvolit krátké jméno - budeš ho používat častokrát!

> **POZNÁMKA:** Vytvoření virtuálního prostředí na Ubuntu 14.04, v současné době vyhazuje následující chybu:
>
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
>
> Chceš-li se tomuto vyhnout, použij tento příkaz `virtualenv`.
>
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Práce s virtualenv

Výše uvedený příkaz vytvoří adresář s názvem `myvenv` (či jiným jménem, které jsi zvolila), který obsahuje tvé virtuální prostředí (v podstatě svazek adresářů a souborů).

#### Windows

Spusť virtuální prostředí:

```
    C:\Users\Name\djangogirls> myvenv\Scripts\activate
```  

#### Linux a OS X

Spusť virtuální prostředí:

```
    ~/djangogirls$ source myvenv/bin/activate
```  

Nezapomeň nahradit `myvenv` tvým zvoleným jménem `virtualenv`!

> **Poznámka:** někdy příkaz `source` nemusí být k dispozici. V těchto případech, zkus raději:
>
>     ~/djangogirls$ . myvenv/bin/activate
>     

Že je `virtualenv` spuštěné, poznáš pokud vidíš výzvu konzole vypadající takto:

```
    (myvenv) C:\Users\Name\djangogirls>
```  

nebo:

```
    (myvenv) ~/djangogirls$
```  

Upozornění předpona `(myvenv)` se zobrazí!

Pracuješ-li ve virtuálním prostředí, `python` bude automaticky odkazovat na správnou verzi, takže můžeš použít `python` místo `python3`.

OK máme všechny důležité závislosti na místě a konečně můžeme nainstalovat Django!

## Instalace Django

Máš své `virtualenv` nastartované a můžeš nainstalovat Django pomocí příkazu `pip`. V konzoli, spusť `pip install django == 1.8` (<0>Poznámka:</0> , používáme zde dvojité rovnítko: `==`).

```
    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
```  

v systému Windows

> Pokud se ti ukáže chyba při volání pip na platformě Windows, zkontroluj prosím, zda tvoje cesta k projektu neobsahuje mezery, diakritiku a speciální znaky (tj. `C:\Users\User Name\djangogirls`). Pokud ano zvaž přesunutí do jiného místa bez mezer, diakritiky a speciálních znaků (návrh je: `C:\djangogirls`). Po přesunutí opakuj výše uvedený příkaz.

na Linuxu

> Pokud se zobrazí chyba při volání pip na Ubuntu 12.04, prosím zkus spustit `python -m pip install -U --force-reinstall pip` k opravě instalace pip ve virtualenv.

A je to! Teď jsi (konečně) připravena k vytvoření aplikace Django!
