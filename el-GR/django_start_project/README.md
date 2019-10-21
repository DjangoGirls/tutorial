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
    

Αν είστε σε Windows και αυτή η ενέργεια αποτύχει με σφάλμα `UnicodeDecodeError`, χρησιμοποιείστε αντί για αυτό, αυτή την εντολή:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Τώρα θα χρειαστεί να ελέγξετε αν το site σας δουλεύει. Ανοίξτε έναν browser (Firefox, Chrome, Safari ή Internet Explorer ή οτιδήποτε άλλο χρησιμοποιείτε) και πληκτρολογήστε την παρακάτω διεύθυνση:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

Αν χρησιμοποιείτε Chromebook και Cloud9, αντί κλικάρετε στο παράθυρο που εμφανίστηκε στην πάνω δεξιά γωνία όπου ο server τρέχει. Το url θα δείχνει κάπως έτσι:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Συγχαρητήρια! Μόλις δημιουργήσατε το πρώτο σας website το οποίο τρέχει χρησιμοποιώντας έναν web server! Δεν είναι φοβερό;

![Η εγκατάσταση πέτυχε!](images/install_worked.png)

Σημειώστε ότι ένα παράθυρό εντολών μπορεί να εκτελεί μόνο μια εντολή κάθε φορά και η εντολή που τρέχει αυτή τη στιγμή είναι ένας web server. Όσο ο server τρέχει και αναμένει εισερχόμενα requests το τερματικό θα εμφανίζει κάποια μηνύματα αλλά δεν θα εκτελεί νέες εντολές.

> Είδαμε πως λειτουργούν οι web servers στο κεφάλαιο **Πως λειτουργεί το internet**.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). Για να σταματήσετε τον server, μεταβείτε στο παράθυρο που τρέχει και πιέστε Ctrl + C (σε Windows θα πρέπει να πιέσετε Ctrl + Break).

Έτοιμοι για το επόμενο βήμα; Ώρα να δημιουργήσουμε περιεχόμενο για το blog μας!