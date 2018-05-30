Du kannst [diesen Abschnitt einfach](http://tutorial.djangogirls.org/en/installation/#install-python) überspringen, falls du kein Chromebook benutzt. Wenn du eines benutzt, funktioniert vieles ein bisschen anders und du kannst den Rest der Installationsanweisungen ignorieren.

### Cloud 9

Cloud9 ist ein Tool, das dir einen Code-Editor und Zugriff auf einen Computer im Internet zur Verfügung stellt, auf dem du die Software installieren, editieren und laufen lassen kannst. Für dieses Tutorial wird Cloud 9 die Rolle deines *lokalen Rechners* einnehmen. Du wirst auf diesem Cloud9 Rechner die gleichen Befehle ausführen können, wie die anderen Teilnehmer, die OS X, Ubuntu oder Windows benutzen. Jedoch ist dein Terminal für die Ein- und Ausgaben verbunden mit dem Computer, der von Cloud 9 gehostet wird.

1. Installiere Cloud 9 aus dem [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Gehe auf [c9.io](https://c9.io)
3. Erstelle dir einen Account
4. Klicke auf *Create a New Workspace*
5. Gib ihm den Namen *django-girls*
6. Wähle *Blank* aus( das zweite von links in der untersten Reihe mit dem orangen Logo)

Jetzt solltest du ein Interface mit Sidebar, ein grosses Fenster mit Text und am unteren Rand ein Feld sehen, das wie folgt aussieht:

{% filename %}Cloud 9{% endfilename %}

    deinbenutzername:~/workspace $
    

Im unteren Bereich siehst du dein *Terminal*, mit dem du auf deinen Cloud 9 Computer zugreifen kannst um deine Kommandos auszuführen. Dieses Terminalfenster kannst du nach deinen Wünschen vergrößern oder verkleinern.

### Virtuelle Umgebung

Eine virtuelle Umgebung (auch virtualenv genannt) ist ein privater Behälter, in den wir nützlichen Code packen können, um an einem Projekt arbeiten zu können. Wir benutzen diese, um Code für verschiedene Projekte getrennt aufzubewahren, damit diese nicht vermischt werden.

Führe im Terminal den folgenden Code aus( das Terminal befindet sich am unteren Rand des Cloud 9 Interface):

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Wenn du Probleme hast frag deinen Coach nach Hilfe.

Als nächstes führe die folgenden Befehle aus:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(beachte, dass wir im letzten Befehl eine Tilde gefolgt von einem Gleichheitssymbol benutzen: ~=).

### Github

Erstelle einen [Github](https://github.com) Account.

### PythonAnywhere

Das Django Girls tutorial beinhaltet einen Teil zum Thema Deployment. Beim Deployment nimmst du den Code, der deiner Web Anwendung zu Grunde liegt und packst ihn auf einen öffentlich zugänglichen Computer (Server), damit auch andere Leute deine Arbeit betrachten können.

Dieser Teil ist ein bisschen seltsam, wenn du ihn auf einem Chromebook ausführst, da er bereits nur in der Cloud ist( im Gegensatz zu einem Laptop). Es ist aber trotzdem sinnvoll mitzumachen, wir stellen uns dann einfach unseren Cloud 9 Arbeitsplatz als "work in progress" vor und Python Anywhere als Platz auf dem wir unser Projekt vorführen können.

Deshalb solltest du dich auf [www.pythonanywhere.com](https://www.pythonanywhere.com) für einen Python Anywhere Account anmelden.