> Časť tejto kapitoly je založené na tutorialoch Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Časť tejto kapitoly je založená na [django-marcador tutorial](http://django-marcador.keimlink.de/) licencovanej pod medzinárodnou licenciou Creative Commons Attribution-ShareAlike 4.0. Tutoriál django-marcador je autorsky chránený Markusom Zapke-Gründemannom et al.

## Virtuálne prostredie

Skôr ako nainštalujeme Django, nainštalujeme si extrémne užitočný nástroj, ktorý ti pomôže udržiavať poriadok pri programovaní na tvojom počítači. Je možné tento krok preskočiť, no veľmi ho odporúčame. Začať s najlepším možným nastavením ti ušetrí kopec problémov v budúcnosti!

Takže poďme vytvoriť **virtuálne prostredie** (alebo aj *virtualenv*). Virtualenv oddelí nastavenia Python/Django pre každý projekt zvlášť. To znamená, že zmeny, ktoré urobíš na jednej web stránke, neovplyvnia iné stránky, ktoré vyvíjaš. Šikovné, však?

Jediné, čo musíš urobiť je nájsť adresár, v ktorom chceš `virtualenv` vytvoriť, napríklad tvoj domovský adresár. Vo Windowse by mohol vyzerať napríklad `C:\Users\Meno` (kde `Meno` predstavuje tvoj login).

> **POZNÁMKA:** Vo Windowse, sa uisti, že tento adresár neobsahuje špeciálne znaky, alebo znaky s diakritikou; ak tvoje uživateľské meno obsahuje znaky s diakritikou, použi iný adresár, napr. `C:\djangogirls`.

V tomto tutoriale budeme používať nový adresár `djangogirls` v tvojom domovskom adresári:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Vytvoríme virtualenv s názvom `myenv`. Všeobecný príkaz má takýto formát:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Ak chceš vytvoriť nové `virtualenv`, musíš otvoriť príkazový riadok a spustiť `python -m venv myvenv`. Bude to vyzerať takto:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

`myvenv` je názov tvojho `virtualenv`-u. Môžeš použiť aj iný názov, ale používaj malé písmená a žiadne medzery, diakritiku alebo špeciálne znaky. Je tiež dorbé použiť krátky názov, pretože naň budeš často odkazovať!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Vytvoriť `virtualenv` na Linuxe a OS X vyžaduje iba jednoduché spustenie `python3 -m venv myvenv`. Bude to vyzerať takto:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` je názov tvojho `virtualenv`-u. Môžeš použiť aj iný názov, ale ostaň pri malých písmenách a nepoužívaj medzery. Je tiež dorbé použiť krátky názov, pretože naň budeš často odkazovať!

> **POZNÁMKA:** Niektoréverzie systému Debian/Ubuntu môžu zobraziť nasledujúcu chybu:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
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
> Obídeme to týmto príkazom `virtualenv`-u.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **POZNÁMKA:** Ak sa ti objaví chybu ako
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
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Práca s virtualenv

Vyššie uvedený príkaz vytvorí adresár s názvom `myvenv` (alebo akékoľvek meno si vybrala), ktorý obsahuje naše virtuálne prostredie (v podstate kopec adresárov a súborov).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Virtuálne prostredie spusti príkazom:

{% filename %}command-line{% endfilename %}

    C:\Users\Meno\djangogirls> myvenv\Scripts\activate
    

> **Poznámka:** Vo Windows 10 sa môže vyskytnúť chyba vo Windows PowerShell, ktorá hovorí `execution of scripts is disabled on this system`. V tomto prípade, otvor ďalší Windows PowerShell s možnosťou "Spustiť ako správca". Potom skús spustiť nasledovný príkaz predtým ako aktivuj svoje virtualenv:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Virtuálne prostredie spusti príkazom:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Nezabudni nahradiť `myvenv` názvom svojho `virtualenv`-u!

> **POZNÁMKA:** niekedy `source` nemusí byť k dispozícii. V takom prípade vyskúšaj použiť:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

To, že je `virtualenv` spustený, zistíš, keď bude príkazový riadok v konzole bude mať na začiatku `(myenv)`.

Pri práci vo virtuálnom prostredí bude `python` automaticky odkazovať na správnu verziu, takže môžeš pokojne používať `python` namiesto `python3`.

OK, všetko potrebné máme prichystané. Konečne môžeme nainštalovať Django!

## Inštalácia Djanga

Teraz keď máš `virtualenv` spustené, môžeš nainštalovať Django.

Predtým ako to urobíme, mali by sme sa uistiť, že je nainštalovaná najnovšia verzia `pip`, softvéru ktorý použijeme na inštalovanie Djanga:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python3 -m pip install --upgrade pip
    

Potom spusti `pip install django~=1.11.0` (všimni si že používame tildu po ktorej nasleduje znamienko rovná sa: `~=`) aby si nainštalovala Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install django~=1.11.0
    Collecting django~=1.11.0
      Downloading Django-1.11.3-py2.py3-none-any.whl (6.8MB)
    Installing collected packages: django
    Successfully installed django-1.11.3
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Ak sa objaví chyba pri spustení pip vo Windowse, skontroluj, či cesta/názov tvojho projektu neobsahuje medzery, diakritiku alebo špeciálne znaky (napr. `C:\Users\Tvoje Meno\djangogirls`). Ak obsahuje, mala by si zvážiť použitie iného miesta, bez medzier, diakritiky a špeciálnych znakov (napríklad: `C:\djangogirls`). Vytvor nové virtualenv v novom adresári, potom odstráň starý a zopakuj vyššie uvedený príkaz. (Presunutie virtualenv adresára nebude fungovať, lebo virtualenv používa absolútne cesty.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Príkazový riadok sa možno zamrazí po tom čo sa pokúsiš nainštalovať Django. Ak sa to stane, namiesto hore uvedeného príkazu použi:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install django~=1.11.0
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Ak sa objaví chyba pri spustejní pip v Ubuntu 12.04 spusti `python -m pip install - U --force-reinstall pip`, čím sa opraví inštalácia pip vo virtualenv-e.

<!--endsec-->

To je všetko! Teraz si už (konečne) pripravená vytvoriť Django aplikáciu!