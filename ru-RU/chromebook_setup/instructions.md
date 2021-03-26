Можешь [пропустить этот раздел](http://tutorial.djangogirls.org/en/installation/#install-python), если ты не используешь Chromebook. Если же у тебя Chromebook, процесс установки будет немного иным. Ты можешь игнорировать остальные инструкции по установке.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE - это инструмент, предоставляющий тебе редактор кода и доступ к компьютеру в интернете, на котором ты можешь установить, записать и выполнить программу. На протяжении данного урока Cloud IDE будет использоваться как твой *локальный компьютер*. Ты будешь работать в терминале (так же, как и твои одноклассники на OS X, Ubuntu или Windows), но твой терминал будет подключен к компьютеру где-нибудь в Нидерландах или Германии, который Cloud9 установили специально для тебя. Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Ты можешь выбрать одну из облачных IDE. Далее следуй инструкциям.

#### PaizaCloud Cloud IDE

1. Перейди на [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Зарегистрируй аккаунт
3. Нажми *New Sever* и выбери *Django app*
4. Нажмите кнопку запуска (в левой части окна)

Теперь ты должна увидеть интерфейс с боковой панелью, кнопки слева. Нажми кнопку запуска, чтобы открыть окно терминала со строкой вроде этой:

{% filename %}Terminal{% endfilename %}

    $
    

Терминал на PaizaCloud Cloud IDE готов для твоих инструкций. Ты можешь изменить или развернуть это окно, чтобы сделать его немного больше.

#### AWS Cloud9

В настоящее время Cloud 9 требует от тебя входа при помощи AWS и ввода данных кредитной карты.

1. Установи Cloud 9 из [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Перейди на [c9.io](https://c9.io) и нажми *Get started with AWS Cloud9*
3. Войди при помощи аккаунта AWS (необходимы данные кредитной карты, но ты можешь пользоваться бесплатно)
4. На панели управления AWS введи *Cloud9* в поисковой строке и кликни
5. На панели управления Cloud 9 нажми *Create environment*
6. Назови его *django-girls*
7. При конфигурировании настроек выбери *Create a new instance for environment (EC2)* в "Environment Type" и *t2.micro* "Instance type" (он должен вернуть тебе ответ "Free-tier eligible."). Все настройки по умолчанию в порядке, и ты также можешь выставлять по умолчанию и остальные настройки.
8. Нажми *Next step*
9. Нажми *Create environment*

Теперь ты должна увидеть интерфейс боковой панели, большое главное окно с текстом и небольшое окно в нижней части, которая выглядит примерно так:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Эта нижняя область - твой терминал. Терминал можно использовать для отправки инструкций на удаленный компьютер Cloud 9. Ты можешь изменить размер этого окна, чтобы увеличить терминал.

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

### Виртуальное окружение

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