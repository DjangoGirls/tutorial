Du kannst [diesen Abschnitt einfach](http://tutorial.djangogirls.org/en/installation/#install-python) überspringen, falls du kein Chromebook benutzt. Wenn du eins benutzt, wird deine Installation ein wenig anders sein. Du kannst den Rest der Installationsanweisungen ignorieren.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE is a tool that gives you a code editor and access to a computer running on the Internet where you can install, write, and run the software. For the duration of the tutorial, cloud IDE will act as your *local machine*. You'll still be running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that cloud IDE sets up for you. Here is the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). You can choose one of the cloud IDEs, and follow the instruction of the cloud IDE.

#### PaizaCloud Cloud IDE

1. Go to [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Sign up for an account
3. Click *New Server*
4. Click Terminal button(on the left side of the window)

Now you should see an interface with a sidebar, buttons at the left. Click "Terminal" button to open terminal window with prompt like this:

{% filename %}Terminal{% endfilename %}

    $
    

The terminal will give the computer Cloud 9 has prepared for your instructions. You can resize or maximize that window to make it a bit bigger.

#### AWS Cloud9

1. Go to [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Sign up for an account
3. Click *Create Environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    deinbenutzername:~/workspace $
    

Der untere Bereich ist dein *Terminal*, wo du Kommandos für den Computer eingeben kannst, den dir Cloud 9 zur Verfügung stellt. Du kannst dieses Fenster vergrössern oder verkleinern.

### Virtuelle Umgebung

Eine virtuelle Umgebung (auch virtualenv genannt) ist wie ein privater Behälter, in den wir nützlichen Code für ein Projekt packen können, an dem wir arbeiten. Wir benutzen sie, um Code für verschiedene Projekte getrennt aufzubewahren, damit dieser nicht vermischt wird.

Führe im Terminal den folgenden Code aus (das Terminal befindet sich am unteren Rand des Cloud 9-Interfaces):

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Falls das nicht funktioniert, frag' deinen Coach um Hilfe.

Führe dann die folgenden Befehle aus:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(Beachte, dass wir im letzten Befehl eine Tilde gefolgt von einem Gleichheitssymbol benutzen: ~=).

### GitHub

Erstelle einen [GitHub](https://github.com)-Account.

### PythonAnywhere

Das Django Girls-Tutorial enthält ein Kapitel zum Thema Deployment. Beim Deployment nimmst du den Code, der deiner Web-Anwendung zu Grunde liegt, und packst ihn auf einen öffentlich zugänglichen Computer (Server), damit auch andere Leute deine Arbeit sehen können.

Es mag seltsam scheinen, das auf einem Chromebook zu tun. Denn wir sind mit Cloud 9 ja bereits auf einem anderen Computer im Internet (anstatt z.B. auf einem lokalen Laptop). Es ist aber trotzdem sinnvoll, denn wir können uns unseren Cloud-9-Arbeitsplatz als Ort für "Dinge in Arbeit" vorstellen und PythonAnywhere als Ort, wo wir unser "fertiges" Projekt der Öffentlichkeit zeigen.

Melde dich deshalb auf [www.pythonanywhere.com](https://www.pythonanywhere.com) für ein PythonAnywhere-Benutzerkonto an.