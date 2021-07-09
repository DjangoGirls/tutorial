Du kan [hoppa över denna sektion](http://tutorial.djangogirls.org/en/installation/#install-python) om du inte använder en Chromebook. Om det är så att du använder en Chromebook kommer din installation se lite annorlunda ut. Du kan ignorera resten av installations instruktionerna.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE är ett verktyg som ger användaren en kod-editor och tillgång till en dator på internet på vilken du kan installera, skriva och köra mjukvara. Under denna introduktion kommer Cloud IDE vara din *lokala maskin*. Du kommer fortfarande att köra din kommandon i terminalen, precis som dina klasskamrater som sitter på OS X, Ubuntu, eller Windows, men din terminal kommer vara kopplat till en dator som Cloud IDE har satt upp till dig. Här är instruktionerna för cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Du kan välja en Cloud IDE och följ anvisningen för den Cloud IDE.

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

1. Gå till [Glitch.com](https://glitch.com/)
2. Registrera ett nytt konto (https://glitch.com/signup) eller använd ditt GitHub-konto om du har ett. (Se GitHub-instruktionerna nedan.)
3. Klicka på *New Project* och välj *hello-webpage*
4. Klicka på rullgardinslistan Tools (längst ner till vänster i fönstret) och sedan på Terminal-knappen för att öppna terminalfliken med en prompt som ser ut så här:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

När du använder Glitch.com som din moln-IDE behöver du inte skapa en virtuell miljö. Skapa istället följande filer manuellt:

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

När dessa filer har skapats går du till Terminalen och kör följande kommandon för att skapa ditt första Django-projekt:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

För att se detaljerade felmeddelanden kan du aktivera Djangos felsökningsloggar för din Glitch-applikation. Lägg helt enkelt till följande i slutet av filen `mysite/settings.py`.

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

Detta kommer att skapa filen `debug.log` som beskriver Django-operationer och eventuella felmeddelanden som kan komma upp, vilket gör felen mycket lättare att fixa om din webbplats inte fungerar.

Den första omstarten av Glitch-projektet kommer misslyckas. (Om du klickar på den övre rullgardinsmenyn `Show` och sedan klickar på `In a New Window`, kommer du att få felmeddelandet `DisallowedHost`. Oroa dig inte för det just nu, guiden kommer att fixa detta så snart du uppdaterar Django-inställningarna för ditt projekt i filen `mysite/settings.py`.

### Virtuell miljö

En virtuell miljö (även kallad virtualenv) är som en privat låda som vi kan stoppa användbar datorkod i för ett projekt vi arbetar med. Vi använder dem för att hålla olika kodbitar vi vill ha för våra olika projekt separerade så saker inte blandas ihop mellan projekt.

Kör:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(observera att på sista raden använder vi ett tilde följt av ett likamedtecken: `~=`).

### GitHub

Skapa ett [GitHub](https://github.com)-konto.

### PythonAnywhere

Django Girls handledning innehåller ett avsnitt om det som kallas Deployment (även kallat driftsättning eller publicering), som innebär att ta koden som driver din nya webbapplikation och flytta den till en offentligt tillgänglig dator (kallad server) så att andra personer kan se ditt arbete.

Denna del är lite udda när du följer handledningen på en Chromebook eftersom vi redan använder en dator som är på Internet (i motsats till en vanlig bärbar dator). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).