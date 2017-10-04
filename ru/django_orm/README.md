# Django ORM и QuerySet

В этой главе ты узнаешь, как Django подключается к базе данных и сохраняет в неё информацию. Давай начнём!

## Что такое QuerySet?

QuerySet, по сути, — список объектов заданной Модели. QuerySet позволяет читать данные из базы данных, фильтровать и изменять их порядок.

Проще научиться на примере. Давай попробуем, согласна?

## Интерактивная консоль Django

Открой свой локальный терминал (не на PythonAnywhere) и набери следующую команду:

{% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py shell
```

Результат должен быть таким:

{% filename %}command-line{% endfilename %}
```python
(InteractiveConsole)
>>>
```

Ты находишься в интерактивной консоли Django. По сути, это та же интерактивная консоль Python, но с магией Django :) Ты можешь использовать весь синтаксис Python, разумеется.

### Все объекты

Давай попробуем вывести на экран все записи в нашем блоге. Ты можешь сделать это следующей командой:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Упс! Ошибка. Она говорит, что не существует объекта с именем Post. И это верно — мы забыли импортировать его!

{% filename %}command-line{% endfilename %}
```python
>>> from blog.models import Post
```

Всё просто: мы импортируем модель `Post` из `blog.models`. Давай попробуем получить все записи блога ещё раз:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Это список записей, с которыми мы работали до этого! Мы создали их через панель администратора Django. Теперь же мы хотим создавать записи с помощью Python, так как же мы этого добьёмся?

### Создаём объект

Создать объект Post в базе данных можно следующим образом:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Но у нас есть один недочёт: `me`. Мы должны передать этой переменной экземпляр модели `User`, который будет отвечать за автора записи. Как это сделать?

Давай для начала импортируем модель User:

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

Это суперпользователь, которого мы создали ранее! Нам нужен его экземпляр:

{% filename %}command-line{% endfilename %}
```python
>>> me = User.objects.get(username='ola')
```

Как ты можешь заметить, мы получили (`get`) пользователя (`User`) с именем `username` 'ola'. Шикарно! В твоём случае имя, конечно, может отличаться.

Теперь мы, наконец, можем создать наш пост:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Ура! Хочешь проверить, что всё работает?

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Есть, ещё один пост в списке!

### Добавляем записи

Можешь повеселиться и добавить ещё записей. 2-3 будет достаточно.

### Фильтрация объектов

Важной особенностью QuerySets является возможность фильтровать объекты. Предположим, нам нужно найти все записи пользователя ola. Мы используем метод `filter` вместо метода `all` в `Post.objects.all()`. В скобках мы укажем условия, по которым будет построена выборка записей. В нашей ситуации условием будет являться равенство поля `author` переменной `me`. В Django мы можем написать это следующим образом: `author=me`. Теперь наш код выглядит следующим образом:

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

А может быть мы хотим получить все записи со словом 'title' в поле `title`?

{% filename %}command-line{% endfilename %}
```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Примечание**: обрати внимание на два символа нижнего подчёркивания (`_`) между `title` и `contains`. Django ORM использует этот синтаксис для разделения имён полей ("title") и операций или фильтров ("contains"). Если ты используешь только один символ нижнего подчёркивания, то получишь ошибку "FieldError: Cannot resolve keyword title_contains".

Ты также можешь получить список всех опубликованных записей. Мы просто отфильтруем записи по полю `published_date`:

{% filename %}command-line{% endfilename %}
```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

К сожалению, пост, который мы добавили в консоли Python, ещё не опубликован. Мы можем изменить это! Сначала выберем запись, которую мы хотим опубликовать:

{% filename %}command-line{% endfilename %}
```python
>>> post = Post.objects.get(title="Sample title")
```

Дальше мы опубликуем её с помощью метода `publish`!

{% filename %}command-line{% endfilename %}
```python
>>> post.publish()
```

Теперь попробуй получить список опубликованных сообщений снова (нажми стрелку вверх 3 раза и затем `enter`):

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
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```


### Соединение QuerySets

QuerySets можно **сцеплять**, создавая цепочки:

```
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Это мощный и удобный инструмент, позволяющий писать сложные запросы.

Отлично! Теперь ты готова к следующей части! Чтобы закрыть интерактивную консоль, набери:

{% filename %}command-line{% endfilename %}
```python
>>> exit()
$
```
