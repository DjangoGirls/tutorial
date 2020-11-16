{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Mú ètò rẹ gbòòrò síi

We've already completed all the different steps necessary for the creation of our website: we know how to write a model, URL, view and template. We also know how to make our website pretty.

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

{% raw %}A fẹ́ ní atọ́ka kan láti àkọlé ti àròkọ kan nínú àkójọ àròkọ náà sí ojú-ìwé àlàyé ti àròkọ náà. Jẹ́ ká ṣàyípadà `<h2><a href="">{{ post.title }}</a></h2>`kí ó bàa lè tọ́ka sí ojú-ìwé àlàyé ti àròkọ náà:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %} Àkókò láti ṣàlàyé `{% url 'post_detail' pk=post.pk %}` tó ṣàjèjì náà. Gẹ́gẹ́ bí o ti lè lérò, àkọsílẹ̀ `{% %}` náà túmọ̀ sí pé a n lo àwọn àmì àwòṣe Django. Ní àkókò yìí, a ó lo ọ̀kan tí yíò ṣẹ̀dá URL kan fún wa!{% endraw %}

Apá `post_detail` náà túmọ̀ sí pé Django yíò máa retí URL kan nínú `blog/urls.py` pẹ̀lú name=post_detail

Àti pé `pk=post.pk` ńkọ́? `pk` is short for primary key, which is a unique identifier for each record in a database. Every Django model has a field which serves as its primary key, and whatever other name it has, it can also be referred to as "pk". Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a field named "id" holding a number that increases for each record, i.e. 1, 2, 3) and adds it as a field to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Ní báyìí, nígbà tí a bá lọ sí http://127.0.0.1:8000/ a ó ní àṣìṣe kan (gẹ́gẹ́ bí a ṣe retí, nítorí pé a kò tíì ní URL kan tàbí *view* kan fún `post_detail`). Yóò rí báyìí:

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

Ó dáa, a ti ṣàfikún àpẹẹrẹ URL tuntun kan sí `blog/urls.py`! Jẹ́ ká ṣe ìmúdójúìwọ̀n ojú-ìwé náà: http://127.0.0.1:8000/ Boom! Server náà ti dáwọ́ iṣẹ́ dúró lẹ́ẹ̀kan si. Ṣàyẹ̀wò console náà – gẹ́gẹ́ bí a ṣe retí, àṣìṣe mìíràn tún wà!

![AttributeError](images/attribute_error2.png)

Ǹjẹ́ o rántí ohun tí ìgbésẹ̀ tó kàn jẹ́? Òhun ni ṣíṣe àfikún view kan!

## Ṣàfikún view àlàyé ti àròkọ kan

Ní àkókò yìí, a fún *view* wa ní àfikún parameter kan, `pk`. *view* wa nílò láti mú u, àbí bẹ́ẹ̀ kọ? Nítorí náà, a ó ṣàlàyé iṣẹ́ wa gẹ́gẹ́ bí `def post_detail(request, pk):`. Note that this parameter must have the exact same name as the one we specified in `urls` (`pk`). Also note that omitting this variable is incorrect and will result in an error!

Ní báyìí, a fẹ́ gba àròkọ blog ẹyọkan ṣoṣo. Láti ṣe èyí, a lè lo querysets, báyìí:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Ṣùgbọ́n kóòdù yìí ní ìṣòro kan. Tí kò bá sí `Post` tí a fún ní `primary key` (`pk`) náà, a ó ní àṣìṣe tí kò dáa rárá kan!

![Àṣìṣe DoesNotExist](images/does_not_exist2.png)

A kò fẹ́ ìyẹn! Ṣùgbọ́n a dúpẹ́ pé Django wá pẹ̀lú nnkan kan tí yíò yanjú ìyẹn fún wa: `get_object_or_404`. Tó bá jẹ́ pé kò sí `Post` tí a fún ní `pk` náà, yóò ṣàfihàn ojú-ìwé tó dára, ojú-ìwé `Page Not Found 404` náà.

![Ojú-ìwé kò sí](images/404_2.png)

Ìròyìn rere náà ni pé o lè ṣẹ̀dá ojú-ìwé `Page not found` tìẹ kí o sì mú u rẹwà gẹ́gẹ́ bí o ṣe fẹ́. Ṣùgbọ́n kò ṣe pàtàkì ní báyìí, nítorí náà a ó fojú fò ó.

Ó dáa, àkókò láti ṣàfikún *view* kan sí fáìlì `views.py` wa!

Nínú `blog/urls.py`, a ti ṣẹ̀dá òfin URL kan tó n jẹ́ `post_detail` tó ń tọ́ka sí view kan tí a n pè ní `views.post_detail`. Èyí túmọ̀ sí pé Django yíò máa retí iṣẹ́ view kan tí a n pè ní `post_detail` nínú `blog/views.py`.

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

![View àkójọ àròkọ](images/post_list2.png)

Ó ṣiṣẹ́! Ṣùgbọ́n kí ló máa ṣẹlẹ̀ nígbà tí o bá tẹ atọ́ka kan nínú àkọlé àròkọ blog?

![Àṣìṣe TemplateDoesNotExist](images/template_does_not_exist2.png)

Ó tì o! Àṣìṣe mìíràn! Ṣùgbọ́n a ti mọ bí a ṣe máa kojú rẹ̀, àbí bẹ́ẹ̀ kọ? A nílò láti ṣàfikún àwòṣe kan!

## Ṣẹ̀dá àwòṣe kan fún àwọn àlàyé àròkọ náà

A ó ṣẹ̀dá fáìlì kan nínú `blog/templates/blog` tí a n pè ní `post_detail.html`, tí a ó sì ṣí i nínú olóòtú kóòdù náà.

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

Lẹ́ẹ̀kan síi, a n mú `base.html` gbòòrò síi. Nínú búlọ́ọ̀kù `content` náà, a fẹ́ ṣàfihàn published_date (tó bá wà), àkọlé àti ọ̀rọ̀ ti àròkọ kan. Ṣùgbọ́n ó yẹ kí a ṣàlàyé àwọn nnkan pàtàkì kan, àbí bẹ́ẹ̀ kọ?

{% raw %}`{% if ... %} ... {% endif %}` jẹ́ àmì àwòṣe kan tí a lè lò nígbà tí a bá fẹ́ ṣàyẹ̀wò nnkan kan. (Rántí `if ... else ...` láti àkòrí **Ìfihàn sí Python**?) Nínú ìṣẹ̀lẹ̀ yìí, a fẹ́ ṣàyẹ̀wò bóyá `published_date` ti àròkọ kan kìí ṣe òfìfo.{% endraw %}

Ó dáa, a lè ṣe ìmúdójúìwọ̀n ojú-ìwé wa láti wo bóyá `TemplateDoesNotExist` kò sí mọ́ báyìí.

![Ojú-ìwé àlàyé àròkọ](images/post_detail2.png)

Yay! Ó n ṣiṣẹ́!

# Àkókò láti ṣàgbékalẹ̀!

Yóò dára láti ṣàyẹ̀wò bóyá ààyè ayélujára rẹ ṣì máa ṣiṣẹ́ lórí PythonAnywhere, àbí bẹ́ẹ̀ kọ? Jẹ́ ká gbìyànjú ṣíṣe àgbékalẹ̀ lẹ́ẹ̀kan si.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Lẹ́yìn náà, nínú [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/) kan:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Rántí láti rọ́pò `<your-pythonanywhere-domain>` pẹ̀lú subdomain PythonAnywhere rẹ, láìsí àwọn àkámọ́ onígun náà.)

## Ṣíṣe ìmúdójúìwọ̀n àwọn fáìlì tó wà lójú kan lórí server náà

Àwọn server bíi PythonAnywhere fẹ́ràn láti ṣiṣẹ́ lórí "àwọn fáìlì tó wà lójú kan" (bíi àwọn fáìlì CSS) lọ́nà tó yàtọ̀ sí àwọn fáìlì Python, nítorí pé wọ́n lè mú wọn ṣiṣẹ́ lọ́nà tó já fáfá láti jẹ́ gbígbé ní kíákíá. Nítorí èyí, nígbàkigbà tí a bá ṣe àwọn ìyípadà sí àwọn fáìlì CSS wa, a nílò láti lo àfikún àṣẹ kan lórí server náà láti sọ fún-un pé kí ó ṣe ìmúdójúìwọ̀n wọn. Àṣẹ náà ni a n pè ní `collectstatic`.

Bẹ̀rẹ̀ pẹ̀lú mímú virtualenv rẹ ṣiṣẹ́ tí kò bá tíì ma ṣiṣẹ́ tẹ́lẹ̀ (PythonAnywhere máa n lo àṣẹ kan tí a n pè ní `workon` láti ṣe èyí, ó dà bí àṣẹ `source myenv/bin/activate` tí o máa n lò lórí kọ̀mpútà tìẹ):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

Àṣẹ `manage.py collectstatic` náà fẹ́ dà bíi `manage.py migrate`. A ṣe àwọn ìyípadà kan sí kóòdù wa, lẹ́yìn náà a sọ fún Django láti *lo* àwọn ìyípadà yẹn, bóyá sí àkójọpọ̀ àwọn fáìlì tó wà lójú kan ti server náà, tàbí sí àkójọpọ̀ dátà náà.

Bó ti wù kó rí, a ti ṣetán báyìí láti lọ sí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) náà (láti bọ́tìnnì àkójọ àṣàyàn tó wà ní òkè lápá ọ̀tún console náà) kí o sì tẹ **Reload**, lẹ́yìn náà wo ojú-ìwé https://subdomain.pythonanywhere.com náà láti rí àbájáde náà.

And that should be it. Congrats! :)