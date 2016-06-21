# Разверните!

> **Примечание**: Эта глава может показаться сложной. Будь упорна, развертывание сайта на сервере является важной частью веб-разработки. Данная глава намеренно расположена в середине учебника для того, чтобы твой наставник смог помочь с таким мудреным процессом, как публикация сайта. Так ты сможешь самостоятельно закончить все главы, даже если время будет поджимать.

До настоящего момента твой сайт был доступен только для локального просмотра, теперь же ты узнаешь как развернуть его на удаленном сервере! Развертывание (deploy) — это процесс публикации приложения в интернете, чтобы люди могли наконец увидеть твое творение :).

Как ты уже знаешь, веб-сайт должен располагаться на сервере. Есть много компаний, предоставляющих сервера в интернете. Мы воспользуемся услугами одной из них, с довольно простым процессом публикации: [PythonAnywhere][1]. PythonAnywhere бесплатен для маленьких приложений с небольшим числом посетителей, и этого будет более чем достаточно для нас.

 [1]: https://pythonanywhere.com/

Другим внешним сервисом, которым мы будем пользоваться, является [GitHub][2] — сервис хостинга кода. Существуют и другие похожие сервисы, но практически у каждого программиста есть GitHub аккаунт, теперь будет и у тебя!

 [2]: https://www.github.com

Мы будем использовать GitHub для передачи нашего кода PythonAnywhere и обратно.

# Git

Git — это "система управления версиями", используемая множеством программистов. Эта программа отслеживает изменения, происходящие с файлами, чтобы впоследствии можно было восстановить состояние кода на нужный момент времени. Это немного похоже на функцию отслеживания изменений в Microsoft Word, но куда мощнее.

## Установка Git

> **Примечание** Если вы уже выполнили установку, незачем повторять её вновь — вы можете сразу переходить к следующему разделу и начать создание собственного Git репозитория.

{% include "/deploy/install_git.md" %}

## Создаём Git-репозиторий

Git отслеживает изменения определенного набора файлов, который называется репозиторием (сокращенно "репо"). Давайте создадим один для нашего проекта. Откройте консоль и запустите эти команды в папке `djangogirls`:

> **Заметка**: Проверь текущий рабочий каталог с помощью команд `pwd` (OSX/Linux) или `cd` (Windows) прежде чем инициализировать новый репозиторий. Ты должна находиться в директории `djangogirls`.

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com


Инициализировать git-репозиторий придется только один раз за проект (и тебе больше не придется вводить имя пользователя и адрес электронной почты).

Git будет отслеживать изменения всех файлов и каталогов в заданной директории, однако некоторые из них мы предпочли бы игнорировать. Для этого нам нужно создать файл `.gitignore` в корневом каталоге репозитория. Открой редактор и создай новый файл со следующим содержанием:

    *.pyc
    __pycache__
    myvenv
    db.sqlite3
    .DS_Store


И сохрани его как `.gitignore` в корневом каталоге "djangogirls".

> **Примечание**: Точка в начале имени файла имеет важное значение! Если у тебя есть проблемы с созданием таких файлов (Mac не позволит создать файл с названием, начинающимся с точки, через Finder, например), тогда используй кнопку "Сохранить как" в меню своего редактора кода, это точно поможет.

Используй команду `git status` перед `git add` или в любой другой момент, когда ты не уверена, что изменения — хорошая идея. Это убережёт тебя от таких неприятных сюрпризов как добавление неправильных файлов. Команда `git status` возвращает информацию обо всех ранее неотслеживаемых/изменённых/добавленных в git файлах, а также статус ветки и многое другое. Результат должен быть похож на:

    $ git status
    On branch master

    Initial commit

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

            .gitignore
            blog/
            manage.py
            mysite/

    nothing added to commit but untracked files present (use "git add" to track)


И, наконец, мы сохраним наши изменения. Переключись на консоль и набери:

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py


## Загружаем код в репозиторий GitHub

Зайди на [GitHub.com][2] и создай новую бесплатную учётную запись. (если это уже сделано во время подготовки к воркшопу — здорово!)

Затем создай новый репозиторий и назови его "my-first-blog". Не выбирай опцию "initialise with a README", не создавай файл .gitignore (мы сделаем это локально сами) и оставь Лицензию None.

![][3]

 [3]: images/new_github_repo.png

> **Примечание**: Имя репозитория `my-first-blog` имеет для нас большую важность -- ты можешь, конечно, придумать другое название, но оно будет встречаться множество раз в руководстве и тебе придется заменять его каждый раз на свое. Будет проще для начала остановиться на нашем варианте `my-first-blog`.

На следующем экране ты можешь найти URL для клонирования репозитория. Выбери вариант "HTTPS", копируй команду и вставь в окно терминала:

![][4]

 [4]: images/github_get_repo_url_screenshot.png

Теперь нужно связать локальный репозиторий с репозиторием на GitHub.

Напечатай у себя в консоли следующую команду (Замени `<your-github-username>` именем, указанным при создании аккаунта на GitHub, но без угловых скобок):

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master


Введи свое имя пользователя и пароль от аккаунта GitHub, и ты должна увидеть что-то подобное:

    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/hjwp/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.


<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Твой код теперь на GitHub. Зайди на сайт и проверь! Ты найдешь его в хорошей компании: [фреймворк Django][5], [этот учебник][6], а также многие другие великолепные проекты с исходным кодом размещены на GitHub :)


 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# Настройка нашего блога на PythonAnywhere

> **Примечание** Возможно, ты уже завела учётную запись на PythonAnywhere ранее — если так, нет нужды повторять это вновь.

{% include "/deploy/signup_pythonanywhere.md" %}

## Загружаем код на PythonAnywhere

После регистрации на PythonAnywhere ты будешь перемещена на страницу "Consoles". Выбери опцию старта "Bash" консоли -- это версия консоли PythonAnywhere, аналогичная твоему локальному терминалу.

> **Примечание**: PythonAnywhere использует Linux, так что если ты используешь Windows, то терминал и команды могут немного отличаться от того, к чему ты привыкла на своем компьютере.

Давай загрузим наш код из GitHub на PythonAnywhere, создав "клон" репозитория. Введи следующую команду в консоли на PythonAnywhere (не забудь заменить `<your-github-username>` на свою учётку GitHub):

    $ git clone https://github.com/<your-github-username>/my-first-blog.git


Эта команда загрузит копию твоего кода на PythonAnywhere. Проверь это, набрав `tree my-first-blog`:

    $ tree my-first-blog
    my-first-blog/
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── migrations
    │   │   ├── 0001_initial.py
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py


### Создаём виртуальное окружение на PythonAnywhere

Также как ты делала на своем компьютере, ты можешь создать виртуальное окружение на PythonAnywhere. В Bash консоли введи следующую команду:

    $ cd my-first-blog

    $ virtualenv --python=python3.4 myvenv
    Running virtualenv with interpreter /usr/bin/python3.4
    [...]
    Installing setuptools, pip...done.

    $ source myvenv/bin/activate

    (myvenv) $  pip install django whitenoise
    Collecting django
    [...]
    Successfully installed django-1.8.2 whitenoise-2.0


> **Примечание** Выполнение команды `pip install` может занять несколько минут. Терпение, терпение! Однако, если это занимает больше 5 минут, что-то не так. Спроси своего инструктора.

<!--TODO: think about using requirements.txt instead of pip install.-->

### Сбор статических файлов.

Задаешься вопросом "что это за whitenoise такой"? Это утилита для работы с так называемыми "статическими файлами". Статические файлы — это файлы, не содержащие программного кода, такие как файлы HTML или CSS. Статические файлы работают на серверах не так как на твоем локальном компьютере, и нам потребуется инструмент, такой как "whitenoise", чтобы управляться с ними.

Мы ближе познакомимся со статическими файлами в дальнейшем, когда начнем писать CSS для нашего сайта.

А пока нам просто нужно запускать дополнительную команду под названием `collectstatic`, на сервере. Это даст Django знать, что он должен собрать все статические файлы, которые потребуются серверу. На данный момент эти файлы главным образом позволят админке хорошо выглядеть.

    (myvenv) $ python manage.py collectstatic

    You have requested to collect static files at the destination
    location as specified in your settings:

        /home/edith/my-first-blog/static

    This will overwrite existing files!
    Are you sure you want to do this?

    Type 'yes' to continue, or 'no' to cancel: yes


Набери "yes" и жди! Как тебе нравятся страницы непонятного текста, которые выводятся в терминале? Я всегда сопровождаю их звуками. Брп, брп, брп...

    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
    [...]
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
    Copying '/home/edith/.virtualenvs/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
    62 static files copied to '/home/edith/my-first-blog/static'.


### Создаем базу данных на PythonAnywhere

Есть еще одно отличие твоего локального компьютера и сервера - они используют разные базы данных. Таким образом, пользовательские аккаунты и записи в блоге на сервере и локальном компьютере могут отличаться друг от друга.

Нам нужно инициализировать базу данных на сервере, также как мы это сделали на твоем компьютере, с помощью команд `migrate` и `createsuperuser`:

    (myvenv)20:20 ~ $ python manage.py migrate
    Operations to perform:
    [...]
      Applying sessions.0001_initial... OK


    (mvenv)20:20 ~ $ python manage.py createsuperuser


## Публикация нашего блога как веб-приложения

Теперь наш код загружен на PythonAnywhere, виртуальное окружение готово, статические файлы собраны и база данных инициализирована -- мы готовы опубликовать блог как веб-приложение!

Вернись в панель управления PythonAnywhere нажав на лого в верхнем левом углу, затем переключись на вкладку **Web** и нажми кнопку **Add a new web app**.

После подтверждения доменного имени, выбери **manual configuration** (NB *не* «Django»!) в диалоговом окне. Затем выбери **Python 3.4** и заверши работу мастера.

> **Примечание**: убедись, что ты выбрала опцию "Manual configuration", а не "Django". Мы слишком круты для стандартного настройщика PythonAnywhere для Django ;-)

### Настройка виртуального окружения

Ты будешь перенесена на страницу настройки веб-приложения PythonAnywhere, куда тебе будет нужно заходить каждый раз, когда потребуется внести изменения в приложении на сервере.

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

В секции "Virtualenv" кликни по красному тексту "Enter the path to a virtualenv" и набери `/home/<your-username>/my-first-blog/myvenv/`. Нажми на синий прямоугольник с галочкой, чтобы сохранить изменения, прежде чем двигаться дальше.

> **Примечание**: замени имя пользователя на свое. Если ты допустишь ошибку, PythonAnywhere выдаст предупреждение.

### Настройка файла WSGI

Django использует протокол WSGI, стандартный протокол для обслуживания веб-сайтов, используя Python, который поддерживается PythonAnywhere. Используя файл настроек WSGI мы позволим PythonAnywhere распознать наш Django блог.

Кликни по ссылке "WSGI configuration file" (в секции "Code" наверху страницы -- она будет выглядеть следующим образом: `/var/www/<your-username>_pythonanywhere_com_wsgi.py`) и ты будешь переключена на редактор.

Удали все содержимое и замени его чем-то вроде этого:

```python
import os
import sys

path = '/home/<your-username>/my-first-blog'  # use your own username here
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```


> **Примечание**: не забудь заменить имя пользователя на свое там, где указано `<your-username>`

Задача данного файла сказать PythonAnywhere где находится наше веб-приложение и как называется файл настроек Django. Он также загружает "whitenoise" для работы со статическими файлами.

Нажми **Save** и переключись на вкладку **Web**.

Мы все сделали! Нажми на большую зеленую кнопку **Reload** и можешь проверять свое приложение. Ссылку можно найти в верхней части страницы.

## Советы по отладке

Если видишь ошибку при попытке посетить свой сайт, для отладочной информации первым делом смотри **журнал ошибок**. Ссылку на него ты найдёшь на [вкладке Web][8] на PythonAnywhere. Посмотри, нет ли там сообщений о каких-нибудь ошибках; самые последние из них приведены ниже. Они включают:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   пропуск одного из шагов в консоли: создание virtualenv, её активация, установка Django в виртуальное окружение, запуск collectstatic, инициализация базы данных.

*   ошибка в пути к virtualenv -- рядом должно появляться небольшое предупреждение, если PythonAnywhere не может найти виртуальное окружение по указанному адресу.

*   ошибка в файле настроек WSGI -- ты правильно указала путь к директории my-first-blog?

*   Ты выбрала одну и ту же версию Python для virtualenv и для веб-приложения? Обе должны быть 3.4.

*   Также можешь посмотреть [общие советы по отладке на вики PythonAnywhere][9].

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

И помни: твой инструктор здесь, чтобы помогать!

# Ты в сети!

Стандартная страница твоего сайта должна включать приветствие "Welcome to Django", точно также как было на локальном компьютере. Попробуй добавить `/admin/` к концу адреса сайта и перейдешь к панели администратора сайта. Войди под своим именем и паролем и увидишь форму для добавления новых записей в блог.

Ты заслужила *огромную* похвалу! Развертывание сервера — одна из самых каверзных частей веб-разработки, и не редко уходит несколько дней, прежде чем заставишь всё работать. А у нас уже есть работающий в сети веб-сайт, вот так вот!
