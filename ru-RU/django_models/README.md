# Модели Django

Нам нужно что-то, что будет хранить все записи нашего блога. Но прежде, давай поговорим о вещах, называемых `объектами`.

## Объекты

В программировании существует особая концепция, она называется -- `объектно-ориентированным программированием`. Идея заключается в том, что вместо скучной последовательности инструкций мы моделируем вещи и описываем как они взаимодействуют друг с другом.

Так что же такое объект? Это совокупность поведения и свойств. Звучит странно, но мы приведем пример.

Если мы хотим смоделировать кошку, то создадим объект `Cat`, который обладает определенными свойствами, например, `color` (цвет), `age` (возраст), `mood` (настроение: плохое, хорошее, сонное ;)), `owner` (хозяин, например другой объект -- `Person` или, если кошка дикая, это свойство будет пустым).

Объект `Cat` будет иметь набор определенных действий: `purr` (мурчать), `scratch` (царапаться) или `feed` (кормить, где мы дадим кошке немного `CatFood` (кошачьей еды), которая так же может быть отдельным объектом со своими свойствами, например `taste` (вкусом)

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
    

Основная идея, таким образом, заключается в описании объекта в коде, используя его параметры (`свойства объекта`) и доступные ему действия (`методы`).

Так как же мы смоделируем запись в блоге? Нам же нужен блог, верно?

Для начала стоит ответить на вопрос: что такое запись в блоге? Какие свойства она имеет?

Ну, запись содержит какой-то текст и заголовок, это наверняка, верно? Было бы неплохо также знать кто её написал -- так что нам нужен автор. Ну и в заключении, нам нужно знать когда запись создана и когда опубликована.

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

Модель в Django — это особый вид объекта и он сохраняется в `базе данных`. База данных представляет собой совокупность различных данных. Это то место, где ты будешь хранить информацию о своих пользователях, записях в блоге и т.д. Мы будем использовать базу данных SQLite для хранения информации. Это стандартная база данных в Django -- её вполне хватит для наших нужд сейчас.

Ты можешь представить модель в базе данных как электронную таблицу с колонками (полями) и строками (данными).

### Создание приложения

Для аккуратности мы создадим отдельное приложение в нашем проекте. Очень удобно иметь хорошо организованное рабочее место с самого начала. Для создания приложения нам понадобиться набрать следующую инструкцию в командной строке (из директории `djangogirls`, где находится файл `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Обрати внимание, что в нашем проекте появилась новая папка `blog`, которая содержит некоторые файлы. Итак, структура нашего проекта будет выглядеть следующим образом:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
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
    └── requirements.txt
    

После того как приложение создано, нам нужно сообщить Django, что теперь он должен его использовать. Мы делаем это в файле `mysite/settings.py`, откройте его в своем редакторе кода. Нам нужно найти `INSTALLED_APPS` и добавить к списку `'blog',` прямо перед `]`. Конечный результат должен выглядеть следующим образом:

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

В файле `blog/models.py` мы определяем все объекты называемые`Models` - в этом месте мы определим наши записи для блога.

Открой файл `blog/models.py` в редакторе кода, удали весь текст и вставь на его место следующий код:

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

> Убедись, что использовала два символа нижнего подчеркивания (`_`) с обоих сторон от метода `str`. Это соглашение часто используется при программировании на Python, и иногда его называют "dunder" (сокращение от англ. "double-underscore").

Смотрится страшно, да? Но не волнуйся, мы объясним что значит каждая строка кода!

Строки, начинающиеся с `from` или `import`, открывают доступ к коду из других файлов. Так что, вместо того, чтобы копировать и вставлять один и тот же код во все файлы, мы можешь сослаться на него при помощи `from ... import ...`.

`class Post(models.Model):` -- эта строка определяет нашу модель (`объект`).

- `class` это специальное ключевое слово для определения объектов.
- `Post` это имя нашей модели, мы можем поменять его при желании (специальные знаки и пробелы использовать нельзя). Всегда начинай имена классов с большой буквы.
- `models.Model` означает что объект Post является моделью Django, так Django поймет, что он должен сохранить его в базу данных.

Дальше мы задаем свойства, о которых уже говорили: `title`, `text`, `created_date`, `published_date` и `author`. Чтобы это сделать нам нужно определиться с типом полей (это текст? число? дата? ссылка на другой объект? например, на пользователя?)

- `models.CharField` -- так мы определяем текстовое поле с ограничением на количество символов.
- `models.TextField` - так определяется поле для неограниченно длинного текста. Выглядит подходящим для содержимого поста, верно?
- `models.DateTimeField` -- дата и время.
- `models.ForeignKey` -- ссылка на другую модель.

We will not explain every bit of code here since it would take too much time. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.0/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Создаем таблицы моделей в базе данных

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