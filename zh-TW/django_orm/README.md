# Django ORM 和查詢集 (QuerySets)

在這一章中，您將學習 Django 如何連接到資料庫，並將資料存儲在裡面。一起去探究吧！

## 查詢集 (QuerySet) 是什麼？

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

從例子中學習是最容易的。讓我們試試，好嗎？

## Django shell

打開你的主控台（不是在 PythonAnywhere上），鍵入以下命令︰

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

結果應該像這樣︰

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### 所有物件 (All objects)

首先，讓我們試著顯示所有我們的文章。你可以用下面的命令︰

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! An error showed up. It tells us that there is no Post. It's correct – we forgot to import it first!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

We import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

This is a list of the posts we created earlier! We created these posts using the Django admin interface. But now we want to create new posts using Python, so how do we do that?

### 建立物件 (Create object)

這是你如何在資料庫中建立一個新的文章物件︰

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

讓我們首先導入 User 模型︰

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

在我們的資料庫中我們有哪些使用者？試試這個︰

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

現在我們終於可以建立我們的文章︰

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

萬歲！想要確認它是否成功？

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

在這裡，又多一個文章在清單中！

### 新增更多文章 (Add more posts)

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### 篩選物件 (Filter objects)

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. 我們將使用 `filter` 而不是在 `Post.objects.all()` 中的 `all`。 In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. 現在我們的程式碼部份看起來像這樣︰

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **注意**有兩個底線字元（`_`）在 `title` 和 `contains` 之間。 Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

然後用我們的 `publish` 方法 (method) 將它發佈:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### 排序物件 (Ordering objects)

QuerySets 還允許你排序清單的物件。讓我們試著按 `created_date` 欄位來排序︰

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

我們也可以在欄位開頭添加 `-`，做反向排序：

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### 連結查詢集 (QuerySets)

你還可以使用**連結**將查詢集 (QuerySets) 合併在一起︰

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

這真是強而有力，並可讓你寫相當複雜的查詢 (queries)。

酷！你現在已經可以到下一部分！若要關閉 shell，請鍵入這︰

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```