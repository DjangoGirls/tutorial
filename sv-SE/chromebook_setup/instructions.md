Du kan [hoppa över denna sektion](http://tutorial.djangogirls.org/en/installation/#install-python) om du inte använder en Chromebook. Om det är så att du använder en Chromebook kommer din installation se lite annorlunda ut. Du kan ignorera resten av installations instruktionerna.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE är ett verktyg som ger användaren en kod-editor och tillgång till en dator på internet på vilken du kan installera, skriva och köra mjukvara. Under denna introduktion kommer Cloud IDE vara din *lokala maskin*. Du kommer fortfarande att köra din kommandon i terminalen, precis som dina klasskamrater som sitter på OS X, Ubuntu, eller Windows, men din terminal kommer vara kopplat till en dator som Cloud IDE har satt upp till dig. Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Du kan välja en Cloud IDE och följ anvisningen för den Cloud IDE.

#### PaizaCloud Cloud IDE

1. Gå till [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Skapa ett konto
3. Klicka på *Ny Server* och välj Django-appen
4. Klicka på Terminal knappen (på vänster sida av fönstret)

Nu bör du se ett gränssnitt med en sidofält, och några knappar på vänster. Klicka ”Terminal” knappen för att öppna terminal-fönstret som ser ut såhär:

{% filename %}Terminal{% endfilename %}

    $
    

Terminalen på PaizaCloud Cloud IDE är förberedd för dina instruktioner. Du kan ändra storlek på eller maximera fönstret för att göra det lite större.

#### AWS Cloud9

För närvarande kräver Cloud 9 att du registrerar dig med AWS och ange kreditkort information.

1. Installera Cloud 9 från [Chrome webbutiken](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Gå till [c9.io](https://c9.io) och klicka på *Kom igång med AWS Cloud9*
3. Registrera dig för ett AWS-konto (kräver kreditkortsinformation, men du kan använda det gratis)
4. I AWS kontrollpanelen anger du *Cloud9* i sökfältet och klickar på den
5. I Cloud9 panelen klickar du på *Create environment*
6. Döp den till *django-girls*
7. Medan du anger inställningar, välj *Create a new instance for environment (EC2)* för "Environment Type" och *t2.micro* "Instance type" (det bör säga "Free-tier eligible."). Standardinställningen för kostnadsbesparingar är bra och du kan behålla de andra standardinställningarna.
8. Klicka på *Next step*
9. Klicka på *Create Environment*

Nu kan du se ett gränssnitt med en navigation vid sidan, ett stort huvud-fönster med någon text och ett litet fönster nertill som ser ut typ så här:

{% filename %}bash{% endfilename %}

    dittanvändarnamn:~/workspace $
    

Detta nedre område är din terminal. Du kan använda terminalen för att skicka instruktioner till fjärrdatorn Cloud9. Du kan ändra fönstrets storleken för att göra det lite större.

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

### Virtuell miljö

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