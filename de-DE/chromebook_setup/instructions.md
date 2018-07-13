Du kannst [diesen Abschnitt einfach](http://tutorial.djangogirls.org/en/installation/#install-python) überspringen, falls du kein Chromebook benutzt. Wenn du eins benutzt, wird deine Installation ein wenig anders sein. Du kannst den Rest der Installationsanweisungen ignorieren.

### Cloud 9

Cloud9 ist ein Tool, das dir einen Code-Editor und Zugriff auf einen Computer im Internet zur Verfügung stellt, auf dem du die Software installieren, editieren und laufen lassen kannst. Während des Tutorials wird dir Cloud 9 als dein *lokaler Rechner* dienen. Auch du wirst Befehle in einer Kommandozeilen-Schnittstelle ausführen, genau wie deine Klassenkammeradinnen auf OS X, Ubuntu oder Windows. Dein Terminal wird jedoch mit einem Computer woanders verbunden sein, den Cloud 9 für dich bereitstellt.

1. Installiere Cloud 9 aus dem [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Gehe auf [c9.io](https://c9.io)
3. Erstelle dir einen Account
4. Klicke auf *Create a New Workspace*
5. Gib ihm den Namen *django-girls*
6. Wähle *Blank* aus (das zweite von rechts in der untersten Reihe mit dem orangenen Logo)

Jetzt solltest du eine Benutzeroberfläche mit Seitenleiste, einem grosses Fenster mit Text und am unteren Rand ein Feld sehen, das wie folgt aussieht:

{% filename %}Cloud 9{% endfilename %}

    deinbenutzername:~/workspace $
    

Der untere Bereich ist dein *Terminal*, wo du Kommandos für den Computer eingeben kannst, den dir Cloud 9 zur Verfügung stellt. Du kannst dieses Fenster vergrössern oder verkleinern.

### Virtuelle Umgebung

Eine virtuelle Umgebung (auch virtualenv genannt) ist wie ein privater Behälter, in den wir nützlichen Code für ein Projekt packen können, an dem wir arbeiten. Wir benutzen diese, um Code für verschiedene Projekte getrennt aufzubewahren, damit diese nicht vermischt werden.

Führe in deinem Terminal um unteren Rand des Cloud-9-Interfaces Folgendes aus:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Falls das nicht funktioniert, frag' deinen Coach um Hilfe.

Als nächstes führe die folgenden Befehle aus:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(Beachte, dass wir im letzten Befehl eine Tilde gefolgt von einem Gleichheitssymbol benutzen: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Das Django Girls-Tutorial enthält ein Kapitel zum Thema Deployment. Beim Deployment nimmst du den Code, der deiner Web Anwendung zu Grunde liegt, und packst ihn auf einen öffentlich zugänglichen Computer (Server), damit auch andere Leute deine Arbeit sehen können.

Es mag seltsam scheinen, das auf einem Chromebook zu tun. Denn wir sind mit Cloud 9 ja bereits auf einem anderen Computer im Internet (anstatt z.B. auf einem lokalen Laptop). Es ist aber trotzdem sinnvoll, denn wir können uns unseren Cloud-9-Arbeitsplatz als Sachen "in Arbeit" vorstellen und Python Anywhere als Ort, wo wir unser "fertiges" Projekt der Öffentlichkeit zeigen.

Melde dich deshalb auf [www.pythonanywhere.com](https://www.pythonanywhere.com) für ein Python-Anywhere-Benutzerkonto an.