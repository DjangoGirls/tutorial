# Django modellek

Most valami olyasmire van szükségünk, ami eltárolja az összes blogbejegyzést. De ahhoz, hogy létre tudjunk hozni ilyesmit, előbb egy kicsit beszélnünk kell az `objektumokról`.

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
    

Tehát az egésznek az az alapötlete, hogy a valós dolgokat kódban tulajdonságokkal (vagyis `object property`-kkel) és tevékenységekkel (vagyis `method`-okkal) írjuk le).

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

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

    djangogirls
    ├── blog
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
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
    ├── myvenv
    │   └── ...
    └── requirements.txt
    
    

After creating an application, we also need to tell Django that it should use it. We do that in the file `mysite/settings.py` -- open it in your code editor. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. So the final product should look like this:

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

### Hozzuk létre a blogposzt modelljét

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py` in the code editor, remove everything from it, and write code like this:

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. Ez a jelölés gyakran előfordul a Pythonban, és néha "dunder"-nek hívjuk (a "double underscore" - dupla alulvonás rövidítése).

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- a `class` egy speciális kulcsszó, ami azt mutatja meg, hogy éppen egy objektumot definiálunk.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- a `models.Model` azt jelenti, hogy a Post egy Django Model, így a Django tudni fogja, hogy el kell menteni az adatbázisba.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Készíts táblákat a modelleknek az adatbázisodban

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