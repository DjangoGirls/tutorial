> O parte din această secţiune se bazează pe Tutoriale de Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Parte din această secţiune se bazează pe [django-marcador tutorial](http://django-marcador.keimlink.de/) sub licenţa de Creative Commons Attribution-ShareAlike 4.0 International License. Django-marcador tutorial este protejat de Copyright de Markus Zapke-Gründemann et al.

## Virtual environment

Înainte de a instala Django o să treceți prin pașii de instalare a unui instrument extrem de folos pentru a păstra mediu de programare ordonat pe calculatorul vostru. Este posibil să omiteți acest pas, dar el este foarte recomandat. Porinind de la cea mai buna metodă de configurare o să vă păstrați de mulțime de probleme în viitor!

Haideți să creăm un **virtual environment** (de asemenea numit *virtualenv*). Virtualenv va izola setarea Python/Django pe bază a proiectului. Acest lucru înseamnă că orice modificare a unui singur site nu va afecta pe alte care sunt în curs de dezvoltare. Ordonat, corect?

Tot ce trebuie să faceţi este să găsiți un directoriu, în care doriţi să creaţi `virtualenv`; directoriul home, de exemplu. Pe Windows, acesta ar putea arăta ca `C:\Users\Name` (unde `Name` este numele vostru de utilizator).

> **NOTĂ:** Pe Windows, asiguraţi-vă că acest directoriu nu conţine caractere accentuate sau speciale; în cazul în care numele de utilizator conţine caractere accentuate, folosiţi un alt directoriu, de exemplu, `C:\djangogirls`.

Pentru acest tutorial vom folosi un directoriu nou `djangogirls` din directoriul home:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Vom face un virtualenv numit `myvenv`. Comanda generală va fi în format:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Pentru a crea un nou `virtualenv`, aveți nevoie de a deschide linie de comandă și să executați `python -m venv myvenv`. El va arăta în mod următor:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Unde `myvenv` este numele `virtualenv` vostru. Puteţi utiliza orice alt nume, dar preferați caracterele mici şi nu folosiți spații, accente sau caractere speciale. De asemenea, este o idee bună să păstrați numele scurt - voi o să-l menționați mult!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Putem crea un `virtualenv` atât pe Linux şi OS X prin executarea `python3 -m venv myvenv`. Acesta se va arăta astfel:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

Unde `myvenv` este numele `virtualenv` vostru. Puteţi utiliza orice alt nume, dar preferați caracterele mici şi nu folosiți spații. De asemenea, este o idee bună să păstrați numele scurt - voi o să-l menționați mult!

> **NOTĂ:** Pe unele versiuni de Debian/Ubuntu este posibil să primiţi următoarea eroare:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> În acest caz, urmaţi instrucţiunile de mai sus şi instalați pachetul de `python3-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **NOTĂ:** Pe unele versiuni de Debian/Ubuntu crearea environment-ului virtual în fel respectiv dă eroarea următoare:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Pentru a rezolva problema respectivă, folosiți de comanda `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOTĂ:** Dacă primiţi eroarea următoare
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> atunci executați:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Lucru cu virtualenv

Comanda de sus va crea un directoriu numit `myvenv` (sau alt nume pe care ați ales) care conține environment-ul virtual (în principiu o colecție de directoriu și fișiere).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Porniţi environment-ul virtual prin executarea:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **Notă:** Pe Windows 10 e posibil să primiţi o eroare în Windows PowerShell care spune `execution of scripts is disabled on this system`. În cazul acesta deschideți un alt Windows PowerShell, selectând opțiunea "Run as Administrator". Apoi, încercaţi să executați următoarea comandă înainte de a porni environment-ul virtual:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Start your virtual environment by running:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Remember to replace `myvenv` with your chosen `virtualenv` name!

> **NOTE:** sometimes `source` might not be available. In those cases try doing this instead:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

OK, we have all important dependencies in place. We can finally install Django!

## Installing Django {#django}

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Instalarea pachetelor cu requirements

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