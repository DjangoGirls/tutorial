# Внедряване!

> **Забележка** Следващата глава понякога може да бъде малко трудна за преминаване. Продължете и я завършете; внедряването е важна част от процеса на разработване на уебсайтове. Тази глава е поставена в средата на урока, така че вашият ментор да ви помогне с малко по-сложния процес на вдигане на уебсайта ви онлайн. Това означава, че все още можете да завършите урока самостоятелно, ако ви липсва време.

Досега вашият уебсайт беше достъпен само на вашия компютър. Сега ще научите как да го разгърнете! Разгръщането е процесът на публикуване на приложението ви в Интернет, така че хората най-накрая да могат да отидат и да видят приложението ви. :)

Както научихте, уебсайт трябва да бъде разположен на сървър. В интернет има много доставчици на сървъри, ще използваме [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere е безплатен за малки приложения, които нямат твърде много посетители, така че определено сега ще ви бъде достатъчно.

Другата външна услуга, която ще използваме е [GitHub](https://www.github.com), която е услуга за хостинг на код. Има и други, но почти всички програмисти имат GitHub акаунт в наши дни, а сега и вие!

Тези три места ще бъдат важни за вас. Вашият локален компютър ще бъде мястото, където правите разработка и тестване. Когато сте доволни от промените, ще поставите копие на програмата си в GitHub. Вашият уебсайт ще бъде на PythonAnywhere и ще го актуализирате, като получите ново копие на вашия код от GitHub.

# Git

> **Забележка** Ако вече сте направили стъпките за инсталиране, няма нужда да правите това отново - можете да преминете към следващия раздел и да започнете да създавате вашето Git хранилище.

{% include "/deploy/install_git.md" %}

## Стартираме нашето Git хранилище

Git проследява промените в определен набор от файлове в т.нар. Кодово хранилище (или за кратко "repo" от "repository"). Нека започнем еднo за нашия проект. Отворете конзолата и стартирайте тези команди в директорията `djangogirls`:

> **Забележка** Проверете текущата си работна директория с команда `pwd` (Mac OS X / Linux) или `cd` (Windows), преди да инициализирате хранилището. Трябва да сте в папката `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Инициализирането на git хранилището е нещо, което трябва да направим само веднъж за всеки проект (и няма да се налага да въвеждате отново потребителското име и имейла отново).

Git ще проследи промените във всички файлове и папки в тази директория, но има някои файлове, които искаме да игнорира. Правим това чрез създаване на файл, наречен `.gitignore` в основната директория. Отворете редактора си и създайте нов файл със следното съдържание:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    /.vscode
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

И го запишете като `.gitignore` в папката "djangogirls".

> **Забележка** Точката в началото на името на файла е важна! Ако имате проблеми с създаването му (Macs не харесва да създавате файлове, които започват с точка чрез Finder, например), след това използвайте функцията "Save As" в редактора си; това е бронеустойчиво. И не забравяйте да добавите `.txt`, `.py` или друго разширение към името на файла - той ще бъде разпознат от Git само ако името е просто `.gitignore`.
> 
> **Забележка** Един от файловете, които сте посочили във вашия `.gitignore` файл е `db.sqlite3`. Този файл е вашата локална база данни, където се съхраняват всички ваши потребители и публикации. Ще следваме стандартната практика за уеб програмиране, което означава, че ще използваме отделни бази данни за вашия локален тестващ сайт и вашия уеб сайт на живо в PythonAnywhere. Базата данни на PythonAnywhere може да бъде SQLite, като вашата разработваща машина, но обикновено ще използвате такава, наречена MySQL, която може да се справи с много повече посетители на сайта, отколкото SQLite. Така или иначе, като игнорирате вашата SQLite база данни за копието на GitHub, това означава, че всички публикувани досега публикации и superuser ще бъдат достъпни само локално и ще трябва да създавате нови в производството. Трябва да мислите за вашата локална база данни като за добра площадка, където можете да тествате различни неща и да не се страхувате, че ще изтриете истинските си публикации от блога си.

Добра идея е да използвате команда `git status` преди `git add` или винаги, когато се окажете несигурни какво се е променило. Това ще ви помогне да предотвратите появата на изненади, като например добавяне или поемане на грешни файлове. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. The output should be similar to the following:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    No commits yet
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

And finally we save our changes. Go to your console and run these commands:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Pushing your code to GitHub

Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (If you already did that in the workshop prep, that is great!) Be sure to remember your password (add it to your password manager, if you use one).

Then, create a new repository, giving it the name "my-first-blog". Leave the "initialize with a README" checkbox unchecked, leave the .gitignore option blank (we've done that manually) and leave the License as None.

![](images/new_github_repo.png)

> **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. It's probably easier to stick with the name `my-first-blog`.

On the next screen, you'll be shown your repo's clone URL, which you will use in some of the commands that follow:

![](images/github_get_repo_url_screenshot.png)

Now we need to hook up the Git repository on your computer to the one up on GitHub.

Type the following into your console (replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets -- the URL should match the clone URL you just saw):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

When you push to GitHub, you'll be asked for your GitHub username and password (either right there in the command-line window or in a pop-up window), and after entering credentials you should see something like this:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Your code is now on GitHub. Go and check it out! You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)

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

Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`, so that the URL matches the clone URL from GitHub):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python=3.6 https://github.com/<your-github-username>/my-first-blog.git
    

As you watch that running, you'll be able to see what it's doing:

- Downloading your code from GitHub
- Creating a virtualenv on PythonAnywhere, just like the one on your own computer
- Updating your settings file with some deployment settings
- Setting up a database on PythonAnywhere using the `manage.py migrate` command
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.

The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own computer, so it can have different posts and admin accounts. As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

You can also go to the "Files" page and navigate around using PythonAnywhere's built-in file browser. (From the Console page, you can get to other PythonAnywhere pages from the menu button in the upper right corner. Once you're on one of the pages, there are links to the other ones near the top.)

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above
- If you previously signed up for a PythonAnywhere account and had an error with collectstatic, you probably have an older version of SQLite (eg 3.8.2) for your account. In that case, sign up for a new account and try the commands in the PythonAnywhere section above.

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!