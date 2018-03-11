# Django ORM 和 QuerySets（查询集）

在这一章中，你将学习 Django 如何连接到数据库，并将数据存储在里面。一探究竟吧！

## QuerySet 是什么呢？

从本质上说，QuerySet 是给定模型的对象列表（list）。QuerySet 允许您从数据库中读取数据，对其进行筛选以及排序。

用例子来学习最容易的了。让我们试试这个，好吗？

## Django shell

打开你本地的终端(不是在Python解析器里面) 然后输入这个命令:

    (myvenv) ~/djangogirls$ python manage.py shell
    

效果应该像这样：

    (InteractiveConsole)
    >>>
    

你现在在 Django 的交互式控制台中。它是就像 Python 提示符，但有一些额外神奇的 Django 特性：）。你当然也可以在这里使用所有的 Python 命令。

### 所有对象

首先让我们尝试显示所有我们的文章。你可以用下面的命令：

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined
    

哎呀 ！出现了一个错误。它告诉我们没有文章。这是正确的 — — 我们忘了首先导入它 ！

    >>> from blog.models import Post
    

这很简单： 我们从 `blog.models` 导入 `Post` 的模型。让我们试着再一次显示所有的帖子：

    >>> Post.objects.all()
    <QuerySet [<Post: my post title>, <Post: another post title>]>
    

这是我们之前创建的文章的 list 列表！我们通过使用Django admin界面创建了这些文章。但是我们现在想通过Python来创建新的文章，那么我们应该如何做呢？

### 创建对象

这就是你如何在数据库创建一个新的Post对象的方法:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

但是我们这里有一个遗漏的要素： `me`。我们需要传递 `User` 模型的实例作为作者。如何做到这一点？

让我们首先导入用户模型：

    >>> from django.contrib.auth.models import User
    

我们在数据库中有哪些用户？试试这个：

    >>> User.objects.all()
    <QuerySet [<User: ola>]>
    

这是一个我们之前创建的超级用户！让我们现在获取一个用户实例：

    me = User.objects.get(username='ola')
    

正如你所看到的，我们现在 `get` 一个 `username` 等于 'ola' 的`User` 。简单吧！当然，你必须将其改为你所使用的用户名。

现在我们终于可以创建我们的文章了:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

哈哈！要检查是否有效吗？

    >>> Post.objects.all()
    <QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
    

就是这样，又一个文章在列表里面！

### 添加更多文章

你现在可以找点乐子，并添加更多的帖子，看它是如何工作。添加 2-3 个并前进到下一个部分。

### 筛选对象

QuerySets的很大一部分功能是对它们进行筛选。 譬如，我们想要发现所有都由用户ola编写的文章。 我们将使用 `filter`，而不是 `all` 在 `Post.objects.all()`。 我们需要在括号中申明哪些条件，以在我们的 queryset 结果集中包含一篇博客文章。 在我们的情况是 `author`，它等于 `me`。 把它写在 Django 的方式是： `author = me`。 现在我们的代码段如下所示：

    >>> Post.objects.filter(author=me)
    <QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
    

或者，也许我们想看到包含在 `title` 字段标题的所有帖子吗？

    >>> Post.objects.filter(title__contains='title')
    <QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
    

> **注**在`title` 与 `contains` 之间有两个下划线字符 (`_`)。 Django 的 ORM 使用此语法来分隔字段名称 （"title"） 和操作或筛选器 （"contains"）。 如果您只使用一个下划线，您将收到类似"FieldError： 无法解析关键字 title_contains"的错误。

你也可以获取一个所有已发布文章的列表。我们通过筛选所有含`published_date`为过去时间的文章来实现这个目的：

> > > from django.utils import timezone Post.objects.filter(published_date__lte=timezone.now())[]

不幸的是，通过Python终端添加的文章还没发布。我们可以改变它！首先获取一个我们想要发布的文章实例：

    >>> post = Post.objects.get(title="Sample title")
    

然后将它与我们 `publish` 的方法一起发布 ！

    >>> post.publish()
    

现在再一次尝试获取已发布的文章（按向上箭头按钮三次，然后按回车）:

    >>> Post.objects.filter(published_date__lte=timezone.now())
    <QuerySet [<Post: Sample title>]>
    

### 对象排序

Queryset 还允许您排序结果集对象的列表。让我们试着让它们按 `created_date` 字段排序：

    >>> Post.objects.order_by('created_date')
    <QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
    

我们也可以在开头添加 `-` 来反向排序：

    >>> Post.objects.order_by('-created_date')
    <QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
    

### 链式 QuerySets

你可以通过**链式调用**连续组合QuerySets

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

这真是强而有力，而且可以让你写较复杂的的查询

酷 ！现在，你准备下一个部分 ！若要关闭shell程序，请键入这：

    >>> exit()
    $
