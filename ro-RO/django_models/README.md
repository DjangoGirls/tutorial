# Modele în Django

Ceea ce ne dorim să creăm acum este ceva ce va păstra toate posturile blog-ului nostru. Dar pentru a putea face acest lucru trebuie să vorbim un pic despre lucruri numite `obiecte`.

## Obiecte

În programare există un concept numit `programare orientată pe obiecte`. Ideea este că în loc de a scrie totul ca o secvenţă plictisitoare de instrucţiuni de programare, putem modela lucruri şi defini modul în care ei interacţionează unul cu altul.

Deci, ce este un obiect? Este o colecţie de proprietăţi şi acţiuni. Sună ciudat, dar vă vom da un exemplu.

În cazul în care dorim să modelăm o pisică, vom crea un obiect `Cat`, care are unele proprietăţi, cum ar fi `color`, `age`, `mood` (cum ar fi bun, rău sau somnoros ;)), şi `owner` (care ar putea fi asociat cu un obiect de `Person` – sau, poate, în cazul pisicii abandonate, proprietatea această ar putea fi goală).

`Cat` are niște acțiuni: `purr`, `scratch`, or `feed` (în cazul, în care noi vom da pisicii niște `CatFood`, care ar putea fi un obiect sepărat cu diferite proprietăți, de exemplu, `taste`).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

În principiu, idea este de a descrie lucruri reale cu cod, utilizând proprietăți (numite `proprietățile obiectului`) și acțiuni (numite `metode`).

Cum vom modela posturile din blog? Dorim să creăm un blog, corect?

Trebuie să răspundem la o întrebare: Ce este un post din blog? Care proprietăți el trebuie să aibă?

Ok, într-adevăr, un post din blog are nevoie de text, care este conținutul și titlu, corect? Ar fi bine să cunoaștem cine l-a scris – de aceea avem nevoie și de autor. În sfârșit, dorim să știm când postul a fost creat și publicat.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Care lucruri ar putea fi făcute cu un post de blog? Ar fi bine să avem `o metodă` care publică un post, corect?

O să avem nevoie de o metodă numită `publish`.

Pentru că noi deja știm ce noi dorim să obținem, trebuie să începem să facem modele în Django!

## Modele în Django

Știînd ce este un obiect, putem crea un model în Django pentru postul de blog.

Model în Django este un tip special de obiect – el este salvat în `baza de date`. O bază de date este o colecție de date. Acesta este un loc în care o să păstrăm informație despre utilizatorii, posturile de blog, ș.a. Noi o să utilizăm baza de date SQLite pentru a păstra date. Acesta este conector de baza de date implicit din Django - va fi suficient pentru scopurile nostre.

Puteți imagina un model din bază de date ca un tabel cu coloane (atribute) și rânduri (date).

### Crearea aplicației

Pentru a păstra totul ordonat, o să creăm o aplicație sepărată în proiectul nostru. E bine să avem totul ordonat de la început. Pentru a crea aplicație avem nevoie de a executa următoare comandă în linie de comandă (din directoriu `djangogirls` unde este fișierul `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Veți observa că directoriu nou `blog` este creat și conține niște fișiere. Directoriile și fișierele în proiectul nostru trebuie să arată în felul următor:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    |   ├── urls.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

După crearea aplicației avem nevoie ca Django o să utilizeze. Noi facem acest lucru în fișierul `mysite/settings.py` -- el trebuie să fie deschis în editorul de cod. Trebuie să găsim `INSTALLED_APPS` și să adăugăm o linie care conține `'blog',` mai sus de `]`. Rezultatul final trebuie să arate în fel următor:

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

### Crearea modelului de un post de blog

În fișierul `blog/models.py` definim pe toate obiectele numite `Models` – acesta este locul, unde o să definim un post de blog.

Deschideți fișierul `blog/models.py` în editorul de cod și ștergeți totul din el și scrieți codul ca urmează:

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Verificați că utilzați două bare de jos (`_`) în fiecare parte a `str`. Acest standard este utilizat frecvent în Python și uneori este numit "dunder" (scurtare pentru "double-underscore").

E înfricoșător? Dar nu vă îngrijorați - o să explicăm ce înseamnă codul dat!

Toate liniile, începând cu `from` or `import` sunt liniile ce adaugă niște biți din alte fișire. De aceea în loc de a copia și a inserta aceeași lucruri în fiecare fișier, noi putem iclude niște părți cu `from ... import ...`.

`class Post(models.Model):` – linie această definește modelul nostru (el este `un obiect`).

- `class` este un cuvânt special care indică că noi definim un obiect.
- `Post` este denumirea modelului nostru. Putem s-o numim altfel (dar trebuie să evităm caractere speciale și spații libere). Mereu începeți denumirea clasei cu o majusculă.
- `models.Model` însemnă că Post este un model în Django, de aceea Django știe că el trebuie să fie păstrat în bază de date.

Acum noi definim proprietăți despre care noi am vorbit: `title`, `text`, `created_date`, `published_date` și `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.0/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Create tables for models in your database

The last step here is to add our new model to our database. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. It will look like this:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database! It would be nice to see it, right? Jump to the next chapter to see what your Post looks like!