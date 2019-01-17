# Динамически изменяющиеся данные в шаблонах

Отдельные части уже размещены в нужных местах: модель `Post`, определенна в файле `models.py`, `post_list` - в файле `views.py` и добавлен шаблон. Но как нам отобразить записи в шаблоне HTML-страницы? Ведь именно это нам мы и хотим добиться: взять определенный контент (модели, сохраненные в базе данных) и аккуратно отобразить их в шаблоне, верно?

Для этого и предназначены *представления*: соединять между собой модели и шаблоны. В `post_list` *view* нужно будет взять модели, которые мы хотим отобразить и затем передать их шаблону. Таким образом, в *представлениях (view)* мы определяем что (какая модель) будет отображена в шаблоне.

Хорошо, так как мы этого добьемся?

Нам нужно открыть файл `blog/views.py` в редакторе кода. Так что *представление* `post_list` будет выглядеть следующим образом:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Помнишь мы говорили о включении кода из других файлов? Теперь нам нужно включить модель, которую мы определили в файле `models.py`. Мы добавим строку `from .models import Post` следующим образом:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Точка перед `models` означает *текущую директорию* или *текущее приложение*. Оба файла `Views.py` и `models.py` находятся в одном и том же каталоге. Это значит, что мы можем использовать точку `.` и имя файла (без `.py`). Затем мы импортируем модель (`Post`).

Но что дальше? Чтобы получить реальную запись из модели `Post`, нам нужен так называемый `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

So, let's open the `blog/views.py` file in the code editor, and add this piece of code to the function `def post_list(request)` -- but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

Пожалуйста, обрати внимание, что мы создали *переменную* для QuerySet: `posts`. Можешь думать о неё как об имени для нашего QuerySet. Теперь мы можем обращаться к нему, используя имя.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. Мы должны задавать имена, передаваемым шаблону вещам (мы будем придерживаться `'posts'` прямо сейчас). :) В итоге параметр будет выглядеть следующим образом: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

В результате файл `blog/views.py` должен выглядеть следующим образом:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Вот и все! Теперь пришло время перейти к шаблону и отобразить QuerySet на странице!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/