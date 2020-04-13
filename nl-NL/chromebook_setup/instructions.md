Je kunt [deze sectie overslaan](http://tutorial.djangogirls.org/en/installation/#install-python) als je geen Chromebook gebruikt. Als je die wel gebruikt, dan is het installatieproces anders. Je kunt dan de rest van de installatieinstructies negeren.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud 9 is een hulpmiddel die je een code editor aanbiedt op een computer op het Internet. Hierop kan je de programmatuur installeren en uitvoeren. In deze gids beschouwen we Cloud 9 dan ook als jouw *lokale machine*. Je zult opdrachten nog steeds, net als je klasgenoten met OS X, Ubuntu, of Windows, in een terminalscherm typen. Maar jouw terminal is dan verbonden met een computer ergens anders, zoals Cloud 9 dat voor jou heeft ingesteld. Hier is de instructie voor cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Je kan kiezen uit de een van de volgende IDEs. Volg een van onderstaande instructies.

#### Ga naar de PaizaCloud wolk IDE

1. Ga naar de [PaizaCloud wolk IDE](https://paiza.cloud/)
2. Meld je aan voor een account
3. Click *New Server* and choose the Django app
4. Klik op Terminal knop (aan de linkerkant van het venster)

Nu zou je een scherm met een zijbalk en knoppen aan de linkerkant moeten zien. Klik op de "Terminal" knop om een scherm met een terminal te openen, met de volgende prompt:

{% filename %}Terminal{% endfilename %}

    $
    

De terminal op de PaizaCloud IDE is klaar voor je instructies. Je kunt het scherm vergroten of maximaliseren.

#### AWS Cloud9

Currently Cloud 9 requires you to sign up with AWS and enter credit card information.

1. Install Cloud 9 from the [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Go to [c9.io](https://c9.io) and click *Get started with AWS Cloud9*
3. Sign up for an AWS account (requires credit card information, but you can use it for free)
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Virtuele omgeving

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We gebruiken ze om de stukjes code van verschillende projecten apart te houden, zodat dingen uit verschillende projecten niet doorelkaar worden gehaald.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(let op: op de laatste regel gebruiken we een tilde gevolgd door een 'is' teken: `~=`).

### GitHub

Maak een [GitHub](https://github.com)account aan.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Meld je daarom aan voor een nieuw Python Anywhere account op [www.pythonanywhere.com](https://www.pythonanywhere.com).