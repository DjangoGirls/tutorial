Можеш да [пропуснеш този раздел](http://tutorial.djangogirls.org/en/installation/#install-python), ако не използваш Chromebook. Ако използваш, опитът ти в инсталацията ще бъде малко по-различен. Можеш да игнорираш останалата част от инструкциите за инсталиране.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Облачна IDE е инструмент, която ти дава редактор на код и достъп до компютър, работещ в Интернет, където можеш да инсталираш, да пишеш и да пускаш софтуер. За продължителността на ръководството, облачната IDE ще ти служи като твоя *локална машина*. Все пак ще пишеш команди в терминал, също като твоите съученици на OS X, Ubuntu или Windows, но твоят терминал ще бъде свързан с компютър, работещ някъде другаде, който облачната IDE настройва за теб. Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Можеш да избереш един от облачни IDE интерфейси и да следваш инструкциите за тази облачна IDE.

#### PaizaCloud Cloud IDE

1. Отиди на [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Направи акаунт
3. Натисни *New Server* и избери приложението Django
4. Натисни бутон на Терминал (от лявата страна на прозореца)

Сега трябва да виждаш интерфейс със странична лента, бутоните са отляво. Натисни бутона "Terminal" за да се отвори ето такава подкана:

{% filename %}Terminal{% endfilename %}

    $
    

Терминалът на PaizaCloud Cloud IDE е готов за твоите инструции. Можеш да увеличиш прозореца за да го направиш малко по-голям.

#### AWS Cloud9

Понастоящем, Cloud 9 изисква от теб да се регистрираш с AWS и да въведеш информация за кредитната си карта.

1. Инсталирай Cloud 9 от [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Отиди на [c9.io](https://c9.io) и натисни *Get started with AWS Cloud9*
3. Регистрирай се за AWS акаунт (изисква информация за кредитна карта, но можеш да го използваш безплатно)
4. В AWS Dashboard, напиши *Cloud9* в лентата за търсене и я натисни
5. В Cloud 9 таблото, натисни *Create environment*
6. Наречи го *django-girls*
7. Конфигурирайки настройките, избери *Create a new instance for environment (EC2)* за "Environment Type" и *t2.micro* "Instance type" (трябва да пише "Free-tier eligible."). Настройката за икономия на разходи по подразбиране е наред и можеш да запазиш останалите по подразбиране.
8. Натисни *Next step*
9. Натисни *Create environment*

Сега трябва да видиш интерфейс със странична лента, голям основен прозорец с малко текст и малък прозорец в долната част, който да изглежда като нещо подобно:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Тази долна зона е твоят терминал. Можеш да използваш терминала за изпращане на инструкции до отдалечения компютър Cloud 9. Можеш да промениш размера на прозореца, за да го направиш малко по-голям.

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

### Виртуална среда

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