> Časť tejto kapitoly je založená na tutoriáloch Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Časť tejto kapitoly je založená na [django-marcador tutorial](http://django-marcador.keimlink.de/) pod licenciou Creative Commons Attribution-ShareAlike 4.0 International License. Tutoriál django-marcador je autorsky chránený Markusom Zapke-Gründemannom et al.

## Virtuálne prostredie

Skôr, ako nainštalujeme Django, nainštalujeme si extrémne užitočný nástroj, ktorý ti pomôže udržiavať poriadok pri programovaní na tvojom počítači. Je možné tento krok preskočiť, no veľmi ho odporúčame. Začať s najlepším možným nastavením ti ušetrí kopec problémov v budúcnosti!

Takže poďme vytvoriť **virtuálne prostredie** (alebo aj *virtualenv*). Virtualenv oddelí nastavenia Pythonu/Djanga pre každý projekt zvlášť. To znamená, že zmeny, ktoré urobíš na jednej web stránke, neovplyvnia iné stránky, ktoré vyvíjaš. Šikovné, však?

Jediné, čo musíš urobiť, je nájsť priečinok, v ktorom chceš `virtualenv` vytvoriť, napríklad tvoj domovský priečinok. Vo Windowse by mohol vyzerať napríklad `C:\Users\Meno` (kde `Meno` predstavuje tvoj login).

> **POZNÁMKA:** Vo Windowse sa uisti, že tento priečinok neobsahuje špeciálne znaky alebo znaky s diakritikou; ak tvoje uživateľské meno obsahuje znaky s diakritikou, použi iný priečinok, napr. `C:\djangogirls`.

V tomto tutoriáli budeme používať nový priečinok `djangogirls` v tvojom domovskom priečinku:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Vytvoríme virtualenv s názvom `myenv`. Všeobecný príkaz má takýto formát:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Ak chceš vytvoriť nový `virtualenv`, musíš otvoriť príkazový riadok a spustiť `python -m venv myvenv`. Bude to vyzerať takto:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

`myvenv` je názov tvojho `virtualenvu`. Môžeš použiť aj iný názov, ale používaj malé písmená a žiadne medzery, diakritiku alebo špeciálne znaky. Je tiež dobré použiť krátky názov - budeš naň často odkazovať!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and macOS" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Vytvoriť `virtualenv` na Linuxe a macOS vyžaduje spustenie `python3 -m venv myvenv`. Bude to vyzerať takto:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` je názov tvojho `virtualenvu`. Môžeš použiť aj iný názov, ale ostaň pri malých písmenách a nepoužívaj medzery. Je tiež dobré použiť krátky názov, pretože naň budeš často odkazovať!

> **POZNÁMKA:** Niektoré verzie systému Debian/Ubuntu môžu zobraziť nasledujúcu chybu:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  Na systémoch Debian/Ubuntu budeš musieť nainštalovať balíček python3-venv pomocou nasledujúceho príkazu.
>        apt install python3-venv
>     Možno budeš musieť pre tento príkaz použiť sudo.  Po nainštalovaní balíčku python3-venv si znova vytvor svoje virtuálne prostredie.
>     
> 
> V tomto prípade postupuj podľa pokynov uvedených vyššie a nainštaluj si balík `python3-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **POZNÁMKA:** V niektorých verziách Debian/Ubuntu inicializovanie virtuálneho prostredia týmto spôsobom vráti nasledovnú chybu:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Obídeme to príkazom `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python{{ book.py_version }} myvenv
>     
> 
> **POZNÁMKA:** Ak sa ti objaví chyba ako
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> potom namiesto toho spusti:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python{{ book.py_version }}-venv
>     

<!--endsec-->

## Práca s virtualenvom

Vyššie uvedený príkaz vytvorí priečinok s názvom `myvenv` (alebo akékoľvek meno si si vybrala), ktorý obsahuje naše virtuálne prostredie (v podstate kopec priečinkov a súborov).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Virtuálne prostredie spusti príkazom:

{% filename %}command-line{% endfilename %}

    C:\Users\Meno\djangogirls> myvenv\Scripts\activate
    

> **POZNÁMKA:** Vo Windowse 10 sa môže vyskytnúť chyba vo Windows PowerShelli, ktorá hovorí `execution of scripts is disabled on this system`. V tomto prípade otvor ďalší Windows PowerShell s možnosťou "Spustiť ako správca". Potom skús spustiť nasledovný príkaz predtým, než spustíš svoj virtualenv:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **POZNÁMKA:** Pre používateľky populárneho editora VS Code, ktorý má vlastný zabudovaný terminál založený na Windows PowerShell: ak chcete naďalej používať tento zabudovaný terminál, môžete spustiť nasledovný príkaz na aktiváciu virtuálneho prostredia:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> Výhoda je, že netreba skákať medzi oknami editoru a príkazovými oknami.

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and macOS" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Virtuálne prostredie spusti príkazom:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Nezabudni nahradiť `myvenv` názvom svojho `virtualenvu`!

> **POZNÁMKA:** Ak príkaz `source` nefunguje, skús namiesto neho toto:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

To, že je `virtualenv` spustený, zistíš tak, že príkazový riadok v konzole bude mať na začiatku `(myenv)`.

Pri práci vo virtuálnom prostredí bude `python` automaticky odkazovať na správnu verziu, takže môžeš pokojne používať `python` namiesto `python3`.

OK, všetko potrebné máme prichystané. Konečne môžeme nainštalovať Django!

## Inštalácia Djanga {#django}

Teraz, keď máš svoj `virtualenv` spustený, môžeš nainštalovať Django.

Predtým, než to urobíme, mali by sme sa uistiť, že je nainštalovaná najnovšia verzia `pipu`, softvéru, ktorý použijeme na inštalovanie Djanga:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Inštalácia balíčkov so závislosťami

Súbor requirements udržiava zoznam závislostí, ktoré sa nainštalujú, keď spustíš `pip install`:

Ako prvé vytvor súbor s názvom `requirements.txt` vo vnútri tvojho priečinku `djangogirls/` pomocou editora, ktorý si si nainštalovala. V editore treba otvoriť nový súbor a uložiť ho ako `requirements.txt` v priečinku `djangogirls/`. Tvoj priečinok bude vyzerať takto:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

Do súboru `djangogirls/requirements.txt` by si mala pridať nasledujúci text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Teraz spusti `pip install -r requirements.txt`, aby si nainštalovala Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.9MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Ak sa objaví chyba pri spustení pipu vo Windowse, skontroluj, či cesta/názov tvojho projektu neobsahuje medzery, diakritiku alebo špeciálne znaky (napr. `C:\Users\Tvoje Meno\djangogirls`). Ak obsahuje, mala by si zvážiť použitie iného miesta, bez medzier, diakritiky a špeciálnych znakov (napríklad: `C:\djangogirls`). Vytvor nový virtualenv v tomto novom priečinku, potom odstráň starý a zopakuj vyššie uvedený príkaz. (Presunutie virtualenv priečinku samotného nebude fungovať, lebo virtualenv používa absolútne cesty.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Príkazový riadok môže zamrznúť, keď sa pokúsiš nainštalovať Django. Ak sa to stane, namiesto hore uvedeného príkazu použi:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Ak sa objaví chyba pri spustení pipu v Ubuntu 12.04, spusti `python -m pip install - U --force-reinstall pip`, čím sa opraví inštalácia pipu vo virtualenve.

<!--endsec-->

To je všetko! Teraz si už (konečne) pripravená vytvoriť Django aplikáciu!