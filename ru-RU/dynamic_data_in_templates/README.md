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

Ты уже должна быть знакома с принципом работы QuerySets. Мы говорили о нем в главе [Django ORM (QuerySets)](../django_orm/README.md).

Сейчас вы хотим список записей блога, отсортированный по `published_date`, верно? Мы уже делали это в главе QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Итак, давай откроем файл `blog/views.py` в редакторе кода, и добавим этот фрагмент кода в функцию `def post_list(request)` - но не забудь в начало файла добавить `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Пожалуйста, обрати внимание, что мы создали *переменную* для QuerySet: `posts`. Можешь думать о неё как об имени для нашего QuerySet. Теперь мы можем обращаться к нему, используя имя.

В функции `render` мы уже имеем параметр `request` (т.е. все что мы получим от пользователя в качестве запроса через Интернет) и файл шаблона `'blog/post_list.html'`). Последний параметр, который выглядит как `{}`, это место, куда мы можем добавить что-нибудь для использования в шаблоне. Мы должны задавать имена, передаваемым шаблону вещам (мы будем придерживаться `'posts'` прямо сейчас). :) В итоге параметр будет выглядеть следующим образом: `{'posts': posts}`. Обрати внимание, что часть перед `:` является строкой; её нужно обернуть в кавычки: `"`.

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

Хочешь подробнее узнать о QuerySets в Django? Тогда тебе пригодится официальная документация: https://docs.djangoproject.com/en/2.2/ref/models/querysets/