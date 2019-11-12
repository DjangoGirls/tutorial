# I-deploy!

> **Paalala** Ang sumunod na kabanata ay maaring masyadong mahirap maintindihan paminsan-minsan. Magtiyaga at tapusin ito; ang pag-deploy ay isang pinaka-importanteng bahagi sa proseso ng paggawa ng mga website. Ang kabanatang ito ay nilagay sa gitnang bahagi ng tutorial para ang iyong tagapayo ay makatulong sa mga medyo mahirap na proseso sa pag-gawang online ng iyong website. Ibig sabihin nito, pwede mo pa ring tapusin ang tutorial na ikaw lang kahit maubusan ka pa ng oras.

Hanggang ngayon, ang iyong website ay magagamit lang sa iyong kompyuter. Sa ngayon, matutunan mo kung paano ito i-deploy! Ang pag-deploy ay isang proseso ng paglathala ng iyong application sa Internet para sa wakas ay mapuntahan at makita ng mga tao ang iyong app. :)

Base sa natutunan mo, ang website ay kinakailangang nakalagay sa isang server. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

Ang isa pang external service na gagamitin ay ang [GitHub](https://www.github.com), na isang service ng naghohost ng mga code. Mayroon pang pang ibang mga providers, pero karamihan sa mga programmer ngayon ay mayroon nang account sa Github, at ngayon ikaw din!

Ang tatlong lugar na ito ay importante para sa iyo. Ang iyong lokal na komputer kung saan gagawin mo ang pag-dedevelop at pag-test. Kung masaya kana sa mga pagbabago, ikaw ay maglalagay ng kopya ng iyong program sa Github. Ang iyong website ay nandoon sa PythonAnywhere at atin itong i-update sa pamamagitan ng pagkuha ng bagong kopya ng iyong code mula sa Github.

# Git

> **Paalala** Maaring nagawa mo ang mga hakbang sa pag-install, hindi mo na kailangang gawin ito ulit - pwede kang dumeretso sa sunod na seksiyon at magsimulang maglikha ng iyong repository sa Git.

{% include "/deploy/install_git.md" %}

## Pinapaandar ang ating repository sa Git

Ang Git ay nagsubaybay sa mga pagbabago sa isang partikular na grupo ng file sa loob ng tinatawag na repository ng code (o "repo" sa maikli). Umpisahan natin ang isa para sa iyong proyekto. Buksan ang iyong consile at patakuhin ang mga command na ito, sa loob ng directory ng `djangogirls`:

> **Paalala** TIyakin ang iyong kasalukuyang working directory gamit ang `pwd` (Mac OS X/Linux) o `cd` (Windows) na command bago i-initialize ang repository. Dapat na nasa loob ka ng `djangogirls` na folder.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Ang pag-initialize ng git repository ay kailangang gawin nang isang beses lang sa bawat proyekto (at hindi na kinakailangang maglagay pa ng bansag at email kailanman).

Ang git ay magsubaybay sa mga pagbabago sa lahat ng mga file at mga folder sa loob ng directory, pero maaring may mga files na gusto nating isawalang-bahala. Gagawin natin ito sa pamamagitan ng paglikha ng file na tinatawag na `.gitignore` sa loob ng base na directory. Buksan ang iyong editor at maglikha ng bagong file na may sumusunod na nilalaman:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    /.vscode
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

At i-save ito isip `.gitignore` sa loob ng "djangogirls" na folder.

> **Paalala** Ang tuldok sa harap ng pangalan ng file ay importante! Kung ikaw ay nahihirapan sa paglikha nito (ang Mac ay hindi gusto na maglikha ka ng mga file na nagisisumula sa isang tulod sa pamamagitan ng Finder, halimbawa), kung gayon ay gamitin ang "Save As" na katangian ng iyong editor; ito ay himpit. And be sure not to add `.txt`, `.py`, or any other extension to the file name -- it will only be recognized by Git if the name is just `.gitignore`.
> 
> **Paalala** Isa sa mga file na nilakip mo sa iyong `.gitignore` file ay si `db.sqlite3`. That file is your local database, where all of your users and posts are stored. We'll follow standard web programming practice, meaning that we'll use separate databases for your local testing site and your live website on PythonAnywhere. The PythonAnywhere database could be SQLite, like your development machine, but usually you will use one called MySQL which can deal with a lot more site visitors than SQLite. Either way, by ignoring your SQLite database for the GitHub copy, it means that all of the posts and superuser you created so far are going to only be available locally, and you'll have to create new ones on production. Isipin mo ang iyong local na database na isang magandang palaruan kung saan pede mung masubukan ang ibat-ibang bagay na walang takot na mabura mo ang mga tunay na post galing sa iyong blog.

Mainam na gamitin mo muna ang `git status` na commmand bago ka mag `git add` o kapag hindi ka sigurado kung ano ang nagbago. Nakakatulong ito para hindi ka mabigla sa mga pangyayari, gaya ng mga maling file na nasali at na-commit. Ang `git status` na command ay naghahatid ng mga impormasyon sa lahat ng mga file na hindi naka track/binago/at na-stage, ang estado ng branch, at marami pang iba. Ang output ay dapat kagaya ng sumusunod:

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
    

At sa wakas, ating i-save ang ating mga binago. Pumunta iyong console at patakbuhin ang mga command na ito:

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