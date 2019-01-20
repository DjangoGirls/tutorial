{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Расширяем свое приложение

Мы уже выполнили часть необходимых шагов для создания веб-сайта: мы знаем как создать модель, Url, представление и шаблон. Мы также знаем как улучшить визуальный дизайн с помощью Css.

Время практики!

Первое, что нам потребуется в блоге - страница для отображения конкретной записи, верно?

У нас уже есть модель `Post`, так что нам не нужно добавлять дополнительный код в файл `models.py`.

## Создадим в шаблоне ссылку на страницу поста

Мы начнем с добавления ссылки внутри файла `blog/templates/blog/post_list.html`. Откройте его в редакторе кода, и сейчас он должен выглядеть следующим образом: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        &lt;div class="post"&gt;
            &lt;div class="date"&gt;
                {{ post.published_date }}
            &lt;/div&gt;
            &lt;h2&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h2&gt;
            &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
        &lt;/div&gt;
    {% endfor %}
{% endblock %}
```

{% raw %}Нам хотелось бы иметь ссылку с заголовка поста в списке на страницу подробной информации о посте. Давай изменим `<h1><a href="">{{ post.title }}</a></h1>` чтобы получилась ссылка на страницу с полным содержанием поста:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Самое время разобраться с загадочным `{% url 'post_detail' pk=post.pk %}`. Как можешь предположить, синтаксис `{% %}` означает использование тегов шаблонов Django. На этот раз мы используем тот, что создаст для нас URL!{% endraw %}

Часть `post_detail` означает, что Django будет ожидать URL в `blog/urls.py` с именем =post_detail

А что же `pk=post.pk`? `pk` это сокращение от primary key ("первичный ключ"), что является уникальным именем для каждой записи в базе данных. Так как мы не определили специальный primary key в нашей модели `Post`, Django создаст один для нас (по умолчанию это будет число, которое увеличивается на единицу для каждой записи, например 1, 2, 3) и добавит его в поле с именем `pk` для каждой из наших записей. Мы получаем доступ к первичному ключу напечатав `post.pk`, таким же образом мы получаем доступ и к другим полям (`title`, `author`, и т.д.) в нашем объекте `Post`!

Теперь, когда мы перейдем по адресу http://127.0.0.1:8000/ мы получим ошибку (как и ожидается, поскольку у нас нет прописанного URL и *view* для `post_detail`). Она будет выглядеть следующим образом:

![NoReverseMatch error](images/no_reverse_match2.png)

## Создадим URL для страницы поста

Давай создадим URL в `urls.py` для *представления* `post_detail`!

Мы хотим, чтобы адрес страницы нашего первого поста был таким: **URL**: http://127.0.0.1:8000/post/1/

Давай создадим URL в файле `blog/urls.py` и укажем Django на *представление* под названием `post_detail`, которое будет отображать пост целиком. Открой файл `blog/urls.py` в редакторе кода и добавь строку `path('post/<int:pk>/', views.post_detail, name='post_detail'),` так, что файл должен выглядить следующим образом:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

This part `post/<int:pk>/` specifies a URL pattern – we will explain it for you:

- `post/` means that the URL should begin with the word **post** followed by a **/**. So far so good.
- `<int:pk>` – this part is trickier. It means that Django expects an integer value and will transfer it to a view as a variable called `pk`.
- `/` – then we need a **/** again before finishing the URL.

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you are looking for a *view* called `post_detail` and transfer the information that `pk` equals `5` to that *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Do you remember what the next step is? It's adding a view!

## Добавим представление для страницы поста

This time our *view* is given an extra parameter, `pk`. Our *view* needs to catch it, right? So we will define our function as `def post_detail(request, pk):`. Note that we need to use exactly the same name as the one we specified in urls (`pk`). Omitting this variable is incorrect and will result in an error!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

We don't want that! But luckily Django comes with something that will handle that for us: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

The good news is that you can actually create your own `Page not found` page and make it as pretty as you want. But it's not super important right now, so we will skip it.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` in the code editor and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

И в конце файла мы добавим наше *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Да. Пришло время обновить страницу: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

Заработало! Только что произойдет, если ты попробуешь перейти по ссылке из заголовка записи?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Ой, нет! Другая ошибка! Но мы уже знаем как с ней справиться, верно? Нам нужно добавить шаблон!

## Создадим шаблон для страницы поста

Мы создадим файл `post_detail.html` в директории `blog/templates/blog`, и откроем его в редакторе кода.

Должно получиться примерно так:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    &lt;div class="post"&gt;
        {% if post.published_date %}
            &lt;div class="date"&gt;
                {{ post.published_date }}
            &lt;/div&gt;
        {% endif %}
        &lt;h2&gt;{{ post.title }}&lt;/h2&gt;
        &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
    &lt;/div&gt;
{% endblock %}
```

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

Отлично, можешь перезагрузить страницу и проверить пропала ли теперь ошибка `TemplateDoesNotExist`.

![Post detail page](images/post_detail2.png)

Ура! Все работает!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Затем набери в [Bash консоли PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Обновление статических файлов на сервере

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://yourname.pythonanywhere.com page to see the result.

And that should be it! Congrats :)