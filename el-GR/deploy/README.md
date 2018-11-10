# Ανεβάστε!

> **Σημείωση** Το ακόλουθο κεφάλαιο μπορεί να είναι μερικές φορές λίγο δύσκολο να ολοκληρωθεί. Επιμένετε και τελειώστε το, το ανέβασμα είναι ένα σημαντικό μέρος της διαδικασίας ανάπτυξης της ιστοσελίδας. Άλλωστε όταν αναπτύσετε ένα website θα θέλατε στο τέλος να το δει όλος ο κόσμος, όχι μόνο εσείς στον υπολογιστή σας. Το κεφάλαιο αυτό τοποθετείται στη μέση του οδηγού, έτσι ώστε ο μέντορας σας να μπορεί να σας βοηθήσει με την περίπλοκη διαδικασία του "ανεβάσματος" της ιστοσελίδας στο διαδίκτυο. Αυτό σημαίνει ότι μπορείτε ακόμη να ολοκληρώσετε τον οδηγό μόνοι σας ακόμα και αν σας τελειώσει ο χρόνος.

Μέχρι τώρα, η ιστοσελίδα σου ήταν μόνο διαθέσιμη στον υπολογιστή σου. Τώρα θα μάθεις πως να την ανεβάσεις σε κάποιον server! "Ανεβάζω στο server" (ή άλλιώς deploy) είναι η διαδικασία της δημοσίευσης την εφαρμογής σας στο διαδίκτυο, έτσι ώστε οι άνθρωποι τελικά να πάνε και να δουν την εφαρμογή σας (μέσα από κάποιο url, πχ https://www.mypage. gr). :)

Όπως μάθατε, μια ιστοσελίδα πρέπει να βρίσκεται σε ένα διακομιστή (server). Υπάρχουν εκατοντάδες υπηρεσίες διακομιστών (server providers) εκεί έξω. Εμείς θα χρησιμοποιήσουμε το [PythonAnywhere](https://www.pythonanywhere.com/). Το PythonAnywhere είναι δωρεάν για μικρές εφαρμογές που δεν έχουν πολλούς επισκέπτες, καθιστώντας το ιδανικό για την περίπτωση μας.

Η άλλη υπηρεσία που θα χρησιμοποιήσουμε είναι το [GitHub](https://www.github.com), το οποίο είναι μια υπηρεσία φιλοξενίας κώδικα. Υπάρχουν και άλλες υπηρεσίες φιλοξενίας κώδικα εκεί έξω (όπως το BitBucket και άλλες), αλλά σχεδόν όλοι οι προγραμματιστές έχουν λογαριασμό GitHub αυτές τις μέρες όπως και εσείς τώρα!

Αυτά τα τρία μέρη θα είναι σημαντικά για εσάς. Ο τοπικός σας υπολογιστής θα είναι το μέρος όπου θα κάνετε ανάπτυξη και δοκιμή. Όταν είστε ικανοποιημένοι με τις αλλαγές, θα τοποθετήσετε ένα αντίγραφο του προγράμματος σας στο GitHub. Η ιστοσελίδα σας θα είναι στο PythonAnywhere και θα την ενημερώσετε με το να πάρετε ένα καινούριο αντίγραφο του κωδικού σας από το GitHub.

# Git

> **Σημείωση** Αν κάνατε ήδη τα βήματα εγκατάστασης, δεν χρειάζεται να τα ξανακάνετε. Μπορείτε να μεταβείτε στην επόμενη ενότητα και να ξεκινήσετε να δημιουργήσετε GitHub repository σας (ή με μια λέξη, repo).

{% include "/deploy/install_git.md" %}

## Ξεκινώντας με το Git repo

Το Git παρακολουθεί τις αλλαγές σε ένα συγκεκριμένο σύνολο αρχείων που αποκαλείται αρχείο αποθήκευσης κώδικα (ή «repo» εν συντομία, όπως είπαμε παραπάνω). Ας δημιουργήσουμε ένα για την εφαρμογή μας. Ανοίξτε την κονσόλα σας, μεταβείτε στον φάκελο`djangogirls` και εκτελέστε αυτές τις εντολές:

> **Σημείωση** Ελέγξτε που βρίσκεστε στην κονσόλα (δηλαδή σε ποιον φάκελο) με την εντολή `pwd` (Mac OS X/Linux) ή `cd` (Windows) πριν αρχικοποιήσετε το repo σας. Θα πρέπει να βρίσκεστε στο φάκελο `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Η αρχικοποίηση του repo είναι κάτι που πρέπει να γίνεται μόνο μια φορά ανά project (δίχως να χρειάζεται να εισάγετε το όνομα χρήστη και το email σας, ποτέ ξανά).

Το Git θα παρακολουθήσει τις αλλαγές σε όλα τα αρχεία και τους φακέλους σε αυτόν τον φάκελο (σε αυτό το project). Ωστόσο υπάρχουν ορισμένα αρχεία που θέλουμε να τα αγνοήσει και να μην συμπεριληφθούν στο repo. Το κάνουμε αυτό δημιουργώντας ένα αρχείο που ονομάζεται `.gitignore` στον αρχικό φάκελο. Ανοίξτε το πρόγραμμα επεξεργασίας κειμένου και δημιουργήστε ένα νέο αρχείο με το ακόλουθο περιεχόμενο:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

Αποθηκεύστε το ως `.gitignore` μέσα στον φάκελο "djangogirls".

> **Σημείωση** Η τελεία στην αρχή του ονόματος του αρχείου είναι σημαντική! Αν έχετε κάποιο πρόβλημα στη δημιουργία του (στο Finder, για παράδειγμα, των Mac υπολογιστών, δεν αρέσει να δημιουργούνται αρχεία με την τελεία ως πρώτο χαρακτήρα), τότε χρησιμοποιήστε το "Αποθήκευση ως...". Σιγουρευτείτε, πάντως, να μην προσθέσετε `.txt`, `.py`, ή οποιοδήποτε άλλη κατάληξη στο όνομα του αρχείου. Θα αναγνωριστεί από το Git μόνο αν το όνομα του είναι ακριβώς `.gitignore`.
> 
> **Σημείωση** Ένα από τα ονόματα αρχείων που συμπεριλάβατε στο αρχείο `.gitignore` είναι το αρχείο `db.sqlite3`. Αυτό το αρχείο είναι μια τοπική βάση δεδομένων (database), όπου όλοι οι χρήστες και τα posts σας είναι αποθηκευμένα. Ακολουθούμε μια κοινή πρακτική όσον αφορά τον προγραμματισμό ιστού (web programming) η οποία απαιτεί την χρήση ξεχωριστής βάσης δεδομένων τοπικά στον υπολογιστή μας και στον server όπου θα ανεβάσουμε την εφαρμογή μας (PythonAnywhere). Η βάση δεδομένων του PythonAnywhere θα μπορούσε να είναι και αυτή SQLite, όπως στον υπολογιστή σας αλλά συχνά θα χρησιμοποιείτε μια πιο ευρέως διαδεδομένη και εμπλουτισμένη με πιο πολλά χαρακτηριστικά και δυνατότητες όπως η PostgresQL ή η MySQL. Όπως και να 'χει, μη συμπεριλαμβάνοντας την SQLite βάση στο repo, σημαίνει ότι όλα τα posts και οι χρήστες που δημιουργήσατε μέχρι τώρα θα είναι διαθέσιμα τοπικά στον υπολογιστή σας και θα χρειαστεί να τα ξαναδημιουργήσετε όταν ανεβάσετε το project σας. Να σκέφτεστε την τοπική βάση δεδομένων σας ως ένα παιδότοπο όπου μπορείτε να δοκιμάσετε διαφορετικά πράγματα και να μην φοβάστε ότι πρόκειται να διαγράψετε τις αληθινές σας δημοσιεύσεις από το blog σας.

Είναι καλή ιδέα να χρησιμοποιήσετε την εντολή `git status` πριν από την εντολή`git add` ή όποτε δεν είστε βέβαιοι για το τι έχει αλλάξει. Αυτό θα βοηθήσει να αποτραπούν οποιεσδήποτε εκπλήξεις, όπως το να προστεθούν ή να αποθηκευτούν λανθασμένα αρχεία. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. Τα δεδομένα εξόδου πρέπει να είναι παρόμοια με τα ακόλουθα:

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
    

Και τέλος σώζουμε τις αλλαγές μας. Πηγαίνετε στην κονσόλα σας και να εκτελέσετε αυτές τις εντολές:

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

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

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

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!