# Django ORM и QuerySet

В этой главе ты узнаешь как Django подключается к базе данных и сохраняет в неё информацию. Давай начнем!

## Что такое QuerySet?

QuerySet, по сути, список объектов заданной Модели. QuerySet позволяет читать данные из базы данных, фильтровать и изменять их порядок.

Проще научиться на примере. Давай попробуем, согласна?

## Интерактивная консоль Django

Открой свой локальный терминал (не на PythonAnywhere), и набери следующую команду:

    (myvenv) ~/djangogirls$ python manage.py shell
    

Результат должен быть таким:

    (InteractiveConsole)
    >>>
    

Ты находишься в интерактивной консоли Django. По сути, это та же интерактивная консоль Python, но с магией Django :). Ты можешь использовать весь синтаксис Python, разумеется.

### Все объекты

Давай попробуем вывести на экран все записи в нашем блоге. Ты можешь сделать это следующей командой:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined
    

Упс! Ошибка. Она говорит, что не существует объекта с именем Post. И это верно -- мы забыли импортировать его!

    >>> from blog.models import Post
    

Все просто: мы импортируем модель `Post` из `blog.models`. Давай попробуем получить все записи блога еще раз:

    >>> Post.objects.all()
    [<Post: my post title>, <Post: another post title>]
    

Это список записей, с которыми мы работали до этого! Мы создали их через панель администратора Django. Теперь же, мы хотим создавать записи через Python, так как же мы этого добьемся?

### Создаем объект

Создать объект Post в базе данных можно следующим образом:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

Но у нас есть один недочет: `me`. Мы должны передать этой переменной экземпляр модели `User`, который будет отвечать за автора записи. Как это сделать?

Давай импортируем модель user для начала:

    >>> from django.contrib.auth.models import User
    

Какие пользователи есть в нашей базе данных? Попробуй эту команду:

    >>> User.objects.all()
    [<User: ola>]
    

Это суперпользователь, которого мы создали ранее! Нам нужен его экземпляр:

    me = User.objects.get(username='ola')
    

Как ты можешь заметить, мы получили (`get`) пользователя (`User`) с именем `username` 'ola'. Шикарно! В твоем случае, имя, конечно, может отличаться.

Теперь мы наконец можем создать наш пост:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

Ура! Хочешь проверить, что все работает?

    >>> Post.objects.all()
    [<Post: my post title>, <Post: another post title>, <Post: Sample title>]
    

Есть, еще один пост в списке!

### Добавляем записи

Можешь повеселиться и добавить еще записей. 2-3 будет достаточно.

### Фильтрация объектов

Важной особенностью QuerySets является возможность фильтровать объекты. Предположим, нам нужно найти все записи пользователя ola. Мы используем метод `filter` вместо метода `all` в `Post.objects.all()`. В кавычках мы укажем условия, по которым будет построена выборка записей. В нашей ситуации условием будет являться равенство поля `author` переменной `me`. В Django мы можем написать это следующим образом: `author=me`. Теперь наш код выглядит следующим образом:

    >>> Post.objects.filter(author=me)
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
    

А может быть мы хотим получить все записи со словом 'title' в поле `title`?

    >>> Post.objects.filter(title__contains='title')
    [<Post: Sample title>, <Post: 4th title of post>]
    

> **Примечание**: Обрати внимание на два символа нижнего подчеркивания (`_`) между `title` и `contains`. Django's ORM использует этот синтаксис для разделения имен полей ("title") и операций или фильтров ("contains"). Если ты используешь только один символ нижнего подчеркивания, то получишь ошибку "FieldError: Cannot resolve keyword title_contains".

Ты также можешь получить список всех опубликованных записей. Мы просто отфильтруем записи по полю `published_date`:

    >>> from django.utils import timezone
    >>> Post.objects.filter(published_date__lte=timezone.now())
    []

К сожалению, пост, который мы добавили в консоли Python еще не опубликован. Мы можем изменить это! Сначала выберем запись, которую мы хотим опубликовать:

    >>> post = Post.objects.get(title="Sample title")
    

Дальше мы опубликуем её с помощью метода `publish`!

    >>> post.publish()
    

Теперь попробуй получить список опубликованных сообщений снова (нажмите стрелку вверх 3 раза и затем `enter`):

    >>> Post.objects.filter(published_date__lte=timezone.now())
    [<Post: Sample title>]
    

### Сортировка объектов

QuerySets позволяет сортировать объекты. Давай попробуем сортировку по полю `created_date`:

    >>> Post.objects.order_by('created_date')
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
    

Мы также можем изменить порядок на противоположный, добавив `-` в начало условия:

    >>> Post.objects.order_by('-created_date')
    [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
    

### Соединение QuerySets

QuerySets можно **сцеплять**, создавая цепочки:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

Это — мощный и удобный инструмент, позволяющий писать сложные запросы.

Отлично! Теперь ты готова к следующей части! Чтобы закрыть интерактивную консоль, набери:

    >>> exit()
    $
