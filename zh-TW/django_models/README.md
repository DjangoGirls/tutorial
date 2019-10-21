# Django 模型 (Django models)

我們現在想要做的是將來能存儲我們部落格中的所有文章的東西。但為了能夠做我們需要，我們必須談一下`物件`這東西.

## 物件 (Objects)

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

那麼什麼是物件？它是一個屬性 (properties) 和動作 (actions) 的集合。聽起來很奇怪吧，但是我們將會給你一個例子。

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
    

所以基本上，這概念是用包含屬性（稱為`object properties`）和方法（稱為`methods`）的程式碼來描寫真實的事物).

那麼我們將如何建立我們的部落格文章 (blog posts) 的模型？我們想要建立一個部落格，對吧？

我們需要回答這個問題：什麼是部落格文章 (blog post) ？它應該有什麼屬性？

嗯，確定的是我們的博客文章 (blog post) 需要一些文字內容和標題，對嗎？ It would be also nice to know who wrote it – so we need an author. 最後，我們想要知道文章是什麼時候建立和公佈。

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

那些工作和部落格文章有關？有一些公佈文章的`方法 (method) `是不錯的，對吧

所以我們將需要一個`公佈(publish)` 的方法。

既然我們已經知道我們想要完成什麼，讓我們開始在 Django 上建立模型吧。

## Django 模型 (Django model)

知道什麼是物件 (object) 之後，我們可以為我們的部落格文章 (blog post) 建立一個 Django 模型。

A model in Django is a special kind of object – it is saved in the `database`. 資料庫是資料的集合。 這是你將存儲有關使用者 (users) 和你的部落格文章 (blog posts) 等資訊的地方。 我們將使用一個 SQLite 資料庫來存儲我們的資料。 This is the default Django database adapter – it'll be enough for us right now.

你可以把資料庫中的模型看作是有列（欄位）和行（資料）的試算表。

### 建立應用程式 (Creating an application)

為了讓一切保持整潔，我們將在我們的專案內建立一個別的應用程式。 一開始就讓一切井然有序是很好的。 我們需要在主控台上（從 `djangogirls` 檔所在目錄 `manage.py` ）執行以下命令來建立一個應用程式：

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

### 建立一個部落格文章張貼模型 (Creating a blog post model)

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. 這個規矩在 Python 中頻繁地使用，有時候我們也稱它為 "dunder" （是 "double-underscore" 的縮寫）。　

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` 是一個特殊的關鍵字，表示我們在定義一個物件 (object) 。
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` 意味 Post 是一個 Django 模型，所以 Django 知道這模型應該被儲存在資料庫。

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

### 為你資料庫中的模組建立表格 (Create tables for models in your database)

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