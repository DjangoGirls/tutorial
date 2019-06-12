# Àwọn àwòṣe Django

Ohun tí a fẹ́ ṣẹ̀dá ní báyìí jẹ́ nnkan kan tí yíò tọ́jú gbogbo àwọn àròkọ tó wà nínú blog wa. Ṣùgbọ́n láti lè ṣe ìyẹn, a nílò láti sọ̀rọ̀ díẹ̀ nípa àwọn nnkan tí a n pè ní `objects` (ohun-èlò).

## Àwọn Ohun-èlò

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Nítorí náà, kíni ohun-èlò kan? Ó jẹ́ àkójọ àwọn ohun ìdánimọ̀ àti àwọn iṣẹ́ kan. Ó ṣàjèjì, ṣùgbọ́n a ó fún ọ ní àpẹẹrẹ kan.

Tí a bá fẹ́ ṣe àwòṣe ológbò kan, a óò ṣẹ̀dá ohun-èlò `Cat` (Ológbò) kan tó ní àwọn ohun ìdánimọ̀ bíi `color` (àwọ̀), `age` (ọjọ́ orí), `mood` (ìṣesí) (bíi ìdùnnú, ìbànújẹ́, tàbí oorun ;)), àti `owner` (oníǹkan) (èyí tí a lè yàn ohun-èlò `Person` (Ènìyàn) kan – tàbí bóyá, ní ti ológbò tó sọnù kan, ohun ìdánimọ̀ yìí lè jẹ́ òfìfo).

Lẹ́yìn náà, `Cat` (Ológbò) náà ní àwọn iṣẹ́ kan: `purr` (kùn), `scratch` (èékánná híha), tàbí `feed` (oúnje) (ní èyí tí, a óò fún ológbò náà ní `CatFood` (Oúnjẹ Ológbò) kan, èyí tó lè jẹ́ ohun-èlò ọ̀tọ̀ kan pẹ̀lú àwọn ohun ìdánimọ̀, bíi `taste` (ìtọ́wò)).

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

Báwo ni a ṣe máa ṣe àwòṣe àwọn àròkọ blog nígbà náà? A fẹ́ kọ́ blog kan, àbí bẹ́ẹ̀ kọ?

A ní láti dáhùn ìbéèrè: Kíni àròkọ blog kan? Àwọn ohun ìdánimọ̀ wo ló yẹ kó ní?

Ó dáa, ó dájú pé àròkọ blog wa nílò awọn ọ̀rọ̀ kan pẹ̀lú àkóónú rẹ̀ àti àkọlé kan, àbí bẹ́ẹ̀ kọ? Yíò tún dára láti mọ ẹni tó kọ ọ́ – nítorí náà a nílò olùdásílẹ̀ kan. Ní ìparí, a fẹ́ mọ ìgbà tí a ṣẹ̀dá àti ṣàtẹ̀jáde àròkọ náà.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Kíni irú àwọn nnkan tí a lè ṣe pẹ̀lú àròkọ blog kan? Yíò dára láti ní `method` (ọ̀nà) kan tí yíò ṣàtẹ̀jáde àròkọ náà, àbí bẹ́ẹ̀ kọ?

Nítorí náà a ó nílò ọ̀nà `publish` (tẹ̀jáde) kan.

Nígbà tí a ti mọ ohun tí a fẹ́ ṣe, jẹ́ ká bẹ̀rẹ̀ ṣíṣe àwòṣe rẹ̀ ní Django!

## Àwòṣe Django

Pẹ̀lú mímọ ohun tí ohun-èlò (object) kan jẹ́, a lè ṣẹ̀dá àwòṣe Django kan fún àròkọ blog wa.

Àwòṣe kan ní Django jẹ́ irú ohun-èlò àkànṣe kan – ó gba títọ́jú sínú `database` (àkójọpọ̀ dátà) náà. A database is a collection of data. This is a place in which you will store information about users, your blog posts, etc. We will be using a SQLite database to store our data. This is the default Django database adapter – it'll be enough for us right now.

You can think of a model in the database as a spreadsheet with columns (fields) and rows (data).

### Ṣíṣẹ̀dá ètò kan

Láti mú kí gbogbo nnkan wà létòlétò, a ó ṣẹ̀dá ètò ọ̀tọ̀ kan sínú iṣẹ́ wa. Ó dára púpọ̀ láti ní gbogbo nnkan létòlétò láti ìbẹ̀rẹ̀pẹ̀pẹ̀. To create an application we need to run the following command in the console (from `djangogirls` directory where `manage.py` file is):

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
    |   ├── urls.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

After creating an application, we also need to tell Django that it should use it. We do that in the file `mysite/settings.py` -- open it in your code editor. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. So the final product should look like this:

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. This convention is used frequently in Python and sometimes we also call them "dunder" (short for "double-underscore").

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` is a special keyword that indicates that we are defining an object.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` means that the Post is a Django Model, so Django knows that it should be saved in the database.

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? A number? A date? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

A kò ní ṣàlàyé gbogbo kóòdù níbí nítorí pé yíò gba àkókò púpọ̀. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.0/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Create tables for models in your database

The last step here is to add our new model to our database. First we have to make Django know that we have some changes in our model. (A ṣẹ̀ṣẹ̀ ṣẹ̀dá rẹ̀!) Lọ sí fèrèsé console rẹ kí o sì tẹ `python manage.py makemigrations blog`. Yóò rí báyìí:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Àkíyèsí:** Rántí láti tọ́jú àwọn fáìlì tí o ṣàtúnṣe náà. Bí bẹ́ẹ̀ kọ́, kọ̀mpútà rẹ yíò ṣiṣẹ́ lórí ẹyà ti tẹ́lẹ̀ náà èyí tó lè fún ọ ní àwọn ìròyìn àṣìṣe láìròtẹ́lẹ̀.

Django ti ṣètò fáìlì migration (ìyípòpadà) kan fún wa tí a ní láti lò sí àkójọpọ̀ dátà wa. Tẹ `python manage.py migrate blog`, tó sì yẹ kí èsì náà rí báyìí:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database! It would be nice to see it, right? Jump to the next chapter to see what your Post looks like!