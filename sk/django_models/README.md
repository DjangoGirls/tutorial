# Django modely

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## Objekty

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Takže čo je to objekt? Je to zbierka vlastností a akcií. Znie to čudne, ale ukážeme si príklad.

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

Ako teda budeme modelovať blog post? Chceme vytvoriť blog, však?

Musíme odpovedať na otázku: Čo je vlastne blog post? Aké vlastnosti by mal mať?

No, náš blog post určite potrebuje nejaký text s obsahom a titulkom, nie? It would be also nice to know who wrote it – so we need an author. A nakoniec, chceme vedieť, kedy bol post vytvorený a zverejnený.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Čo všetko môžeme s blog postom robiť? Bolo by dobré mať nejakú `metódu`, ktorá post publikuje, však?

Takže budeme potrebovať metódu `publish`.

Keďže už vieme, čo chceme dosiahnuť, začnime tvoriť model v Djangu!

## Django model

Keďže už vieme, čo je objekt, môžeme vytvoriť Django model pre náš blog post.

A model in Django is a special kind of object – it is saved in the `database`. Databáza je súbor údajov. Je to miesto, kde budeš ukladať informácie o užívateľoch, príspevkoch na blogu, atď. Na ukladanie údajov budeme používať databázu SQLite. This is the default Django database adapter – it'll be enough for us right now.

Model v databáze si môžeš predstaviť ako tabuľku so stĺpcami (polia) a riadkami (dáta).

### Vytvorenie aplikácie

Aby sme mali všetko pekne upratané, vytvoríme vo vnútri nášho projektu samostatnú aplikáciu. Je dobré mať všetko zorganizované hneď od začiatku. Aby sme vytvorili aplikáciu, musíš v konzole spustiť nasledujúci príkaz (v adresári `djangogirls`, kde sa nachádza súbor `manage.py`):

{% filename %}command-line{% endfilename %}

    ~/djangogirls$ (myvenv) python manage.py startapp blog
    

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
    

After creating an application, we also need to tell Django that it should use it. To urobíme v súbore `mysite/settings.py`. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. Takže výsledok nášho snaženia bude vyzerať takto:

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

### Vytvorenie modelu blog postu

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. Táto konvencia sa v Pythone často používa a niekedy sa tomu hovorí "dunder" (skratka pre anglické Double-UNDERscore).

It looks scary, right? But don't worry – we will explain what these lines mean!

Všetky riadky začínajúce s `from` alebo `import` pridávajú časti z iných súborov. Takže namiesto kopírovania rovnakých vecí v každom súbore môžeme zahrnúť niektoré časti pomocou `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` je špeciálne kľúčové slovo, ktoré naznačuje, že definujeme objekt.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` znamená, že Post je Django Model, takže Django vie, že by mal byť uložený v databáze.

Teraz zadefinujeme vlastnosti, o ktorých sme hovorili: `title` (titulka), `text`, `created_date` (dátum vytvorenia), `published_date` (dátum zverejnenia) a `author` (autor). To do that we need to define the type of each field (Is it text? Číslo? Dátum? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

Nebudeme si tu vysvetľovať každý kúsok kódu, pretože by to zabralo príliš veľa času. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

A čo `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` znamená, že ide o funkciu/metódu a `publish` je názov metódy. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Metódy často niečo vracajú (angl. `return`). Príklad nájdeš napríklad v metóde `__str__`. V tomto prípade, keď zavoláme `__str__()`, dostaneme text (**string**) s názvom postu.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

Ak čokoľvek nie je jasné, neváhaj a spýtaj sa mentora! Je nám jasné, že je to komplikované, najmä ak sa učíš, čo sú objekty a funkcie súčasne. Ale dúfame, že teraz už to vyzerá trochu menej magicky!

### Vytváranie tabuliek pre modely v databáze

Posledným krokom je pridať náš nový model do databázy. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. Bude to vyzerať takto:

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
    

Hurá! Náš Post model je už v databáze! Bolo by fajn ho vidieť, nie? Prejdi na nasledujúcu kapitolu a uvidíš ako vyzerá tvoj Post!