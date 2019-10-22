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
> 
> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

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

## Installing Django {#django}

Teraz keď máš `virtualenv` spustené, môžeš nainštalovať Django.

Predtým ako to urobíme, mali by sme sa uistiť, že je nainštalovaná najnovšia verzia `pip`, softvéru ktorý použijeme na inštalovanie Djanga:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

That's it! You're now (finally) ready to create a Django application!