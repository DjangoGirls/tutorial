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
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

După crearea aplicației avem nevoie ca Django o să utilizeze. Noi facem acest lucru în fișierul `mysite/settings.py` -- el trebuie să fie deschis în editorul de cod. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. Rezultatul final trebuie să arate în fel următor:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
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

Acum noi definim proprietăți despre care noi am vorbit: `title`, `text`, `created_date`, `published_date` și `author`. Pentru a face acesta trebuie să definim tipurile fiecărui atribut (Acesta este text? E număr? E dată? E relație cu un alt obiect, de exemplu User?)

- `models.CharField` – este cum definiți text cu numărul limitat de caractere.
- `models.TextField` – este pentru text lung fără limite. Sună ideal pentru conținut unui post de blog, corect?
- `models.DateTimeField` – este dată și timp.
- `models.ForeignKey` – este relație cu un alt model.

Noi n-o să explicăm toate detaliile aici, pentru că va lua mult timp. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

Ce despre `def publish(self):`? Acesta este metodă `publish` despre care am vorbit anterior. `def` înseamnă că acesta este o funcție/metodă și `publish` este denumirea acestei metode. Puteți să schimbați denumirea metodei, dacă doriți. Regulă de a crea denumirele corecte este că trebuie să utilizăm caractere mici și bare de jos în loc de spații. De exemplu, o metodă care calculează preț mediu ar putea fi numită `calculate_average_price`.

Metode returnează des niște valori utilizând cuvântul cheie `return`. Un exemplu este metoda `__str__`. În cazul dat, când executăm `__str__()` primim text (**string**) cu titlu postului.

Observați că `def publish(self):` și `def __str__(self):` sunt aliniate in clasa. Din motivul că Python este sensitiv la spații, este necesar să aliniem metodele în clase. Altfel, metode nu va fi a clasei și puteți să primiți o funcționare neașteptată.

Dacă ceva despre modele nu este clar, întrebați-l pe mentorul vostru! Noi sțim că e complicat, în dosebit când aflați despre obiecte și funcții deodată. Dar sperăm că atunci este mai clar!

### Crearea tabelelor pentru modele în baza de date

Ultimul lucru este de a adăuga modelul nou la baza de date. Cel dintâi trebuie să facem ca Django să știe despre shimbari în model. (Noi tocmai am făcut schimbare!) În linie de comandă executați `python manage.py makemigrations blog`. Este urmatoare:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Notă:** Nu uitați să sălvați fișierele pe care le editați. Altfel, calculatorul va executa versiunea anterioară ce poate da erori neașteptate.

Django a generat fișierul de migrare pe care trebuie s-o aplicăm la baza de date. Executați `python manage.py migrate blog` și rezultatul trebuie să fie următor:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Ura! Modelul Post este în baza de date! Va fi bine s-o vedem, corect? În capitolul următor o să aflați, cum este Post!