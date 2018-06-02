> Ein Teil dieses Kapitels basiert auf dem Tutorial der Geek Girls Carrots (http://django.carrots.pl/).

> Teile dieses Kapitels basieren auf dem [django-marcador Tutorial](http://django-marcador.keimlink.de/) lizenziert unter Creative Commons Attribution-ShareAlike 4.0 International License. Das django-marcador Tutorial von Markus Zapke-Gründemann et al. ist urheberrechtlich geschützt.

## Virtuelle Umgebung

Bevor wir mit der Installation von Django beginnen, lernen wir ein sehr hilfreiches Tool kennen, das uns hilft, unsere Arbeitsumgebung zum Coden sauber zu halten. Es ist möglich, diesen Schritt zu überspringen, aber wir legen ihn dir dennoch besonders ans Herz. Mit dem bestmöglichen Setup zu starten, wird dir in der Zukunft eine Menge Frust ersparen!

Wir erzeugen eine virtuelle Arbeitsumgebung - ein **virtual environment** oder auch *virtualenv*. Eine virtuelle Umgebung wird dein Python/Django-Setup für ein einzelnes Projekt isolieren. Das bedeutet, dass deine Änderungen an einem Website-Projekt keine anderen Projekte, an welchen du auch gerade entwickelst, beeinträchtigen. Klingt nützlich, oder?

Du musst nur das Verzeichnis festlegen, in dem du das `virtualenv` erstellen willst; zum Beispiel dein Home-Verzeichnis. Auf Windows ist dies `C:\Users\Name` (`Name` ist dein Anmeldename/Login).

In diesem Tutorial erstellen wir darin ein neues Verzeichnis `djangogirls`:

```bash
$ mkdir djangogirls
$ cd djangogirls
```

Wir nennen die virtuelle Umgebung `myvenv`. Das Kommando dazu lautet dann:

```bash
$ python3 -m venv myvenv
```

<!--sec data-title="Virtuelle Umgebung: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

### Windows

Um ein neues `virtualenv` zu erstellen, öffnest Du die Konsole (das kennst Du schon aus einem vorangegangenen Kapitel) und gibst `C:\Python35\python -m venv myvenv` ein. Das sieht dann so aus:

```bash
C:\Users\Name\djangogirls> C:\Python35\python -m venv myvenv
```

`C:\Python35\python` ist das Verzeichnis in das Du zuvor Python installiert hast. `myvenv` ist der Name deiner neuen virtuellen Arbeitsumgebung, deinem neuen `virtualenv`. Du kannst auch andere Namen benutzen. Aber denk daran: nur Kleinbuchstaben, keine Leerzeichen, Akzente oder andere Sonderzeichen. Kurze Namen eignen sich gut, denn Du wirst sie oft benutzen bzw. eingeben müssen!

<!--endsec-->

<!--sec data-title="Virtuelle Umgebung: Linux and macOS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

### Linux und macOS X

Eine `virtualenv` auf Linux oder macOS X anzulegen, heißt lediglich `python3 -m venv myvenv` einzugeben. Fertig. So sieht das dann aus:

```bash
~/djangogirls$ python3 -m venv myvenv
```

`myvenv` ist der Name deiner neuen virtuellen Arbeitsumgebung, deines neuen `virtualenv`. Andere Namen sind natürlich möglich. Bleibe bei Kleinbuchstaben und verwende keine Leerzeichen. Es ist hilfreich, die Namen kurz zu halten, denn du wirst sie oft benutzen bzw. eingeben müssen!

> **Anmerkung:** Die Einrichtung eines Virtualenv unter Ubuntu wie beschrieben, wird möglicherweise mit der folgenden Fehlermeldung quittiert:
>```bash
>Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>```
> 
> Das zu umgehen, kannst du den `virtualenv`-Befehl verwenden.
>```bash
>~/djangogirls$ sudo apt install python-virtualenv
>~/djangogirls$ virtualenv --python=python3.4 myvenv
>```

<!--endsec-->

## Mit der virtuellen Umgebung arbeiten

Die obigen Kommandos erstellen ein Verzeichnis `myvenv` (bzw. den von Dir vergebenen Namen). Es enthält unsere virtuelle Arbeitsumgebung (im Wesentlichen ein paar Verzeichnisse und Dateien).


<!--sec data-title="Arbeiten mit der virtuellen Umgebung: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->
#### Windows

Starte deine virtuelle Umgebung, indem du eingibst:
```bash
C:\Users\Name\djangogirls> myvenv\Scripts\activate
```
<!--endsec-->

<!--sec data-title="Arbeiten mit der virtuellen Umgebung: Linux und macOS X" data-id="virtualenv_linuxosx" data-collapse=true ces-->

#### Linux und OS X

Starte deine virtuelle Umgebung, indem du eingibst:

```bash
~/djangogirls$ source myvenv/bin/activate
```

Der Name `myvenv` muss mit dem von Dir gewählten Namen des `virtualenv` übereinstimmen!

> **Anmerkung:** Manchmal ist das Kommando `source` nicht verfügbar. In diesen Fällen geht es auch so:
>```bash
>~/djangogirls$ . myvenv/bin/activate
>```

<!--endsec-->

Dein `virtualenv` wurde erfolgreich erstellt, wenn die Eingabeaufforderung der Konsole so aussieht:

```bash
(myvenv) C:\Users\Name\djangogirls>
```

oder:

```bash
(myvenv) ~/djangogirls$
```

Die Zeile sollte mit dem Prefix `(myvenv)` beginnen!

In Deiner neuen virtuellen Umgebung wird automatisch die richtige Version von `python` verwendet. Du kannst also `python` statt `python3` eingeben.

Ok, jetzt ist die erforderliche Umgebung startklar und wir können endlich Django installieren!

## Django Installation

Da dein `virtualenv` jetzt gestartet ist, kannst du Django mit `pip` installieren.

Bevor wir das tun, versichern wir uns, dass wir die neueste Version von `pip` installiert haben, die Software, mit welcher wir Django installieren werden:

```bash
(myvenv) ~$ python3 -m pip install --upgrade pip
```

Gib in die Konsole `pip install django~=1.10.0` ein.

```bash
(myvenv) ~$ pip install django~=1.10.0
Collecting django~=1.10.0
  Downloading Django-1.10.4-py2.py3-none-any.whl (6.8MB)
Installing collected packages: django
Successfully installed django-1.10.4
```

<!--sec data-title="Django Installieren: Windows" data-id="django_err_windows"
data-collapse=true ces-->

Für Windows

> Wenn du auf einem Windows-Rechner einen Fehler bekommst beim Aufruf von pip, dann prüfe, ob dein Pfad Leerzeichen, Akzente oder Sonderzeichen enthält (`C:\Users\User Name\djangogirls`). Wenn das der Fall ist, dann verschiebe es an einen anderen Ort ohne Leerzeichen, Akzente oder Sonderzeichen (empfohlen: `C:\djangogirls`). Danach versuchst du die Installation am neuen Ort noch einmal.

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

Für Linux

> Für pip mit Ubuntu 12.04 kann es zu einem Fehler kommen. Ruf dann `python -m pip install -U --force-reinstall pip` auf, um die Installation von pip im virtualenv zu reparieren.

<!--endsec-->

Das war's! Du bist nun (endlich) bereit, deine erste Django Anwendung zu starten!
