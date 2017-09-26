# Django modellek

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## Objektumok

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Tehát mi az az objektum? Tulajdonságok és tevékenységek gyűjteménye. Furán hangozhat, de mindjárt mutatunk egy példát.

If we want to model a cat, we will create an object `Cat` that has some properties such as `color`, `age`, `mood` (like good, bad, or sleepy ;)), and `owner` (which could be assigned a `Person` object – or maybe, in case of a stray cat, this property could be empty).

Then the `Cat` has some actions: `purr`, `scratch`, or `feed` (in which case, we will give the cat some `CatFood`, which could be a separate object with properties, like `taste`).

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
    

So basically the idea is to describe real things in code with properties (called `object properties`) and actions (called `methods`).

Hogyan modellezzük a blogposztokat? Egy blogot szeretnénk fejleszteni, ugye?

Erre a kérdésre keressük a választ: Mi egy blogposzt? Milyen tulajdonságai vannak?

Nos, a bejegyzésünknek biztos van szövege, és címe, igaz? It would be also nice to know who wrote it – so we need an author. Végül tudni szeretnénk, mikor lett megírva és publikálva a poszt.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Milyen dolgokat lehet csinálni egy blogbejegyzéssel? Jó lenne, ha lenne valamiféle `method`, ami publikálja a posztot, nem?

Tehát szükségünk van egy `method` methodra.

Most, hogy tudjuk, mit szeretnénk elérni, kezdjük el modellezni Django-ban!

## Django modell

Most, hogy tudjuk, mik az objektumok, már el tudjuk készíteni a blogposzt Django modelljét.

A model in Django is a special kind of object – it is saved in the `database`. Az adatbázis tulajdonképpen adatok gyűjteménye. Ez az a hely, ahol adatokat tárolhatsz a felhasználókról, a blogposztokról, stb. Mi egy SQLite adatbázist fogunk használni az adataink tárolásához. This is the default Django database adapter – it'll be enough for us right now.

Az adatbázisban lévő modellt úgy képzeld el, mint egy táblázatot (pl. az Excelben), ahol oszlopok (mezők) és sorok (adatok) vannak.

### Készítsünk egy alkalmazást!

Hogy minden szép rendben maradjon, most a projekten belül egy külön alkalmazást hozunk létre. Jó, ha már az elejétől fogva rendezetten tartjuk a dolgokat. Ahhoz, hogy létrehozzuk az alkalmazást, ezt a parancsot kell futtatnunk a parancssorban (a `djangogirls` könyvtárban, ahol a `manage.py` fájl van):

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

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
    

After creating an application, we also need to tell Django that it should use it. A `mysite/settings.py` tehetjük meg. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. Így kell kinéznie ennek a résznek:

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

### Hozzuk létre a blogposzt modelljét

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
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

> Double-check that you use two underscore characters (`_`) on each side of `str`. Ez a jelölés gyakran előfordul a Pythonban, és néha "dunder"-nek hívjuk (a "double underscore" - dupla alulvonás rövidítése).

It looks scary, right? But don't worry – we will explain what these lines mean!

Azok a sorok, amik úgy kezdődnek, hogy `from` vagy `import`, más fájlokban lévő dolgokat adnak hozzá a fájlunkhoz. Ahelyett, hogy minden fájlba átmásolnánk ugyanazokat a dolgokat, beemelhetünk néhány dolgot a `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- a `class` egy speciális kulcsszó, ami azt mutatja meg, hogy éppen egy objektumot definiálunk.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- a `models.Model` azt jelenti, hogy a Post egy Django Model, így a Django tudni fogja, hogy el kell menteni az adatbázisba.

Most pedig azokat a tulajdonságokat definiáljuk, amikről korábban beszéltünk:`title` (cím), `text` (szöveg), `created_date` (létrehozás dátuma), `published_date` (publikálás dátuma) és `author` (szerző). To do that we need to define the type of each field (Is it text? Egy szám? Dátum? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

Most nem magyarázzuk el nagyon részletesen a kódot, mert túl sok idő lenne. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

És mi a helyzet a `def publish(self):` résszel? This is exactly the `publish` method we were talking about before. A `def` azt jelenti, hogy ez egy függvény (function) / method, és a `publish` ennek a methodnak a neve. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

A methodok gyakran `return`-ölnek (visszaadnak) valamit. Erre van is egy példa a `__str__` methodban. Ebben az esetben amikor meghívjuk a `__str__()`-t, egy szöveget kapunk vissza (**string**), ami a Post címe.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

Ha valami még nem teljesen világos a modellekkel kapcsolatban, nyugodtan kérdezd meg a coachodat! Tudjuk, hogy bonyolult, főleg, ha egyszerre tanulsz az objektumokról és a függvényekről. De reméljük, már sokkal kevésbé tűnik varázslatnak az egész!

### Készíts táblákat a modelleknek az adatbázisodban

Az utolsó lépés, hogy hozzáadjuk az új modellünket az adatbázishoz. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. Ez fog történni:

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
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

Hurrá! Bekerült az adatbázisba a Post modellünk! Jó lenne látni is, nem igaz? A következő fejezetben kiderül, hogy néz ki!