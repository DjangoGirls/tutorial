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

Είναι καλή ιδέα να χρησιμοποιήσετε την εντολή `git status` πριν από την εντολή`git add` ή όποτε δεν είστε βέβαιοι για το τι έχει αλλάξει. Αυτό θα βοηθήσει να αποτραπούν οποιεσδήποτε εκπλήξεις, όπως το να προστεθούν ή να αποθηκευτούν λανθασμένα αρχεία. Η εντολή `git status` επιστρέφει πληροφορίες σχετικά με το ποια αρχεία είναι untracked/modified/staged files, το status του branch και πολλές ακόμη πληροφορίες. Η έξοδος πρέπει να είναι παρόμοια με τα ακόλουθα:

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
    

Και τέλος αποθηκεύουμε τις αλλαγές μας. Πηγαίνετε στην κονσόλα σας και εκτελέστε αυτές τις εντολές:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Ανεβάζοντας τον κώδικα σας στο GitHub

Πηγαίνετε στο [https://github.com](https://www.github.com) και δημιουργήστε έναν δωρεάν λογαριασμό. (Αν το έχετε ήδη κάνει αυτό, τέλεια!). Σιγουρευτείτε ότι θυμάστε τον κωδικό πρόσβασης σας (προσθέστε τον σε κάποιον διαχειριστή κωδικών πρόσβασης, αν έχετε κάποιον).

Έπειτα, δημιουργήστε ένα νέο repo, δίνοντας του το όνομα "my-first-blog". Αφήστε το κουτάκι "initialize with a README" κενό. Αφήστε, επίσης την επιλογή .gitignore κενή (το έχουμε ήδη αυτό το αρχείο) και τέλος αφήστε το License ως None.

![](images/new_github_repo.png)

> **Σημείωση** Το όνομα `my-first-blog` είναι σημαντικό. Θα μπορούσατε να διαλέξετε ένα άλλο, αλλά επειδή θα το χρησιμοποιείτε αρκετά στις ακόλουθες εντολές, καλό να είναι χρησιμοποιήσετε το ίδιο εκτός και αν είστε λάτρης του πληκτρολογίου και σας αρέσει να γράφετε! Είναι πιο εύκολο να μείνετε με το όνομα `my-first-blog`.

Στην επόμενη οθόνη θα δείτε το url (την διεύθυνση) του repo σας την οποία θα χρησιμοποιήσουμε παρακάτω:

![](images/github_get_repo_url_screenshot.png)

Τώρα το μόνο που μένει είναι να συνδέσουμε το τοπικό repo μας με το remote (απομακρυσμένο).

Πληκτρολογήστε τα ακόλουθα στην κονσόλα σας (αντικαταστήστε το `<your-github-username>` με το όνομα χρήστη σας στο GitHub αλλά χωρίς τα "<>". Το url θα πρέπει να είναι το ίδιο με το url που είδατε πριν:

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Όταν ανεβάζετε στο GitHub, θα ερωτηθείτε για το όνομα χρήστη και τον κωδικό πρόσβασης σας (είτε μέσω κονσόλας είτε μέσω ενός χωριστού παράθυρου). Αφού τα εισάγετε, θα δείτε κάτι σαν το παρακάτω:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Ο κώδικας σας είναι πλέον στο GitHub. Πηγαίνετε να τον δείτε! Θα διαπιστώσετε ότι και άλλο δημοφιλή ανοιχτού λογισμικού projects φιλοξενούνται στο GitHub, όπως το ίδιο το [Django](https://github.com/django/django), το [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) και άλλα πολλά. :)

# Ανεβάζοντας το blog μας στο PythonAnywhere

## Δημιουργήστε έναν δωρεάν λογαριασμό στο PythonAnywhere

> **Σημείωση** Αν έχετε δημιουργήσει ήδη έναν τότε παραλείψτε αυτό το βήμα.

{% include "/deploy/signup_pythonanywhere.md" %}

## Παραμετροποιώντας το site μας στο PythonAnywhere

Μεταβείτε πίσω στο [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) κλικάροντας στο logo και επιλέξτε να εκκινήσετε μια κονσόλα "Bash". Αυτή είναι η έκδοση της κονσόλας του PythonAnywhere σαν και αυτή που έχετε στον υπολογιστή σας.

![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)

> **Σημείωση** Το PythonAnywhere είναι βασισμένο στο Linux, οπότε αν τρέχετε Windows, η κονσόλα ίσως να σας φανεί διαφορετική από αυτή που έχετε συνηθίσει.

Η διαδικασία του ανεβάσματος της εφαρμογή σας (το blog) στο PythonAnywhere περιλαμβάνει τα εξής βήματα: το PythonAnywhere να μπορεί να "διαβάσει" τον κώδικα σας στο GitHub, να τον "κατεβάσει" και να τον αποθηκεύσει σε κάποιον από τους σκληρούς του δίσκους (pull) και στο τέλος να κάνει serve την εφαρμογή αυτή. Υπάρχουν οι χειροκίνητοι τρόποι για να επιτευχθούν αυτά τα βήματα αλλά το PythonAnywhere προσφέρει εργαλεία για αυτόν ακριβώς το λόγο. Ας το εγκαταστήσουμε πρώτα:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

Αυτό θα εμφανίσει κάτι σαν `Collecting pythonanywhere` και στο τέλος θα τελειώσει με μια γραμμή η οποία θα λέει `Successfully installed (...) pythonanywhere- (...)`.

Τώρα θα τρέξουμε το βοηθητικό εργαλείο ούτως ώστε να παραμετροποιήσει την εφαρμογή μας από το GitHub. Πληκτρολογήστε τα ακόλουθα στην κονσόλα του PythonAnywhere (μην ξεχάσετε να χρησιμοποιήσετε αντί του `<your-github-username>` το όνομα χρήστη σας του GitHub ούτως ώστε τα urls να είναι τα ίδια):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
    

Μπορείτε να βλέπετε τι γίνεται καθώς το πρόγραμμα τρέχει:

- Κατεβάζει τον κώδικα σας από το GitHub
- Δημιουργεί ένα virtualenv στο PythonAnywhere όπως ακριβώς αυτό στον υπολογιστή σας
- Εμπλουτίζει το αρχείο settings.py με κάποιες ρυθμίσεις για το deployment
- Ρυθμίζει τη βάση δεδομένων στο PythonAnywhere χρησιμοποιώντας την εντολή `manage.py migrate`
- Ρυθμίζει τα στατικά αρχεία (θα μάθουμε γι'αυτά αργότερα)
- Τέλος ρυθμίζει το PythonAnywhere για να εξυπηρετήσει την εφαρμογή σας

Παρόλο που στο PythonAnywhere όλα αυτά τα βήματα είναι αυτοματοποιημένα, όλα αυτά δεν αλλάζουν αν επιλέξετε κάποιον άλλον server provider.

Αυτό που πρέπει να τονίσουμε είναι ότι η βάση δεδομένων στο PythonAnywhere είναι διαφορετική από αυτήν στον υπολογιστή σας. Ως αποτέλεσμα αυτού, θα χρειαστεί να αρχικοποιήσουμε τον λογαριασμό διαχειριστή με την εντολή `createsuperuser`. Το PythonAnywhere έχει ενεργοποιήσει το virtualenv για σας, οπότε το μόνο που μένει είναι να τρέξουμε:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Εισάγετε τα στοιχεία του χρήστη admin. Καλό είναι να χρησιμοποιήσετε τα ίδια με αυτά στον τοπικό υπολογιστή σας για να μην μπερδεύεστε εκτός και αν θέλετε να κάνετε να φτιάξετε ένα πιο ρεαλιστικό σενάριο όπου ο κωδικός αυτός θα πρέπει να είναι πιο δύσκολος ως προς την μαντεψιά.

Τώρα, αν θέλετε, μπορείτε να δείτε τον κώδικα σας στο PythonAnywhere δίνοντας την εντολή `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

Μπορείτε, επίσης, να μεταβείτε στη σελίδα "Files" και απο κει να περιηγηθείτε χρησιμοποιώντας τον browser του PythonAnywhere. (Από την σελίδα Console, μπορείτε να μεταβείτε στις άλλες σελίδες του PythonAnywhere από το κουμπί menu στην πάνω δεξιά γωνία. Μόλις είστε σε μία από τις σελίδες, υπάρχουν συνδέσεις με τις άλλες πάνω στην κορυφή.)

## Τώρα είστε ζωντανά!

Το site σας είναι πλεόν deployed! Κλικάρετε στη σελίδα "Web" του PythonAnywhere για να αποκτήσετε το url σας. Μπορείτε να το μοιραστείτε με όποιον θέλετε :)

> **Σημείωση** Αυτός είναι ένας οδηγός για αρχάριους και κατά τη διάρκεια του deploying παρακάμψαμε κάποια βήματα τα οποία είναι πολύ σημαντικά από άποψη ασφάλειας. Αν και όταν θελήσετε να εμπλουτίσετε ή να φτιάξετε ένα νέο project αλλά πιο σοβαρό αυτή τη φορά, καλό θα ήταν να συμβουλευτείτε το [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) για μερικές συμβουλές ασφάλειας.

## Συμβουλές debugging

Αν λάβετε κάποιο σφάλμα καθώς τρέχετε το script `pa_autoconfigure_django.py`, δείτε τα ακόλουθα:

- Έχετε ξεχάσει να δημιουργήσετε ένα PythonAnywhere API token.
- Έχετε κάνει λάθος στο GitHub URL
- Αν δείτε ένα σφάλμα που λέει *«Could not find your settings.py»*, είναι πιθανώς επειδή δεν συμπεριλάβατε όλα τα αρχεία σας στο repo ή/και δεν έχετε κάνει push τις αλλαγές σας στο GitHub επιτυχώς. Δείτε ξανά την ενότητα Git παραπάνω

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Check out your site!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!