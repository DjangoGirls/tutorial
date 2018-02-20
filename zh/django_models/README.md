# Django模型

我们现在将要创建的是一个能存储我们博客所有文章的东西。为了达到这个目的，我们将要讲解一下一个被称为`objects（对象）`的东西.

## 对象

在编程中有一个概念叫做 `面向对象编程` 。 它的思想是，与其用无聊的一连串的程序指令方式写程序，我们不如为事物建立模型，然后定义他们是怎样互相交互的。

那什么是对象呢？它是一个属性和操作的集合。它听起来很奇怪，但我们会给你一个例子。

如果我们想塑造一只猫的模型，我们会创建一个名为`Cat`的对象，它含有一些属性例如：`color`, `age`, `mood`(又比如：good, bad, sleepy ;))，还有`owner（主人）` (那是一个`Person`对象或者假若是流浪猫，这个属性可以为空)。

然后这个`Cat`会有一些行为: `purr`, `scratch`, 或者`feed` (在这其中我们会给这只猫一些 `CatFood`，这个`CatFood`可以是单独的一个包含比如<0>taste</0>属性的对象).

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

嗯，肯定我们的博客文章需要一些文本，包括内容与标题，对吗？ 我们也需要知道是谁写的 — — 所以我们需要一位作者。 最后，我们想要知道什么时候该文章创建并发布。

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

Django 里的模型是一种特殊的对象 — — 它保存在 `数据库` 中。 数据库是数据的集合。 这是您存储有关用户、 您的博客文章等信息的地方。 我们将使用SQLite 数据库来存储我们的数据。 这是默认的 Django 数据库适配器 — — 对于我们现在的需求而言它是足够的。

您可以将数据库中的模型看作是电子表格中的列 （字段） 和行 （数据）。

### 创建应用程序

为了让一切保持整洁，我们将我们的项目内部创建单独的应用程序。 如果一开始就让每一件东西井然有序，那就太好了。 为了创建一个应用程序，我们需要在命令行中执行以下命令 (从`manage.py` 文件所在的`djangogirls` 目录)：

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

你会注意到一个新的 `blog` 目录被创建，它现在包含一些文件。我们的目录和我们的项目中的文件现在应该看起来像这样：

    djangogirls
    ├── mysite
    |       __init__.py
    |       settings.py
    |       urls.py
    |       wsgi.py
    ├── manage.py
    └── blog
        ├── migrations
        |       __init__.py
        ├── __init__.py
        ├── admin.py
        ├── models.py
        ├── tests.py
        └── views.py
    

创建应用程序后，我们还需要告诉 Django 它应该使用它。 我们是在 `mysite/settings.py`文件中这样做的。 我们需要找到 `INSTALLED_APPS` 并在它下面添加一行`'blog'` 。 所以最终的代码应如下所示：

    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'blog',
    )
    

### 创建一个博客文章模型

我们在 `blog/models.py` 文件中，定义所有的 `Models` 对象— — 我们将在其中都定义我们的博客文章。

让我们打开 `blog/models.py`，从中删除一切并编写这样的代码：

    from django.db import models
    from django.utils import timezone
    
    
    class Post(models.Model):
        author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
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
    

> 当你在`str`的两端使用两个下划线字符（`_`）的时候务必三思而后行。 这是Python编程里面的一种常见的约定写法，有时我们也叫这个做"dunder"("double-underscore"的缩写)。

这看起来太吓人了，对吧？不过不用担心，我们会解释这几行是什么意思！

所有以 `from` 或 `import` 开始的所有行，都是需要从其他文件中添加一些内容。 所以与其复制和粘贴同样的内容，我们可以用 `from...... import......`来导入这些文件.

`class Post(models.Model):` - 这行是用来定义我们的模型 (这是一个 `对象`).

*   `class` 是一个特殊的关键字，表明我们在定义一个对象。
*   `Post`是我们模型的一个名字。我们可以给它取另外一个不同的名字(但是我们必须避免使用特殊字符或者空格符)。总是以首字母大写来作为类名。
*   `models.Model` 表明Post是一个Django模型，所以Django知道它应该被保存在数据库中。

现在我们定义了我们曾经提及到的那些属性：`title`, `text`, `created_date`, `published_date`和`author`。 为了做到那样我们需要为我们每个字段定义一个类型(它是文本吗？ 是数字？ 是日期？ 到另一个对象的关联，比如用户吗?）。

*   `models.CharField` - 这是你如何用为数有限的字符来定义一个文本。
*   `models.TextField` - 这是没有长度限制的长文本。这听起来用在博客文章的内容上挺适合的，对吧？
*   `models.DateTimeField` - 这是日期和时间。
*   `models.ForeignKey` - 这是指向另一个模型的连接。

我们不会对这里的代码解释得面面俱到因为那会花太多时间了。 如果你想了解更多有关模型字段以及如何定义除上面描述以外的东西，那你应该去看看Django的官方文档(https://docs.djangoproject.com/en/1.8/ref/models/fields/#field-types)。

`def publish(self):`又怎样呢? 这正是我们之前提及到的`publish`方法。 `def`表明这是一个函数或者方法，`publish`是这个方法的名字。 如果你喜欢的话你可以改变方法名。 命名的规则是使用小写字母以及下划线而非空白符。 举个例子，一个计算平均价格的方法可以叫做`calculate_average_price`.

方法通常会`return`一些东西。 例如在 `__str__` 方法中就有这个。 在这种情况下，当我们调用 `__str__()` 我们将得到文章标题的文本 （**字符串**）。

如果关于模型尚有不清楚的，请随时问你的教练 ！ 我们知道它很复杂，特别是当你同时学习对象和函数的时候。 但希望它在你看来没有那么神奇！

### 在你的数据库中为模型创建数据表

在这里的最后一步是将我们新的模型添加到我们的数据库。 首先我们必须让Django知道我们在我们的模型(我们刚刚创建的！) 有一些变更。 输入`python manage.py makemigrations blog`。 它看起来会像这样：

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post
    

Django为我们准备了我们必须应用到我们数据库的迁移文件。输入`python manage.py migrate blog`，然后对应的输出应该是:

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

万岁! 我们的Post模型现在已经在我们的数据库里面了! 它看起来很不错, 对吧? 跳转到下一个章节，看看你博客文章的样子！
