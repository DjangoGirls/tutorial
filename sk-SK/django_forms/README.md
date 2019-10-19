# Formuláre Django

Posledná vec, ktorú chceme urobiť na našej web stránke je vytvoriť príjemný spôsob pridávania a úpravy blog postov. Django `admin` je v pohode, ale ťažko sa prispôsobuje a upravuje do krajšej podoby. Pomocou `formulárov` budeme mať absolútnu moc nad naším rozhraním - môžeme urobiť takmer čokoľvek, čo si vieme predstaviť!

Na Django formulároch je fajn, že ich môžeme vytvoriť úplne od nuly alebo vytvoriť `ModelForm`, ktorý uloží výsledok formulára do modelu.

A toto je presne to, čo chceme urobiť: vytvoríme formulár pre náš `Post` model.

Tak ako všetky ostatné dôležité časti Djanga, formuláre majú svoj vlastný súbor: `forms.py`.

Musíme vytvoriť súbor s týmto názvom v adresári `blog`.

    blog
       └── forms.py
    

OK, let's open it in the code editor and type the following code:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

We need to import Django forms first (`from django import forms`) and our `Post` model (`from .models import Post`).

`PostForm`, ako asi správne predpokladáš, je názov nášho formulára. Musíme Djangu povedať, že tento formulár je `ModelForm` (aby Django pre nás mohlo trochu čarovať) - za to je zodpovedný `forms.ModelForm`.

Ďalej máme `triedu Meta`, kde Djangu povieme, ktorý model by mal byť použitý na vytvorenie tohto formulára (`model = Post`).

Nakoniec môžeme Djangu povedať, ktoré formuláre budú v našom formulári. V tomto scenári, chceme aby boli zobrazené iba `title` (nadpis) a `text` - `author` by mala byť aktuálne prihlásená osoba (teda ty!) a dátum vytvorenia `created_date` by mal byť automaticky nastavený pri vytvorení postu (t.j. v kóde), však?

To je všetko! Jediné, čo treba teraz urobiť, je použiť formulár v *zobrazení* (angl. view) a zobraziť ho v šablóne.

Takže ešte raz vytvoríme link na stránku, URL, zobrazenie a šablónu.

## Link na stránku s formulárom

It's time to open `blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Všimni si, že chceme zavolať naše nové view `post_new`. Trieda `"glyphicon glyphicon-plus"` je poskytnutá bootstrap témou ktorú používame a ona zobrazí znamienko plus pre nás.

Po pridaní riadku by tvoj html súbor mal vyzerať asi takto:

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

After saving and refreshing the page http://127.0.0.1:8000 you will see a familiar `NoReverseMatch` error. Is that the case? Good!

## URL

We open `blog/urls.py` in the code editor and add a line:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

A výsledný kód bude vyzerať takto:

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

Po obnovení stránky uvidíme chybu `AttributeError`, pretože nemáme implementovaný view `post_new`. Pridajme ho teraz.

## view post_new

Time to open the `blog/views.py` file in the code editor and add the following lines with the rest of the `from` rows:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

A potom náš *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Nový formulár `Post` vytvoríme tak, že sputíme `PostForm()` a prepošleme ho šablóne. K tomuto *view* sa ešte vrátime, ale teraz poďme rýchlo vytvoriť šablónu formulára.

## Šablóna

We need to create a file `post_edit.html` in the `blog/templates/blog` directory, and open it in the code editor. To make a form work we need several things:

* Musíme zobraziť formulár. Môžeme to urobiť (napríklad) pomocou {% raw %}`{{ form.as_p }}`{% endraw %}.
* Riadok vyššie musí byť obalený HTML tagom: `<form method="POST">...</form>`.
* Potrebujeme tlačidlo `Uložiť`. Vytvoríme ho ako HTML tlačidlo: `<button type="submit">Uložiť</button>`.
* A nakoniec, hneď za otváracím tagom `<form ...>` musíme pridať `{% raw %}{% csrf_token %}{% endraw %}`. Toto je veľmi dôležité, vďaka tomu je formulár bezpečný! Ak si na to zabudla, Django sa bude sťažovať keď sa pokúsiš uložiť formulár:

![CSFR Zakázaná stránka](images/csrf2.png)

OK, pozrime sa, ako by malo vyzerať HTML v `post_edit.html`:

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

Obnovíme stránku! Aha! Tvoj formulár je na svete!

![Nový formulár](images/new_form2.png)

Ale počkaj! Keď zadáš niečo do polí `title` a `text` a skúsiš to uložiť - čo sa stane?

Nič! Sme stále na rovnakej stránke a náš text je preč... a žiaden nový príspevok sa nepridal. Takže čo sa pokazilo?

Odpoveď znie: nič. Akurát budeme mať ešte trochu práce v našom *view* (zobrazení).

## Uloženie formuláru

Open `blog/views.py` once again in the code editor. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Keď odošleme formulár, vrátime sa do rovnakého view, ale teraz už máme v `request` aj nejaké údaje, presnejšie v `request.POST` (názov nemá nič spoločné s "postom" na blogu, ide len o to, že posielame - "postujeme" údaje). Pamätáš si, že naša definícia formuláru `<form>` v HTML súbore mala premennú `method="POST"`? Všetky polia z formulára sú teraz v `request.POST`. `POST` by si nemala premenovať na nič iné (jediná ďalšia platná hodnota pre premennú `method` je `GET`, teraz ale nemáme čas vysvetliť si rozdiel).

Takže v našom *view* musíme ošetriť dva rôzne prípady: prvý, ak pristupujeme na stránku prvýkrát a chceme prázdny formulár, a druhý, keď sa vrátime na *view* s už predvyplnenými údajmi formulára. Takže potrebujeme pridať podmienku (na to použijeme `if`):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Je čas nahradiť tri bodky `[...]`. Ak ide o `metódu` `POST` tak cheme vytvoriť `PostForm` s datami z formulára, však? Urobíme to takto:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Ďalej skontrolujme či je formulár v poriadku (všetky povinné polia sú vyplnené a nie sú zadané žiadne nesprávne hodnoty). To urobíme pomocou `form.is_valid()`.

Skonotrolujeme, či je formulár platný a ak áno, môžeme ho uložiť!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

V podstate urobím dve veci: uložíme formulár pomocou `form.save` a pridáme autora (keďže pole `author` nebolo v `PostForm`, avšak toto pole je povinné). `commit=False` znamená, že ešte nechceme uložiť model `Post` - najskôr chceme pridať autora. Väčšinou budeš používať `form.save()` bez `commit=False`, no v tomto prípade, to takto musíme spraviť. `post.save()` uchová zmeny (pridanie autora) a máme vytvorený nový blog príspevok!

A bolo by skvelé, keby sme sa potom ihneď dostali na stránku `post_detail` nášho novovytvoreného blog postu, nie? Aby sme to vedeli urobiť, budeme potrebovať ešte jeden import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Pridaj tento riadok úplne na začiatok súboru. A teraz môžeme povedať: prejdi na stránku `post_detail` novovytvoreného príspevku":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`blog. views. post_detail` je názov view, kam chceme ísť. Spomínaš si, že tento *view* vyžaduje premennú `pk`? Aby sme ju odovzdali do view, použijeme `pk=post.pk`, kde `post` je novovytvorený blog post!

OK, dosť sme hovorili, už je na čase pozrieť sa ako teraz vyzerá celý *view*, však?

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

Pozrime sa, či funguje. Poď na stránku http://127.0.0.1:8000/post/new/, pridaj `title` a `text`, ulož to... a voilà! Nový blog post je pridaný a my sme presmerovaní na stránku `post_detail`!

Možno si si všimla, že pred uložením postu nastavujeme dátum publikovania. Neskôr v **Django Girls Tutorial: Rozšírenie** sa zoznámime s *tlačidlom Publikovať*.

To je úžasné!

> Keďže sme nedávno použili administrátorské rozhranie Djanga, systém si myslí, že sme stále prihlásení. Existuje zopár situácií, ktoré by mohli spôsobiť odhlásenie (zatvorenie prehliadača, reštart databázy a podobne). Pokiaľ by sa ti zobrazovala chyba pri vytváraní postu upozorňujúca na neprihláseného užívateľa, choď na adminskú stránku http://127.0.0.1:8000/admin and prihlás sa znova. Toto dočasne vyrieši problém. Čaká však na teba aj permanentné riešenie v kapitole **Domáca úloha: zvýš svojej stránke bezpečnosť!** po skončení hlavného tutorialu.

![Chyba prihlásenia](images/post_create_error.png)

## Validácia formuláru

Teraz si ukážeme, aké sú Django formuláre super. Príspevok na blogu (post) musí mať polia `title` a `text`. V našom modeli `Post` sme nepovedali (na rozdiel od `published_date`), že tieto polia sú nepovinné, takže Django štandardne očakáva, že budú nastavené.

Skús uložiť formulár bez `title` a `text`. Pokús sa uhádnuť, čo sa stane!

![Validácia formuláru](images/form_validation2.png)

Django overí, či sú všetky polia formulára správne. Nie je to skvelé?

## Úprava formuláru

Teraz už vieme, ako sa pridáva nový formulár. Ale čo ak chceme upravovať existujúci? Je to veľmi podobné tomu, čo sme práve spravili. Poďme rýchlo vytvoriť niektoré dôležité veci. (ak niečomu nerozumieš, opýtaj sa svojho trénera alebo sa pozri na predchádzajúce kapitoly, pretože všetky tieto kroky sme si už prebrali.)

Open `blog/templates/blog/post_detail.html` in the code editor and add the line

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

takže šablóna teraz bude vyzerať takto:

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

Open `blog/urls.py` in the code editor, and add this line:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Znova použijeme šablónu `blog/templates/blog/post_edit.html`, takže posledná vec, čo nám chýba je *view*.

Let's open `blog/views.py` in the code editor and add this at the very end of the file:

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

To vyzerá skoro tak isto ako náš view `post_new`, však? Ale nie úplne. For one, we pass an extra `pk` parameter from `urls`. A ďalej: pomocou `get_object_or_404(Post, pk=pk)` získame `Post` model, ktorý chceme upravovať a následne pri vytváraní formuláru odovzdáme tento post ako parameter `instance`, aj v prípade keď ukladáme formulár…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…aj v prípade keď sme otvorili formulár za účelom úpravy daného príspevku:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK, vyskúšajme, či to funguje! Poďme na stránku `post_detail`. V pravom hornom rohu by malo byť tlačidlo na úpravu:

![Tlačidlo Upraviť](images/edit_button2.png)

Keď naňho klikneš, uvidíš formulár s našim blog príspevkom:

![Úprava formuláru](images/edit_form2.png)

Môžeš si vyskúšať zmeniť názov alebo text a uložiť zmeny!

Gratulujeme! Tvoja aplikácia je čím ďalej dokonalejšia!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Bezpečnosť

Being able to create new posts by clicking a link is awesome! Ale, v tejto chvíli, každý kto navštívi tvoju stránku, bude môcť pridať nový blog post a to asi nie je to, čo by si chcela. Urobme to tak, že sa tlačidlo zobrazí len tebe.

Open `blog/templates/blog/base.html` in the code editor, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Do neho pridáme ďalší tag `{% if %}`, vďaka ktorému sa link zobrazí len užívateľom, ktorí sú prihlásení ako admin. Momentálne si to len ty! Zmeň `<a>` aby vyzeral takto:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Tento `{% if %}` zabezpečí, aby bol link odoslaný do prehliadača, len ak je používateľ požadujúci stránku prihlásený. Nezabráni to vytváraniu nových príspevkov úplne, ale je to dobrý prvý krok. Viac o bezpečnosti si povieme v rozširujúcich lekciách.

Spomínaš si na ikonku na upravovanie ktorú sme práve pridali na našu stránku s detailmi? Rovnakú zmenu chceme pridať aj sem, aby iný ludia nemohli upravovať existujúce príspevky.

Open `blog/templates/blog/post_detail.html` in the code editor and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Zmeň ho na toto:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Kedže si pravdepodobne prihlásená, ak obnovíš stránku, neuvidíš nič. Načítaj stránku v inom prehliadači, alebo incognito okne (nazývané "InPrivate" vo Windows Edge) a uvidíš, že sa odkaz nezobrazuje a ikonka tiež nie!

## Ešte jedna vec: čas nasadiť aplikáciu!

Pozrime sa, či to všetko funguje na PythonAnywhere. Je čas na ďalšie nasadenie!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Potom v [konzole PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

A to by malo byť všetko! Gratulujeme :)