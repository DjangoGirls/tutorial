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
     ```
    
    
    ## Pushing your code to GitHub
    
    Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (Als je tijdens de workshop voorbereiding al een GitHub account hebt aangemaakt, super!)
    
    Vervolgens, creëer een nieuwe repository en geef het de naam "my-first-blog". Laat het vakje bij "initialize with a README" leeg, laat de .gitignore optie ook leeg (dat hebben we handmatig al gedaan) en laat de licentie staan op geen (None).
    
    <img src="images/new_github_repo.png" />
    
    > **Opmerking** De naam 'my-first-blog' is belangrijk. Je kunt natuurlijk iets anders kiezen, maar in de instructies hieronder zul je het vaak tegen komen, en je zou het dan elke keer moeten vervangen. Het is waarschijnlijk makkelijker om gewoon de naam 'my-first-blog' aan te houden.
    
    Op het volgende scherm zul je je repo's kloon URL vinden. Kies de "HTTPS" versie, kopiëer het, zodat je het straks in de terminal kunt plakken:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Nu moeten we de GitHub repository op jouw computer nog koppelen aan die op GitHub.
    
    Typ het volgende in op je console (vervang de '<your-github-username>' met de gebruikersnaam die je hebt gebruikt toen je je GitHub account aanmaakte, maar zonder de haakjes):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Enter your GitHub username and password and you should see something like this:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Go and check it out!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console – that's the PythonAnywhere version of a console, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Let's pull down our code from GitHub and onto PythonAnywhere by creating a "clone" of our repo. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
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

The `StaticFilesHandler` is for dealing with our CSS. This is taken care of automatically for you during local development by the `runserver` command. We'll find out a bit more about static files later in the tutorial, when we edit the CSS for our site.

Hit **Save** and then go back to the **Web** tab.

We're all done! Hit the big green **Reload** button and you'll be able to go view your application. You'll find a link to it at the top of the page.

## Debugging tips

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom. Common problems include:

- Forgetting one of the steps we did in the console: creating the virtualenv, activating it, installing Django into it, migrating the database.

- Making a mistake in the virtualenv path on the Web tab – there will usually be a little red error message on there, if there is a problem.

- Making a mistake in the WSGI configuration file – did you get the path to your my-first-blog folder right?

- Did you pick the same version of Python for your virtualenv as you did for your web app? Both should be 3.6.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

And remember, your coach is here to help!

# You are live!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!