# Àwọn fọ́ọ̀mù Django

Ohun tó kẹ́yìn tí a fẹ́ ṣe lórí ààyè ayélujára wa ni láti ṣẹ̀dá ọ̀nà tó dára kan láti ṣàfikún àti ṣàtúnṣe àwọn àròkọ blog. `admin` ti Django dára, ṣùgbọ́n ó ṣòro láti ṣé bí o ṣe fẹ́ àti láti mú rẹwà. Pẹ̀lú `forms`, a máa ní gbogbo agbára lórí atọ́kùn wa – a lè fẹ́rẹ̀ẹ́ ṣe ohunkóhun tí a lè wòye sí!

Ohun tó dára nípa àwọn fọ́ọ̀mù Django ni pé a lè ṣàlàyé ìkan láti ìbẹ̀rẹ̀ tàbí ṣẹ̀dá `ModelForm` kan èyí tí yíò tọ́jú èsì fọ́ọ̀mù náà sínú àwòṣe náà.

Èyí jẹ́ ohun tí a fẹ́ ṣe gan-an: a ó ṣẹ̀dá fọ́ọ̀mù kan fún àwòṣe `Post` wa.

Gẹ́gẹ́ bí gbogbo apá tó ṣe pàtàkì nínú Django, àwọn fọ́ọ̀mù ní fáìlì tiwọn: `forms.py`.

A nílò láti ṣẹ̀dá fáìlì kan pẹ̀lú orúkọ yìí nínú àkójọpọ̀ fáìlì `blog` náà.

    blog
       └── forms.py
    

O dáa, jẹ́ ká ṣí i nínú olóòtú kóòdù náà kí a sì tẹ kóòdù tó tẹ̀le yìí:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

A nílò láti ṣàgbéwọlé àwọn fọ́ọ̀mù Django lákọ̀ọ́kọ́ (`from django import forms`) àti àwòṣe `Post` wa (`from .models import Post`).

`PostForm`, bí o ṣe lérò, jẹ́ orúkọ fọ́ọ̀mù wa. A nílò láti sọ fún Django pé fọ́ọ̀mù yìí jẹ́ `ModelForm` kan (kí Django baà lè ṣe àwọn iṣẹ́ kan fún wa) – `forms.ModelForm` ló máa ṣe ìyẹn.

Lẹ́yìn náà, a ní `class Meta`, níbi tí a ti máa sọ àwòṣe tó yẹ kí Django lò láti ṣẹ̀dá fọ́ọ̀mù yìí (`model = Post`).

Ní ìparí, a lè sọ (àwọn) ààyè tó yẹ kó wà nínú fọ́ọ̀mù wa. Ní irú ìṣẹ̀lẹ̀ yìí, a fẹ́ kí `title` àti `text` nìkan hàn síta – ó yẹ kí `author` jẹ́ ẹni tó ti wọlé lọ́wọ́lọ́wọ́ (ìwọ!) àti pé ó yẹ kí `created_date` wà ní ètò fúnra rẹ̀ nígbà tí a bá ṣẹ̀dá àròkọ kan (ìyẹn ni pé, nínú kóòdù náà), àbí bẹ́ẹ̀ kọ?

Òhun nìyẹn! Gbogbo ohun tí a nílò láti ṣe báyìí ni láti lo fọ́ọ̀mù náà nínú *view* kan kí a sì ṣàfihàn rẹ̀ nínú àwòṣe kan.

Nítorí náà, a ó ṣẹ̀dá atọ́ka sí ojú-ìwé náà kan, URL kan, view kan àti àwòṣe kan lẹ́ẹ̀kan síi.

## Atọ́ka sí ojú-ìwé kan pẹ̀lú fọ́ọ̀mù náà

It's time to open `blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Ṣàkíyèsí pé a fẹ́ pe view tuntun wa ní `post_new`. Kíláàsì `"glyphicon glyphicon-plus"` wà ní ìpèsè nípasẹ̀ theme bootstrap tí a n lò náà, àti pé yíò ṣàfihàn àmì ìròpọ̀ (+) kan fún wa.

Lẹ́yìn ṣíṣe àfikún ìlà náà, ó yẹ kí fáìlì HTML rẹ wá rí báyìí:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Lẹ́yìn títọ́jú àti ṣíṣe ìmúdójúìwọ̀n ojú-ìwé http://127.0.0.1:8000 náà, ìwọ yíò rí àṣìṣe `NoReverseMatch` tí o mọ́ nípa. Ṣé bó ṣe rí nìyẹn? O dáa!

## URL

A ṣí `blog/urls.py` nínú olóòtú kóòdù náà àti ṣàfikún ìlà kan:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

Àti pé kóòdù ìparí náà yíò rí báyìí:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

Lẹ́yìn ṣíṣe ìmúdójúìwọ̀n ààyè náà, a rí `AttributeError` kan, nítorí pé a kò ní view `post_new` náà ní ṣíṣe. Jẹ́ ká ṣàfikún rẹ̀ ní báyìí.

## view post_new

Àkókò láti ṣí fáìlì `blog/views.py` nínú olóòtú kóòdù náà àti ṣàfikún àwọn ìlà tó tẹ̀le yìí pẹ̀lú àwọn ìlà `from` yòókù náà:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Lẹ́yìn náà *view* wa:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Láti ṣẹ̀dá fọ́ọ̀mù `Post` tuntun kan, a nílò láti pe `PostForm()` kí a sì darí rẹ̀ sí àwòṣe (template) náà. A ó padà sí *view* yìí, ṣùgbọ́n ní báyìí, jẹ́ ká tètè ṣẹ̀dá àwòṣe (template) kan fún fọ́ọ̀mù náà.

## Àwòṣe (template)

A nílò láti ṣẹ̀dá fáìlì `post_edit.html` kan nínú àkójọpọ̀ fáìlì `blog/templates/blog` náà, kí a sì ṣí nínú olóòtú kóòdù náà. Láti mú kí fọ́ọ̀mù kan ṣiṣẹ́, a nílò àwọn nnkan bíi mélòó kan:

* A ní láti ṣàfihàn fọ́ọ̀mù náà. A lè ṣe ìyẹn pẹ̀lú (fún àpẹẹrẹ) {% raw %}`{{ form.as_p }}`{% endraw %}.
* Ìlà tó wà lókè yìí nílò láti gba wíwé pẹ̀lú àmì fọ́ọ̀mù HTML kan: `<form method="POST">...</form>`.
* A nílò bọ́tìnnì `Save` kan. A lè ṣe ìyẹn pẹ̀lú bọ́tìnnì HTML kan: `<button type="submit">Save</button>`.
* Ní ìparí, kété lẹ́yìn àmì `<form ...>` ṣíṣí náà, a nílò láti ṣàfikún {% raw %}`{% csrf_token %}`{% endraw %}. Èyí ṣe pàtàkì púpọ̀, nítorí pé yóò pèsè ààbò fún àwọn fọ́ọ̀mù rẹ! Tí o bá gbàgbé nípa apá yìí, Django yíò ṣàròyé nígbà tí o bá gbìyànjú láti tọ́jú fọ́ọ̀mù náà:

![Ojú-ìwé Forbidden CSRF](images/csrf2.png)

O dáa, jẹ́ ká wo bó ṣe yẹ kí HTML inú `post_edit.html` rí:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Àkókò láti ṣe ìmúdójúìwọ̀n! Yay! Fọ́ọ̀mù rẹ ti fojú hàn!

![Fọ́ọ̀mù tuntun](images/new_form2.png)

Ṣùgbọ́n, dúró ná! Nígbà tí o bá tẹ nnkan kan sínú àwọn ààyè `title` àti `text` náà, tí o sì gbìyànjú láti tọ́jú rẹ̀, kí ló máa ṣẹlẹ̀?

Kò sí nnkan kan! A tún wà lórí ojú-ìwé kannáà lẹ́ẹ̀kan síi àti pé ọ̀rọ̀ wa ti lọ… àti pé kò sí àròkọ tuntun tí a ṣàfikún. Nítorí náà, kí ló wá fà á?

Ìdáhùn náà ní pé: kò sí nnkan kan. A nílò láti ṣe iṣẹ́ díẹ̀ síi nínú *view* wa.

## Títọ́jú fọ́ọ̀mù náà

Ṣí `blog/views.py` lẹ́ẹ̀kan síi nínú olóòtú kóòdù náà. Lọ́wọ́lọ́wọ́, gbogbo ohun tí a ní nínú view `post_new` ni èyí tó tẹ̀le yìí:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Nígbà tí a bá fi fọ́ọ̀mù náà ṣọwọ́, a tún padà wá sí view kannáà, ṣùgbọ́n ní àkókò yìí a ní àwọn dátà díẹ̀ síi nínú `request`, pàtàkì jù nínú `request.POST` (orúkọ sísọ náà kò ní nnkan kan láti ṣe pẹ̀lú "àròkọ" blog kan; ó ní í ṣe pẹ̀lú pé a n fi dátà ránṣẹ́). Rántí nínú fáìlì HTML náà, bí àlàyé `<form>` wa ṣe ní variable `method="POST"` náà? Gbogbo àwọn ààyè láti fọ́ọ̀mù náà ti wà nínú `request.POST`. Kò yẹ kí o ṣàtúnṣe orúkọ `POST` sí ohunkóhun mìíràn (ohun kan ṣoṣo mìíràn tó fẹsẹ̀múlẹ̀ fún `method` ni `GET`, ṣùgbọ́n a kò ní àkókò láti sàlàyé ìyàtọ̀ tó wà níbẹ̀).

Nítorí náà, nínú *view* wa, a ní ìṣòro méjì ọ̀tọ̀ọ̀tọ̀ láti yanjú: àkọ́kọ́, nígbà tí a bá wọ ojú-ìwé náà fún ìgbà àkọ́kọ́ tí a sì fẹ́ fọ́ọ̀mù òfìfo kan, àti èkejì, nígbà tí a bá padà sí *view* náà pẹ̀lú gbogbo dátà fọ́ọ̀mù tí a ṣẹ̀ṣẹ̀ tẹ̀. Nítorí náà, a nílò láti ṣàfikún ipò kan (a ó lo `if` fún ìyẹn):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Àkókò ti tó láti rọ́pò àwọn àmì tó-ín náà `[...]`. Tí `method` bá jẹ́ `POST` á jẹ́ pé a fẹ́ ṣàgbékalẹ̀ `PostForm` náà pẹ̀lú dátà láti fọ́ọ̀mù náà, àbí bẹ́ẹ̀ kọ? A ó ṣe ìyẹn báyìí:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Ohun tó kàn ni láti ṣàyẹ̀wò bóyá fọ́ọ̀mù náà wà bó ṣe tọ́ (a ti ṣètò gbogbo àwọn ààyè tí a nílò àti pé a kò fi ohun tí kò tọ́ ṣọwọ́). A máa ṣe ìyẹn pẹ̀lú `form.is_valid()`.

A máa ṣàyẹ̀wò bóyá fọ́ọ̀mù náà fẹsẹ̀múlẹ̀ àti pé tó bá rí bẹ́ẹ̀, a lè tọ́jú rẹ̀!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Ní pàtàkì, a ní àwọn nnkan méjì níbí: a tọ́jú fọ́ọ̀mù náà pẹ̀lú `form.save` àti pé a ṣàfikún olùdásílẹ̀ kan (nígbà tó jẹ́ pé kò sí ààyè `author` nínú `PostForm` náà, tí a sì nílò ààyè yìí). `commit=False` túmọ̀ sí pé a kò tíì fẹ́ tọ́jú àwòṣe `Post` náà – a fẹ́ kọ́kọ́ ṣàfikún olùdásílẹ̀ náà. Lọ́pọ̀ ìgbà, o máa lo `form.save()` láìsí `commit=False`, ṣùgbọ́n ní irú ìṣẹ̀lẹ̀ yìí, a nílò láti pèsè rẹ̀. `post.save()` yíò tọ́jú àwọn ìyípadà (ṣíṣe àfikún olùdásílẹ̀ náà) àti pé a ti ṣẹ̀dá àròkọ blog tuntun kan!

Ní ìparí, yóò dára tí a bá lè lọ tààrà sí ojú-ìwé `post_detail` náà fún àròkọ blog wa tí a ṣẹ̀ṣẹ̀ ṣẹ̀dá, àbí bẹ́ẹ̀ kọ? Láti ṣe ìyẹn, a nílò àgbéwọlé kan si:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Ṣàfikún rẹ̀ ní ìbẹ̀rẹ̀pẹ̀pẹ̀ fáìlì rẹ. Ní báyìí, a lè sọ pé, "lọ sí ojú-ìwé `post_detail` náà fún àròkọ tí a ṣẹ̀ṣẹ̀ ṣẹ̀dá náà":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` jẹ́ orúkọ view tí a fẹ́ lọ náà. Rántí pé *view* yìí nílò variable `pk` kan? Láti darí rẹ̀ sí àwọn view náà, a lo `pk=post.pk`, níbi tí `post` jẹ́ àròkọ blog tí a ṣẹ̀ṣẹ̀ ṣẹ̀dá náà!

Ó dáa, a ti sọ̀rọ̀ lọ́pọ̀lọpọ̀, ṣùgbọ́n ó ṣeéṣe kí a fẹ́ wo bí gbogbo *view* náà ṣe rí ní báyìí, àbí bẹ́ẹ̀ kọ?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Jẹ́ ká wo bóyá ó n ṣiṣẹ́. Lọ sí ojú-ìwé http://127.0.0.1:8000/post/new/ náà, ṣàfikún `title` àti `text` kan, tọ́jú rẹ̀… àti pé òhun nìyẹn! Àròkọ blog tuntun náà ti wà ní àfikún àti pé a ti darí padà sí ojú-ìwé `post_detail` náà!

O lè ti ṣàkíyèsí pé a n ṣètò ọjọ́ ìtẹ̀jáde ṣáájú títọ́jú àròkọ náà. Tó bá yá, a ó ṣàfihàn *bọ́tìnnì ìtẹ̀jáde* kan nínú **Django Girls Tutorial: Extensions**.

Ìyẹn dára púpọ̀!

> Nítorí pé a lo atọ́kùn alábòójútó Django náà láìpẹ́, ètò náà n lérò lọ́wọ́lọ́wọ́ pé a kò tíì jáde. Àwọn ìṣẹ̀lẹ̀ díẹ̀ kan wà tó lè yọrí sí jíjáde wa (pípa aṣàwákiri náà dé, ṣíṣe àtúnbẹ̀rẹ̀ DB náà, àti bẹ́ẹ̀ bẹ́ẹ̀ lọ). Tó bá jẹ́ pé, nígbà ṣíṣẹ̀dá àròkọ kan, o rí pé o n gba àwọn àṣìṣe tó n tọ́ka sí àìsí aṣàmúlò tó ti wọlé kan, lọ sí ojú-ìwé alábòójútó náà http://127.0.0.1:8000/admin kí o sì wọlé padà. Èyí yíò yanjú ìṣòro náà fúngbà díẹ̀. Àtúnṣe fúngbà pipe kan wà tó ń dúró de ọ́ nínú àkòrí **Homework: add security to your website!** lẹ́yìn àlàyé pàtàkì náà.

![Àṣìṣe wíwọlé](images/post_create_error.png)

## Fífìdí fọ́ọ̀mù múlẹ̀

Ní báyìí, a ó fi hàn ọ́ bí àwọn fọ́ọ̀mù Django ṣe dára tó. Àròkọ blog kan nílò láti ní àwọn ààyè `title` àti `text`. Nínú àwòṣe `Post` wa, a kò sọ wípé a ò nílò àwọn ààyè wọ̀nyí (tó yàtọ̀ sí `published_date`), nítorí náà Django, ní ìpìlẹ̀, yíò retí kí a ṣètò wọn.

Gbìyànjú láti tọ́jú fọ́ọ̀mù náà láìsí `title` àti `text`. Kí lo rò pé yíò ṣẹlẹ̀!

![Fífìdí fọ́ọ̀mù múlẹ̀](images/form_validation2.png)

Django n gbìyànjú láti fẹsẹ̀múlẹ̀ pé gbogbo àwọn ààyè tó wà nínú fọ́ọ̀mù wa wà bó ṣe tọ́. Ṣé kò dára ni?

## Fọ́ọ̀mù àtúnṣe

Now we know how to add a new post. Ṣùgbọ́n tí a bá fẹ́ ṣàtúnṣe ìkan tó ti wà tẹ́lẹ̀ ńkọ́? Èyí kò fi bẹ́ẹ̀ yàtọ̀ sí ohun tí a ṣẹ̀ṣẹ̀ ṣetán. Jẹ́ ká ṣẹ̀dá àwọn nnkan tó ṣe pàtàkì ní kíákíá. (Tí nnkan kan kò bá yé ọ, ó yẹ kí o béèrè lọ́wọ́ olùkọ́ rẹ tàbí kí o wo àwọn àkòrí tó ṣáájú náà, nítorí pé a ti ṣàlàyé gbogbo àwọn ìgbésẹ̀ wọ̀nyí tẹ́lẹ̀.)

Ṣí `blog/templates/blog/post_detail.html` nínú olóòtú kóòdù náà kí o sì ṣàfikún ìlà yìí

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

kí àwòṣe (template) náà lè rí báyìí:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Ṣí `blog/urls.py` nínú olóòtú kóòdù náà, kí o sì ṣàfikún ìlà yìí:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

A ó tún lo àwòṣe (template) `blog/templates/blog/post_edit.html` náà, nítorí náà ohun tí a pàdánù kẹ́yìn ni *view* kan.

Jẹ́ ká ṣí `blog/views.py` nínú olóòtú kóòdù náà kí a sì ṣàfikún èyí ní ìgbẹ̀yìn fáìlì náà:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Èyí fẹ́rẹ̀ẹ́ rí bákannáà pẹ̀lú view `post_new` wa, àbí bẹ́ẹ̀ kọ? Ṣùgbọ́n kìí ṣe pátápátá. For one, we pass an extra `pk` parameter from `urls`. Lẹ́yìn náà, a gba àwòṣe `Post` tí a fẹ́ ṣàtúnṣe pẹ̀lú `get_object_or_404(Post, pk=pk)` àti pé, nígbà tí a bá ṣẹ̀dá fọ́ọ̀mù kan, a máa darí àròkọ yìí gẹ́gẹ́ bí `instance` kan, nígbà tí a bá tọ́jú fọ́ọ̀mù náà…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…àti nígbà tí a bá ṣẹ̀ṣẹ̀ ṣí fọ́ọ̀mù kan pẹ̀lú àròkọ yìí láti ṣàtúnṣe:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Ó dáa, jẹ́ ká ṣàyẹ̀wò bóyá ó n ṣiṣẹ́! Jẹ́ ká lọ sí ojú-ìwé `post_detail` náà. Ó yẹ kí bọ́tìnnì àtúnṣe kan wà ní igun òkè lápá ọ̀tún náà:

![Bọ́tìnnì àtúnṣe](images/edit_button2.png)

Nígbà tí o bá tẹ̀ ẹ́, ìwọ yíò rí fọ́ọ̀mù náà pẹ̀lú àròkọ blog wa:

![Fọ́ọ̀mù àtúnṣe](images/edit_form2.png)

Má tijú láti ṣàyípadà àkọlé náà tàbí ọ̀rọ̀ náà kí o sì tọ́jú àwọn ìyípadà náà!

Kú oríire! Ètò rẹ túbọ̀ ń péye síi!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Ààbò

Ṣíṣẹ̀dá àwọn àròkọ tuntun nípasẹ̀ títẹ atọ́ka kan dára púpọ̀! Ṣùgbọ́n ní báyìí, ẹnikẹ́ni tó bá ṣèbẹ̀wò sí ààyè rẹ yóò lè ṣe àròkọ blog tuntun kan, àti pé kìí ṣe ohun tí o fẹ́. Jẹ́ ká ṣe é kí bọ́tìnnì náà máa hàn sí ìwọ ṣùgbọ́n kó pamọ́ fún ẹlòmíràn.

Ṣí `blog/templates/blog/base.html` nínú olóòtú kóòdù náà, wá `div` `page-header` wa àti àmì ajúwe ipò tí o fi síbẹ̀ ṣáájú. Ó yẹ kó rí báyìí:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

A óò ṣàfikún àmì `{% if %}` mìíràn sí èyí, tí yíò mú kí atọ́ka náà hàn fún àwọn aṣàmúlò tó bá ti wọlé sínú alábòójútó náà nìkan. Ní báyìí, ìwọ nìkan ni! Ṣàyípadà àmì `<a>` náà láti rí báyìí:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

`{% if %}` yìí yíò fi atọ́ka náà ránṣẹ́ sí aṣàwákiri náà tí aṣàmúlò tó bá ń béèrè ojú-ìwé náà bá ti wọlé nìkan. Èyí kò dáàbòbò ṣíṣẹ̀dá àwọn àròkọ tuntun pátápátá, ṣùgbọ́n ó jẹ́ ìgbésẹ̀ àkọ́kọ́ tó dára kan. A ó ṣàlàyé ààbò síwájú síi nínú àwọn ẹ̀kọ́ àfikún náà.

Rántí àwòrán aṣàmì àtúnṣe náà tí a ṣẹ̀ṣẹ̀ ṣàfikún sí ojú-ìwé detail wa? A tún fẹ́ ṣàfikún ìyípadà kannáà síbẹ̀, kí àwọn èèyàn mìíràn má lè ṣàtúnṣe àwọn àròkọ tó wà tẹ́lẹ̀.

Ṣí `blog/templates/blog/post_detail.html` nínú olóòtú kóòdù náà kí o sì wá ìlà yìí:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Ṣàyípadà rẹ̀ sí èyí:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Nítorí pé ó ṣeéṣe ko ti wọlé, tí o bá ṣe ìmúdójúìwọ̀n ojú-ìwé náà, ìwọ kò ní rí ìyàtọ̀ kankan. Ṣí ojú-ìwé náà nínú aṣàwákiri mìíràn kan tàbí fèrèsé kòlólúwa kan (tí a n pè ní "InPrivate" nínú Windows Edge), ìwọ yíò si rí pé atọ́ka náà kò fojú hàn, kódà àwòrán aṣàmì náà kò fojú hàn!

## Ó ṣì ku nnkan kan: àkókò láti ṣàgbékalẹ̀!

Jẹ́ ká wo bóyá gbogbo èyí yíò ṣiṣẹ́ lórí PythonAnywhere. Àkókò fún ṣíṣe àgbékalẹ̀ mìíràn!

* Lákọ̀ọ́kọ́, ṣàrídájú kóòdù tuntun rẹ, kí o sì tì í sí GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Lẹ́yìn náà, nínú [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/) kan:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Rántí láti rọ́pò `<your-pythonanywhere-domain>` pẹ̀lú subdomain PythonAnywhere rẹ, láìsí àwọn àkámọ́ onígun náà.)

* Ní ìparí, lọ sí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) náà (lo bọ́tìnnì àkójọ àṣàyàn tó wà ní òkè lápá ọ̀tún console náà) kí o sì tẹ **Reload**. Ṣe ìmúdójúìwọ̀n blog https://subdomain.pythonanywhere.com rẹ láti rí àwọn ìyípadà náà.

A ó parí gbogbo rẹ̀ síbí! Kú oríire :)