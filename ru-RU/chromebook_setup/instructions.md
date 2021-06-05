Можешь [пропустить этот раздел](http://tutorial.djangogirls.org/en/installation/#install-python), если ты не используешь Chromebook. Если же у тебя Chromebook, процесс установки будет немного иным. Ты можешь игнорировать остальные инструкции по установке.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE - это инструмент, предоставляющий тебе редактор кода и доступ к компьютеру в интернете, на котором ты можешь установить, записать и выполнить программу. На протяжении данного урока Cloud IDE будет использоваться как твой *локальный компьютер*. Ты будешь работать в терминале (так же, как и твои одноклассники на OS X, Ubuntu или Windows), но твой терминал будет подключен к компьютеру где-нибудь в Нидерландах или Германии, который Cloud9 установили специально для тебя. Здесь инструкции для облачных сред IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Ты можешь выбрать одну из облачных IDE. Далее следуй инструкциям.

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

1. Перейдите на сайт [Glitch.com](https://glitch.com/)
2. Зарегистрируйте учетную запись (https://glitch.com/signup) или используйте свою учетную запись GitHub, если она у вас есть. (См. Инструкции GitHub ниже.)
3. Нажмите на кнопку new project и выберите команду hello-webpage
4. Щелкните раскрывающийся список Инструменты (в левой нижней части окна), затем нажмите кнопку Терминал, чтобы открыть вкладку терминала с такой подсказкой:

{% filename %} Терминал{% endfilename %}

    app@name-of-your-glitch-project:~
    

При использовании Glitch.com в качестве облачной IDE вам не нужно создавать виртуальную среду. Вместо этого создайте вручную следующие файлы:

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

После создания этих файлов перейдите в Терминал и выполните следующие команды, чтобы создать свой первый проект Django:

{% filename %}Терминал{% endfilename %}

    django-admin.py startproject mysite .
    Обновить
    

Чтобы видеть подробные сообщения об ошибках, вы можете активировать журналы отладки Django для своего приложения Glitch. Просто добавьте следующее в конец файла ` mysite / settings.py `.

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

Это создаст файл ` debug.log ` с подробным описанием операций Django и любых сообщений об ошибках, которые могут появиться, что значительно упростит исправление, если ваш веб-сайт не работает.

Первоначальный перезапуск проекта Glitch должен завершиться ошибкой. (Если вы щелкните верхнюю кнопку раскрывающегося списка `Показать`, а затем щелкните `В новом окне`, вы получите сообщение об ошибке `DisallowedHost`.) Не беспокойтесь об этом на данном этапе, это руководство будет исправлено, как только вы обновите настройки Django вашего проекта в файле `mysite/settings.py`.

### Виртуальная среда

Виртуальная среда (также называемая виртуальная программа) похожа на частный ящик, в который мы можем поместить полезный компьютерный код для проекта, над которым мы работаем. Мы используем их, чтобы хранить отдельные фрагменты кода, которые мы хотим для наших различных проектов, чтобы они не путались между проектами.

Запустить:

{% filename %}Cloud 9{% endfilename %} 

    mkdir djangogirls
    djangogirls
    python3 -m venv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(обратите внимание, что в последней строке мы используем знак равенства после знака тильды: `~=`).

### GitHub

Создать [GitHub](https://github.com) аккаунт.

### PythonAnywhere

Учебник Django Girls включает раздел о том, что называется «Развертывание», которое представляет собой процесс переноса кода, обеспечивающего работу вашего нового веб-приложения, на общедоступный компьютер (называемый сервером), чтобы другие люди могли видеть вашу работу.

Эта часть немного странная при выполнении руководство на Chromebook, поскольку мы уже используем компьютер, подключенный к Интернету (в отличие, скажем, от ноутбука). Тем не менее, он по-прежнему полезен, поскольку мы можем думать о нашем рабочем пространстве Cloud 9 как о месте «незавершенной» работы, а о Python Anywhere как о месте, где мы можем продемонстрировать наши вещи, когда они становятся более законченными.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).