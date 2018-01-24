# Ανεβάστε!

> **Σημείωση** Το ακόλουθο κεφάλαιο μπορεί να είναι μερικές φορές λίγο δύσκολο να ολοκληρωθεί. Επιμένετε και τελειώστε το, το ανέβασμα είναι ένα σημαντικό μέρος της διαδικασίας ανάπτυξης της ιστοσελίδας. Το κεφάλαιο αυτό τοποθετείται στη μέση του εκπαιδευτικού εγγράφου, έτσι ώστε να μέντορας σας να μπορεί να σας βοηθήσει με την ελαφρώς πιο περίπλοκη διαδικασία "ανεβάσματος" της ιστοσελίδας στο διαδίκτυο. Αυτό σημαίνει ότι μπορείτε να ολοκληρώσετε την εκπαίδευση μόνοι σας ακόμα και αν σας τελειώσει ο χρόνος.

Μέχρι τώρα, η ιστοσελίδα σου ήταν μόνο διαθέσιμη στον υπολογιστή σου. Τώρα θα μάθεις πως να την αναπτύσσεις! Ανεβάζω στο διαδίκτυο" είναι η διαδικασία της δημοσίευσης την εφαρμογής σας στο διαδίκτυο, έτσι ώστε οι άνθρωποι τελικά να πάνε και να δουν την εφαρμογή σας. :)

Όπως μάθατε, μια ιστοσελίδα πρέπει να βρίσκεται σε ένα διακομιστή. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

Η άλλη εξωτερική υπηρεσία που θα χρησιμοποιήσουμε είναι το [GitHub](https://www.github.com), το οποίο είναι μια υπηρεσία φιλοξενίας κώδικα. Υπάρχουν και άλλοι διαθέσιμοι έξω, αλλά σχεδόν όλοι οι προγραμματιστές έχουν λογαριασμό GitHub αυτές τις μέρες, και έτσι και εσείς θα έχετε τώρα!

Αυτά τα τρία μέρη θα είναι σημαντικά για εσάς. Ο τοπικός σας υπολογιστής θα είναι το μέρος όπου θα κάνετε ανάπτυξη και δοκιμή. Όταν είστε ικανοποιημένοι με τις αλλαγές, θα τοποθετήσετε ένα αντίγραφο του προγράμματος σας στο GitHub. Η ιστοσελίδα σας θα είναι στο PythonAnywhere και θα την ενημερώσετε με το να πάρετε ένα καινούριο αντίγραφο του κωδικού σας από το GitHub.

# Git

> **Σημείωση** Αν κάνατε ήδη τα βήματα εγκατάστασης, δεν χρειάζεται να τα ξανακάνετε- μπορείτε να παραλείψετε στην επόμενη ενότητα και να ξεκινήσετε να δημιουργείτε το αρχείο αποθήκευσης του Git.

{% include "/deploy/install_git.md" %}

## Ξεκινώντας το αρχείο αποθήκευσής μας του Git

Το Git παρακολουθεί τις αλλαγές σε ένα συγκεκριμένο σύνολο αρχείων που αποκαλείται αρχείο αποθήκευσης κώδικα (ή «ρεπό» εν συντομία). Ας ξεκινήσουμε ένα για την εφαρμογή μας. Ανοίξτε την κονσόλα σας και να εκτελέσετε αυτές τις εντολές, στον φάκελο`djangogirls`:

> **Note** Check your current working directory with a `pwd` (Mac OS X/Linux) or `cd` (Windows) command before initializing the repository. Θα πρέπει να βρίσκεστε στο φάκελο `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Το όνομά σας"
    $ git config --global user.email you@example.com
    

Initializing the git repository is something we need to do only once per project (and you won't have to re-enter the username and email ever again).

Το Git θα παρακολουθείσει τις αλλαγές σε όλα τα αρχεία και τους φακέλους σε αυτόν τον κατάλογο, ωστόσο υπάρχουν ορισμένα αρχεία που θέλουμε να τα αγνοήσει. Το κάνουμε αυτό δημιουργώντας ένα αρχείο που ονομάζεται `.gitignore` στον αρχικό κατάλογο. Ανοίξτε το πρόγραμμα επεξεργασίας κειμένου και δημιουργήστε ένα νέο αρχείο με το ακόλουθο περιεχόμενο:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

And save it as `.gitignore` in the "djangogirls" folder.

> **Σημείωση** Η τελεία στην αρχή του ονόματος του αρχείου είναι σημαντική! If you're having any difficulty creating it (Macs don't like you to create files that begin with a dot via the Finder, for example), then use the "Save As" feature in your editor; it's bulletproof.
> 
> **Note** One of the files you specified in your `.gitignore` file is `db.sqlite3`. Αυτό το αρχείο είναι η τοπική σου βάση δεδομένων, όπου όλες οι δημοσιεύσεις σου αποθηκεύονται. Δεν θέλουμε να προσθέσουμε αυτό στην αποθήκη σας επειδή η ιστοσελίδα σας στο PythonAnywhere πρόκειται να χρησιμοποιεί διαφορετική βάση δεδομένων. Η βάση δεδομένων μπορεί να είναι SQLite, όπως η μηχανή ανάπτυξης σας, αλλά συνήθως θα χρησιμοποιείται μία που ονομάζεται MySQL η οποία μπορεί να ασχοληθεί με πολύ περισσότερους επισκέπτες από την SQLite. Έτσι και αλλιώς, αγνοώντας την βάση δεδομένων σας SQLite για την αντιγραφή στο GitHub, σημαίνει ότι όλες οι δημοσιεύσεις σας που έχετε δημιουργήσει μέχρι τώρα πρόκειται να μείνουν και να είναι διαθέσιμες τοπικά, αλλά θα πρέπει να τις προσθέσετε ξανά στην παραγωγή. Να σκέφτεστε την τοπική βάση δεδομένων σας ως ένα παιδότοπο όπου μπορείτε να δοκιμάσετε διαφορετικά πράγματα και να μην φοβάστε ότι πρόκειται να διαγράψετε τις αληθινές σας δημοσιεύσεις από το blog σας.

Είναι καλή ιδέα να χρησιμοποιήσετε την εντολή `git status` πριν από την εντολή`git add` ή όποτε δεν είστε βέβαιοι για το τι έχει αλλάξει. Αυτό θα βοηθήσει να αποτραπούν οποιεσδήποτε εκπλήξεις, όπως το να προστεθούν ή να αποθηκευτούν λανθασμένα αρχεία. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. Τα δεδομένα εξόδου πρέπει να είναι παρόμοια με τα ακόλουθα:

{% filename %}command-line{% endfilename %}

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
    
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
     ```
    
    
    ## Pushing your code to GitHub
    
    Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (Αν το κάνατε ήδη στην προετοιμασία εργαστηρίου, θαυμάσια!)
    
    Έπειτα, δημιουργήστε ένα νέο χώρο αποθήκευσης, ονομάζοντας το "το πρώτο μου blog". Leave the "initialize with a README" checkbox unchecked, leave the .gitignore option blank (we've done that manually) and leave the License as None.
    
    <img src="images/new_github_repo.png" />
    
    > **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. Είναι πιθανώς ευκολότερο να παραμείνετε στο όνομα "το πρώτο μου blog".
    
    Στην επόμενη οθόνη, θα δείτε την διεύθυνση URL του κλώνου του αποθηκευτικού χώρου σας. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Now we need to hook up the Git repository on your computer to the one up on GitHub.
    
    Πληκτρολογήστε τα ακόλουθα στην κονσόλα σας (Αντικαταστήστε '<your-github-username>; με το όνομα χρήστη που εισάγατε όταν δημιουργήσατε τον λογαριασμό GitHub σας, αλλά χωρίς τις αγκύλες)
    
    {% filename %}Γραμμή εντολών{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Εισάγετε το GitHub όνομα χρήστη και κωδικό σας και θα πρέπει να δείτε κάτι σαν αυτό:
    
    {% filename %}γραμμή εντολών{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Πηγαίνετε και τσεκάρετέ το!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Διαλέξτε την επιλογή να ξεκινήσετε μία κονσόλα "Bash" - αυτή είναι η PythonAnywhere έκδοση της κονσόλας, όπως αυτή στον υπολογιστή σας.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Ας τραβήξουμε μας κώδικά μας από το GitHub στο PythonAnywhere, δημιουργώντας έναν «κλώνο» του αρχείου αποθήκευσής μας. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
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

    <br /><br />&gt; **Note** The `pip install` step can take a couple of minutes.  Υπομονή, υπομονή!  Αλλά αν πάρει πάνω από πέντε λεπτά, κάτι είναι λάθος.  Ρωτήστε τον προπονητή σας.
    
    &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
    
    ### Creating the database on PythonAnywhere
    
    Here's another thing that's different between your own computer and the server: it uses a different database. Έτσι οι λογαριασμοί χρήστη και οι δημοσιεύσεις μπορούν να είναι διαφορετικά στον διακομιστή και τον υπολογιστή σας.
    
    Just as we did on your own computer, we repeat the step to initialize the database on the server, with `migrate` and `createsuperuser`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Publishing our blog as a web app
    
    Now our code is on PythonAnywhere, our virtualenv is ready, and the database is initialized. Είμαστε έτοιμοι να το δημοσιεύσουμε ως μία εφαρμογή δικτύου!
    
    Click back to the PythonAnywhere dashboard by clicking on its logo, and then click on the **Web** tab. Finally, hit **Add a new web app**.
    
    After confirming your domain name, choose **manual configuration** (N.B. – *not* the "Django" option) in the dialog. Μετά επιλέξτε **Python 3.6**, και κάντε κλικ στο κουμπί Next για να ολοκληρώσετε τον οδηγό.
    
    &gt; **Σημείωση** Σιγουρευτείτε να επιλέξετε την επιλογή "Manual configuration", όχι την "Django". Είμαστε πολύ κουλ για την προεπιλεγμένη PythonAnywhere Django εγκατάσταση. ;-)
    
    
    ### Setting the virtualenv
    
    You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Κάντε κλικ στο τσεκαρισμένο μπλε κουτί για να αποθηκεύσετε το μονοπάτι πριν συνεχίσετε.
    
    &gt; **Note** Substitute your own PythonAnywhere username as appropriate. Εάν κάνετε ένα λάθος, το PythonAnywhere θα σας δείξει μια μικρή προειδοποίηση.
    
    
    ### Configuring the WSGI file
    
    Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports. Ο τρόπος που ρυθμίζουμε το PythonAnywhere να αναγνωρίζει τα Django blog μας είναι τροποποιώντας ένα αρχείο ρύθμισης παραμέτρων WSGI.
    
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
    

Η δουλειά αυτού του αρχείου είναι να πει στο PythonAnywhere που ζει η εφαρμογή δικτύου μας και ποιο είναι το όνομα του αρχείου ρυθμίσεων Django.

The `StaticFilesHandler` is for dealing with our CSS. Αυτό τακτοποιείται αυτόματα κατά την διάρκεια της τοπικής ανάπτυξης από την εντολή `runserver`. Θα μάθουμε λίγο περισσότερα για τα στατικά αρχεία αργότερα στο εγχειρίδιο, όταν θα επεξεργαστούμε το CSS για την ιστοσελίδα μας.

Πατήστε **Save** και στη συνέχεια, επιστρέψτε στην καρτέλα **Web**.

Είμαστε καθ'όλα έτοιμοι! Κλικάρετε το μεγάλο πράσινο κουμπί **Reload** και θα είστε σε θέση να δείτε την εφαρμογή σας. Θα βρείτε έναν σύνδεσμο σε αυτό στην κορυφή της σελίδας.

## Συμβουλές για τον εντοπισμό σφαλμάτων

Εάν εμφανιστεί ένα σφάλμα κατά την προσπάθειά σας να επισκεφθείτε την ιστοσελίδα σας, το πρώτο μέρος για να ψάξετε ορισμένες πληροφορίες εντοπισμού σφαλμάτων είναι στο αρχείο **error log**. Θα βρείτε ένα σύνδεσμο προς αυτό στην καρτέλα [Web](https://www.pythonanywhere.com/web_app_setup/) του PythonAnywhere. Δείτε εάν υπάρχουν κάποια μηνύματα σφάλματος εκεί. Τα πλέον συχνά εμφανίζονται στο κάτω μέρος. Τα πιο συνηθισμένα προβλήματα περιλαμβάνουν:

- Ξεχνώντας ένα από τα βήματα που κάναμε στην κονσόλα: δημιουργία του virtualenv, ενεργοποίηση του, εγκατάσταση του Django σε αυτό, μετεγκατάσταση της βάσης δεδομένων.

- Κάνοντας ένα λάθος στο μονοπάτι virtualenv στην καρτέλα Web- θα υπάρχει συνήθως ένα μικρό κόκκινο μήνυμα σφάλματος, εάν υπάρχει ένα πρόβλημα.

- Making a mistake in the WSGI configuration file – did you get the path to your my-first-blog folder right?

- Πήρατε την ίδια έκδοση της Python για το virtualenv, όπως κάνατε για την εφαρμογή διαδικτύου; Και οι δύο θα πρέπει να είναι 3.6.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

Και να θυμάστε, ο εκπαιδευτής σας είναι εδώ να βοηθήσει!

# Είστε συνδεδεμένοι!

Η προεπιλεγμένη σελίδα για τον ιστότοπο σας πρέπει να λέει "Λειτουργεί!", όπως και στον τοπικό υπολογιστή σας. Δοκιμάστε να προσθέσετε το `/admin/` στο τέλος του URL, και θα μεταφερθείτε στην ιστοσελίδα διαχείρισης. Συνδεθείτε με το όνομα χρήστη και τον κωδικό πρόσβασης, και θα δείτε ότι μπορείτε να προσθέσετε νέες αναρτήσεις στο διακομιστή.

Μόλις δημιουργήσετε μερικές δημοσιεύσεις, μπορείτε να πάτε πίσω στην τοπική σας εγκατάσταση (όχι το PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. Αυτό σας επιτρέπει να εργάζεστε και να πειραματίζεστε χωρίς να σπάσετε την ζωντανή σελίδα σας Web. Pretty cool, huh?

Δώστε στον εαυτό σας ένα *ΜΕΓΑΛΟ* ελαφρύ χτύπημα στην πλάτη! Η εγκατάσταση σε έναν διακομιστή είναι ένα από τα πιο πολύπλοκα κομμάτια της ανάπτυξης εφαρμογών διαδικτύου και παίρνει συχνά αρκετές ημέρες στους ανθρώπους προτού να τις κάνουν λειτουργικές. Αλλά έχετε την ιστοσελίδα σας ζωντανή, στο πραγματικό Διαδίκτυο, ακριβώς όπως αυτό!