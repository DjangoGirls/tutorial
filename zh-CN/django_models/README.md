# Django模型

我们现在将要创建的是一个能存储我们博客所有文章的东西。为了达到这个目的，我们将要讲解一下一个被称为`objects（对象）`的东西.

## 对象

在编程中有一个概念叫做 `面向对象编程` 。 它的思想是，与其用无聊的一连串的程序指令方式写程序，不如为事物建立模型，然后定义他们之间的交互方法。

那什么是对象呢？它是一个属性和操作的集合。它听起来很奇怪，但我们会给你一个例子。

如果我们想塑造一只猫的模型，我们会创建一个名为`Cat`的对象，它含有一些属性例如：`color`(颜色), `age`(年龄), `mood`(心情， 比如 good [好] , bad [不好], sleepy [困] ; ))，还有`owner` (主人) (那是一个`Person` (人) 对象, ——或者, 假若这只猫是流浪猫，这个属性可以为空)。

然后这个`Cat`会有一些行为: `purr`(咕噜咕噜叫), `scratch`(抓挠), 或者`feed` (被喂食) (在这其中我们会给这只猫一些 `CatFood` (猫粮)，这个`CatFood`可以是单独的一个包含比如 <0>taste</0> (口味)属性的对象).

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

嗯，我们的博客文章一定需要一些文本，包括内容与标题，对吗？ 另一个很合理的需求是知道是谁写了这篇文章 — — 所以我们需要一个作者。 最后，我们想要知道什么时候该文章创建并发布。

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

Django 里的模型(model)是一种特殊的对象(object) — — 它保存在 `数据库` 中。 数据库是数据的集合。 这是您存储有关用户、 您的博客文章等信息的地方。 我们将使用SQLite 数据库来存储我们的数据。 这是默认的 Django 数据库适配器 — — 对于我们现在的需求而言, 它是足够的。

您可以将数据库中的模型看作是电子表格中的列 （字段） 和行 （数据）。

### 创建应用程序

为了让一切保持整洁，我们将我们的项目内部创建单独的应用程序。 如果一开始就让每一件东西井然有序，那就太好了。 为了创建一个应用程序，我们需要在命令行中执行以下命令 (从`manage.py` 文件所在的`djangogirls` 目录)：

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

你会注意到一个新的 `blog` 目录被创建，并且它包含了一些文件。现在, 我们的项目中的目录和文件应该看起来像这样：

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
    
    

创建应用程序之后，我们还需要告知 Django , 以让 Django 使用该应用程序。 我们在文件 `mysite/settings.py` 中做 "告知 Django" 这件事——请在你的代码编辑器中打开这个文件。 我们需要找到 `INSTALLED_APPS` , 并在它的条目中添加一条`'blog.apps.BlogConfig'` . 所以最终的文件应该如下所示：

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

在 `blog/models.py` 文件中，我们定义所有的 `Models` 对象— — 这个文件是我们定义 "博客文章" 的地方。

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

这看起来太吓人了，对吧？不过不用担心，我们会解释这几行是什么意思！

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