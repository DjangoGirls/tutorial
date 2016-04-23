# Django űrlapok

Utolsó lépésként azt fogjuk megcsinálni, hogy a blogposztokat ne csak az admin oldalon hozhassuk létre és szerkeszthessük. A Django `admin` menő, de elég nehéz személyre szabni, és nem is túl szép. A `form`ok (űrlapok) segítségével viszont majdnem mindent meg tudunk csinálni a felületünkön, amit csak szeretnénk!

A Django formokban az a jó, hogy ha akarjuk, teljesen az alapoktól is megírhatjuk őket, de `ModelForm`-ot is létrehozhatunk, ami az űrlap eredményét a modellbe menti el.

Pontosan ezt szeretnénk: egy űrlapot a `Post` modellünkhöz.

Mint minden fontos résznek a Django-ban, a formoknak is megvan a maguk helye: a `forms.py` fájl.

Hozz létre egy új fájlt ezzel a névvel a `blog` könyvtárban.

    blog
       └── forms.py
    

Rendben, most nyisd meg, és írd bele a következő kódot:

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```    

Először importálnunk kell a Django formjait (`from django import forms`), és persze a `Post` modellünket is (`from .models import Post`).

Valószínűleg már sejted, hogy a `PostForm` az űrlapunk neve lesz. Meg kell mondanunk a Django-nak, hogy ez a form egy `ModelForm` (hogy egy kis Django varázslat kerüljön bele) - ezért a `forms.ModelForm` felelős.

Aztán a `class Meta` következik, itt mondjuk meg a Django-nak, hogy melyik modellt kell használnia az űrlap elkészítéséhez (`model = Post`).

Legvégül megadhatjuk, hogy melyik mezők kerüljenek bele az űrlapba. Mi csak a `title` (cím) és a `text` (szöveg) mezőket szeretnénk megjeleníteni - az `author` (szerző) az a felhasználó lesz, aki éppen be van jelentkezve (te magad!), és a `created_date`-et (létrehozás dátumát) automatikusan állítja be a Django, amikor elmented a posztot, emlékszel?

Ennyi az egész! Most már csak az van hátra, hogy használjuk az űrlapot egy *view*-ban, és megjelenítsük egy template-ben.

Tehát még egyszer: egy link az oldalhoz, egy URL, egy view és egy template.

## Link az oldalhoz, ahol az űrlap van

Itt az ideje, hogy megnyisd a `blog/templates/blog/base.html` fájlt. Itt hozzáadunk egy linket a `page-header` nevű `div`hez:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```    

Figyelem: az új nézetünket `post_new`-nak fogjuk hívni.

Miután hozzáadtad ezt a sort, így fog kinézni a html fájlod:

```html
{% load staticfiles %}
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

Ha elmented, és frissíted a http://127.0.0.1:8000 oldalt, az ismerős `NoReverseMatch` hibát kell látnod, igaz?

## URL

Nyisd meg a `blog/urls.py` fájlt, és add hozzá ezt a sort:

```python
    url(r'^post/new/$', views.post_new, name='post_new'),
```    

Így fog kinézni a teljes kód:

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```    

Ha frissíted az oldalt, egy `AttributeError`t fogsz látni, hiszen még nincs implementálva a `post_new` nevű view. Készítsük el most rögtön.

## post_new nézet

Nyisd meg a `blog/views.py` fájlt, és add hozzá a következő sorokat:

```python
from .forms import PostForm
```    

és a *view*t:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```    

Ahhoz, hogy egy új `Post` űrlapot kapjunk, meg kell hívnunk a `PostForm()`-ot, és továbbadni a template-nek. Még visszatérünk erre a *view*-ra, de előbb gyorsan készítsük egy sablont a formnak.

## Template

Létre kell hoznunk egy `post_edit.html` nevű fájlt a `blog/templates/blog` könyvtárban. Ahhoz, hogy működjön az űrlapunk, szükségünk van pár dologra:

*   meg kell jelenítenünk az űrlapot. Ezt egyszerűen megtehetjük a `{% raw %}{{ form.as_p }}{% endraw %}` kóddal.
*   az előző sort be kell csomagolnunk egy HTML form tagbe: `<form method="POST">...</form>`
*   szükségünk van egy `Save` (Mentés) gombra. Ezt egy HTML gombbal tudjuk létrehozni: `<button type="submit">Save</button>`
*   és végül, a nyitó `<form ...>` tag után hozzá kell adnunk ezt: `{% raw %}{% csrf_token %}{% endraw %}`. Ez nagyon fontos, mert ettől lesznek biztonságosak az űrlapjaid! A Django panaszkodni fog, ha úgy próbálod elmenteni a formot, hogy kifelejtetted ezt a részt:

![CSFR tiltott oldal][1]

 [1]: images/csrf2.png

Rendben, nézzük, hogy néz ki a HTML kód a `post_edit.html`-ben:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```    

Itt az ideje, hogy frissítsd az oldalt! Juhú! Ott van az űrlapod!

![Új űrlap][2]

 [2]: images/new_form2.png

De várjunk csak egy percet! Ha begépelsz valamit a `title` és a `text` mezőbe, és megpróbálod elmenteni - mi történik?

Semmi! Megint ugyanazon az oldalon vagyunk, és a szöveg eltűnt... és nem jött létre új bejegyzés. Mi romlott el?

A válasz: semmi. Csak még egy kicsit dolgoznunk kell a *view*-n.

## Űrlap mentése

Nyisd meg újra a `blog/views.py` fájlt. Most mindössze ennyi van a `post_new` nézetben:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```    

Amikor beküldünk egy űrlapot, ugyanabba a nézetbe kerülünk vissza, de ilyenkor a `request`ben több adat van, mint korábban, egész pontosan a `request.POST`-ban (ennek az elnevezésnek nincs köze a blogban lévő "poszt"-hoz, ez annyit jelent, hogy éppen adatokat "posztolunk", vagyis küldünk). Emlékszel, hogy a HTML fájlban a `<form>` definíciójában szerepelt a `method="POST"` változó? Most az űrlap minden mezője bekerült a `request.POST`-ba. Semmiképp se nevezd át a `POST` (a `method` másik érvényes értéke a `GET` lenne, de most nincs idő elmagyarázni a különbséget).

Tehát a *view*-ban két különböző esetet kell kezelnünk. Az első: amikor először kerülünk az oldalra, és egy üres űrlapot szeretnénk látni. A második: amikor visszajutunk a *view*-ba, azokkal az adatokkal, amiket épp az előbb gépeltünk be a formba. Ehhez egy feltételt kell hozzáadnunk (az `if`-et fogjuk használni).

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```    

Itt az ideje, hogy kitöltsük a `[...]` részeket. Ha a `method` `POST`, akkor egy `PostForm`-ot szeretnénk létrehozni az űrlapban beküldött adatokból, igaz? Ezt így tehetjük meg:

```python
form = PostForm(request.POST)
```    

Nem nehéz! A következő, hogy ellenőrizzük, helyes-e az űrlap (minden kötelező mező ki lett-e töltve, és nem készülünk-e helytelen adatokat elmenteni). Ezt csinálja a `form.is_valid()`.

Megnézzük, hogy érvényes-e a form, és ha igen, elmenthetjük!

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```    

Itt lényegében két dolog történik: elmentjük az űrlapot a `form.save` paranccsal, és hozzáadunk egy szerzőt (mivel nem volt `author` mező a `PostForm`-ban, viszont ez a mező kötelező!). A `commit=False` azt jelenti, hogy még nem mentjük el a `Post` modellt - előbb még hozzá akarunk adni egy szerzőt. Az idő nagy részében a `commit=False` nélkül fogod használni a `form.save()`-et, de most szükségünk van erre a részre. A `post.save()` megőrzi a változtatásokat (szerző hozzáadása), és létrehoz egy új blogposztot!

Végül tök jó lenne, ha egyből a frissen elkészült bejegyzés `post_detail` oldalára jutnánk nem? Ehhez egy újabb importra van szükségünk:

```python
from django.shortcuts import redirect
```   

Ezt írd a fájlod elejére. És most megmondhatjuk a Django-nak: menj az új blogposzt `post_detail` oldalára.

```python
return redirect('blog.views.post_detail', pk=post.pk)
```    

A `blog.views.post_detail` a nézet neve, ahova most menni akarunk. Emlékszel, hogy ez a *view* egy `pk` változót kér? Ahhoz, hogy ezt megkapja, a `pk=post.pk` részt használjuk, ahol a `post` az új blogposztunkat jelenti!

Rendben, elég sokat beszéltünk, de most már látni szeretnéd, hogy néz ki a teljes *view*, igaz?

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```    

Nézzük meg, hogy működik-e. Menj a http://127.0.0.1:8000/post/new/ oldalra, adj hozzá egy `title`-t és egy `text`-et, mentsd el... és voilà! Az új poszt bekerült az adatbázisba, és át lettél irányítva a `post_detail` oldalra!

Talán észrevetted, hogy a poszt elmentése előtt beállítjuk a közzététel dátumát. Később, a **Django Girls Tutorial: Extensions** részben egy *publish* gombot is készítünk.

Ez nagyszerű!

## Form validáció

Most megmutatjuk, mennyire menők a Django űrlapok. Egy blogposztnak kell, hogy legyen `title` és `text` mezője. A `Post` modellben nem jelentettük ki külön, hogy ezek a mezők nem kötelezőek (ellentétben a `published_date` mezővel), ezért a Django elvárja, hogy ki legyenek töltve.

Próbáld meg elmenteni az űrlapot `title` vagy `text` nélkül. Találd ki, mi fog történni!

![Form validáció][3]

 [3]: images/form_validation2.png

A Django gondoskodik az összes mező ellenőrzéséről. Hát nem fantasztikus?

> Mivel nemrég használtuk a Django admin felületét, a rendszer most azt hiszi, hogy be vagyunk jelentkezve. Néhány esetben előfordul, hogy a rendszer kijelentkeztet minket (pl. ha bezárod a böngészőt vagy újraindítod az adatbázist). Ha azt veszed észre, hogy a hibaüzenetek arra utalnak, hogy nincs bejelentkezett felhasználó, menj az admin oldalra -http://127.0.0.1:8000/admin - és jelentkezz be újra. Ez ideiglenesen megoldja a problémát. Van egy hosszútávú megoldás is a **Házi feladat: tedd biztonságosabbá a weboldalad!** fejezetben a tutorial fő része után.

![Bejelentkezési hiba][4]

 [4]: images/post_create_error.png

## Űrlapok szerkesztése

Most már tudod, hogyan tudsz új formot hozzáadni. De mi van, ha egy létező űrlapot szeretnél módosítani? Az eddigiekhez nagyon hasonlóan fog működni. Gyorsan készítsük néhány fontos dolgot (ha nem értesz valamit, kérdezd meg a coachodat, vagy nézz bele az előző fejezetekbe, hiszen ezeket a lépéseket már mind megcsináltad egyszer).

Nyisd meg a `blog/templates/blog/post_detail.html` fájlt, és add hozzá ezt a sort:

```python
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```   

Így fog kinézni a template:

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endblock %}
```    

A `blog/urls.py`-ban pedig erre a sorra lesz szükségünk:

```python
    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```    

Itt újrahasznosíthatjuk a `blog/templates/blog/post_edit.html` sablont, szóval már csak egy *view* van hátra.

Nyisd meg a `blog/views.py`-t, és add hozzá ezt a fájl végén:

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
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```    

Majdnem pont úgy néz ki, mint a `post_new` view, nem igaz? De nem teljesen. Először is átadunk egy extra `pk` paramétert az url-ekből. Aztán a `Post` modellt a `get_object_or_404(Post, pk=pk)` sorral kapjuk meg, és végül, amikor létrehozzuk a formot, ezt a posztot adjunk át `instance`-ként, amikor elmentjük:

```python
form = PostForm(request.POST, instance=post)
```    

és akkor is, amikor megnyitjuk az űrlapot, hogy szerkeszthessük a posztot:

```python
form = PostForm(instance=post)
```    

Oké, most teszteljük le, hogy működik-e! Menj a `post_detail` oldalra. Kell lennie egy szerkesztés gombnak a jobb felső sarokban:

![Szerkesztés gomb][5]

 [5]: images/edit_button2.png

Ha rákattintasz, megkapod az űrlapot a blogposzttal:

![Űrlapok szerkesztése][6]

 [6]: images/edit_form2.png

Változtasd meg a címet vagy a szöveget, és mentsd el!

Gratulálunk! Az alkalmazásod egyre és egyre jobb!

Ha szeretnél többet tudni a Django formokról, olvass róluk a dokumentációban: https://docs.djangoproject.com/en/1.8/topics/forms/

## Biztonság

Nagyon jó, hogy az új blogposztok írásához csak egy linkre kell kattintani! Viszont most bárki létre tud hozni egy új bejegyzést, aki meglátogatja az oldaladat, és valószínűleg ezt nem szeretnéd. Csináljuk meg, hogy a gombot csak te lásd, és mások ne.

A `blog/templates/blog/base.html`-ben keresd meg a `page-header` `div`et, és az anchor taget, amit korábban írtál bele. Így néz ki:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```    

Írunk még egy `{% if %}` taget, ami arra lesz jó, hogy csak azoknak az usereknek mutassa a linket, akik be vannak jelentkezve az adminba. Most ez csak te vagy! Változtasd meg a `<a>` taget, hogy így nézzen ki:

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```    

Az `{% if %}` miatt a link csak akkor küldődik át a böngészőbe, ha a felhasználó, aki lekérte az oldalt, be van jelentkezve. Ez nem akadályozza meg teljesen az új posztok létrehozását, de kezdésnek jó. A kiegészítő leckékben többet is tanulhatsz a biztonságról.

Mivel valószínűleg be vagy jelentkezve, semmi változást nem fogsz látni, ha frissítesz. Viszont ha megnyitod az oldalt egy másik böngészőben, vagy egy inkognitóablakban, látni fogod, hogy a link nincs ott!

## Még egy dolog: itt az ideje egy újabb deploynak!

Nézzük meg, hogy működik-e ez az egész a PythonAnywhere-en. Itt az ideje egy újabb deploynak!

*   Először is commitold az új kódodat, és pushold GitHubra
```
$ git status
$ git add --all .
$ git status
$ git commit -m "Added views to create/edit blog post inside the site."
$ git push
```    

*   Aztán írd be ezt a [PythonAnywhere Bash konzol][7]ba:

 [7]: https://www.pythonanywhere.com/consoles/

    $ cd my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]
    

*   Végül menj a [Web tab][8]-ra, és nyomj **Reload**ot.

 [8]: https://www.pythonanywhere.com/web_app_setup/

Ennyi az egész. Gratulálunk :)
