# Динамически изменяющиеся данные в шаблонах

Отдельные части уже размещены в нужных местах: модель `Post`, определена в файле `models.py`, `post_list` - в файле `views.py` и добавлен шаблон. Но как нам отобразить записи в шаблоне HTML-страницы? Ведь именно этого нам и нужно добиться: взять определенный контент (модели, сохраненные в базе данных) и аккуратно отобразить их в шаблоне, верно?

Для этого и предназначены *представления*: соединять между собой модели и шаблоны. В `post_list` *представлениям* нужно будет взять модели, которые мы хотим отобразить и передать их шаблону. Таким образом, в *представлениях* мы определяем что (какая модель) будет отображена в шаблоне.

Хорошо, так как мы этого добьемся?

Нам нужно открыть файл `blog/views.py`. Таким образом *представление* `post_list` будет выглядеть следующим образом:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```
    

Помнишь мы говорили о включении кода из других файлов? Теперь нам нужно включить модель, которую мы определили в файле `models.py`. Мы добавим строку `from .models import Post` следующим образом:

```python
from django.shortcuts import render
from .models import Post
```
    

Точка перед `models` означает *текущую директорию* или *текущее приложение*. Поскольку `views.py` и `models.py` находятся в одной директории, мы можем использовать точку `.` и имя файла (без расширения `.py`). Затем мы импортируем модель (`Post`).

Но что дальше? Чтобы получить реальную запись из модели `Post`, нам нужен `QuerySet`.

## QuerySet

Ты уже должна быть знакома с принципом работы QuerySets. Мы говорили о нем в главе [Django ORM (QuerySets)][1].

 [1]: ../django_orm/README.md

Сейчас нас интересует список записей блога, отсортированных по `published_date`, согласна? Мы уже делали это в главе о QuerySets!

```python
    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```    

Теперь нам нужно включить эту строку кода в файл`blog/views.py`, добавив её в функцию `def post_list(request)`:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```
    

Пожалуйста, обрати внимание, что мы создали *переменную* для QuerySet: `posts`. Можешь думать о ней как об имени для нашего QuerySet. Теперь мы можем обращаться к нему, используя имя.

Кроме того, код использует функцию `timezone.now()`, так что нужно также импортировать `timezone`.

Нам осталось передать QuerySet `posts` в шаблон (мы расскажем о том, как отобразить его на странице в следующей главе).

В функции `render` мы уже имеем параметр `request` (т.е. все что мы получим от пользователя в качестве запроса через Интернет) и файл шаблона `'blog/post_list.html'`. Последний параметр, который выглядит как `{}`, это место, куда мы можем добавить что-нибудь для использования в шаблоне. Мы должны задавать имена, передаваемым шаблону вещам (мы будем придерживаться `'posts'` прямо сейчас :)). В итоге параметр будет выглядеть следующим образом: `{'posts': posts}`. Обрати внимание, что часть перед `:` является строкой; её нужно обернуть в кавычки `''`.

В результате файл `blog/views.py` должен выглядеть следующим образом:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```
    

Вот и все! Теперь пришло время перейти к шаблону и отобразить QuerySet на странице!

Подробнее о QuerySets в Django можно узнать в официальной документации: https://docs.djangoproject.com/en/1.8/ref/models/querysets/
