> Časť tejto kapitoly je založené na tutorialoch Geek Girls Carrots (http://django.carrots.pl/).
>
> Časť tejto kapitoly je založená na [django-marcador tutorial](http://django-marcador.keimlink.de/) licencovanej pod medzinárodnou licenciou Creative Commons Attribution-ShareAlike 4.0. Tutoriál django-marcador je autorsky chránený Markusom Zapke-Gründemannom et al.

## Virtuálne prostredie

Skôr ako nainštalujeme Django, nainštalujeme si extrémne užitočný nástroj, ktorý ti pomôže udržiavať poriadok pri kódovaní v tvojom počítači. Je možné tento krok preskočiť, no veľmi ho odporúčame. Začať s najlepším možným nastavením ti ušetrí kopec problémov v budúcnosti!

Takže poďme vytvoriť **virtuálne prostredie** (alebo aj *virtualenv*). Virtualenv oddelí nastavenia Python/Django pre každý projekt zvlášť. To znamená, že zmeny, ktoré urobíš na jednej web stránke, neovplyvnia iné stránky, ktoré vyvíjaš. Šikovné, však?

Jediné, čo musíš urobiť je nájsť adresár, v ktorom chceš `virtualenv` vytvoriť, napríklad tvoj domovský adresár. Vo Windowse by mohol vyzerať napríklad `C:\Users\Meno` (kde `Meno` predstavuje tvoj login).

V tomto tutoriale budeme používať nový adresár `djangogirls` v tvojom domovskom adresári:

```
mkdir djangogirls
cd djangogirls
```

Vytvoríme virtualenv s názvom `myenv`. Všeobecný príkaz má takýto formát:

```
python3 -m venv myvenv
```

### Windows

Ak chceš vytvoriť nový `virtualenv`, musíš otvoriť konzolu (hovorili sme o tom pár kapitol dozadu, pamätáš?) a spusti `C:\Python34\python -m venv myvenv`. Bude to vyzerať takto:

```
C:\Users\Meno\djangogirls> C:\Python34\python -m venv myvenv
```

kde `C:\Python34\python` je adresár, v ktorom máš nainštalovaný Python a `myvenv` je názov tvojho `virtualenv`-u. Môžeš použiť aj iný názov, ale používaj malé písmená a žiadne medzery, diakritiku alebo špeciálne znaky. Je tiež dobré použiť krátky názov - budeš naňho často odkazovať!

### Linux a OS X

Vytvoriť `virtualenv` na Linuxe a OS X vyžaduje iba jednoduché spustenie `python3 -m venv myvenv`. Bude to vyzerať takto:

```
~/djangogirls$ python3 -m venv myvenv
```

`myvenv` je názov tvojho `virtualenv`-u. Môžeš použiť aj iný názov, ale ostaň pri malých písmenách a nepoužívaj medzery. Je tiež dorbé použiť krátky názov, pretože naň budeš často odkazovať!

> **POZNÁMKA:** Inicializácia virtuálneho prostredie na Ubuntu 14,04 týmto spôsobom v súčasnosti dáva takúto chybu:
>
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>
>
> Obídeme to týmto príkazom `virtualenv`-u.
>
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>

## Práca s virtualenv

Vyššie uvedený príkaz vytvorí adresár s názvom `myvenv` (alebo akékoľvek meno si vybrala), ktorý obsahuje naše virtuálne prostredie (v podstate kopec adresárov a súborov).

#### Windows

Virtuálne prostredie spusti príkazom:

```
C:\Users\Meno\djangogirls> myvenv\Scripts\activate
```

#### Linux a OS X

Virtuálne prostredie spusti príkazom:

```
~/djangogirls$ source myvenv/bin/activate
```

Nezabudni nahradiť `myvenv` názvom svojho `virtualenv`-u!

> **POZNÁMKA:** niekedy `source` nemusí byť k dispozícii. V takom prípade vyskúšaj použiť:
>
>     ~/djangogirls$ . myvenv/bin/activate
>

To, že je `virtualenv` spustený, zistíš, keď bude príkazový riadok v konzole vyzerať takto:

```
(myvenv) C:\Users\Name\djangogirls>
```

alebo:

```
(myvenv) ~/djangogirls$
```

Všimni si, že sa tam objavila predpona `(myenv)`!

Pri práci vo virtuálnom prostredí bude `python` automaticky odkazovať na správnu verziu, takže môžeš pokojne používať `python` namiesto `python3`.

OK, všetko potrebné máme prichystané. Konečne môžeme nainštalovať Django!

## Inštalácia Djanga

Teraz, keď máš `virtualenv` spustený, môžeš nainštalovať Django pomocou príkazu `pip`. V konzole spusti `pip install django==1.8` (všimni si, že používame dvojité rovná sa: `==`).

```
(myvenv) ~$ pip install django==1.8
Downloading/unpacking django==1.8
Installing collected packages: django
Successfully installed django
Cleaning up...
```

vo Windowse

> Ak sa objaví chyba pri spustení pip vo Windowse, skontroluj, či cesta/názov tvojho projektu neobsahuje medzery, diakritiku alebo špeciálne znaky (napr. `C:\Users\Tvoje Meno\djangogirls`). Ak obsahuje, mala by si zvážiť presun na iné miesto, bez medzier, diakritiky a špeciálnych znakov (napríklad: `C:\djangogirls`). Po presune prosím vyskúšaj vyššie uvedený príkaz znova.

na Linuxe

> Ak sa objaví chyba pri spustejní pip v Ubuntu 12.04 spusti `python -m pip install - U --force-reinstall pip`, čím sa opraví inštalácia pip vo virtualenv-e.

To je všetko! Teraz si už (konečne) pripravená vytvoriť Django aplikáciu!
