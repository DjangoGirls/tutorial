# Django ORM и QuerySet

В этой главе ты узнаешь как Django подключается к базе данных и сохраняет в неё информацию. Давай начнем!

## Что такое QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

Проще научиться на примере. Давай попробуем, согласна?

## Интерактивная консоль Django

Открой свой локальный терминал (не на PythonAnywhere), и набери следующую команду:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Результат должен быть таким:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too, of course.

### Все объекты

Давай попробуем вывести на экран все записи в нашем блоге. Ты можешь сделать это следующей командой:

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

### Создаем объект

Создать объект Post в базе данных можно следующим образом:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

Давай импортируем модель user для начала:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Какие пользователи есть в нашей базе данных? Попробуй эту команду:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat! Of course, you have to adjust this line to use your own username.

Теперь мы наконец можем создать наш пост:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Ура! Хочешь проверить, что все работает?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Есть, еще один пост в списке!

### Добавляем записи

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Фильтрация объектов

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. Мы используем метод `filter` вместо метода `all` в `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Теперь наш код выглядит следующим образом:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Примечание**: Обрати внимание на два символа нижнего подчеркивания (`_`) между `title` и `contains`. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Дальше мы опубликуем её с помощью метода `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### Сортировка объектов

QuerySets позволяет сортировать объекты. Давай попробуем сортировку по полю `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Мы также можем изменить порядок на противоположный, добавив `-` в начало условия:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### Соединение QuerySets

QuerySets можно **сцеплять**, создавая цепочки:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

Это — мощный и удобный инструмент, позволяющий писать сложные запросы.

Отлично! Теперь ты готова к следующей части! Чтобы закрыть интерактивную консоль, набери:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```