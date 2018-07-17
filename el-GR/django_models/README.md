# Μοντέλα (models) του Django

Αυτό που θέλουμε να δημιουργήσουμε τώρα είναι κάτι που θα αποθηκεύει όλες τις αναρτήσεις του blog μας. Αλλά για να είμαστε σε θέση να το κάνουμε, πρέπει να μιλήσουμε λίγο για το τι ονομάζουμε `"αντικείμενα" (objects)`.

## Αντικείμενα (objects)

Υπάρχει μια έννοια στον προγραμματισμό που ονομάζεται `"Αντικειμενοστραφής προγραμματισμός`. Η ιδέα είναι ότι αντί να γράφετε τα πάντα ως μια βαρετή ακολουθία από προγραμματιστικές εντολές, μπορούμε να μοντελοποιήσουμε τα πράγματα και να καθορίσουμε πως αλληλεπιδρούν μεταξύ τους.

Άρα, τι είναι ένα αντικείμενο; Είναι μια συλλογή από ιδιότητες και συμπεριφορές. Ακούγεται παράξενο, αλλά θα σας δώσουμε ένα παράδειγμα.

Εάν θέλουμε να μοντελοποιήσουμε μια γάτα, θα δημιουργήσουμε ένα αντικείμενο `Γάτα` το οποίο έχει κάποιες ιδιότητες όπως `χρώμα`, `ηλικία`, `διάθεση` (όπως καλή, κακή, νυσταγμένη :)), και `ιδιοκτήτης`(που θα μπορεί να ανατεθεί σε ένα αντικείμενο `άτομο` - ή ίσως, στην περίπτωση μιας αδέσποτης γάτας, αυτή η ιδιότητα θα μπορούσε να είναι άδεια).

Έπειτα η `γάτα` έχει κάποιες δράσεις `γουργούρισμα`, `ξύσιμο` ή `τάισμα`( σε αυτή την περίπτωση, θα δώσουμε στην γάτα λίγη `γατοτροφή`, που θα μπορούσε να είναι ένα ξεχωριστό αντικείμενο με ιδιότητες, όπως `γεύση`).

    Γάτα
    _________
    χρώμα
    ηλικία
    συμπεριφορά
    ιδιοκτήτης
    γουργούρισμα()
    ξύσιμο()
    τάισμα(γατο_τροφή)
    

    Γατοτροφή
    __________
    
    γεύση
    

Έτσι, βασικά η ιδέα είναι να περιγράψουμε τα αληθινά πράγματα στον κώδικα με ιδιότητες (που ονομάζονται `ιδιότητες αντικειμένου`) και συμπεριφορές (που ονομάζονται `μέθοδοι αντικειμένου`).

Πώς θα μοντελοποιήσουμε τότε τις αναρτήσεις του blog; Θέλουμε να κατασκευάσουμε ένα blog, σωστά;

Πρέπει να δώσουμε απάντηση στο ερώτημα: τι είναι μία ανάρτηση στο blog; Τι ιδιότητες πρέπει να έχει;

Λοιπόν, σίγουρα μία ανάρτηση στο blog μας χρειάζεται κάποιο κείμενο με το περιεχόμενό του και έναν τίτλο, σωστά; Θα ήταν επίσης ωραίο να ξέρουμε ποιος το έγραψε αυτό - έτσι χρειαζόμαστε ένα συγγραφέα. Τέλος, θέλουμε να γνωρίζουμε πότε δημιουργήθηκε και δημοσιεύτηκε η συγκεκριμένη ανάρτηση.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Τι είδους πράγματα θα μπορούσαν να γίνουν με μια ανάρτηση στο blog; Θα ήταν ωραίο να έχουμε κάποια `μέθοδο` που δημοσιεύει την ανάρτηση, σωστά;

Έτσι, θα χρειαστούμε μια μέθοδο `publish`.

Δεδομένου ότι γνωρίζουμε ήδη τι θέλουμε να επιτύχουμε, ας ξεκινήσουμε τη μοντελοποίηση στο Django!

## Μοντέλο του Django

Γνωρίζοντας τι είναι ένα αντικείμενο, μπορούμε να δημιουργήσουμε ένα μοντέλο Django για την ανάρτηση στο blog μας.

Ένα μοντέλο στο Django είναι ένα ιδιαίτερο είδος αντικειμένου- αποθηκεύεται στο `database`. Η βάση δεδομένων είναι μια συλλογή δεδομένων. Είναι εκεί όπου θα αποθηκεύεις πληροφορίες για τους χρήστες σου, τις αναρτήσεις στο blog, κλπ. Θα χρησιμοποιήσουμε την βάση δεδομένων SQLite για την αποθήκευση των δεδομένων μας. Αυτός είναι ο προεπιλεγμένος μετασχηματιστής βάσης δεδομένων Django - είναι αρκετό για εμάς για τώρα.

Μπορείς να σκεφτείς ένα μοντέλο της βάσης δεδομένων ως ένα υπολογιστικό φύλλο με στήλες (πεδία) και γραμμές (δεδομένα).

### Δημιουργία μιας εφαρμογής

Για να κρατήσουμε τα πάντα τακτοποιημένα, θα δημιουργήσουμε μια ξεχωριστή εφαρμογή μέσα στο project μας. Είναι πολύ ωραίο να έχουμε τα πάντα οργανωμένα από την αρχή. To create an application we need to run the following command in the console (from `djangogirls` directory where `manage.py` file is):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Θα παρατηρήσετε ότι ένας νέος`blog` κατάλογος δημιουργείται και περιέχει έναν αριθμό αρχείων. Οι κατάλογοι και τα αρχεία στο έργο μας πρέπει να μοιάζουν κάπως έτσι:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

Μετά την δημιουργία μίας εφαρμογής, πρέπει επίσης να πούμε στο Django ότι πρέπει να το χρησιμοποιήσει. Αυτό το κάνουμε στο αρχείο `mysite/settings.py`. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. Έτσι το τελικό προϊόν πρέπει να μοιάζει κάπως έτσι:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### Creating a blog post model

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Double-check that you use two underscore characters (`_`) on each side of `str`. This convention is used frequently in Python and sometimes we also call them "dunder" (short for "double-underscore").

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` is a special keyword that indicates that we are defining an object.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` means that the Post is a Django Model, so Django knows that it should be saved in the database.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField`- αυτό είναι για μεγάλα κείμενα χωρίς ένα όριο. Ακούγεται ιδανικό για περιεχόμενο δημοσιεύσεων blog, έτσι δεν είναι;
- `models.DateTimeField`- αυτό είναι μια ημερομηνία και ώρα.
- `models.ForeignKey`- αυτό είναι ένας σύνδεσμος για ένα άλλο μοντέλο.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.0/ref/models/fields/#field-types).

What about `def publish(self):`? Αυτή είναι ακριβώς η μέθοδος `publish` για την οποία μιλούσαμε πριν. `def` σημαίνει ότι είναι αυτή είναι μια λειτουργία/μέθοδος και `publish` είναι το όνομα της μεθόδου. Μπορείτε να αλλάξετε το όνομα της μεθόδου αν θέλετε. Ο κανόνας ονομασίας είναι ότι χρησιμοποιούμε μικρά γράμματα και κάτω παύλες αντί για κενά. Για παράδειγμα, μια μέθοδος που υπολογίζει την μέση τιμή θα λεγόταν `υπολογισμός_μέσης_τιμής`.

Οι μέθοδοι συχνά `επιστρέφουν` κάτι. Υπάρχει ένα παράδειγμα αυτού στη μέθοδο `__str__`. Σε αυτό το σενάριο, όταν καλούμε την `__str__()` θα λάβουμε ένα κείμενο (**string**) με ένα τίτλο θέσης.

Επίσης προσέξτε ότι και το `def publish(self):` και το `def __str__(self):` "χτυπημένα" μέσα στην κλάση μας. Επειδή η Python είναι ευαίσθητη στο whitespace, πρέπει να "χτυπήσουμε" τις μεθόδους μας μέσα στην κλάση. Αλλιώς, οι μέθοδοι δεν θα ανήκουν στην κλάση, και μπορεί να συναντήσετε απρόοπτη συμπεριφορά.

Εάν κάτι ακόμα δεν είναι ξεκάθαρο σχετικά με τα μοντέλα, μη διστάσετε να ρωτήσετε τον καθηγητή σας! Ξέρουμε ότι είναι περίπλοκο, ειδικά όταν μαθαίνετε τι είναι τα αντικείμενα και οι λειτουργίες ταυτόχρονα. But hopefully it looks slightly less magic for you now!

### Δημιουργήστε πίνακες για πρότυπα στην βάση δεδομένων σας

Το τελευταίο βήμα εδώ είναι να προσθέσουμε το νέο μοντέλο μας στην βάση δεδομένων μας. Πρώτα πρέπει να ενημερώσουμε το Django ότι έχουμε κάποιες αλλαγές στο μοντέλο μας. (Μόλις το δημιουργήσαμε!) Πηγαίνετε στο παράθυρο της κονσόλας σας και πληκτρολογήστε `python manage.py makemigrations blog`. Θα μοιάζει κάπως έτσι:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Σημείωση:** Θυμηθείτε να αποθηκεύετε τα αρχεία που επεξεργάζεστε. Αλλιώς, ο υπολογιστής σας θα εκτελέσει τις προηγούμενες εκδόσεις που μπορεί να σας δώσει μηνύματα απρόοπτων σφαλμάτων.

Το Django προετοίμασε ένα φάκελο μετανάστευσης για εμάς που πρέπει τώρα να εφαρμόσουμε στην βάση δεδομένων μας. Πληκτρολογήστε `python manage.py migrate blog` και τα αποτελέσματα πρέπει να είναι όπως ακολουθεί:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

Ζήτω! Το μοντέλο ανάρτησης μας είναι στην βάση δεδομένων μας! Θα ήταν ωραίο να το δούμε, σωστά; Πηγαίνετε στο επόμενο κεφάλαιο για να δείτε πως μοιάζει η ανάρτηση σας!