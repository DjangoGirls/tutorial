# Veröffentlichen!

> **Hinweis:** Durch das folgende Kapitel muss man sich manchmal durchbeißen. Bleib dran und gib nicht auf; die Website zu veröffentlichen, ist ein sehr wichtiger Schritt. Dieses Kapitel ist in der Mitte des Tutorials platziert, damit dir dein Mentor mit dem etwas anspruchsvolleren Vorgang der Veröffentlichung deiner Website helfen kann. Den Rest des Tutorials kannst du dann auch alleine beenden, sollte die Zeit nicht ausreichen.

Bis jetzt war deine Webseite nur auf deinem Computer verfügbar. Jetzt wirst du lernen wie du sie 'deployst'! Deployen bedeutet, dass du deine Anwendung im Internet veröffentlichst, so dass endlich jeder darauf zugreifen kann. :)

Wie du schon gelernt hast, muss eine Webseite auf einem Server liegen. Es gibt eine Vielzahl von Hosting (Server)-Anbietern im Internet, wir werden [PythonAnywhere](https://www.pythonanywhere.com/) verwenden. PythonAnywhere ist kostenlos für kleine Anwendungen, die nicht von vielen Besuchern aufgerufen werden. Also erstmal genau das Richtige für dich.

Als weiteren externen Dienst werden wir [GitHub](https://www.github.com) nutzen, einen "Code Hosting"-Dienst. Es gibt noch andere solcher Dienste, aber die meisten Programmierer haben heute ein Konto bei GitHub, und du auch gleich!

Diese drei Orte werden für dich wichtig sein. Die Entwicklung und das Testen wirst du auf deinem lokalen Rechner durchführen. Wenn du mit deinen Änderungen zufrieden bist, wirst du eine Kopie deines Programms auf GitHub veröffentlichen. Deine Website wird auf PythonAnywhere gehostet werden. Ändern kannst du sie, indem du eine neue Version deines Codes von GitHub herunter lädst.

# Git

> **Hinweis:** Falls du die [Installationsschritte](../installation/README.md) bereits durchgeführt hast, kannst du mit dem nächsten Abschnitt fortfahren und anfangen, dein Git-Repository zu erstellen.

{% include "/deploy/install_git.md" %}

## Unser Git-Repository

Git verwaltet die Veränderungen an einer Sammlung von Dateien in einem sogenannten Repository (oder kurz "Repo"). Legen wir eines für unser Projekt an. Öffne deine Konsole und gibt folgende Kommandos im `djangogirls`-Verzeichnis ein:

> **Hinweis:** Überprüfe dein aktuelles Arbeitsverzeichnis mit dem Befehl `pwd` (OSX/Linux) oder `cd` (Windows) bevor du das Repository initialisierst. Du musst dich im `djangogirls`-Verzeichnis befinden, bevor du fortfährst.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Dein Name"
    $ git config --global user.email du@example.com
    

Die Initialisierung des Git-Repositorys müssen wir für jedes Projekt nur einmal machen (danach musst Du Benutzernamen und Mail-Adresse nie wieder eingeben).

Git wird die Änderungen an all den Dateien und Ordnern in diesem Verzeichnis aufzeichnen. Wir wollen aber, dass einige Dateien ignoriert werden. Dazu legen wir eine Datei `.gitignore` im Hauptordner (`djangogirls`) des Repos an. Öffne deinen Editor und erstelle eine neue Datei mit dem folgenden Inhalt:

{% filename %}.gitignore{% endfilename %}

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder
    static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

Speichere die Datei mit dem Namen `.gitignore` im "djangogirls"-Root-Verzeichnis.

> **Hinweis:** Der Punkt vor dem Dateinamen ist wichtig! Wenn du Schwierigkeiten beim Erstellen hast (z.B. lassen Macs im Finder keine Dateien mit Punkt am Anfang erzeugen, Punkt-Dateien sind auf Linux und OS X "versteckte Dateien"), dann verwende die "Speichern unter"-Funktion im Editor, das sollte immer funktionieren. Wichtig ist, dass du den Dateinamen nicht mit `.txt`, `.py` oder einer anderen Dateinamen-Erweiterung ergänzt -- die Datei wird von Git nur erkannt, wenn ihr Name exakt nur `.gitignore` ist. Linux und MacOS behandeln Dateien mit Namen, die mit `.` beginnen (wie `.itignore`), als versteckt und der normale `ls`-Befehl zeigt diese Dateien nicht an. Verwende stattdessen `ls -a` um die Datei `.gitignore` anzuzeigen.
> 
> **Hinweis:** Eine der Dateien, die du in deiner `.gitignore`-Datei defniniert hast, ist `db.sqlite3`. Diese Datei ist deine lokale Datenbank, in welcher alle deine Benutzer und Posts gespeichert werden. Wir werden die gängige Web-Entwicklungs-Praxis befolgen, was heißt, dass wir separate Datenbanken für unsere lokale Test-Website und unsere öffentliche Website auf PythonAnywhere verwenden werden. Die Datenbank für letztere könnte SQLite sein, wie auf deiner Entwicklungsmaschine, aber normalerweise wirst du eine sogenannte MySQL-Datenbank nutzen, welche mit viel mehr Besuchern umgehen kann als SQLite. So oder so, dadurch, dass du deine SQLite-Datenbank für die GitHub-Kopie nicht verwendest, werden alle deine bisherigen Posts der Superuser nur lokal zur Verfügung stehen und du musst in der produktiven Umgebung neue hinzufügen. Betrachte deine lokale Datenbank als tollen Spielplatz, auf welchem du verschiedene Dinge ausprobieren kannst, ohne Angst zu haben, dass du deine wirklichen Post auf deinem Blog löschst.

Es ist hilfreich den Befehl `git status` vor `git add` auszuführen oder immer dann, wenn du dir unsicher bist, was geändert wurde. Das schützt vor manchen Überraschungen, wie z. B. das falsche Hinzufügen oder Übertragen von Dateien. Das `git status`-Kommando gibt Informationen über unbeobachtete/veränderte/hinzugefügte Dateien, den Status der Verzweigung und einiges mehr wieder. Deine Ausgabe sollte dem hier ähneln:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    No commits yet
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

Nun speichern wir unsere Änderungen durch folgende Eingabe in der Konsole:

{% filename %}command-line{% endfilename %}

    $ git add .
    $ git commit -m "Meine Django Girls App, erster Commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Den Code auf GitHub veröffentlichen

Gehe auf [GitHub.com](https://www.github.com) eröffne ein neues, kostenloses Nutzerkonto. (Falls Du es bereits während der Workshop-Vorbereitung eingerichtet hast, ist das großartig!) Stelle sicher, dass Du Dein Passwort nicht vergisst (füge es zu zu Deinem Passwort-Manager hinzu, falls Du einen solchen verwendest).

Erstelle dann ein neues Repository und gib ihm den Namen "my-first-blog". Lass das Kontrollkästchen "initialise with a README" deaktiviert und die Einstellung der Option .gitignore leer (das haben wir schon von Hand gemacht) und lass die Lizenz auf "None".

![](images/new_github_repo.png)

> **Achtung:** Der Name `my-first-blog` ist wichtig -- du kannst auch einen anderen wählen, aber er wird im Folgenden noch sehr oft vorkommen und du wirst immer daran denken müssen, ihn in den Anweisungen entsprechend anzupassen. Es ist wahrscheinlich einfacher, bei `my-first-blog` zu bleiben.

In der nächsten Ansicht wirst du die clone-URL deines Repositorys sehen, die du in manchen der folgenden Kommandozeilenbefehlen verwenden wirst:

![](images/github_get_repo_url_screenshot.png)

Nun müssen wir das Git-Repository auf deinem Computer mit dem auf GitHub verbinden.

Gib das Folgende auf der Kommandozeile ein (ersetzte `<your-github-username>` mit dem Benutzernamen, den du beim Erstellen deines GitHub-Accounts gewählt hast, aber ohne die spitzen Klammern -- die URL sollte der clone-URL entsprechen, die du vorhin gerade gesehen hast):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Wenn du zu GitHub pushst, wirst du nach deinem Benutzernamen und Passwort gefragt (entweder direkt im Kommandozeilen-Fenster oder in einem Pop-Up-Fenster), und nach der Eingabe deiner Zugangsdaten solltest du etwas Ähnliches wie das hier sehen:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Dein Code ist jetzt auf GitHub. Schau gleich mal nach! Dort ist dein Code in guter Gesellschaft - [Django](https://github.com/django/django), das [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) und viele andere großartige Open Source Software-Projekte haben ihren Code auf GitHub. :)

# Deinen Blog auf PythonAnywhere einrichten

## Registriere dich für ein PythonAnywhere Konto

> **Hinweis:** Es ist möglich, dass du bereits ein PythonAnywhere Konto angelegt hast. Wenn ja, dann brauchst du das nicht noch einmal zu tun.

{% include "/deploy/signup_pythonanywhere.md" %}

## Unsere Site auf PythonAnywhere konfigurieren

Gehe zurück zum [Haupt-Dashboard PythonAnywhere](https://www.pythonanywhere.com/), indem du auf das Logo klickst. Dann wähle die Option zum Start einer "Bash"-Konsole – die PythonAnywhere Version einer Kommandozeile wie du sie auf deinen Computer hast.

![Der 'New Console"-Abschnitt auf der PythonAnywhere-Weboberfläche, mit einem Knopf für 'bash'](images/pythonanywhere_bash_console.png)

> **Hinweis:** PythonAnywhere basiert auf Linux. Wenn du Windows benutzt, dann sieht die Konsole etwas anders aus als die Konsole auf deinem Computer.

Um eine Web App auf PythonAnywhere publizieren zu können, muss dein Code von GitHub heruntergeladen und PythonAnyhwere dazu gebracht werden, diesen zu erkennen und als Web Applikation anzubieten. Du kannst das auch manuell machen. Aber PythonAnywhere stellt ein Hilfstool zur Verfügung, das das alles für dich erledigt. Lass es uns installieren:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip{{ book.pa_py_version }} install --user pythonanywhere
    

Nach diesem Befehl solltest du in etwa Folgendes sehen: `Collecting pythonanywhere`, und irgendwann den Schluss `Successfully installed (...) pythonanywhere- (...)`.

Nun können wir mit dem Hilfstool unsere App von GitHub automatisch konfigurieren. Gib das Folgende in der Konsole auf PythonAnywhere ein (vergiss nicht, deinen GitHub-Benutzernamen an Stelle von `<your-github-username>` zu benutzen, so dass die URL der clone-URL von GitHub entspricht):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python={{ book.pa_py_version }} https://github.com/<your-github-username>/my-first-blog.git
    

Während du die Ausführung verfolgst, wirst du sehen, was passiert:

- Den Code von GitHub herunterladen
- Eine virtuelle Umgebung auf PythonAnywhere einrichten, genau wie die auf deinem eigenen Computer
- Deine Einstellungen mit ein paar Veröffentlichungseinstellungen aktualisieren
- Eine Datenbank auf PythonAnywhere einrichten mit dem Befehl `manage.py migrate`
- Deine statischen Dateien einrichten (darüber lernen wir später etwas)
- PythonAnywhere so einrichten, dass es deine Web-App über seine Schnittstelle (API) präsentieren kann

Diese Schritte wurden auf PythonAnywhere automatisiert, aber es sind die selben Schritte, die du bei jedem anderen Server-Provider machen müsstest.

Das Wichtigste im Moment ist, dass du weißt, dass Deine Datenbank auf PythonAnywhere vollständig unabhängig von deiner Datenbank auf deinem eigenen PC ist, so dass sie unterschiedliche Posts und Administratorenkonten haben kann. Aus diesem Grund müssen wir das Administratorenkonto mittels `createsuperuser` initialisieren - wie wir das auf deinem eigenen Computer getan haben. PythonAnywhere hat deine virtualenv automatisch für dich aktiviert. Du musst nur noch Folgendes ausführen:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Trage die Informationen für deinen Administrator ein. Am Besten verwendest du die selben Daten wie auf deinem eigenen Computer, um Verwechslungen zu vermeiden - es sei denn, du willst das Passwort auf PythonAnywhere sicherer machen.

Nun kannst auch einen Blick auf deinen Code auf PythonAnywhere werfen mittels `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

Du kannst auch auf die "Files"-Seite gehen und mit PythonAnywheres eingebautem Datei-Manager navigieren. (Von der "Console"-Seite gelangst du über das Menü in der rechten oberen Ecke zu anderen PythonAnywhere-Seiten. Sobald du auf einer dieser Seiten bist, findest du die Links zu den anderen Seiten oben über dem Seiteninhalt.)

## Du bist jetzt live!

Nun ist deine Site also live im öffentlichen Internet! Klick dich zur PythonAnywhere "Web"-Seite durch und hole dir den Link. Teile ihn, mit wem du willst. :)

> **Hinweis:** Da es sich hier um ein Anfänger-Tutorial handelt, haben wir ein paar Abkürzungen genommen, um die Site zu veröffentlichen, welche sicherheitstechnisch nicht ideal sind. Falls du dich entscheidest, dieses Projekt weiterzubauen oder ein neues Projekt anzufangen, dann solltest du die [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) durchgehen, um einige Tipps zur Absicherung deiner Seite zu erhalten.

## Debugging Tipps

Solltest du beim Ausführen des `pa_autoconfigure_django.py` Skripts eine Fehlermeldung erhalten, findest du folgend ein paar bekannte Gründe hierfür:

- Du hast vergessen deinen PythonAnywhere API-Token zu erstellen.
- Du hast in deiner GitHub-URL einen Fehler gemacht.
- Falls du die Fehlermeldung *"Could not find your settings.py"* erhältst, liegt das wahrscheinlich daran, dass du nicht alle Files zum Git hinzugefügt und/oder diese nicht erfolgreich auf GitHub veröffentlicht hast. Schau dir nochmals den Git-Abschnitt weiter oben an.
- Falls du ein bestehendes PythonAnywhere-Benutzerkonto verwendest und eine Fehlermeldung bzgl. collectstatic erhalten hast, hast du dort vermutlich eine alte SQLite-Version (z.B. 3.8.2). Wenn das der Fall ist, erstelle ein neues Benutzerkonto und versuche dort, die Kommandos aus dem obenstehenden PythonAnywhere-Abschnitt erneut auszuführen.

Falls du eine Fehlermeldung erhältst, wenn du versuchst, deine Site aufzurufen, solltest du als Erstes die Debugging-Informationen im **error log** anschauen. Den Link dazu findest du über [die PythonAnywhere-Seite "Web"](https://www.pythonanywhere.com/web_app_setup/). Schau nach, ob darin Fehlermeldungen enthalten sind; die neuesten findest du ganz unten.

Du findest einige [Allgemeine Debugging Tipps im PythonAnywhere Wiki](http://help.pythonanywhere.com/pages/DebuggingImportError).

Und denke daran, dein Coach ist da, um zu helfen!

# Schau dir deine Website an!

Auf der Defaultseite deiner Site sollte "It worked!" stehen - genau so wie auf deinem lokalen Computer. Füge nun `/admin/` ans Ende deiner URL an und du kommst auf die Admin-Site. Logge dich mit Benutzername und Passwort ein, und du wirst sehen, dass du auf dem Server neue Posts hinzufügen kannst -- die Posts aus deiner lokalen Test-Datenbank wurden ja nicht auf deinen öffentlichen Blog geschickt.

Wenn du ein paar Posts erstellt hast, kannst du zurück auf dein lokales Setup (nicht PythonAnywhere) wechseln. Ab jetzt solltest du für Änderungen auf deinem lokalen Setup arbeiten. So wird in der Web-Entwicklung gearbeitet - Änderungen lokal machen und diese dann auf GitHub veröffentlichen und dann deine Änderungen auf den produktiven Webserver ziehen. So kannst du Sachen ausprobieren, ohne deine produktive Website kaputt zu machen. Ziemlich cool, oder?

Klopf dir *kräftig* auf die Schulter! Server-Deployment ist eines der kompliziertesten Dinge der Web-Entwicklung und es dauert oftmals mehrere Tage, bis alles läuft. Aber du hast deine Site jetzt live, im echten Internet!