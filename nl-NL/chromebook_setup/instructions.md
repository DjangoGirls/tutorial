Je kunt [deze sectie overslaan](http://tutorial.djangogirls.org/en/installation/#install-python) als je geen Chromebook gebruikt. Als je die wel gebruikt, dan is het installatieproces anders. Je kunt dan de rest van de installatieinstructies negeren.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud 9 is een hulpmiddel die je een code editor aanbiedt op een computer op het Internet. Hierop kan je de programmatuur installeren en uitvoeren. In deze gids beschouwen we Cloud 9 dan ook als jouw *lokale machine*. Je zult opdrachten nog steeds, net als je klasgenoten met OS X, Ubuntu, of Windows, in een terminalscherm typen. Maar jouw terminal is dan verbonden met een computer ergens anders, zoals Cloud 9 dat voor jou heeft ingesteld. Hier is de instructie voor cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Je kan kiezen uit de een van de volgende IDEs. Volg een van onderstaande instructies.

#### Ga naar de PaizaCloud wolk IDE

1. Ga naar de [PaizaCloud wolk IDE](https://paiza.cloud/)
2. Meld je aan voor een account
3. Klik op *nieuwe Server*
4. Klik op Terminal knop (aan de linkerkant van het venster)

Nu moet u een interface met een zijbalk, knoppen aan de linkerkant. klikt u op "Terminal" knop te openen van de terminal venster met prompt zoals dit:

{% filename %}Terminal{% endfilename %}

    $
    

The terminal on the PaizaCloud Cloud IDE is prepared for your instructions. You can resize or maximize that window to make it a bit bigger.

#### AWS Cloud9

1. Go to [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Sign up for an account
3. Click *Create Environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Virtuele omgeving

Een virtuele omgeving (ook wel virtualenv genoemd) is als een privé map waar we bruikbare computercodes kunnen bewaren voor het project waar we aan werken. We gebruiken ze om delen van de code voor onze diverse projecten gesepareerd te bewaren zodat ze niet in de war raken met andere projecten.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Als dit nog steeds niet werkt, vraag dan je coach om hulp.

Vervolgens voer uit:

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