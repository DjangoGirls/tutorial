{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Продължете апликацията си

Вече завършихме всички различни стъпки необходими за създаването на нашия уеб сайт: знаем как да напишем модел, URL, изглед и шаблон. Знаем също и как да направим сайта ни хубав.

Време е за практика!

Първото нешо, което ни е необходимо за блога е очевидно страница, която да показва една публикация, нали така?

Вече разполагаме с `Post` модел, така че няма нужда да правим промени в `models.py`.

## Създайте връзка към шаблона със съдържанието на поста.

Ще започнем като добавим връзка във файла `blog/templates/blog/post_list.html`. Отворете го в редактора си, като до момента трябва да изглежда по този начин: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %} Искаме да имаме връзка от заглавието на поста в листа с публикациите до страницата със съдържанието на поста. Нека променим `<h2><a href="">{{ post.title }}</a></h2>`, така че да се свързва със съдържанието на страницата:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %} Време е да обясним мистериозния код `{% url 'post_detail' pk=post.pk %}`. Може би забелязахте, че означението `{% %}` означава, че използваме Django шаблонни етикети. Този път ще изполваме такъв, който създава URL за нас! {% endraw %}

`post_detail` частта означава, че Django трябва да очаква URL в `blog/urls.py` с име name=post_detail

А какво за `pk=post.pk`? `pk` е на кратко от primary key, което е уникален идентификатор за всеки един запис в базата данни. Всеки Django модел има поле, което служи за негов първоначален код (primary key), и каквото и друго име да има, то може също да се съотнесе като "pk". Тъй като не уточнихме първоначалната стойност в нашия `Post` модел, Django създава един за нас (по подразбиране, полето "id" , съдържащо номер, който се увеличава при всеки запис, т.е. 1, 2, 3) и го добавя към полето на всеки от нашите постове. Можем да достигнем primary key като напишем `post.pk`,, по същия начин достъпваме други полета (`title`, `author`, и т.н.)в нашия `Post` обект!

Сега като отидем на http://127.0.0.1:8000/ ще видим грешка ( както се очаквкаше, тъй като все още нямаме URL или *view* за `post_detail`). Ще изглежда така:

![NoReverseMatch error](images/no_reverse_match2.png)

## Създаване на URL към съдържанието на поста

Нека създадем URL в `urls.py` за нашия `post_detail` *view*!

Искаме първия ни пост да бъде показван на този **URL**: http://127.0.0.1:8000/post/1/ 

Сега да направим URL във файла `blog/urls.py`, който да насочва Django към *view* наречен `post_detail`, който ще показва целия блог пост. Отворете файла `blog/urls.py` в редактора си и добавете следния ред `path('post/<int:pk>/', views.post_detail, name='post_detail'),`, така че файлът да изглежда по този начин:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %} 

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Тази част `post/<int:pk>/` уточнява URL образеца -- ще ви го обясним:

- `post/` означава, че URL трябва да започва с думата **post** последвана от **/**. Дотук добре.
- `<int:pk>` -- тази част е по-сложна. Означава, че Django очаква стойност цяло число и ще го преведе към изгледа (view) като променлива наречена `pk`.
- `/` – then we need a **/** again before finishing the URL.

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you are looking for a *view* called `post_detail` and transfer the information that `pk` equals `5` to that *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Do you remember what the next step is? It's adding a view!

## Add a post's detail view

This time our *view* is given an extra parameter, `pk`. Our *view* needs to catch it, right? So we will define our function as `def post_detail(request, pk):`. Note that this parameter must have the exact same name as the one we specified in `urls` (`pk`). Also note that omitting this variable is incorrect and will result in an error!

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

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Yes. It is time to refresh the page: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

It worked! But what happens when you click a link in blog post title?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh no! Another error! But we already know how to deal with it, right? We need to add a template!

## Create a template for the post details

We will create a file in `blog/templates/blog` called `post_detail.html`, and open it in the code editor.

Enter the following code:

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
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ...` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Yay! It works!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://subdomain.pythonanywhere.com page to see the result.

And that should be it! Congrats :)