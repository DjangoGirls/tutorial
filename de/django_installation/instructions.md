> Ein Teil dieser Sektion basiert auf den Tutorials von Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. Für das "django-marcador Tutorial" liegt das Urheberrecht bei Markus Zapke-Gründemann et al.

## Virtuelle Umgebung

Bevor wir mit der Installation von Django beginnen, lernen wir ein sehr hilfreiches Tool kennen, das uns hilft, unsere Arbeitsumgebung zum Coden sauber zu halten. Es ist möglich diesen Schritt zu überspringen, aber wir legen ihn dir dennoch besonders ans Herz. Mit dem bestmöglichen Setup zu starten, wird dir in der Zukunft eine Menge Frust ersparen!

Wir erzeugen eine virtuelle Arbeitsumgebung - ein **virtual environment** oder auch *virtualenv*. Eine virtuelle Umgebung wird dein Python/Django-Setup für ein einzelnes Projekt isolieren. Das bedeutet, dass deine Änderungen an einem Website-Projekt keine anderen Projekte, an welchen du auch gerade entwickelst, beeinträchtigen. Klingt nützlich, oder?

Du musst nur das Verzeichnis festlegen, in dem du das `virtualenv` erstellen willst; zum Beispiel dein Home-Verzeichnis. On Windows, it might look like `C:\Users\Name` (where `Name` is the name of your login).

> **NOTE:** On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example, `C:\djangogirls`.

In diesem Tutorial erstellen wir darin ein neues Verzeichnis `djangogirls`:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Wir nennen die virtuelle Umgebung `myvenv`. Das Kommando dazu lautet dann:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

To create a new `virtualenv`, you need to open the command prompt and run `python -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Where `myvenv` is the name of your `virtualenv`. Du kannst auch andere Namen benutzen. Aber denk daran: nur Kleinbuchstaben, keine Leerzeichen, Akzente oder andere Sonderzeichen. It is also good idea to keep the name short – you'll be referencing it a lot!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

We can create a `virtualenv` on both Linux and OS X by running `python3 -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` ist der Name deiner neuen virtuellen Arbeitsumgebung, deines neuen `virtualenv`. Andere Namen sind natürlich möglich. Bleibe bei Kleinbuchstaben und verwende keine Leerzeichen. It is also a good idea to keep the name short as you'll be referencing it a lot!

> **Hinweis:** Bei manchen Versionen von Debian/Unbuntu kann folgender Fehler auftauchen:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt-get install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt-get install python3-venv
>     
> 
> **NOTE:** On some versions of Debian/Ubuntu initiating the virtual environment like this currently gives the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Das zu umgehen, kannst du den `virtualenv`-Befehl verwenden.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt-get install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOTE:** If you get an error like
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> then instead run:
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

Starte deine virtuelle Umgebung, indem du eingibst:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **NOTE:** on Windows 10 you might get an error in the Windows PowerShell that says `execution of scripts is disabled on this system`. In this case, open another Windows PowerShell with the "Run as Administrator" option. Then try typing the following command before starting your virtual environment:
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

Starte deine virtuelle Umgebung, indem du eingibst:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Der Name `myvenv` muss mit dem von Dir gewählten Namen des `virtualenv` übereinstimmen!

> **Anmerkung:** Manchmal ist das Kommando `source` nicht verfügbar. In diesen Fällen geht es auch so:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

In Deiner neuen virtuellen Umgebung wird automatisch die richtige Version von `python` verwendet. Du kannst also `python` statt `python3` eingeben.

Ok, jetzt ist die erforderliche Umgebung startklar und wir können endlich Django installieren!

## Django Installation

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install --upgrade pip
    

Then run `pip install django~=1.11.0` (note that we use a tilde followed by an equal sign: `~=`) to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install django~=1.11.0
    Collecting django~=1.11.0
      Downloading Django-1.11.3-py2.py3-none-any.whl (6.8MB)
    Installing collected packages: django
    Successfully installed django-1.11.3
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Erstelle ein neues virtualenv in einem neuen Verzeichnis, lösche danach das alte und wiederhohle den oben genannten Befehl. (Das Verzeichnis des virtualenv zu verschieben funktioniert dabei nicht da virtualenv absolute Pfade verwendet.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Es kann sein das deine Befehlszeile einfriert wenn du versuchst Django zu installieren. Sollte das passieren nutze folgenden Befehl anstelle des oben angegebenen:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install django~=1.11.0
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Für pip mit Ubuntu 12.04 kann es zu folgendem Fehler kommen. Ruf dann `python -m pip install -U --force-reinstall pip` auf, um die Installation von pip im virtualenv zu reparieren.

<!--endsec-->

Das war's! Du bist nun (endlich) bereit, deine erste Django Anwendung zu starten!