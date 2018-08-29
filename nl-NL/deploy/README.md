# Uitrollen!

> **Opmerking** Het volgende hoofdstuk kan soms een beetje moeilijk zijn om doorheen te komen. Zet door en maak het af. Software uitrollen is een belangrijk onderdeel van het ontwikkelproces. Dit hoofdstuk staat in het midden van de tutorial zodat je je mentor om hulp kunt vragen met het online krijgen van je website, wat iets ingewikkelder is. Dit betekent dat je de tutorial later altijd nog zelf kunt afmaken als je tijd tekort komt.

Tot nu toe was je website alleen maar beschikbaar op je eigen computer. Nu leer je hoe je je website kunt uitrollen! Uitrollen is het publiceren van jouw applicatie op het internet zodat mensen eindelijk jouw app kunnen zien. :)

Zoals je geleerd hebt moet een website op een server geplaatst zijn. Er zijn veel server providers beschikbaar op het internet. Wij zullen [PythonAnywhere](https://www.pythonanywhere.com/) gebruiken. PythonAnywhere is gratis voor kleine applicaties die niet zoveel bezoekers hebben, dus voor nu zal het voor jou voldoende zijn.

De andere externe dienst die we zullen gebruiken is [GitHub](https://www.github.com), een code hosting dienst. Er zijn ook anderen beschikbaar, maar bijna alle programmeurs hebben tegenwoordig een GitHub account, en nu jij ook!

Deze drie diensten zijn belangrijk. Je eigen (lokale) computer is de plek waar je verder bouwt en test aan je applicatie. Wanneer je tevreden bent met de wijzigingen, plaats je een kopie van je programma op GitHub. Je website staat op PythonAnywhere en je kunt 'm updaten door middel van een nieuwe kopie van je code van GitHub.

# Git

> **Opmerking** Als je de stappen voor installatie al gevolgd hebt, hoef je dit niet nog een keer te doen. Je kunt het volgende gedeelte overslaan en beginnen met het aanmaken van je Git repository.

{% include "/deploy/install_git.md" %}

## Het aanmaken van je Git repository

Git houdt wijzigingen in een bepaalde set bestanden bij in wat een code 'repository' (oftewel "repo" in het kort) als een soort bewaarplaats. Laten we er één creëren voor ons project. Open je console en draai de volgende commando's, in de `djangogirls` map:

> **Note** Controleer of je in de goede map zit te werken met een `pwd` (Mac OS X/Linux) of `cd` (Windows) commando voordat je de repository creëert. Je zou in de `djangogirls` map moeten zitten.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Je hoeft slechts één keer per project een git repository te creëren (en je hoeft nooit meer je gebruikersnaam en e-mail in te vullen).

Git houdt alle wijzigingen in alle bestanden en mappen in deze map bij, maar er zijn ook een paar bestanden die daarbij genegeerd mogen worden. We kunnen dit aangeven door een bestand genaamd `.gitignore` in de hoofdmap aan te maken. Open je editor en maak een nieuw bestand aan met de volgende inhoud:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

En sla het op als `.gitignore` in de "djangogirls" map.

> **Opmerking** De punt aan het begin van de bestandsnaam is belangrijk! Als je tegen problemen aanloopt bij het creëren van het bestand (Macs vinden het niet leuk als je via de Finder een bestand dat begint met een punt aanmaakt, bijvoorbeeld), gebruik dan de "Opslaan als" functie in je editor; daar kan niks misgaan.
> 
> **Opmerking** Een van de besanden die je genoemd hebt in je `.gitignore` bestand is `db.sqlite3`. Dat bestand is je lokale database, waar al je blogposts worden bewaard. We willen dit niet aan de repository toevoegen, omdat je website straks op PythonAnywhere een andere database zal gebruiken. Die database zou SQLite kunnen zijn, net als op je eigen laptop, maar normaal gesproken zul je MySQL gebruiken, wat veel meer bezoekers aankan dan SQLite. Door de SQLite database te negeren voor de GitHub kopie zullen all blogposts die je tot nu toe geschreven hebt alleen maar lokaal beschikbaar zijn. Je zal ze voor de live website dus nog een keer moeten toevoegen. Zie je lokale database als een speeltuin waar je veel verschillende dingen kunt uitproberen, zonder dat je bang hoeft te zijn dat je al je echte posts perongeluk verwijdert van je blog.

Het is een goed idee om een `git status` commando te gebruiken voor `git add` of wanneer je niet meer helemaal zeker weet welke bestanden je ookalweer hebt gewijzigd. Dit voorkomt nare verrassingen, zoals het toevoegen en committen van verkeerde bestanden. Het `git status` commando weergeeft informatie over alle gewijzigde en klaargezette bestanden, de status van de 'tak' (branch) en nog veel meer. Het resultaat zou hierop moeten lijken:

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
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

Als laatste stap slaan we onze wijzigingen op. Ga naar je console en draai de volgende commando's:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Pushing your code to GitHub

Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (If you already did that in the workshop prep, that is great!)

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
    

Enter your GitHub username and password and you should see something like this:

{% filename %}command-line{% endfilename %}

    Username for 'https://github.com': ola
    Password for 'https://ola@github.com':
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
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

You can also go to the "Files" page and navigate around using PythonAnywhere's built-in file browser. (From the Console page, you can get to other PythonAnywhere pages from the menu button in the upper right corner. Once you're on one of the pages, there are links to the other ones near the top.)

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!