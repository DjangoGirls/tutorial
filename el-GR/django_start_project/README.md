# Το πρώτο σας Django project!

> Μέρος αυτού του κεφαλαίου είναι βασισμένο στους οδηγούς από την κοινότητα Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Μέρος αυτού του κεφαλαίου είναι βασισμένο στους οδηγούς από την κοινότητα [django-marcador tutorial](http://django-marcador.keimlink.de/) υπό την άδεια χρήσης Creative Commons Attribution-ShareAlike 4.0 International License. Τα πνευματικά δικαιώματα του οδηγού django-marcador ανήκουν στον Markus Zapke-Gründemann.

Πρόκειται να δημιουργήσουμε ένα μικρό blog!

Το πρώτο βήμα είναι να ξεκινήσουμε ένα νέο Django project. Βασικά αυτό σημαίνει ότι θα εκτελέσουμε μερικά scripts (εντολές) που παρέχονται από το Django τα οποία θα δημιουργήσουν τον σκελετό ενός Django project για εμάς. Αυτά είναι ένα σύμπλεγμα φακέλων και αρχείων που θα χρησιμοποιήσουμε αργότερα.

Τα ονόματα μερικών αρχείων και φακέλων είναι πολύ σημαντικά για το Django. Δεν πρέπει να μετονομάσετε τα αρχεία που πρόκειται να δημιουργήσουμε. Μετακινώντας τα σε ένα διαφορετικό μέρος δεν είναι επίσης καλή ιδέα. Το Django χρειάζεται να διατηρήσει μία συγκεκριμένη δομή για να μπορεί να βρει σημαντικά πράγματα.

> Θυμηθείτε να εκτελείτε τα πάντα μέσα σε κάποιο εικονικό περιβάλλον. Εάν δεν δείτε ένα πρόθεμα `(myenv)` στην κονσόλα σας, θα πρέπει να ενεργοποιήσετε το εικονικό περιβάλλον σας. Εξηγήσαμε πως να το κάνετε αυτό στο κεφάλαιο **Εγκατάσταση Django** στην ενότητα **Δουλεύοντας με το εικονικό περιβάλλον**. Σε Windows δοκιμάστε να γράψετε `myvenv\Scripts\activate` ή αν έχετε Lixux/OS X γράψτε `source myvenv/bin/activate`.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Στην κονσόλα σας Mac OS X ή Linux, πρέπει να εκτελέσετε την ακόλουθη εντολή. ** Μην ξεχάσετε να προσθέσετε την τελεία `. ` στο τέλος!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Η τελεία `.` είναι ζωτικής σημασίας επειδή λέει στην εντολή να εγκαταστήσει το Django στο τρέχον φάκελο σας ( για το οποίο η τελεία `.` είναι μία συντόμευση).
> 
> **Σημείωση** Όταν πληκτρολογείτε την παραπάνω εντολή, θυμηθείτε ότι πληκτρολογείτε το κομμάτι που ξεκινά με `django-admin`. Το κομμάτι κονσόλας που εμφανίζεται εδώ `(myvenv) ~/djangogirls$` είναι απλώς ένα παράδειγμα.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Στα Windows πρέπει να εκτελέσετε την ακόλουθη εντολή. **(Μην ξεχάσετε να προσθέσετε την τελεία `.` στο τέλος)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Η τελεία `.` είναι ζωτικής σημασίας επειδή λέει στην εντολή να εγκαταστήσει το Django στο τρέχον φάκελο σας ( για το οποίο η τελεία `.` είναι μία συντόμευση).
> 
> **Σημείωση** Όταν πληκτρολογείτε την παραπάνω εντολή, θυμηθείτε ότι πληκτρολογείτε το κομμάτι που ξεκινά με `django-admin.exe`. Το κομμάτι κονσόλας που εμφανίζεται εδώ `(myvenv) ~/djangogirls$` είναι απλώς ένα παράδειγμα.

<!--endsec-->

Η εντολή `django-admin.py` μπορεί να δημιουργήσει τους φακέλους και τα αρχεία για εσάς. Θα πρέπει τώρα να έχετε μια δομή φακέλων που μοιάζει κάπως έτσι:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **Σημείωση**: Στην δομή φακέλων σας, θα δείτε επίσης τον `venv` φάκελο σας που δημιουργήσαμε προηγουμένως.

Το `manage.py` είναι ένα script που βοηθά με την διαχείριση του project σας. Με αυτό θα μπορούμε να (μεταξύ άλλων πραγμάτων) ξεκινήσουμε έναν server στον υπολογιστή μας χωρίς να εγκαταστήσουμε οτιδήποτε άλλο.

Το αρχείο `settings.py` περιέχει τις διάφορες παραμέτρους του project σας.

Θυμάστε όταν μιλήσαμε σχετικά με ένα μεταφορέα αλληλογραφίας που ελέγχει που να παραδώσει ένα γράμμα; Το αρχείο `urls.py` περιέχει μία λίστα από σχέδια που χρησιμοποιούνται από τον `urlresolver`.

Ας αφνοήσουμε τα υπόλοιπα αρχεία προς το παρόν καθώς δεν θα τα αλλάξουμε καθόλου. Το μόνο πράγμα που πρέπει να θυμάστε είναι να μην τα διαγράψετε κατά λάθος!

## Αλλάζοντας τις ρυθμίσεις

Ας κάνουμε μερικές αλλαγές στο αρχείο `mysite/settings.py`. Ανοίξτε το.

**Σημείωση**: Κρατήστε στο μυαλό σας ότι το αρχείο `settings.py` είναι ένα κοινό Python αρχείο όπως όλα τα άλλα Python αρχεία (έχουν, δηλαδή, την κατάληξη .py). Μπορείτε να το ανοίξετε μέσα από τον επεξεργαστή κώδικα που χρησιμοποιείτε, κλικάροντας στο "File -> Open". Αυτό θα εμφανίσει ένα παράθυρο εξερεύνησης αρχείων μέσα από το οποίο επιλέγετε το αρχείο `settings.py` και το ανοίγετε. Εναλλακτικά, μπορείτε να μεταβείτε μέσα από τον φάκελο djangogirls και με δεξί κλικ να το ανοίξετε. Έπειτα, επιλέξτε τον επεξεργαστή κώδικα από την προτινώμενη λίστα προγραμμάτων. Η επιλογή του επεξεργαστή κώδικα είναι σημαντική καθώς μπορεί να έχετε άλλα προγράμματα εγκατεστημένα.

Θα ήτνα καλό να έχουμε τη σωστή ώρα στην ιστοσελίδα μας. Πηγαίνετε στο [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) και αντιγράψτε την ζώνη ώρας σας (TZ) (πχ `Europe/Athens`).

Στο αρχείο `settings.py`, βρείτε τη γραμμή που λέει `TIME_ZONE` και αλλάξτε την τιμή της σε αυτή που αντιγράψατε. Για παράδειγμα:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

Ο κωδικό γλώσσας (language code) αποτελείται από την γλώσσα, πχ `en` για Αγγλικά ή `el` για Ελληνικά και τον κωδικό χώρας πχ `gr` για Ελλάδα ή `ch` για την Ελβετία. Αν τα Ελληνικά είναι η μητρική σας γλώσσα, μπορείτε να προσθέσετε το παρακάτω για να αλλάξετε την γλώσσα σε Ελληνικά: Μπορείτε, δηλαδή, να έχετε ένα κουμπί "Άκυρο" μεταφρασμένο στην γλώσσα σας. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

Αν θέλετε κάποια διαφορετική γλώσσα, αλλάξτε το string LANGUAGE_CODE όπως παρακάτω με την τική που εσείς επιθυμείτε:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'el-GR'
```

Χρειάζεται επίσης να ρυθμίσουμε τα στατικά αρχεία μας. (Θα βρείτε τα πάντα για τα στατικά αρχεία και το CSS αργότερα στον οδηγό.) Πηγαίνετε προς τα κάτω μέχρι το *τέλος* του αρχείου και ακριβώς κάτω από την καταχώρηση `STATIC_URL`, προσθέστε μια νέα που ονομάζεται `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Όταν το flag `DEBUG` είναι `True` και η λίστα `ALLOWED_HOSTS` είναι κενή, ο host επικυρώνεται μέσα από την ακόλουθη λίστα `[«localhost', '127.0.0.1', ' [:: 1]']`. Αυτό δεν θα ταιριάξει το hostname μας στο PythonAnywhere μόλις κάνουμε deploy την εφαρμογή μας. Οπότε θα χρειαστεί να κάνουμε την ακόλουθη αλλαγή:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Σημείωση**: Αν χρησιμοποιείτε ένα Chromebook, προσθέστε αυτή τη γραμμή στο τέλος του αρχείου settings.py: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Επίσης προσθέστε `".amazonaws.com"` στη λίστα `ALLOWED_HOSTS` αν χρησιμοποιείτε το cloud9
> 
> If you are hosting your project on `Glitch.com`, let us protect the Django secret key that needs to remain confidential (otherwise, anyone remixing your project could see it):
> 
> - First, we are going to create a random secret key. Open the Glitch terminal again, and type the following command:
>     
>     {% filename %}command-line{% endfilename %}
>     
>     ```bash
>     python -c 'from django.core.management.utils import get_random_secret_key; \
>           print(get_random_secret_key())'
>     ```
>     
>     This should display a long random string, perfect to use as a secret key for your brand new Django web site. We will now paste this key into a `.env` file that Glitch will only show you if you are the owner of the web site.
> 
> - Create a file `.env` at the root of your project and add the following property in it:
>     
>     {% filename %}.env{% endfilename %}
>     
>     ```bash
>     # Here, inside the single quotes, you can cut and paste the random key generated above
>     SECRET='3!0k#7ds5mp^-x$lqs2%le6v97h#@xopab&oj5y7d=hxe511jl'
>     ```
> 
> - Then update the Django settings file to inject this secret value and set the Django web site name:
>     
>     {% filename %}mysite/settings.py{% endfilename %}
>     
>     ```python
>     SECRET_KEY = os.getenv('SECRET')
>     ```
> 
> - And a little further down in the same file, we inject the name of your new Glitch website:
>     
>     {% filename %}mysite/settings.py{% endfilename %}
>     
>     ```python
>     ALLOWED_HOSTS = [os.getenv('PROJECT_DOMAIN') + ".glitch.me"]
>     ```
>     
>     The `PROJECT_DOMAIN` value is automatically generated by Glitch. It will correspond to the name of your project.

## Δημιουργία μιας βάσης δεδομένων

Υπάρχουν πολλές διαφορετικές βάσεις δεδομένων που μπορούν να αποθηκεύσουν δεδομένα για την σελίδα σας. Θα χρησιμοποιήσουμε την προεπιλεγμένη, `sqlite3`.

Αυτό έχει ήδη δηλωθεί στο αρχείο `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Για να δημιουργήσετε μία βάση δεδομένων για το blog σας, ας εκτελέσουμε το ακόλουθο στην κονσόλα: `python manage.py migrate` ( χρειάζεται να είμαστε στον φάκελο `djangogirls` που περιέχει το αρχείο `manage.py`). Αν αυτό πάει καλά, θα πρέπει να δείτε κάτι σαν αυτό:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... ΟΚ
    

Και τελειώσαμε! Ώρα να ξεκινήσουμε τον server και να δούμε εάν η ιστοσελίδα μας λειτουργεί!

## Εκκίνηση του development server

Θα πρέπει να είστε στον φάκελο που περιέχει το αρχείο `manage.py` (στον φάκελο `djangogirls`). Στην κονσόλα, μπορούμε να ξεκινήσουμε τον server εκτελώντας `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Εάν είστε σε ένα Chromebook, χρησιμοποιείστε αυτή την εντολή:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

or this one if you are using Glitch:

{% filename %}Glitch.com terminal{% endfilename %}

    $ refresh
    
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

or on Glitch:

    https://name-of-your-glitch-project.glitch.me
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> Είδαμε πως λειτουργούν οι web servers στο κεφάλαιο **Πως λειτουργεί το internet**.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!