> Ein Teil dieses Kapitels basiert auf dem Tutorial der Geek Girls Carrots (http://django.carrots.pl/).
> 
> Teile dieses Kapitels basieren auf dem [django-marcador Tutorial](http://django-marcador.keimlink.de/) lizenziert unter Creative Commons Attribution-ShareAlike 4.0 International License. Das django-marcador Tutorial von Markus Zapke-Gründemann et al. ist urheberrechtlich geschützt.

## Virtuelle Umgebung

Bevor wir mit der Installation von Django beginnen, lernen wir ein sehr hilfreiches Tool kennen, das uns hilft, unsere Arbeitsumgebung zum Coden sauber zu halten. Es ist möglich diesen Schritt zu überspringen, aber wir legen ihn dir dennoch besonders ans Herz. Mit dem bestmöglichen Setup zu starten, wird dir in der Zukunft eine Menge Frust ersparen!

Wir erzeugen eine virtuelle Arbeitsumgebung - ein **virtual environment** oder auch *virtualenv*. Eine virtuelle Umgebung wird dein Python/Django-Setup für ein einzelnes Projekt isolieren. Das bedeutet, dass deine Änderungen an einem Website-Projekt keine anderen Projekte, an welchen du auch gerade entwickelst, beeinträchtigen. Klingt nützlich, oder?

Du musst nur das Verzeichnis festlegen, in dem du das `virtualenv` erstellen willst; zum Beispiel dein Home-Verzeichnis. Auf Windows ist dies `C:\Users\Name` (`Name` ist dein Anmeldename/Login).

In diesem Tutorial erstellen wir darin ein neues Verzeichnis `djangogirls`:

    mkdir djangogirls
    cd djangogirls
    

Wir nennen die virtuelle Umgebung `myvenv`. Das Kommando dazu lautet dann:

    python3 -m venv myvenv
    

### Windows

Um ein neues `virtualenv` zu erstellen, öffnest Du die Konsole (das kennst Du schon aus einem vorangegangenen Kapitel) und gibst `C:\Python34\python -m venv myvenv` ein. Das sieht dann so aus:

    C:\Users\Name\djangogirls> C:\Python34\python -m venv myvenv
    

`C:\Python34\python` ist das Verzeichnis in das Du zuvor Python installiert hast. `myvenv` ist der Name deiner neuen virtuellen Arbeitsumgebung, deinem neuen `virtualenv`. Du kannst auch andere Namen benutzen. Aber denk daran: nur Kleinbuchstaben, keine Leerzeichen, Akzente oder andere Sonderzeichen. Kurze Namen eignen sich gut, denn Du wirst sie oft benutzen bzw. eingeben müssen!

### Linux und OS X

Eine `virtualenv` auf Linux oder OS X anzulegen, heißt lediglich `python3 -m venv myvenv` einzugeben. Fertig. So sieht das dann aus:

    ~/djangogirls$ python3 -m venv myvenv
    

`myvenv` ist der Name deiner neuen virtuellen Arbeitsumgebung, deines neuen `virtualenv`. Andere Namen sind natürlich möglich. Bleibe bei Kleinbuchstaben und verwende keine Leerzeichen. Es ist hilfreich, die Namen kurz zu halten, denn du wirst sie oft benutzen bzw. eingeben müssen!

> **Anmerkung:** Die Einrichtung eines Virtualenv unter Ubuntu 14.04 wie beschrieben, wird mit der folgenden Fehlermeldung quittiert:
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Das zu umgehen, kannst du den `virtualenv`-Befehl verwenden.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Mit der virtuellen Umgebung arbeiten

Die obigen Kommandos erstellen ein Verzeichnis `myvenv` (bzw. den von Dir vergebenen Namen). Es enthält unsere virtuelle Arbeitsumgebung (im Wesentlichen ein paar Verzeichnisse und Dateien).

#### Windows

Starte deine virtuelle Umgebung, indem du eingibst:

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

#### Linux und OS X

Starte deine virtuelle Umgebung, indem du eingibst:

    ~/djangogirls$ source myvenv/bin/activate
    

Der Name `myvenv` muss mit dem von Dir gewählten Namen des `virtualenv` übereinstimmen!

> **Anmerkung:** Manchmal ist das Kommando `source` nicht verfügbar. In diesen Fällen geht es auch so:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Dein `virtualenv` wurde erfolgreich erstellt, wenn der Prompt der Konsole so aussieht:

    (myvenv) C:\Users\Name\djangogirls>
    

oder:

    (myvenv) ~/djangogirls$
    

Die Zeile sollte mit dem Prefix `(myvenv)` beginnen!

In Deiner neuen virtuellen Umgebung wird automatisch die richtige Version von `python` verwendet. Du kannst also `python` statt `python3` eingeben.

Ok, jetzt ist die erforderliche Umgebung startklar und wir können endlich Django installieren!

## Django Installation

Da dein `virtualenv` jetzt gestartet ist, kannst du Django mit `pip` installieren. Gib in die Konsole `pip install django==1.8` ein (beachte, dass wir zwei Gleichheitszeichen schreiben: `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

für Windows

> Wenn du auf einem Windows-Rechner einen Fehler bekommst beim Aufruf von pip, dann prüfe, ob dein Pfad Leerzeichen, Akzente oder Sonderzeichen enthält (`C:\Users\User Name\djangogirls`). Wenn das der Fall ist, dann verschiebe es an einen anderen Ort ohne Leerzeichen, Akzente oder Sonderzeichen (empfohlen: `C:\djangogirls`). Danach versuchst du die Installation am neuen Ort noch einmal.

für Linux

> Für pip mit Ubuntu 12.04 kann es zu folgendem Fehler kommen. Ruf dann `python -m pip install -U --force-reinstall pip` auf, um die Installation von pip im virtualenv zu reparieren.

Das war's! Du bist nun (endlich) bereit, deine erste Django Anwendung zu starten!