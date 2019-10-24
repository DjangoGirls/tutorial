> Ein Teil dieses Kapitels basiert auf den Tutorials von Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Teile dieses Kapitels basieren auf dem [django-marcador Tutorial](http://django-marcador.keimlink.de/) lizenziert unter der Creative Commons Attribution-ShareAlike 4.0 International License. Für das "django-marcador Tutorial" liegt das Urheberrecht bei Markus Zapke-Gründemann et al.

## Virtuelle Umgebung

Bevor wir mit der Installation von Django beginnen, lernen wir ein sehr hilfreiches Tool kennen, das uns hilft, unsere Arbeitsumgebung zum Coden sauber zu halten. Es ist möglich, diesen Schritt zu überspringen, aber wir legen ihn dir dennoch besonders ans Herz. Mit dem bestmöglichen Setup zu starten, wird dir in der Zukunft eine Menge Frust ersparen!

Wir erzeugen eine virtuelle Arbeitsumgebung - ein **virtual environment** oder auch *virtualenv*. Das isoliert die Python-/Django-Setups verschiedener Projekte voneinander. Das bedeutet, dass deine Änderungen an einem Website-Projekt keine anderen Projekte beeinträchtigen, an welchen du sonst noch entwickelst. Klingt nützlich, oder?

Du musst nur das Verzeichnis festlegen, in dem du das `virtualenv` erstellen willst; zum Beispiel dein Home-Verzeichnis. Auf Windows ist dies `C:\Users\Name` (`Name` ist dein Anmeldename/Login).

> **HINWEIS:** Stelle auf Windows sicher, dass dieser Verzeichnisname keine Umlaute oder Sonderzeichen enthält. Falls dein Benutzername Umlaute enthält, verwende ein anderes Verzeichnis, zum Beispiel `C:\djangogirls`.

In diesem Tutorial erstellen wir darin ein neues Verzeichnis `djangogirls`:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Wir erstellen eine virtuelle Umgebung namens `myvenv`. Das Kommando dazu lautet dann:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Um ein neues `virtualenv` zu erzeugen, musst du auf der Kommandozeile von Windows `python -m venv myvenv` ausführen. Das wird so aussehen:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

wobei `myvenv` der Name deines `virtualenv` ist. Du kannst auch irgend einen anderen Namen wählen, aber bleibe bei Kleinbuchstaben und verwende keine Leerzeichen, Umlaute oder Sonderzeichen. Eine Gute Idee ist, den Namen kurz zu halten. Du wirst ihn oft benutzen bzw. eingeben müssen!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Auf Linux oder OS X kann ein `virtualenv` durch das Ausführen von `python3 -m venv myvenv` erzeugt werden. Das wird so aussehen:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` ist der Name deiner neuen virtuellen Arbeitsumgebung, deines neuen `virtualenv`. Du kannst auch irgend einen anderen Namen wählen, aber bleibe bei Kleinbuchstaben und verwende keine Leerzeichen. Eine Gute Idee ist, den Namen kurz zu halten. Du wirst ihn oft benutzen bzw. eingeben müssen!

> **Hinweis:** Bei manchen Versionen von Debian/Unbuntu kann folgender Fehler auftreten:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> Falls das auftritt, folge den Anweisungen in der Fehlermeldung und installiere das `python3-venv`-Paket: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **HINWEIS:** In manchen Debian/Ubuntu-Versionen kann das zu folgendem Fehler führen:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Falls das eintritt, verwende stattdessen den `virtualenv`-Befehl.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **HINWEIS:** Wenn du einen Fehler wie
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> erhältst, führe stattdessen Folgendes aus:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Mit der virtuellen Umgebung arbeiten

Die obigen Kommandos erstellen ein Verzeichnis `myvenv` (bzw. den von Dir vergebenen Namen). Es enthält unsere virtuelle Arbeitsumgebung (im Wesentlichen ein paar Verzeichnisse und Dateien).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Starte deine virtuelle Umgebung, indem du Folgendes eingibst:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **HINWEIS:** Auf Windows 10 kannst du in der Windows PowerShell die Fehlermeldung `execution of scripts is disabled on this system` erhalten. Öffne in diesem Fall eine weitere Windows PowerShell über "Als Administrator ausführen". Versuche dann, das folgende Kommando einzugeben, bevor du das virtualenv noch einmal aktivierst:
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

## Django-Installation {#django}

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Pakete mittels requirements-Datei installieren

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