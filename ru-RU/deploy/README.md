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
> **Примечание** Один из файлов, заданных в ваш файл `.gitignore` — `db.sqlite3`. Этот файл является локальной базой данных, где хранятся все ваши сообщения. Мы не будем добавлять ее к нашему репозиторию, потому что наш сайт на PythonAnywhere будет использовать другую базу данных. Эта база данных может быть как SQLite, так и многие другие, но обычно вы будете использовать MySQL, которая может выдержать гораздо большее число посетителей, нежели SQLite. Either way, by ignoring your SQLite database for the GitHub copy, it means that all of the posts you created so far are going to stay and only be available locally, but you're going to have to add them again on production. You should think of your local database as a good playground where you can test different things and not be afraid that you're going to delete your real posts from your blog.

Использовать команду `git status` перед `git add` или в любой другой момент, когда ты не уверен, что изменилось — хорошая идея. This will help prevent any surprises from happening, such as wrong files being added or committed. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. The output should be similar to the following:

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
    [...]  create mode 100644 mysite/wsgi.py
    ``` 
    
    
    ## Публикация на GitHub
    Переди на [GitHub.com](https://www.github.com) и зарегистрируй новый бесплатный аккаунт. (If you already did that in the workshop prep, that is great!)
    
    Then, create a new repository, giving it the name "my-first-blog". Leave the "initialize with a README" checkbox unchecked, leave the .gitignore option blank (we've done that manually) and leave the License as None.
    
    <img src="images/new_github_repo.png" />Примечание: Имя репозитория my-first-blog имеет большое значение - ты, конечно, можешь придумать другое название, но оно будет встречаться множество раз в руководстве и тебе придется заменять его каждый раз на свое. Вероятно, проще просто придерживаться имени `my-first-blog`.
    
    On the next screen, you'll be shown your repo's clone URL. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Now we need to hook up the Git repository on your computer to the one up on GitHub.
    
    Type the following into your console (Replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Enter your GitHub username and password and you should see something like this:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Зайди на сайт и проверь!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console – that's the PythonAnywhere version of a console, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Давай загрузим наш код из GitHub на PythonAnywhere, создав "клон" репозитория. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />This will pull down a copy of your code onto PythonAnywhere. Check it out by typing `tree my-first-blog`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Creating a virtualenv on PythonAnywhere
    
    Just like you did on your own computer, you can create a virtualenv on PythonAnywhere. In the Bash console, type:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; **Note** The `pip install` step can take a couple of minutes.  Patience, patience!  But if it takes more than five minutes, something is wrong.  Ask your coach.
    
    &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
    
    ### Creating the database on PythonAnywhere
    
    Here's another thing that's different between your own computer and the server: it uses a different database. So the user accounts and posts can be different on the server and on your computer.
    
    Just as we did on your own computer, we repeat the step to initialize the database on the server, with `migrate` and `createsuperuser`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Publishing our blog as a web app
    
    Now our code is on PythonAnywhere, our virtualenv is ready, and the database is initialized. We're ready to publish it as a web app!
    
    Click back to the PythonAnywhere dashboard by clicking on its logo, and then click on the **Web** tab. Finally, hit **Add a new web app**.
    
    After confirming your domain name, choose **manual configuration** (N.B. – *not* the "Django" option) in the dialog. Next choose **Python 3.6**, and click Next to finish the wizard.
    
    &gt; **Note** Make sure you choose the "Manual configuration" option, not the "Django" one. We're too cool for the default PythonAnywhere Django setup. ;-)
    
    
    ### Setting the virtualenv
    
    You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Click the blue box with the checkmark to save the path before moving on.
    
    &gt; **Note** Substitute your own PythonAnywhere username as appropriate. If you make a mistake, PythonAnywhere will show you a little warning.
    
    
    ### Configuring the WSGI file
    
    Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports. The way we configure PythonAnywhere to recognize our Django blog is by editing a WSGI configuration file.
    
    Click on the "WSGI configuration file" link (in the "Code" section near the top of the page – it'll be named something like `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py`), and you'll be taken to an editor.
    
    Delete all the contents and replace them with the following:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

This file's job is to tell PythonAnywhere where our web app lives and what the Django settings file's name is.

The `StaticFilesHandler` is for dealing with our CSS. This is taken care of automatically for you during local development by the `runserver` command. Мы ближе познакомимся со статическими файлами в дальнейшем, когда начнем писать CSS для нашего сайта.

Нажми **Save** и переключись на вкладку **Web**.

Мы все сделали! Нажми на большую зеленую кнопку **Reload** и можешь проверять свое приложение. Ссылку можно найти в верхней части страницы.

## Советы по отладке

Если видишь ошибку при попытке посетить свой сайт, для отладочной информации первым делом смотри **журнал ошибок**. Ссылку на него ты найдёшь на [вкладке Web](https://www.pythonanywhere.com/web_app_setup/) на PythonAnywhere. Посмотри, нет ли там сообщений о каких-нибудь ошибках; самые последние из них приведены ниже. Они включают:

- Forgetting one of the steps we did in the console: creating the virtualenv, activating it, installing Django into it, migrating the database.

- Making a mistake in the virtualenv path on the Web tab – there will usually be a little red error message on there, if there is a problem.

- Making a mistake in the WSGI configuration file – did you get the path to your my-first-blog folder right?

- Ты выбрала одну и ту же версию Python для virtualenv и для веб-приложения? Обе должны быть 3.6.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

И помни: твой инструктор здесь, чтобы помогать!

# Ты в сети!

The default page for your site should say "It worked!", just like it does on your local computer. Попробуй добавить `/admin/` к концу адреса сайта и перейдешь к панели администратора сайта. Войди под своим именем и паролем и увидишь форму для добавления новых записей в блог.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Ты заслужила *огромную* похвалу! Развертывание сервера — одна из самых каверзных частей веб-разработки, и не редко уходит несколько дней, прежде чем заставишь всё работать. А у нас уже есть работающий в сети веб-сайт, вот так вот!