Możesz [pominąć tę sekcję](http://tutorial.djangogirls.org/en/installation/#install-python), jeżeli nie używasz Chromebooka. W przeciwnym wypadku, proces instalacji będzie wyglądał nieco inaczej. Możesz zignorować pozostałe elementy instrukcji dotyczące instalacji.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE jest narzędziem, które pełni funkcję edytora kodu oraz umożliwia dostęp do komputera uruchomionego w internecie, gdzie możesz instalować, pisać oraz uruchamiać programy. Na czas trwania tutoriala Cloud IDE będzie działać jako *komputer lokalny*. Będziesz mogła uruchamiać komendy w terminalu, tak jak inne osoby korzystające z systemu OS X, Ubuntu czy Windows, z tym że Twój terminal będzie podłączony do komputera, który ustawi dla Ciebie Cloud IDE. Oto instrukcje dotyczące różnych Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Możesz wybrać jedno z poniższych Cloud IDE i postępować zgodnie z instrukcją.

#### PaizaCloud Cloud IDE

1. Przejdź do [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Załóż konto
3. Kliknij *Nowy serwer* i wybierz aplikację Django
4. Kliknij przycisk "Terminal" (po lewej stronie okna)

Teraz powinnaś zobaczyć interfejs z bocznym paskiem i przyciski po lewej stronie. Kliknij przycisk "Terminal", aby otworzyć okno terminala ze znakiem zachęty takim jak ten:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal PaizaCloud Cloud ID jest gotowy na Twoje instrukcje. Możesz zmienić rozmiar tego okna i powiększyć je, aby było troszkę większe.

#### AWS Cloud9

Obecnie Cloud 9 wymaga rejestracji w AWS i wprowadzenia informacji o karcie kredytowej.

1. Zainstaluj Cloud 9 ze [ sklepu internetowego Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Przejdź do [c9.io](https://c9.io) i kliknij *Zacznij z AWS Cloud9*
3. Zarejestruj konto AWS (wymaga danych karty kredytowej, ale możesz używać go za darmo)
4. W Panelu AWS wpisz * Cloud9 * na pasku wyszukiwania i kliknij go
5. W panelu Cloud 9 kliknij * Utwórz środowisko *
6. Nazwij go * django-girls *
7. Podczas konfiguracji wybierz *Utwórz nową instancję dla środowiska (EC2)* dla "Typ Środowiska" i *t2.micro* dla "Typ instancji" (powinien powiedzieć "Kwalifikuje się na poziom darmowy"). Domyślne ustawienie oszczędzania kosztów jest dobre, a pozostałe wartości możesz zachować domyślne.
8. Kliknij *Next step*
9. Kliknij *Create Environment*

Teraz powinnaś zobaczyć interfejs z bocznym paskiem, duże główne okno z tekstem i małe okno na dole, które wygląda następująco:

{% filename %}bash{% endfilename %}

    twojanazwaużytkownika:~/workspace $
    

Dolny obszar jest Twoim terminalem. Możesz użyć go do wysyłania instrukcji do zdalnego komputera Cloud 9. Możesz zmienić rozmiar tego okna, aby je trochę powiększyć.

#### Glitch.com Cloud IDE

1. Przejdź do [Glitch.com](https://glitch.com/)
2. Stwóż darmowe konto (https://glitch.com/signup) lub użyj swojego konta GitHub, jeśli je posiadasz. (Zobacz instrukcje GitHub poniżej)
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

### Środowisko wirtualne

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