> Μέρος αυτής της ενότητας βασίζεται στους οδηγούς των Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Μέρος αυτής της ενότητας βασίζεται στον οδηγό [django-marcador](http://django-marcador.keimlink.de/) υπό την άδεια χρήσης Creative Commons Attribution-ShareAlike 4.0 International License. Τα πνευματικά δικαιώματα του οδηγού django-marcador ανήκουν στον Markus Zapke-Gründemann.

## Εικονικό περιβάλλον

Πριν την εγκατάσταση του Django, θα εγκαταστήσουμε ενα εξαιρετικά χρήσιμο εργαλείο για να κρατήσουμε το περιβάλλον του υπολογιστή σας τακτοποιημένο και καθαρό. Μπορείτε να παραβλέψετε αυτό το βήμα, αλλά προτείνουμε να το ακολουθήσετε καθώς αν δεν το ακολουθήσετε υπάρχει σοβαρή πιθανότητα να προκύψουν σφάλματα αργότερα. Ξεκινώντας με την καλύτερη δυνατή εγκατάσταση, θα αποφύγετε πολλά προβλήματα στο μέλλον!

Ας δημιουργήσουμε λοιπόν ενα **εικονικό περιβάλλον** (το αποκαλούμενο *virtualenv*). Το virtualenv θα απομονώσει την κάθε εγκατάσταση Python/Django ανά έργο (project). Αυτό σημαίνει ότι οι αλλαγές που κάνετε σε μια ιστοσελίδα (έργο - project) δεν θα επηρεάζουν οποιεσδήποτε άλλες ιστοσελίδες που αναπτύσσετε παράλληλα. Κάθε ιστοσελίδα θα έχει τα δικά της πακέτα και κάθε πακέτο την δική του έκδοση (version). Καλό, ε;

Το μόνο που χρειάζεται να κάνετε είναι να βρείτε έναν φάκελο στον οποίο θέλετε να δημιουργήσετε το `virtualenv`. Για παράδειγμα, το home directory σας. Στα Windows, θα μοιάζει κάπως έτσι `C:\Users\Name` ( όπου `Name` είναι το όνομα της σύνδεσης σας).

> **ΣΗΜΕΙΩΣΗ:** Στα Windows, σιγουρευτείτε ότι αυτός ο κατάλογος δεν περιέχει χαρακτήρες που τονίζονται ή ειδικούς χαρακτήρες. Αν το όνομα χρήστη σας περιέχει χαρακτήρες που τονίζονται, χρησιμοποιείστε ένα διαφορετικό φάκελο, για παράδειγμα `C:\djangogirls`.

Για αυτό το tutorial θα χρησιμοποιήσουμε ένα νεο φάκελο `djangogirls` από το home directory σας:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Θα δημιουργήσουμε ένα virtualenv με το όνομα `myvenv`. Η γενική εντολή είναι:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Για την δημιουργία ενός νέου `virtualenv`, θα χρειαστεί να ανοίξετε την γραμμή εντολών στον υπολογιστή σας (κονσόλα) και να τρέξετε την εντολή `python -m venv myvenv`. Θα μοιάζει κάπως έτσι:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Όπου `myvenv` είναι το όνομα του `virtualenv` σας. Μπορείτε να χρησιμοποιήσετε οποιοδήποτε άλλο όνομα, αλλά πρέπει να είναι αγγλικοί χαρακτήρες, πεζά, χωρίς κενά, εμφάσεις ή άλλους ειδικούς χαρακτήρες. Είναι επίσης καλή ιδέα να κρατήσετε το όνομα μικρό - θα το αναφέρετε συχνά!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Μπορούμε να δημιουργήσουμε ένα `virtualenv` σε Linux και σε OS X τρέχοντας την εντολή `python3 -m venv myvenv`. Θα μοιάζει κάπως έτσι:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

Το `myvenv` είναι το όνομα του `virtualenv` σας. Μπορείτε να χρησιμοποιήσετε οποιοδήποτε άλλο όνομα, αλλα πρέπει να είναι αγγλικοί χαρακτήρες, πεζά, χωρίς κενά και χωρίς άλλους ειδικούς χαρακτήρες. Είναι επίσης καλή ιδέα να κρατήσετε το όνομα μικρό - θα το αναφέρετε συχνά!

> **ΣΗΜΕΙΩΣΗ:** Σε μερικές εκδόσεις των Debian/Ubuntu ίσως εμφανιστεί το ακόλουθο σφάλμα:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  Στα λειτουργικά συστήματα Debian/Ubuntu, θα χρειαστεί να εγκαταστήσετε το πακέτο python3-venv χρησιμοποιώντας την ακόλουθη εντολή.
>        apt install python3-venv
>     Ίσως χρειαστεί να χρηιμοποιήσετε sudo με αυτή την εντολή.  Αφού εγκατασταθεί επιτυχώς το πακέτο python3-venv, επαναδημιουργήστε το εικονικό σας περιβάλλον.
>     
> 
> Σε αυτή την περίπτωση, ακολουθήστε τις οδηγίες παραπάνω και εγκαταστήστε το πακέτο `python3-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **ΣΗΜΕΙΩΣΗ:** Σε μερικές εκδόσεις των Debian/Ubuntu η ενεργοποίηση του virtual environment με αυτόν τον τρόπο, παράγει το ακόλουθο σφάλμα:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Για την επίλυση του χρησιμοποιήστε την εντολή `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **ΣΗΜΕΙΩΣΗ:** Αν λάβετε κάποιο σφάλμα όπως
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> τότε τρέξτε:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Δουλεύοντας με το virtualenv

Η παραπάνω εντολή θα δημιουργήσει έναν φάκελο που ονομάζεται `myvenv` (ή όποιο άλλο όνομα διαλέξετε) που περιέχει το εικονικό μας περιβάλλον (βασικά ένα μάτσο φακέλων και αρχείων).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Ξεκινήστε το εικονικό σας περιβάλλον εκτελώντας:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **ΣΗΜΕΙΩΣΗ:** στα Windows 10 μπορεί να λάβετε ένα σφάλμα στο Windows PowerShell που λέει `η εκτέλεση των σεναρίων έχει απενεργοποιηθεί σε αυτό το σύστημα`. Σε αυτή την περίπτωση, ανοίξτε ένα άλλο Windows PowerShell με την επιλογή "Εκτέλεση ως διαχειριστής". Έπειτα δοκιμάστε να πληκτρολογήσετε την ακόλουθη εντολή πριν ξεκινήσετε το εικονικό σας περιβάλλον:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     
> 
> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Ξεκινήστε το εικονικό σας περιβάλλον εκτελώντας:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Θυμηθείτε να αντικαταστήσετε το `myvenv` με το επιλεγμένο `virtualenv` όνομα που επιλέξατε!

> **ΣΗΜΕΙΩΣΗ:** μερικές φορές `πηγή` μπορεί να μην είναι διαθέσιμη. Σε αυτές τις περιπτώσεις προσπαθήστε να κάνετε αυτό:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Θα ξέρετε ότι είστε μέσα σε ένα `virtualenv` όταν δείτε την γραμμή εντολών στην κονσόλα σας να είναι συμπληρωμένη με το όνομα του μέσα σε παρένθεση, πχ `(myvenv)`.

Όταν δουλεύετε μέσα σε ένα εικονικό περιβάλλον, η εντολή `python` θα αναφέρετε αυτόματα στην σωστή έκδοση ώστε να μπορείτε να χρησιμοποιήσετε την εντολή `python` αντί για `python3`.

Εντάξει, μέχρι τώρα έχουμε τακτοποιήσει το περιβάλλον εργασίας μας. Μπορούμε επιτέλους να εγκαταστήσουμε το Django!

## Installing Django {#django}

Τώρα που είστε μέσα στο `virtualenv`, μπορείτε να εγκαταστήσετε το Django.

Πριν κάνουμε αυτό, πρέπει να σιγουρευτούμε ότι έχουμε την τελευταία έκδοση του `pip`, το εργαλείο που χρησιμοποιούμε για να εγκαταστήσουμε το Django (και οποιοδήποτε άλλο Python πακέτο όπως θα δούμε αργότερα):

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Εγκατάσταση πακέτων με τα requirements

Το αρχείο requirements είναι μια λίστα από dependencies (δυστυχώς, πάλι, δεν υπάρχει αντίστοιχος ελληνικός όρος αλλά φανταστείτε το ως τις "απαιτήσεις" της εφαρμογής σας - απαιτήσεις όχι σε μνήμη, σκληρό δίσκο κλπ αλλά σε άλλα προγράμματα) προς εγκατάσταση χρησιμοποιώντας την εντολή `pip install`:

Δημιουργήστε πρώτα ένα αρχείο `requirements.txt` μέσα στο φάκελο `djangogirls /` χρησιμοποιώντας το πρόγραμμα επεξεργασίας κώδικα που εγκαταστήσατε νωρίτερα. Μπορείτε να το κάνετε αυτό, ανοίγοντας ένα νέο αρχείο στο πρόγραμμα επεξεργασίας κώδικα και στη συνέχεια αποθηκεύοντάς το ως `requirements.txt` στο φάκελο `djangogirls /`. Ο φάκελός σας θα μοιάζει κάπως έτσι:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

Στο αρχείο `djangogirls/requirements.txt` θα πρέπει να προσθέσετε τα ακόλουθα:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Τώρα τρέξτε `pip install -r requirements.txt` για να ξεκινήσει η εγκατάσταση του Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

Αυτό ήταν! Είστε (επιτέλους) έτοιμοι να δημιουργήσετε μια Django εφαρμογή!