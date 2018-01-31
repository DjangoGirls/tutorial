# Deploy!

> **Megjegyzés** A következő fejezet néhol kissé bonyolult lehet. Tarts ki és vedd át az egész fejezetet; ugyanis most a webfejlesztés egy nagyon fontos része következik - az ún. deployment. Ez a fejezet a tutorial közepén található, így majd a mentorod is tud segíteni a trükkösebb részeknél, miközben a honlapodat online is elérhetővé teszed. Magát a tutorialt később egyedül is befejezheted, ha esetleg kifutnál az időből.

Míg most, a honlap csak akkor érhető el a számítógépen. Most megtanulod, hogyan kell telepíteni! Ez az ún. deploying - az a tevékenység, amely során az alkalmazásodat közzé teszed az interneten, hogy mások is láthassák és használhassák azt. :)

Ahogyan azt már tudod, a honlapot egy szerveren kell elhelyezni. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

A másik külső szolgáltatás, amit igénybe fogunk venni a [GitHub](https://www.github.com), ami egy ún. code hosting service (forráskód tárolására és megosztására alkalmas online tárhely). Vannak más hozzá hasonló szolgáltatók is, de szinte minden programozó ezt használja manapság, és nemsokára te is közéjük tartozhatsz!

Ez a három helyen lesz fontos. A helyi számítógép lesz az a hely, ahol fejlesztés, tesztelés. Amikor boldog vagy, a változások, a hely egy másolatot a program a GitHub. Your website will be on PythonAnywhere and you will update it by getting a new copy of your code from GitHub.

# Git

> **megjegyzés** Ha már a Telepítési lépéseket, nem kell ezt még egyszer – ugrás a következő részt, majd kezdeni a Git repository.

{% include "/deploy/install_git.md" %}

## Készítsünk Git repository-t

A Git nyomon követi a változásokat az adott fájlokban egy ún. csomagtárban (repository vagy röviden "repo"). Nyissunk egy új repo-t a projektünknek. Nyisd fel a konzolt és futtasd le a következő parancsokat, a `djangogirls` mappában:

> **Note** Check your current working directory with a `pwd` (Mac OS X/Linux) or `cd` (Windows) command before initializing the repository. A `djangogirls` mappában kell lenned.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Inicializálása a git repository-valamit tennünk kell, csak, ha egy projekt (nem kell újra adja meg a felhasználó nevét, e-mail soha többé).

A Git ezután nyomon követ minden változást a fájlokban és mappákban ezen a mappán belül. De vannak bizonyos fájlok, amiket nem szeretnénk figyelembe venni. Ezt úgy tehetjük meg, hogy létrehozunk egy fájlt `.gitignore` névvel a gyökérkönyvtárban. Nyisd meg a szövegszerkesztőt és hozz létre egy új fájlt, amibe az alábbi sorok kerülnek:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

And save it as `.gitignore` in the "djangogirls" folder.

> **Megjegyzés** Nagyon fontos, hogy a fájl neve ponttal kezdődjön! Ha nehezen létrehozása (Mac nem tetszik, hogy hozzon létre fájlokat, hogy kezdődik egy dot keresztül a Finder, például), akkor használja a "Mentés másként" funkciót a szerkesztő; golyóálló.
> 
> **Note** One of the files you specified in your `.gitignore` file is `db.sqlite3`. Ez a fájl a helyi adatbázis, ahol az összes hozzászólás tárolja. We don't want to add this to your repository because your website on PythonAnywhere is going to be using a different database. That database could be SQLite, like your development machine, but usually you will use one called MySQL which can deal with a lot more site visitors than SQLite. Akárhogy is, figyelmen kívül hagyva az SQLite adatbázis a GitHub példányt, ez azt jelenti, hogy az összes hozzászólás létrehozott olyan messze vannak, hogy csak akkor áll rendelkezésre, helyben, de azt kell, hogy vegye fel őket újra a termelés. Meg kell gondolni, a helyi adatbázis, mint egy jó játszótér, ahol ki lehet próbálni más dolgokat pedig ne félj, hogy akarsz törölni az igazi hozzászólás, a blogot.

Jó ötlet a `git status` parancs használata még a `git add` előtt, valamint ezen kívül még bármikor, ha tudni szeretnéd, hogy mi változott. Ez segít megelőzni semmilyen meglepetés történik, mint a rossz fájlokat, hogy ki vagy követett el. A `git állapota` parancs visszatér információt bármely untracked/módosított/megrendezett fájlokat, a fióktelep állapota, valamint sokkal több. A kimenet az alábbihoz hasonló:

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
    

Végül mentsük le a változtatásokat. A konzolban futtasd le a következő parancsokat:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    
    ## Pushing your code to GitHub
    
    Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (If you already did that in the workshop prep, that is great!)
    
    Then, create a new repository, giving it the name "my-first-blog". Hagyja a "inicializálni egy README" jelölőnégyzetet bejelölve hagyja a .gitignore lehetőség üres (már megtettük kézzel), majd hagyja, hogy a Licenc Nem.
    
    <img src="images/new_github_repo.png" />
    
    > **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. Talán könnyebb, hogy csak maradjon a neve `az-elso-blog`.
    
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
    
    Your code is now on GitHub. Menj és nézd meg!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console – that's the PythonAnywhere version of a console, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Töltsük be a forráskódodat a GitHubról a PythonAnywhere-be egy "clone" létrehozásával. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
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
    
    Now our code is on PythonAnywhere, our virtualenv is ready, and the database is initialized. Készen állunk, hogy tegye közzé, mint egy web app!
    
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

The `StaticFilesHandler` is for dealing with our CSS. This is taken care of automatically for you during local development by the `runserver` command. A statikus fájlokról többet is tanulsz majd a tutorial során, amikor a CSS-t fogod szerkeszteni a honlapodhoz.

Nyomd meg a **Save** (Mentés) gombot, majd menj vissza a **Web** fülre.

Kész is vagyunk! Nyomd meg a nagy zöld **Reload** gombot, és máris meg fogod tudni nézni az alkalmazásodat. Az oldal tetején fogsz találni hozzá egy linket.

## Tippek debuggoláshoz

Ha hibát látsz, amikor megpróbálod meglátogatni az oldaladat, az első hely, ahol információt kaphatsz a debuggoláshoz, az **error log**. Ehhez a PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/)-ján találod meg a linket. Nézd meg, hogy van-e benne bármilyen hibaüzenet; a legfrissebbek lesznek alul. Gyakran előforduló problémák:

- Forgetting one of the steps we did in the console: creating the virtualenv, activating it, installing Django into it, migrating the database.

- Making a mistake in the virtualenv path on the Web tab – there will usually be a little red error message on there, if there is a problem.

- Making a mistake in the WSGI configuration file – did you get the path to your my-first-blog folder right?

- Ugyanazt a Python verziót választottad a virtualenved számára, mint az alkalmazásodhoz? Mindkettőnek a 3.6-esnek kell lennie.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

És ne feledd, a coachod azért van, hogy segítsen!

# Él a weboldalad!

The default page for your site should say "It worked!", just like it does on your local computer. Add hozzá az `/admin/`-t az URL végéhez, és az adminfelületre kerülsz. Jelentkezz be a felhasználóneveddel és a jelszavaddal, és látni fogod, hogy itt is tudsz új Postokat létrehozni.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Megérdemelsz egy *HATALMAS* vállveregetést! A szerver deployment a webfejlesztés legbonyolultabb részei közé tartozik, és a fejlesztők gyakran napokat töltenek azzal, hogy mindent működésre bírjanak. De neked most komolyan van egy működő weboldalad, az Interneten, és nem is tartott sokáig megcsinálni!