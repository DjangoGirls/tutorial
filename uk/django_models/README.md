# Django моделі

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## Об'єкти

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Отже, що ж таке об'єкт? Це набір властивостей та дій. Звучить дивно, але представимо приклад.

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

Як же ми тоді змоделюємо дописи у блозі? Ми ж хочемо створити блог, правда?

Нам треба відповісти на питання: що таке допис у блозі? Які властивості він повинен мати?

Однозначно наш допис повинен містити певний текст із змістом і заголовком, правда ж? It would be also nice to know who wrote it – so we need an author. Зрештою, ми б хотіли знати коли було створено і опубліковано цей допис.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Якого роду дії можна було б вчиняти з дописом у блозі? Було б непогано мати певний метод, що публікує допис, правда ж? 

Отже, нам потрібен метод `publish`.

Таким чином, знаючи нарешті, чого ми хочемо досягти, можемо почати моделювати це в Django!

## Django модель

Знаючи яким є наш об'єкт, можемо створити Django модель для допису у нашому блозі.

A model in Django is a special kind of object – it is saved in the `database`. База даних є набором певних даних. Це є місце, де ви будете зберігати інформацію про користувачів, дописи у вашому блозі тощо. Надалі для зберігання наших даних будемо використовувати базу даних SQLite. This is the default Django database adapter – it'll be enough for us right now.

Ви можете уявляти модель в базі даних як таблицю зі стовпчиками (полями) та рядками (дані). 

### Створення додатку

Щоб підтримувати все у порядку, створимо окремий додаток всередині нашого проекту. Дуже добре зберігати в усьому організованість з самого початку. Щоб створити додаток треба запустити наступну команду в консолі (з директорії `djangogirls`, де знаходиться файл `manage.py`):

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
    

After creating an application, we also need to tell Django that it should use it. Ми робимо це у файлі `mysite/settings.py`. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. Таким чином, остаточний результат повинен мати наступний вигляд:

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

### Створення моделі допису у блозі

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. Ця домовленість часто використовується в Python й іноді ми називаємо її "dunder" (скорочення від англ. "double-underscore").

It looks scary, right? But don't worry – we will explain what these lines mean!

Усі лінії, що починаються з `from` або `import` - це лінії, які додають деякі біти з інших файлів. Отже замість того, щоб копіювати і вставляти одне й те ж в кожному файлі,ми можемо включити деякі частини з `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` - це спеціальне ключове слово, яке показує що ми визначаємо об'єкт.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` означає, що Post є Django моделлю, отже Django знає, що вона повинна бути збережена у базі даних.

А зараз визначимо властивості, про які ми говорили перед цим: `title`, `text`, `created_date`, `published_date` і `author`. To do that we need to define the type of each field (Is it text? Число? Дата? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

Не будемо пояснювати кожне слово в коді, оскільки це може зайняти надто багато часу. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

А як щодо `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` означає, що це функція/метод, а `publish` - ім'я методу. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Методи часто `return` (повертають) щось. Приклад цього можна побачити в методі `__str__`. У цьому сценарії, коли ми викликаємо `__str__()`, то отримуємо текст (**string**) із заголовком посту.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

Якщо вам щось незрозуміло з приводу моделей, не соромтеся запитувати у вашого тренера! Ми знаємо, що це дуже складно, особливо коли ви одночасно вивчаєте об'єкти і функції. Але сподіваємося наразі це виглядає трохи менш таємничим для вас!

### Створення таблиць для моделей в базі даних

Останній крок - додати нашу нову модель до нашої бази даних. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. Це буде виглядати так:

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
    

Ура! Наша модель допису Post тепер знаходиться у нашій базі даних. Було б добре побачити її, правда ж? Для цього перейдемо до наступного розділу!