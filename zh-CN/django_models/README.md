# Django模型

我们现在将要创建的是一个能存储我们博客所有文章的东西。为了达到这个目的，我们将要讲解一下一个被称为`objects（对象）`的东西.

## 对象

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

那什么是对象呢？它是一个属性和操作的集合。它听起来很奇怪，但我们会给你一个例子。

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
    

所以基本思想就是用包含属性的代码来描述真实的东西（称为 `对象属性`）和操作 （称为 `方法`).

我们将如何为博客帖子建立模型呢？我们想要建立一个博客，对吗？

我们需要回答一个问题：什么是一篇博客文章？它应该含有什么样的属性？

嗯，肯定我们的博客文章需要一些文本，包括内容与标题，对吗？ It would be also nice to know who wrote it – so we need an author. 最后，我们想要知道什么时候该文章创建并发布。

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

一篇博客文章需要做什么样的事情？应该有一些正确的 `方法` 来发布文章，对吗？

因此我们需要一个`publish`的方法

既然我们已经知道什么是我们想要实现的，让我们开始在Django里面为它建模！

## Django模型

知道什么是对象，我们可以为我们的博客文章创建一个 Django 模型。

A model in Django is a special kind of object – it is saved in the `database`. 数据库是数据的集合。 这是您存储有关用户、 您的博客文章等信息的地方。 我们将使用SQLite 数据库来存储我们的数据。 This is the default Django database adapter – it'll be enough for us right now.

您可以将数据库中的模型看作是电子表格中的列 （字段） 和行 （数据）。

### 创建应用程序

为了让一切保持整洁，我们将我们的项目内部创建单独的应用程序。 如果一开始就让每一件东西井然有序，那就太好了。 为了创建一个应用程序，我们需要在命令行中执行以下命令 (从`manage.py` 文件所在的`djangogirls` 目录)：

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

### 创建一个博客文章模型

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

> Double-check that you use two underscore characters (`_`) on each side of `str`. 这是Python编程里面的一种常见的约定写法，有时我们也叫这个做"dunder"("double-underscore"的缩写)。

It looks scary, right? But don't worry – we will explain what these lines mean!

All lines starting with `from` or `import` are lines that add some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` 是一个特殊的关键字，表明我们在定义一个对象。
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` 表明Post是一个Django模型，所以Django知道它应该被保存在数据库中。

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

### 在你的数据库中为模型创建数据表

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