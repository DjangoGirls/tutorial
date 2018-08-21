> Μέρος αυτής της ενότητας βασίζεται στα σεμινάρια από τα Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. The django-marcador tutorial is copyrighted by Markus Zapke-Gründemann et al.

## Εικονικό περιβάλλον

Πρίν να εγκαταστήσουμε το Django, θα εγκαταστήσουμε ενα εξαιρετικά χρήσιμο εργαλείο για να κρατίσουμε το περιβάλλον του υπολογιστή σου τακτοποιημένο. Μπορείς να παραλείψεις αυτό το βήμα, αλλά συστήνουμε να το ακολουθήσεις. Ξεκινώντας με το καλύτερο δυνατό περιβάλλον, θα αποφύγεις πολλά προβλήματα στο μέλλον!

Λοιπόν, ας δημιουργήσουμε ενα ** εικονικό περιβάλλον** (το αποκαλούμενο *virtualenv*). Το virtualenv θα απομονώσει την κάθε εγκατάσταση Python/Django ανά έργο. Αυτό σημαίνει οι αλλαγές που κάνεις σε μια ιστιοσελίδα δεν επηρεάζουν οποιεσδήποτε άλλες ιστιοσελίδες που επίσης αναπτύσσεις παράλληλα. Καλό, ε;

Το μόνο που χρειάζεται να κάνεις είναι να βρείς έναν κατάλογο στον οποίο θέλεις να δημιουργήσεις το `virtualenv`. Το home directory σου, για παράδειγμα. Στα Windows, θα μοιάζει κάπως έτσι `C:\Users\Name` ( όπου `Name` είναι το όνομα της σύνδεσης σας).

> **ΣΗΜΕΙΩΣΗ:** Στα Windows, σιγουρευτείτε ότι αυτός ο κατάλογος δεν περιέχει χαρακτήρες που τονίζονται ή ειδικούς χαρακτήρες, αν το όνομα χρήστη σας περιέχει χαρακτήρες που τονίζονται, χρησιμοποιείστε ένα διαφορετικό κατάλογο, για παράδειγμα, `C:\djangogirls`.

Για αυτό το tutorial θα χρησιμοποιήσουμε ένα νεο κατάλογο `djangogirls` από το home directory σου:

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Θα δημιουργήσουμε ένα virtualenv που ονομάζεται `myvenv`. Η γενική εντολή είναι:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

To create a new `virtualenv`, you need to open the command prompt and run `python -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Όπου `myvenv` είναι το όνομα του `virtualenv` σας. Μπορείς να χρησιμοποιήσεις οποιοδήποτε άλλο όνομα, αλλά πρέπει να είναι σε πεζά, χωρίς κενά, εμφάσεις ή ειδικούς χαρακτήρες. Είναι επίσης καλή ιδέα να κρατήσετε το όνομα μικρό - θα το αναφέρετε συχνά!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

We can create a `virtualenv` on both Linux and OS X by running `python3 -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

Το `myvenv` είναι το όνομα του `virtualenv` σου. Μπορείς να χρησιμοποιήσεις οποιοδήποτε άλλο όνομα, αλλα πρέπει να είναι σε πεζά και χωρίς κενά. It is also a good idea to keep the name short as you'll be referencing it a lot!

> **NOTE:** On some versions of Debian/Ubuntu you may receive the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **NOTE:** On some versions of Debian/Ubuntu initiating the virtual environment like this currently gives the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> To get around this, use the `virtualenv` command instead.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOTE:** If you get an error like
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> then instead run:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Δουλεύοντας με το virtualenv

Η παραπάνω εντολή θα δημιουργήσει ένα κατάλογο που ονομάζεται `myvenv` (ή όποιο άλλο όνομα διαλέξετε) που περιέχει το εικονικό μας περιβάλλον (βασικά ένα μάτσο καταλόγων και αρχείων).

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Ξεκινήστε το εικονικό σας περιβάλλον εκτελώντας:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **ΣΗΜΕΙΩΣΗ:** στα Windows 10 μπορεί να λάβετε ένα σφάλμα στο Windows PowerShell που λέει ` η εκτέλεση των σεναρίων έχει απενεργοποιηθεί σε αυτό το σύστημα `. Σε αυτή την περίπτωση, ανοίξτε ένα άλλο Windows PowerShell με την επιλογή "Εκτέλεση ως διαχειριστής". Έπειτα δοκιμάστε να πληκτρολογήσετε την ακόλουθη εντολή πριν ξεκινήσετε το εικονικό περιβάλλον σας:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Ξεκινήστε το εικονικό σας περιβάλλον εκτελώντας:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Θυμηθείτε να αντικαταστήσετε το `myvenv` με το επιλεγμένο `virtualenv` όνομα σας!

> **ΣΗΜΕΙΩΣΗ:** μερικές φορές `πηγή` μπορεί να μην είναι διαθέσιμη. Σε αυτές τις περιπτώσεις προσπαθήστε να κάνετε αυτό:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Θα ξέρετε ότι έχετε ξεκινήσει το `virtualenv` όταν δείτε ότι γραμμή εντολών στην κονσόλα σας είναι προκαθορισμένη με `(myvenv)`.

Όταν δουλεύετε μέσα σε ένα εικονικό περιβάλλον, `python` θα αναφέρετε αυτόματα στην σωστή έκδοση ώστε να μπορείτε να χρησιμοποιήσετε `python` αντί για `python3`.

Εντάξει, έχουμε τοποθετήσει όλες τις σημαντικές εξαρτήσεις. Μπορούμε επιτέλους να εγκαταστήσουμε το Django!

## Εγκατάσταση Django

Τώρα που έχετε ξεκινήσει το `virtualenv` σας, μπορείτε να εγκαταστήσετε το Django.

Πριν κάνουμε αυτό, πρέπει να σιγουρευτούμε ότι έχουμε την τελευταία έκδοση του `pip`, το λογισμικό που χρησιμοποιούμε για να εγκαταστήσουμε το Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python3 -m pip install --upgrade pip
    

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of `djangogirls/` folder, using the code editor that you installed earlier:

    djangogirls
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Εάν λάβετε ένα σφάλμα όταν καλείται το μπιπ στην πλατφόρμα Windows, παρακαλούμε ελέγξτε εάν το μονοπάτι ονόματος του έργου σας περιέχει κενά, εμφάσεις ή ειδικούς χαρακτήρες (για παράδειγμα,`C:\Users\User Name\djangogirls`). Εάν το κάνει, παρακαλώ σκεφτείτε να χρησιμοποιήσετε μία άλλη θέση χωρίς κενά, εμφάσεις ή ειδικούς χαρακτήρες (πρόταση: `C:\djangogirls`). Δημιουργήστε ένα νέο virtualenv στον νέο κατάλογο, μετά σβήστε τον παλιό και δοκιμάστε την παραπάνω εντολή ξανά. (Το να μετακινήσετε τον κατάλογο virtualenv δεν θα δουλέψει μιας και το virtualenv χρησιμοποιεί απόλυτες διαδρομές.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Η γραμμή εντολών σας μπορεί να παγώσει αφού προσπαθήσετε να εγκαταστήσετε το Django. Εάν γίνει αυτό, αντί για την παραπάνω εντολή χρησιμοποιήστε:
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

That's it! You're now (finally) ready to create a Django application!