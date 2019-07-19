{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Mú ètò rẹ gbòòrò síi

A ti parí gbogbo àwọn ìgbésẹ̀ ọ̀tọ̀ọ̀tọ̀ tó ṣe pàtàkì fún ṣíṣẹ̀dá ààyè ayélujára wa: a mọ bí a ṣe lè kọ àwòṣe (model), url, view àti àwòṣe (template) kan. A tún mọ bí a ṣe lè mú ààyè ayélujára wa rẹwà.

Àkókò láti ṣe ìdánrawò!

Dájúdájú, nnkan àkọ́kọ́ tí a nílò nínú blog wa ni ojú-ìwé kan láti ṣàfihàn àròkọ kan, àbí bẹ́ẹ̀ kọ?

A ti ní àwòṣe `Post` kan tẹ́lẹ̀, nítorí náà a kò nílò láti ṣàfikún ohunkóhun sí `models.py`.

## Ṣẹ̀dá atọ́ka àwòṣe kan sí àlàyé ti àròkọ kan

A ó bẹ̀rẹ̀ pẹ̀lú ṣíṣe àfikún atọ́ka kan sínú fáìlì `blog/templates/blog/post_list.html`. Ṣí i nínú olóòtú kóòdù náà, ó sì yẹ kí o rí báyìí látẹ̀yìnwá: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %}We want to have a link from a post's title in the post list to the post's detail page. Let's change `<h2><a href="">{{ post.title }}</a></h2>` so that it links to the post's detail page:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %}Time to explain the mysterious `{% url 'post_detail' pk=post.pk %}`. As you might suspect, the `{% %}` notation means that we are using Django template tags. This time we will use one that will create a URL for us!{% endraw %}

Apá `post_detail` náà túmọ̀ sí pé Django yíò máa retí URL kan nínú `blog/urls.py` pẹ̀lú name=post_detail

Àti pé `pk=post.pk` ńkọ́? `pk` jẹ́ ìgékúrú fún primary key, èyí tó jẹ́ àkànṣe orúkọ fún àkọsílẹ̀ kọ̀ọ̀kan nínú àkójọpọ̀ dátà kan. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![Àṣìṣe NoReverseMatch](images/no_reverse_match2.png)

## Ṣẹ̀dá URL kan sí àlàyé ti àròkọ kan

Jẹ́ ká ṣẹ̀dá URL kan sínú `urls.py` fún *view* `post_detail` wa!

A tún fẹ́ kí àlàyé ti àròkọ àkọ́kọ́ wa fojú hàn ní **URL** yìí: http://127.0.0.1:8000/post/1/

Jẹ́ ká ṣẹ̀dá URL kan sínú fáìlì `blog/urls.py` láti darí Django sí *view* kan tó n jẹ́ `post_detail`, tí yíò ṣàfihàn gbogbo àròkọ blog kan. Ṣí fáìlì `blog/urls.py` náà nínú olóòtú kóòdù náà, kí o sì ṣàfikún ìlà `path('post/<int:pk>/', views.post_detail, name='post_detail'),` kí fáìlì náà bàa lè rí báyìí:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Apá `post/<int:pk>/` yìí tọ́ka àpẹẹrẹ URL kan – a ó ṣàlàyé rẹ̀ fún ọ:

- `post/` túmọ̀ sí pé ó yẹ kí URL naa bẹ̀rẹ̀ pẹ̀lú ọ̀rọ̀ **post** náà tí **/** yíò sì tẹ̀lé e. Ìyẹn ṣì dára.
- `<int:pk>` – apá yìí fẹ́ ṣòro díẹ̀. Ó túmọ̀ sí pé Django n retí iye nọ́mbà odidi kan àti pé yíò fi ránṣẹ́ sí view kan gẹ́gẹ́ bí variable kan tí a n pè ní `pk`.
- `/` – lẹ́yìn náà a nílò **/** kan lẹ́ẹ̀kan si ṣáájú píparí URL náà.

Ìyẹn túmọ̀ sí pé tí o bá tẹ `http://127.0.0.1:8000/post/5/` sínú aṣàwákiri rẹ, Django yíò mọ̀ pé o ń wá *view* kan tí a pè ní `post_detail` àti pé yíò fi ìròyìn náà ránṣẹ́ pé `pk` dọ́gba pẹ̀lú `5` sí *view* yẹn.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Do you remember what the next step is? It's adding a view!

## Add a post's detail view

This time our *view* is given an extra parameter, `pk`. Our *view* needs to catch it, right? So we will define our function as `def post_detail(request, pk):`. Note that we need to use exactly the same name as the one we specified in urls (`pk`). Omitting this variable is incorrect and will result in an error!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![Àṣìṣe DoesNotExist](images/does_not_exist2.png)

We don't want that! But luckily Django comes with something that will handle that for us: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Ojú-ìwé kò sí](images/404_2.png)

The good news is that you can actually create your own `Page not found` page and make it as pretty as you want. But it's not super important right now, so we will skip it.

Ó dáa, àkókò láti ṣàfikún *view* kan sí fáìlì `views.py` wa!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

Ó yẹ kí a ṣí `blog/views.py` nínú olóòtú kóòdù náà àti ṣàfikún kóòdù tó tẹ̀le yìí nítòsí àwọn ìlà `from` yòókù náà:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

Àti pé ní ìparí fáìlì náà, a ó ṣàfikún *view* wa:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Bẹ́ẹ̀ ni. Àkókò ti tó láti ṣe ìmúdójúìwọ̀n ojú-ìwé náà: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

Ó ṣiṣẹ́! Ṣùgbọ́n kí ló máa ṣẹlẹ̀ nígbà tí o bá tẹ atọ́ka kan nínú àkọlé àròkọ blog?

![Àṣìṣe TemplateDoesNotExist](images/template_does_not_exist2.png)

Ó tì o! Àṣìṣe mìíràn! Ṣùgbọ́n a ti mọ bí a ṣe máa kojú rẹ̀, àbí bẹ́ẹ̀ kọ? A nílò láti ṣàfikún àwòṣe kan!

## Ṣẹ̀dá àwòṣe kan fún àwọn àlàyé àròkọ náà

A ó ṣẹ̀dá fáìlì kan nínú `blog/templates/blog` tí a n pè ní `post_detail.html`, tí a ó sì ṣí i nínú olóòtú kóòdù náà.

Yóò rí báyìí:

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

{% raw %}`{% if ... %} ... {% endif %}` jẹ́ àmì àwòṣe kan tí a lè lò nígbà tí a bá fẹ́ ṣàyẹ̀wò nnkan kan. (Rántí `if ... else ...` láti àkòrí **Ìfihàn sí Python**?) Nínú ìṣẹ̀lẹ̀ yìí, a fẹ́ ṣàyẹ̀wò bóyá `published_date` ti àròkọ kan kìí ṣe òfìfo.{% endraw %}

Ó dáa, a lè ṣe ìmúdójúìwọ̀n ojú-ìwé wa láti wo bóyá `TemplateDoesNotExist` kò sí mọ́ báyìí.

![Post detail page](images/post_detail2.png)

Yay! Ó n ṣiṣẹ́!

# Àkókò láti ṣàgbékalẹ̀!

Yóò dára láti ṣàyẹ̀wò bóyá ààyè ayélujára rẹ ṣì máa ṣiṣẹ́ lórí PythonAnywhere, àbí bẹ́ẹ̀ kọ? Jẹ́ ká gbìyànjú ṣíṣe àgbékalẹ̀ lẹ́ẹ̀kan si.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Lẹ́yìn náà, nínú [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/) kan:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Rántí láti rọ́pò `<your-pythonanywhere-domain>` pẹ̀lú subdomain PythonAnywhere rẹ, láìsí àwọn àkámọ́ onígun náà.)

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://subdomain.pythonanywhere.com page to see the result.

A ó parí gbogbo rẹ̀ síbí! Kú oríire :)