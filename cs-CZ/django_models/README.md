# Django modely

Nyní chceme vytvořit něco, co bude ukládat všechny příspěvky na našem blogu. Ale aby jsme to mohli udělat, musíme si nejdříve říct něco o `objektech`.

## Objekty

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Co tedy je objekt? Je to kolekce vlastností a činností. Zní to divně, ale dáme ti příklad.

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
    

Základní představa je popsat skutečné věci v kódu vlastnostmi (nazývané `vlastnosti objektu/object properties`) a akcemi (nazývané `metody/methods`).

Jak tedy bude vypadat model blogu? Chceme vytvořit blog, ne?

Musíme odpovědět na otázku: Co je blog post/příspěvek? Jaké by měl mít vlastnosti?

Určitě budeme v naše blogu potřebovat nějaký text s jeho obsahem a titulkem, že? It would be also nice to know who wrote it – so we need an author. Nakonec také chceme vědět, kdy byl příspěvek vytvořen a publikován.

    Post 
    -------- 
    title 
    text 
    author 
    created_date 
    published_date
    

Jaký druh věcí můžeme s příspěvkem dělat? Bylo by hezké mít nějakou `metodu`, která publikuje příspěvek, že ano?

Takže budeme potřebovat metodu `publish`.

Vzhledem k tomu, že už víme, co chceme dosáhnout, můžeme začít modelování v Django!

## Django model

Nyní víme jaký objekt chceme vytvořit, tak můžeme přistoupit k tvorbě Django modelu pro náš příspěvek v blogu.

A model in Django is a special kind of object – it is saved in the `database`. Databáze je soubor dat. Je to místo, ve kterém budeš ukládat informace o uživatelích a tvých příspěvcích v blogu, atd. Budeme používat SQLite databázi k ukládání dat. This is the default Django database adapter – it'll be enough for us right now.

Model v databázi si lze představit jako tabulku s řádky (data) a sloupci (údaje).

### Vytvoření aplikace

Abychom udrželi pořádek, vytvoříme si samostatnou aplikaci uvnitř našeho projektu. Je velmi příjemné mít všechno zorganizované od samého začátku. Chceš-li vytvořit novou aplikaci, je třeba spustit následující příkaz v konzoli (z `djangogirls` adresáře, kde je `manage.py` soubor):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

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
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
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

### Vytvoření modelu pro blog post

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. Tato konvence se v Pythonu používá často. Někdy je také nazýváme "dunder" (zktratka pro "Double-UNDERscore").

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` je speciální klíčové slovo, které říká, že definujeme objekt.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models. Model` znamená, že Post je Django Model, takže Django ví, že by to mělo být uloženo v databázi.

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

### Vytvoření tabulek pro modely v databázi

The last step here is to add our new model to our database. Nejprve musíme dát Djangu vědět, že máme nějaké změny v modelu (které jsme právě vytvořili). (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. It will look like this:

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