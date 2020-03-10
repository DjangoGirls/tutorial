# Модели на Django

Това, което искаме да създадем сега, е нещо, което ще съхранява всички публикации в нашия блог. Но за да можем да направим това, трябва да поговорим малко за неща, наречени `обекти`.

## Обекти

Има концепция в програмирането, наречена `обектно-ориентирано програмиране`. Идеята е, че вместо да пишем всичко като скучна последователност от инструкции за програмиране, можем да моделираме нещата и да определим как те си взаимодействат помежду си.

И така, какво е обект? Това е съвкупност от свойства и действия. Звучи странно, но ще ви дадем пример.

Ако искаме да моделираме котка, ще създадем обект `Cat`, който има някои свойства като `color`, `age`, `mood` (като добър, лош или сънен;)) и `owner` (на който може да бъде назначен обект `Person` - или може би в случай на бездомна котка, този имот може да бъде празен).

Тогава `Cat` има някои действия: `purr`, `scratch` или `feed` (в този случай ще дадем cat some `CatFood`, който може да бъде отделен обект със свойства, като `taste`).

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
    

Така че в общи линии идеята е да се опишат реални неща в код със свойства (наречени `свойства на обекта`) и действия (наречени `методи`).

Как ще моделираме публикации в блогове тогава? Искаме да изградим блог, нали?

Трябва да отговорим на въпроса: Какво е публикация в блога? Какви свойства трябва да има?

Е, със сигурност нашата публикация в блога се нуждае от текст с нейното съдържание и заглавие, нали? Също така би било хубаво да знаем кой го е написал - така че се нуждаем от автор. И накрая, искаме да знаем кога публикацията е създадена и публикувана.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Какви неща могат да се направят с публикация в блог? Би било хубаво да има някакъв `метод`, който публикува публикацията, нали?

Така че ще се нуждаем от метод `publish`.

Тъй като вече знаем какво искаме да постигнем, нека започнем да го моделираме в Django!

## Модел на Джанго

Знаейки какво е обект, можем да създадем модел на Django за нашата публикация в блога.

Моделът в Django е специален вид обект - той се записва в `database`. База данни е съвкупност от данни. Това е място, на което ще съхранявате информация за потребители, публикации в блога си и т.н. Ще използваме база данни SQLite, за да съхраняваме нашите данни. Това е адаптерът за база данни Django по подразбиране - това ще ни бъде достатъчно в момента.

Можете да мислите за модел в базата данни като електронна таблица с колони (полета) и редове (данни).

### Създаване на приложение

За да поддържаме всичко подредено, ние ще създадем отделно приложение вътре в нашия проект. Много е хубаво да се организира всичко от самото начало. За да създадем приложение, трябва да стартираме следната команда в конзолата (от директорията `djangogirls`, където е файлът `management.py`):

{% filename %}Mac OS X и Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Ще забележите, че се създава нова директория `blog` и сега съдържа редица файлове. Директориите и файловете в нашия проект трябва да изглеждат така:

    djangogirls
    ├── blog
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    
    

След създаването на приложение също трябва да кажем на Django, че трябва да го използва. Правим това във файла `mysite/settings.py` -- отваряме го във вашия редактор на кодове. Трябва да намерим `INSTALLED_APPS` и да добавим ред, съдържащ `'blog.apps.BlogConfig',` малко над `]`. Така че крайният продукт трябва да изглежда така:

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

### Създаване на модел на блог публикация

Във файла `blog/models.py` дефинираме всички обекти, наречени `Models` - това е място, на което ще дефинираме нашата публикация в блога.

Нека да отворим `blog/models.py` в редактора на кода, да премахнем всичко от него и да напишем код така:

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

> Проверете двукратно дали използвате два знака за подчертаване (`_`) от всяка страна на `str`. Тази конвенция се използва често в Python и понякога ги наричаме и „dunder“ (съкратено от „двойно-подчертаване“, "double-underscore").

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

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

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