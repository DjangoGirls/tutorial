Je kunt [deze sectie overslaan](http://tutorial.djangogirls.org/en/installation/#install-python) als je geen Chromebook gebruikt. Als je die wel gebruikt, dan is het installatieproces anders. Je kunt dan de rest van de installatieinstructies negeren.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud 9 is een hulpmiddel die je een code editor aanbiedt op een computer op het Internet. Hierop kan je de programmatuur installeren en uitvoeren. In deze gids beschouwen we Cloud 9 dan ook als jouw *lokale machine*. Je zult opdrachten nog steeds, net als je klasgenoten met OS X, Ubuntu, of Windows, in een terminalscherm typen. Maar jouw terminal is dan verbonden met een computer ergens anders, zoals Cloud 9 dat voor jou heeft ingesteld. Hieronder vind je de instructies voor zogenaamde cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Je kan kiezen uit de een van de volgende IDEs. Volg een van onderstaande instructies.

#### Ga naar de PaizaCloud wolk IDE

1. Ga naar de [PaizaCloud wolk IDE](https://paiza.cloud/)
2. Meld je aan voor een account
3. Klik op *New Server* en kies Django app
4. Klik op Terminal knop (aan de linkerkant van het venster)

Nu zou je een scherm met een zijbalk en knoppen aan de linkerkant moeten zien. Klik op de "Terminal" knop om een scherm met een terminal te openen, met de volgende prompt:

{% filename %}Terminal{% endfilename %}

    $
    

De terminal op de PaizaCloud IDE is klaar voor je instructies. Je kunt het scherm vergroten of maximaliseren.

#### AWS Cloud9

Op dit moment vereist Cloud 9 dat je je aanmeldt met AWS en creditcardinformatie invoert.

1. Installeer Cloud 9 uit de [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Ga naar [c9.io](https://c9.io) en klik op * Get started with AWS Cloud9*
3. Registreer voor een AWS-account (vereist creditcardgegevens, maar deze kun je gratis gebruiken)
4. In het AWS Dashboard, typ *Cloud9* in de zoekbalk en klik erop
5. In het Cloud 9 overzicht, klik op * Create environment*
6. Noem deze *django-girls*
7. Tijdens het aanpassen van de instellingen, selecteer je * Create a new instance for environment (EC2)* voor “Environment Type” en de *t2.micro* “Instance type” (Er zou “Free-tier eligible.”) moeten staan. De standaard kosten-besparing instelling is in orde en je kan de andere standaard instellingen behouden
8. Klik op *Next step*
9. Klik op * Create environment*

Je zou nu een scherm moeten zien met een zijbalk, een hoofdvenster met enkele tekstblokken erin, en een klein venster beneden dat er ongeveer zo uitziet:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Het onderste scherm is je terminal. Je kunt de terminal gebruiken om instructies op afstand naar de Cloud 9 computer te versturen. Je kunt de grootte van dat scherm aanpassen om het iets groter te maken.

#### Glitch.com Cloud IDE

1. Go to [Glitch.com](https://glitch.com/)
2. Sign up for an account (https://glitch.com/signup) or use your GitHub account if you have one. (See GitHub instructions below.)
3. Click *New Project* and choose *hello-webpage*
4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Once these files are created, go to the Terminal and execute the following commands to create your first Django project:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.

The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### Virtuele omgeving

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).