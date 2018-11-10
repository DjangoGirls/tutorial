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
    ├───manage.py
    ├───mysite
    │        settings.py
    │        urls.py
    │        wsgi.py
    │        __init__.py
    └───requirements.txt
    

> **Σημείωση**: Στην δομή φακέλων σας, θα δείτε επίσης τον `venv` φάκελο σας που δημιουργήσαμε προηγουμένως.

Το `manage.py` είναι ένα script που βοηθά με την διαχείριση του project σας. Με αυτό θα μπορούμε να (μεταξύ άλλων πραγμάτων) ξεκινήσουμε έναν server στον υπολογιστή μας χωρίς να εγκαταστήσουμε οτιδήποτε άλλο.

Το αρχείο `settings.py` περιέχει τις διάφορες παραμέτρους του project σας.

Θυμάστε όταν μιλήσαμε σχετικά με ένα μεταφορέα αλληλογραφίας που ελέγχει που να παραδώσει ένα γράμμα; Το αρχείο `urls.py` περιέχει μία λίστα από σχέδια που χρησιμοποιούνται από τον `urlresolver`.

Ας αφνοήσουμε τα υπόλοιπα αρχεία προς το παρόν καθώς δεν θα τα αλλάξουμε καθόλου. Το μόνο πράγμα που πρέπει να θυμάστε είναι να μην τα διαγράψετε κατά λάθος!

## Αλλάζοντας τις ρυθμίσεις

Ας κάνουμε μερικές αλλαγές στο αρχείο `mysite/settings.py`. Ανοίξτε το.

**Σημείωση**: Κρατήστε στο μυαλό σας ότι το αρχείο `settings.py` είναι ένα κοινό Python αρχείο όπως όλα τα άλλα Python αρχεία (έχουν, δηλαδή, την κατάληξη .py). Μπορείτε να το ανοίξετε μέσα από τον επεξεργαστή κώδικα που χρησιμοποιείτε, κλικάροντας στο "File -> Open". Αυτό θα εμφανίσει ένα παράθυρο εξερεύνησης αρχείων μέσα από το οποίο επιλέγετε το αρχείο `settings.py` και το ανοίγετε. Alternatively, you can open the file by navigating to the djangogirls folder on your desktop and right-clicking on it. Then, select your code editor from the list. Selecting the editor is important as you might have other programs installed that can open the file but will not let you edit it.

It would be nice to have the correct time on our website. Go to [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) and copy your relevant time zone (TZ) (e.g. `Europe/Berlin`).

In `settings.py`, find the line that contains `TIME_ZONE` and modify it to choose your own timezone. For example:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. So you would have "Cancel" button translated into the language you defined here. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.0/ref/settings/#language-code).

If you want a different language, change the language code by changing the following line:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

We'll also need to add a path for static files. (We'll find out all about static files and CSS later in the tutorial.) Go down to the *end* of the file, and just underneath the `STATIC_URL` entry, add a new one called `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

When `DEBUG` is `True` and `ALLOWED_HOSTS` is empty, the host is validated against `['localhost', '127.0.0.1', '[::1]']`. This won't match our hostname on PythonAnywhere once we deploy our application so we will change the following setting:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Σημείωση**: Αν χρησιμοποιείτε ένα Chromebook, προσθέστε αυτή τη γραμμή στο τέλος του αρχείου σας settings.py: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Also add `.amazonaws.com` to the `ALLOWED_HOSTS` if you are using cloud9

## Δημιουργία μιας βάσης δεδομένων

Υπάρχουν πολλά διαφορετικά λογισμικά βάσης δεδομένων που μπορούν να αποθηκεύσουν δεδομένα για την σελίδα σας. Θα χρησιμοποιήσουμε το προεπιλεγμένο, `sqlite3`.

Αυτό έχει ήδη εγκατασταθεί σε αυτό το τμήμα του αρχείου σας `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Για να δημιουργήσετε μία βάση δεδομένων για το blog μας, ας εκτελέσουμε το ακόλουθο στην κονσόλα: `python manage.py migrate` ( χρειάζεται να είμαστε στον κατάλογο `djangogirls` που περιέχει το αρχείο `manage.py`). Αν αυτό πάει καλά, θα πρέπει να δείτε κάτι σαν αυτό:

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
      Applying sessions.0001_initial... OK
    

Και τελειώσαμε! Ώρα να ξεκινήσουμε τον διακομιστή ιστού και να δούμε εάν η ιστοσελίδα μας λειτουργεί!

## Εκκίνηση του διακομιστή ιστού

Θα πρέπει να είστε στον κατάλογο που περιέχει το αρχείο `manage.py` ( στον κατάλογο `djangogirls`). Στην κονσόλα, μπορούμε να ξεκινήσουμε τον διακομιστή ιστού εκτελώντας `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Εάν είστε σε ένα Chromebook, χρησιμοποιείστε αυτή την εντολή:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Αν είστε σε Windows και αυτή η ενέργεια αποτύχει με το `UnicodeDecodeError`, χρησιμοποιείστε αντί για αυτό, αυτή την εντολή:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> We reviewed how web servers work in the **How the Internet works** chapter.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv. To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!