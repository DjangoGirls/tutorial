Du kannst [diesen Abschnitt einfach](http://tutorial.djangogirls.org/en/installation/#install-python) überspringen, falls du kein Chromebook benutzt. Wenn du eins benutzt, wird deine Installation ein wenig anders sein. Du kannst den Rest der Installationsanweisungen ignorieren.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Mit dem Tool Cloud IDE erhältst du Zugang zu einem Code-Editor und einem Rechner, der im Internet läuft und auf dem du die Software installieren, schreiben und ausführen kannst. Für die Dauer des Tutorials wird Cloud IDE zu deinem *lokalen Rechner*. Auch du wirst Befehle in einer Kommandozeilen-Oberfläche ausführen können, genau wie die anderen Teilnehmerinnen, die mit OS X, Ubuntu oder Windows arbeiten. Dein Terminal wird jedoch mit einem Rechner verbunden sein, den Cloud IDE dir bereitstellt. Hier ist die Anleitung für die Cloud IDEs (PaizaCloud, Cloud IDE, AWS Cloud9). Wähle eine der Cloud IDEs aus und folge den Anweisungen der gewählten Cloud IDE.

#### PaizaCloud Cloud IDE

1. Gehe zu [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Lege dir dort ein Benutzerkonto an
3. Klicke auf *New Server* und wähle die Django-App
4. Klicke auf die Schaltfläche "Terminal" (links im Browserfenster)

Jetzt solltest du links eine Schnittstelle mit einer Seitenleiste und Schaltflächen sehen. Klicke auf den "Terminal"-Button und öffne das Terminal-Fenster mit einer Eingabeaufforderung wie folgt:

{% filename %}browser{% endfilename %}

    $
    

Das Terminal auf der PaizaCloud Cloud IDE steht für deine Anweisungen bereit. Du kannst die Größe des Fensters frei einstellen.

#### AWS Cloud9

Zur Zeit verlangt Cloud 9, dass du dich mit AWS anmeldest und Kreditkarten-Informationen angibst.

1. Installiere Cloud 9 aus dem [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Gehe zu [c9.io](https://c9.io) und klicke auf *Get started with AWS Cloud9*
3. Erstelle ein AWS-Benutzerkonto (benötigt Angabe der Kreditkarte, kann aber kostenlos verwendet werden)
4. Gib im AWS-Dashboard *Cloud9* in die Suchzeile ein und klicke es an
5. Klicke im Cloud-9-Dashboard *Create environment* an
6. Gib ihm den Namen *django-girls*
7. Wähle beim Konfigurieren der Einstellungen *Create a new instance for environment (EC2)* als "Environment Type" und den "Instance type" *t2.micro* ("Free-tier eligible." sollte angezeigt werden). Die Voreinstellung bzgl. "cost-saving" ist in Ordnung und auch die anderen Voreinstellungen kannst du belassen.
8. Klicke auf *Next step*
9. Klicke auf *Create environment*

Jetzt solltest du eine Benutzeroberfläche mit Seitenleiste, ein grosses Fenster mit Text und am unteren Rand ein Feld sehen, das wie folgt aussieht:

{% filename %}bash{% endfilename %}

    deinbenutzername:~/workspace $
    

Dieser untere Bereich ist dein Terminal. Dort kannst du Kommandos für den Computer eingeben, den dir Cloud 9 zur Verfügung stellt. Du kannst dieses Fenster vergrößern oder verkleinern.

### Virtuelle Umgebung

Eine virtuelle Umgebung (auch virtualenv genannt) ist wie ein privater Behälter, in den wir nützlichen Code für ein Projekt packen können, an dem wir arbeiten. Wir benutzen sie, um Code für verschiedene Projekte getrennt aufzubewahren, damit dieser nicht vermischt wird.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).