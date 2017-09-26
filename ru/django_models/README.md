# Модели Django

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## Объекты

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Так что же такое объект? Это совокупность поведения и свойств. Звучит странно, но мы приведем пример.

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

Так как же мы смоделируем запись в блоге? Нам же нужен блог, верно?

Для начала стоит ответить на вопрос: что такое запись в блоге? Какие свойства она имеет?

Ну, запись содержит какой-то текст и заголовок, это наверняка, верно? It would be also nice to know who wrote it – so we need an author. Ну и в заключении, нам нужно знать когда запись создана и когда опубликована.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Какие вещи можно сделать с записью в блоге? Было бы неплохо иметь `метод` для её публикации, согласна?

Так что нам пригодится метод `publish`.

Ну и раз уж мы определились с тем, что хотим получить, давай начнем моделирование в Django!

## Модель в Django

Зная, что представляет из себя объект, мы можем создать Django модель для записи в блоге.

A model in Django is a special kind of object – it is saved in the `database`. База данных представляет собой совокупность различных данных. Это то место, где ты будешь хранить информацию о своих пользователях, записях в блоге и т.д. Мы будем использовать базу данных SQLite для хранения информации. This is the default Django database adapter – it'll be enough for us right now.

Ты можешь представить модель в базе данных как электронную таблицу с колонками (полями) и строками (данными).

### Создание приложения

Для аккуратности мы создадим отдельное приложение в нашем проекте. Очень удобно иметь хорошо организованное рабочее место с самого начала. Для создания приложения нам понадобиться набрать следующую инструкцию в командной строке (из директории `djangogirls`, где находится файл `manage.py`):

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
    

After creating an application, we also need to tell Django that it should use it. Мы сделаем это через файл `mysite/settings.py`. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. Конечный результат должен выглядеть следующим образом:

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

### Создание модели записи в блоге

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. Это соглашение часто используется при программировании на Python, и иногда его называют "dunder" (сокращение от англ. "double-underscore").

It looks scary, right? But don't worry – we will explain what these lines mean!

Строки, начинающиеся с `from` или `import`, открывают доступ к коду из других файлов. Так что, вместо того, чтобы копировать и вставлять один и тот же код во все файлы, мы можешь сослаться на него при помощи `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` это специальное ключевое слово для определения объектов.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` означает что объект Post является моделью Django, так Django поймет, что он должен сохранить его в базу данных.

Дальше мы задаем свойства, о которых уже говорили: `title`, `text`, `created_date`, `published_date` и `author`. To do that we need to define the type of each field (Is it text? число? дата? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

Мы не будем объяснять каждую запятую, поскольку на это уйдет слишком много времени. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

Что насчет `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` означает, что создаётся функция/метод, а `publish` — это название этого метода. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Методы часто `возвращают` что-то. Например, метод `__str__`. В наше случае, после вызова метода `__str__()` мы получим текст (**строку**) с заголовком записи.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

Если тема моделей тебе до сих пор непонятна -- не стесняйся обратиться к тренеру! Мы знаем, что она действительно сложна, особенно когда ты изучаешь параллельно объекты и функции. Но мы надеемся, что все это кажется тебе теперь не магией!

### Создаем таблицы моделей в базе данных

Последним шагом будет добавление нашей модели в базу данных. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. Должно получиться примерно так:

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
    

Ура! Модель записи для блога теперь в базе данных, было бы неплохо посмотреть на неё, верно? Тогда переходи к следующей главе!