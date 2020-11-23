# Publicera!

> **Obs!** Detta kapitel kan bitvis vara besvärligt att ta sig igenom. Försök härda ut och ta dig igenom det, distribution är en viktig del av att utveckla webbsidor. Det här kapitlet är placerat i mitten av totorialen så att din mentor kan hjälpa dig med den något besvärligare processen att publicera din webbsida på nätet. Detta innebär att du kan avsluta tutorialen på egen hand om tiden tar slut.

Fram tills nu var din hemsida endast tillgänglig på din dator. Nu lär du dig att publicera det! Publicering är processen att göra din applikation tillgänglig på internet så att andra kan se och använda din app. :)

Som du lärt dig behöver en hemsida ligga på en server. Det finns många serverleverantörer tillgängliga på internet, vi ska använda [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere är gratis för små applikationer som inte har alltför många besökare så det kommer definitivt räcka för dig nu.

Den andra externa tjänsten som vi kommer att använda är [GitHub](https://www.github.com), vilket är en tjänst för kodlagring. Det finns andra tjänster, men nästan alla programmerare har ett GitHub-konto dessa dagar, och snart har även du ett!

Dessa tre platser kommer att vara viktiga för dig. Din lokala dator kommer vara den plats där du gör utveckling och testning. När du är nöjd med ändringarna lägger du en kopia av ditt program på GitHub. Din webbplats kommer att finnas på PythonAnywhere och du uppdaterar den genom att få en ny kopia av din kod från GitHub.

# Git

> **Note** If you already did the [installation steps](../installation/README.md), there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## Skapa vårt Git-repo

Git spårar ändringar i en viss uppsättning filer i vad som kallas ett kod-repositorium (eller kort sagt "repo"). Låt oss skapa ett för vårt projekt. Öppna din konsol och köra dessa kommandon, i katalogen `djangogirls`:

> **Obs** Kontrollera din aktuella arbetskatalog med `pwd` (Mac OS X/Linux) eller `cd` (Windows) innan du initierar repot. Du bör vara i mappen `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initierade tomt Git-arkiv i ~/djangogirls/.git/
    $ git config --global user.name "Ditt Namn"
    $ git config --global user.email din.epost@example.com
    

Initiera git-repot är något vi bara behöver göra en gång per projekt (och du behöver inte ange användarnamn och e-post någonsin igen).

Git kommer spåra ändringar över alla filer och mappar i den här katalogen, men det finns några filer som vi vill ignorera. Vi gör detta genom att skapa en fil som heter `.gitignore` i baskatalogen. Öppna din editor och skapa en ny fil med följande innehåll:

{% filename %}.gitignore{% endfilename %}

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder
    static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

Och spara den som `.gitignore` i topp-nivån av mappen "djangogirls".

> **Obs** Punkten i början av filnamnet är viktigt! Om du får problem med att skapa filen (Mac-datorer gillar inte att du skapar filer som börjar med en punkt via Finder, till exempel), använd funktionen "Spara som" i din redaktör; det är skottsäkert. Och var noga med att inte lägga till `.txt`, `.py` eller någon annan tillägg till filnamnet - det kommer endast att erkännas av Git om namnet bara är `.gitignore`. Linux och MacOS hanterar filer med ett namn som börjar med `.` (t.ex. `.gitignore`) som dolda och det normala `ls` kommandot kommer inte att visa dessa filer. Använd istället `ls -a` för att se filen `.gitignore`
> 
> **Obs** En av de filer du angav i din `.gitignore`-fil är `db.sqlite3`. Den filen är din lokala databas, där alla dina användare och inlägg lagras. Vi följer standard-praxis för webbprogrammering, vilket innebär att vi använder separata databaser för din lokala testsite och din live-webbplats på PythonAnywhere. PythonAnywhere-databasen kan vara SQLite, som på din utvecklingsmaskin, men oftast kommer du att använda en som kallas MySQL som kan hantera många fler besökare än SQLite. Hursomhelst, genom att ignorera din SQLite-databas för GitHub-kopian kommer alla de inlägg och superanvändare du skapat hittills endast att vara tillgängliga lokalt, och du måste skapa nya i produktion. Du bör se din lokala databas som en bra lekplats där du kan testa olika saker och inte vara rädd för att du kommer att ta bort dina riktiga inlägg från din blogg.

Det är en bra idé att använda kommandot `git status` före `git add` eller om du är osäker på vad som har förändrats. Detta kommer hjälpa till att förhindra att överraskningar inträffar, till exempel att fel filer läggs till eller commitas. Kommandot `git status` returnerar information om alla ospårade/modifierade/incheckade filer, gren-status och mycket mer. Resultatet bör likna följande:

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
    

Och slutligen sparar vi våra ändringar. Gå till din konsol och kör dessa kommandon:

{% filename %}command-line{% endfilename %}

    $ git add .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Pusha din kod till GitHub

Gå till [GitHub.com](https://www.github.com) och registrera dig för ett nytt, gratis användarkonto. (Om du redan gjorde det under workshop-förberedelserna är det toppen! Se till att komma ihåg ditt lösenord (lägg till det i din lösenordshanterare, om du använder en).

Skapa sedan en ny databas och ge den namnet ”my-first-blog”. Lämna kryssrutan "initialize with a README" urbockad, lämna fältet för .gitignore tomt (vi har gjort det manuellt) och låt licensen vara "None".

![](images/new_github_repo.png)

> **Obs** Namnet `my-first-blog` är viktigt – du kan välja något annat, men det kommer att inträffa massor av gånger i instruktionerna nedan, och du skulle behöva ersätta det varje gång. Det är nog lättare att hålla sig till namnet `my-first-blog`.

På nästa skärm kommer ditt repos klonings-URL visas, den kommer du att använda i några av de kommandon som följer:

![](images/github_get_repo_url_screenshot.png)

Nu måste vi koppla upp Git-repot på din dator med det på GitHub.

Skriv in följande i konsolen (ersätt `<your-github-username>` med det användarnamn du angav när du skapade ditt GitHub-konto, men utan vinkelparenteserna -- URL:en ska matcha den klonings-URL du just såg):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

När du pushar till GitHub kommer du bli ombedd att fylla i ditt användarnamn och lösenord (antingen direkt där i kommandoradsfönstret eller i ett popup-fönster) och efter att du har angett uppgifterna bör du se något som det här:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Din kod är nu på GitHub. Gå och kolla in den! Du kommer se att den är i gott sällskap – [Django](https://github.com/django/django), [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) och många andra stora projekt med öppen källkod har sin kod på GitHub. :)

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

    $ pip{{ book.pa_py_version }} install --user pythonanywhere
    

That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`, so that the URL matches the clone URL from GitHub):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python={{ book.pa_py_version }} https://github.com/<your-github-username>/my-first-blog.git
    

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

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want. :)

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