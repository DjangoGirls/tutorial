Je kunt [deze sectie overslaan](http://tutorial.djangogirls.org/en/installation/#install-python) als je geen Chromebook gebruikt. Als je die wel eentje gebruikt, dan is je installatieproces anders dan anders. Je kunt dan de rest van de installatieinstructies negeren.

### Cloud 9

Cloud 9 is een hulpmiddel dat je een code editor aanbiedt en toegang tot een computer op het Internet waarop je de programmatuur kunt installeren, schrijven, en uitvoeren. In deze gids beschouwen we Cloud 9 dan ook als jouw *lokale machine*. Je zult opdrachten nog steeds, net als je klasgenoten met OS X, Ubuntu, of Windows, in een terminalscherm typen. Maar jouw terminal is dan verbonden met een computer ergens anders, zoals Cloud 9 dat voor jou heeft ingesteld.

1. Installeer Cloud 9 uit de [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Ga naar [c9.io](https://c9.io)
3. Meld je aan voor een account
4. Klik op *Create environment*
5. Noem deze *django-girls*
6. Klik op de oranje knop 'Next step'. En klik dan op de oranje knop *Create environment*

Je zou nu een scherm moeten zien met een zijbalk, een hoofdvenster met enkele tekstblokken erin, en een klein venster beneden dat er ongeveer zo uitziet:

{% filename %}Cloud 9{% endfilename %}

    jouw-naam:~/environment $
    

Dit bodempaneel is je *terminal*, waarin je instructies geeft aan de computer die Cloud 9 voor je heeft gemaakt. Je kunt de bovenrand van het venster verslepen om het venster wat groter te maken.

### Virtual Environment

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### Github

Make a [Github](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place or our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).