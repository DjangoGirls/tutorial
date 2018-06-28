# Публикация!

> **Примечание**: Эта глава может показаться сложной. Будь упорна, развертывание сайта на сервере является важной частью веб-разработки. Данная глава намеренно расположена в середине учебника для того, чтобы твой наставник смог помочь с таким мудреным процессом, как публикация сайта. Так ты сможешь самостоятельно закончить все главы, даже если время будет поджимать.

До сих пор твой сайт был доступен только с твоего компьютера. Сейчас ты узнаешь, как "развернуть" свой сайт! Развертывание (deploy) — это процесс публикации приложения в интернете, чтобы люди могли наконец увидеть твое творение. :)

Как ты уже знаешь, веб-сайт должен располагаться на сервере. В интернете есть много сервер-провайдеров, мы будем использовать [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere предоставляется бесплатно для небольших приложений с небольшим числом посетителей, что более чем достаточно для нас.

Другим внешним сервисом, которым мы будем пользоваться, является [GitHub](https://www.github.com) — сервис хостинга кода. Существуют и другие похожие сервисы, но практически у каждого программиста есть GitHub аккаунт, теперь будет и у тебя!

Эти три места будут важны для вас. Ваш локальный компьютер будет местом, где вы будете вести разработку и тестирование. Когда вы удовлетворены изменениями, вы разместите копию вашей программы на GitHub. Ваш веб-сайт будет на PythonAnywhere, и вы будете обновлять его, получая новые копии вашего кода с GitHub.

# Git

> **Примечание**Если вы уже проделали все шаги установки, делать это вновь нет необходимости - вы можете пропустить этот раздел и приступить к созданию Git репозитория.

{% include "/deploy/install_git.md" %}

## Создаём Git-репозиторий

Git отслеживает изменения определенного набора файлов, которая называется репозиторием (сокращенно "репо"). Давайте создадим один для нашего проекта. Откройте консоль и запустите эти команды в папке `djangogirls`:

> **Примечание**Проверьте свой текущий рабочий каталог с помощью команд `pwd` (Mac OS X/Linux) или `cd` (Windows), прежде чем инициализировать репозиторий. Ты должна находиться в директории `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Инициализировать git-репозиторий необходимо только один раз за проект (и тебе больше не придется снова вводить имя пользователя и адрес электронной почты).

Git будет отслеживать изменения всех файлов и каталогов в заданной директории, однако некоторые из них мы предпочли бы игнорировать. Для этого нам нужно создать файл `.gitignore` в корневом каталоге репозитория. Открой редактор и создай новый файл со следующим содержанием:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    __pycache__
    myvenv
    db.sqlite3
    .DS_Store
    

И сохрани его как `.gitignore` в корневом каталоге "djangogirls".

> **Примечание**: Точка в начале имени файла имеет важное значение! Если у тебя есть проблемы с созданием таких файлов (Mac не позволит создать файл с названием, начинающимся с точки, через Finder, например), тогда используй кнопку "Сохранить как" в меню своего редактора кода, это точно поможет.
> 
> **Примечание** Один из файлов, заданных в ваш файл `.gitignore` — `db.sqlite3`. Этот файл является локальной базой данных, где хранятся все ваши сообщения. Мы не будем добавлять ее к нашему репозиторию, потому что наш сайт на PythonAnywhere будет использовать другую базу данных. Эта база данных может быть как SQLite, так и многие другие, но обычно вы будете использовать MySQL, которая может выдержать гораздо большее число посетителей, нежели SQLite. В любом случае, игнорирование базы данных SQLite для копирования GitHub, означает, что все сообщения, созданные вами пока остаются и будут доступны только локально, но вы собираетесь добавить их снова в производство. Вы должны думать о вашей локальной базе данных как о хорошей игровой площадке, где вы можете проверить разные вещи и не бояться, что вы удалите ваши реальные сообщения из вашего блога.

Использовать команду `git status` перед `git add` или в любой другой момент, когда ты не уверен, что изменилось — хорошая идея. Это убережёт тебя от таких неприятных сюрпризов, таких как добавление или "коммит" неправильных файлов. Команда `git status` возвращает информацию обо всех ранее неотслеживаемых/изменённых/добавленных в git файлах, а также статус ветки и многое другое. Результат должен быть аналогичен следующему:

{% filename %}command-line{% endfilename %}

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

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Публикация твоего кода на GitHub

Перейди на сайт [GitHub.com](https://www.github.com) и зарегистрируй новый бесплатный аккаунт. (Если ты уже это сделала в рамках подготовки к воркшопу, то это отлично!)

Дальше создай новый репозиторий с именем "my-first-blog". Не ставь галочку на пункте "initialize with a README" и отметь опции .gitignore(мы создадим этот файл вручную) и License как None.

![](images/new_github_repo.png)

> **Примечание:** Имя репозитория `my-first-blog` имеет очень большое значение. Ты конечно можешь придумать другое название, но оно встречается много раз в руководстве и тебе придется каждый раз менять его на своё. Для начала будет проще остановиться на нашем варианте `my-first-blog`.

На следующем экране ты увидишь ты увидишь ссылку для создания клона, то есть копии репозитория. Выбери "HTTPS" версию, скопируй ссылку и вставь в окно терминала:

![](images/github_get_repo_url_screenshot.png)

Теперь нам нужно связать твой локальный Git репозиторий на компьютере с репозиторием на GitHub.

Напиши у себя в консоли следующую команду (Замени `<your-github-username>` именем, который ты указала при создании аккаунта на GitHub без угловых скобок):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Введи своё имя пользователя и пароль от аккаунта GitHub, ты увидишь что-то подобное:

{% filename %}command-line{% endfilename %}

    Username for 'https://github.com': hjwp
    Password for 'https://hjwp@github.com':
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    
    To https://github.com/ola/my-first-blog.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Теперь твой код загружен на GitHub. Зайди на сайт и проверь! You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)

# Setting up our blog on PythonAnywhere

## Sign up for a PythonAnywhere account

> **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.

{% include "/deploy/signup_pythonanywhere.md" %}

## Configuring our site on PythonAnywhere

Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.

![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)

> **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.

Deploying a web app on PythonAnywhere involves pulling down your code from GitHub, and then configuring PythonAnywhere to recognise it and start serving it as a web application. There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

As you watch that running, you'll be able to see what it's doing:

- Downloading your code from GitHub
- Creating a virtualenv on PythonAnywhere, just like the one on your own PC
- Updating your settings file with some deployment settings
- Setting up a database on PythonAnywhere using the `manage.py migrate` command
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.

As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite  static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!