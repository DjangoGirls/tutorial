# Розширте свою програму

Ми вже завершили усі кроки необхідні для створення нашого сайту: знаємо як написати модель, url, відображення та шаблон. А також знаємо про те, як зробити наш сайт гарнішим.

Час попрактикуватись!

Перша потрібна для нашого блогу річ це, очевидно, сторінка для відображення одного посту, чи не так?

We already have a `Post` model, so we don't need to add anything to `models.py`.

## Створюємо в шаблоні посилання на сторінку посту

We will start with adding a link inside `blog/templates/blog/post_list.html` file. So far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Ми хочемо, щоб в списку постів заголовок посилався на сторінку детальної інформації про пост. Давайте змінімо `< h1 >< href = "" > </a ><{{ post.title }} / h1 >` так, щоб вийшло посилання на пост:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

Саме час пояснити цей дивний запис `{% url 'post_detail' pk=post.pk %}`. Як можна було очікувати, `{% %}` означає, що ми використовуємо шаблонні теги Django. Цього разу ми використаєм один з них, який створить URL для нас!

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![NoReverseMatch error](images/no_reverse_match2.png)

## Створюєм адресу URL для деталей запису

Let's create a URL in `urls.py` for our `post_detail` *view*!

Ми хочемо, щоб наш перший пост був доступний за такою **URL-адресою**: http://127.0.0.1:8000/post/1/

У файлі `blog/urls.py`, давайте вкажемо Django, де взяти відображення для блогозапису, яке називається `post_detail`. Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. Це має виглядати якось так:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. Це означає, що Django візьме усе, що ви тут розмістите і передасть це до відображення як змінну із ім'ям `pk`. (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` означає, що тут має бути один або більше символів. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you are looking for a *view* called `post_detail` and transfer the information that `pk` equals `5` to that *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Пам'ятаєте яким є наступний крок? Звісно: треба додати відображення!

## Додамо деталі відображення запису

This time our *view* is given an extra parameter, `pk`. Наше відображення має вилучити його, правда ж? Отже, визначимо нашу функцію як `def post_detail(request, pk):`. Зауважте, що треба використовувати точно таке ж ім'я як ми визначили в urls (`pk`). Неправильно нехтувати цією змінною, це призведе до помилки!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

Ми цього не хочемо! Але, звичайно, Django надає деякі інструменти, що будуть обробляти це для нас: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

Хороші новини полягають в тому, що можна створити свою власну сторінку `Page not found` і зробити її настільки гарною, наскільки ви захочете. Однак, це не є надто важливим на даний момент, отже, пропустимо цей крок.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Так. Прийшла пора оновити сторінку: http://127.0.0.1:8000 /

![Post list view](images/post_list2.png)

Спрацювало! Але що ж трапиться коли ви клікните на посилання в заголовку поста?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

О ні! Інша помилка! Але ж ми вже знаємо як із цим поводитись, чи не так? Потрібно додати шаблон!

## Create a template for the post details

We will create a file in `blog/templates/blog` called `post_detail.html`.

Це буде виглядати так:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Знову розширюємо `base.html`. Всередині блоку `content` ми хотіли б відобразити такі параметри як: published_date (якщо існує), title і text. Але, мусимо обговорити певні важливі речі, правда ж?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Йой! Працює!

## Ще одне: розгортання!

Було б добре переконатись, що ваш сайт буде працювати на PythonAnywhere, вірно? Спробуймо зробити розгортання ще раз.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Тоді, в [bash консолі PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

Finally, hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

І це все! Вітання :)