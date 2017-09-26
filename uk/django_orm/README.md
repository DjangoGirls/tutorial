# Django ORM і QuerySets

У цьому розділі ви дізнаєтесь як Django з'єднується із базою даних і зберігає в ній дані. Почнемо занурення!

## Що таке QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

Найпростіше показати на прикладі. Давайте спробуємо?

## Django shell

Відкрийте свій локальний термінал (не PythonAnywhere) і наберіть цю команду:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Результат повинен бути наступним:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too, of course.

### Усі об'єкти

Давайте спробуємо спочатку вивести усі наші пости. Можна це зробити за допомогою наступної команди:

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

This is simple: we import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

This is a list of the posts we created earlier! We created these posts using the Django admin interface. But now we want to create new posts using Python, so how do we do that?

### Створення об'єкту

Мова йдеться про те, як створити об'єкт Post в базі даних:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

Спочатку імпортуємо модель User:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Які користувачі присутні в нашій базі даних? Спробуймо це:

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

Тепер ми нарешті можемо створити наш пост:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Ура! Бажаєте перевірити чи це працює?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Є, ще один допис в списку!

### Додайте більше постів

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Фільтрування об'єктів

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. Будемо використовувати `filter` замість `all` в `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Тепер наш шматок коду виглядає так:

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

> **Зауваження** Тут використано два знаки підкреслювання (`_`) між `title` і `contains`. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

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

And then publish it with our `publish` method:

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

### Впорядкування об'єктів

QuerySets також дозволяє впорядковувати список об'єктів. Давайте спробуємо впорядкувати їх за параметром поля `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Також можна здійснити впорядкування у зворотньому напрямку додавши `-` на початку:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### З'єднання QuerySets

QuerySets можна поєднувати, створюючи **ланцюжки**:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

Це дуже потужний механізм, що дозволяє вам писати дуже складні запити.

Клас! Тепер ви готові до наступної частини! Щоб закрити командну оболонку, наберіть:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```