# Ako rozšíriť aplikáciu

Už sme dokončili všetky kroky potrebné k tomu, aby sme vytvorili našu webovú stránku: vieme ako napísať model, url, view a šablónu. Taktiež vieme ako spraviť našu stránku peknú.

Čas na precvičovanie!

Prvá vec, ktorú potrebujeme na našom blogu je, zjavne, stránka, na ktorej zobrazíme jeden príspevok, že?

Už máme `Post` model, takže nepotrebujeme do `models.py` pridávať nič iné.

## Vytvorenie šablóny odkazu na post detail

Začneme tak, že pridáme link do súboru `blog/templates/blog/post_list.html`. Zatiaľ by mal vyzerať nejako takto:

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
{% endblock content %}
```

{% raw %}Chceme, aby link z titulku príspevku smeroval na stránku detailov príspevku. Zmeňme `<h1><a href="">{{ post.title }}</a></h1>` tak, aby odkazoval na stránku detailu príspevku:{% endraw %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Je na čase vysvetliť záhadné `{% url 'post_detail' pk=post.pk %}`. Ako možno tušíš, `{% %}` notácia znamená, že používame tagy Django šablóny. Tentoraz použijeme jeden, ktorý pre nás vytvorí URL!{% endraw %}

`blog.views.post_detail` je cesta k `post_detail` *view* ktorý chceme vytvoriť. Poznámka: `blog` je názov aplikácie (zložky `blog`), `views` je meno súboru `views.py` a posledná časť - `post_detail` - je meno *view*.

Teraz keď pôjdeme na: http://127.0.0.1:8000/ uvidíme chybu (ako sa dá očakávať, keďže nemáme URL alebo *view* pre `post_detail`). Bude to vyzerať takto:

![NoReverseMatch error][1]

 [1]: images/no_reverse_match2.png

## Vytvor URL na detail príspevku

Vytvorme URL v `urls.py` pre náš `post_detail` *view*!

Chceme aby sa detaily nášho prvého príspevku zobrazili na tejto **URL**: http://127.0.0.1:8000/post/1/

Vytvorme URL v súbore `blog/urls.py` tak, aby odkazoval Django na *view* nazvaný `post_detail`, ktorý zobrazí celý príspevok blogu. Pridaj riadok `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),` do súboru `blog/urls.py`. Súbor by mal vyzerať takto:

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
]
```

Táto časť `^post/(?P<pk>[0-9]+)/$` vyzerá desivo, ale neboj sa - o chvíľu ti ju vysvetlíme: - znova začína s `^` -- začiatkom - `post/` znamená len, že po začiatku by URL mala obsahovať slová **post** a **/**. Zatiaľ je všetko v poriadku. - `(?P<pk>[0-9]+)` - táto časť je zložitejšia. Znamená to, že Django vezme všetko, čo tu vložíš a premiestni to do premennej s názvom `pk`. `[0-9]` nám tiež hovorí, že to môžu byť len čísla, nie písmená (takže všetko medzi 0 a 9). `+` znamená, že musíme mať aspoň jedno číslo. Takže niečo ako `http://127.0.0.1:8000/post//` nie je validné, ale `http://127.0.0.1:8000/post/1234567890/` je úplne v poriadku! - `/` - potom znova potrebujeme **/** - `$` - "koniec"!

To znamená, že ak zadáš `http://127.0.0.1:8000/post/5/` do svojho prehliadača, Django pochopí, že hľadáš *view* s názvom `post_detail` a prenesie informácie z `pk` rovné `5` do toho *view*.

`pk` je skratka pre `primárny kľúč (primary key)`. Tento názov je často používaný v Django projektoch. Ale môžeš si pomenovať svoje premenná ako chceš (pamätaj: malé písmená a `_` namiesto medzier!). Napríklad namiesto `(?P<pk>[0-9]+)` môžeme mať premennú `post_id`, takže táto časť by vyzerala: `(?P<post_id>[0-9]+)`.

Dobre, pridali sme nový vzor URL do `blog/urls.py`! Obnovme stránku: http://127.0.0.1:8000/ Boom! Ďalšia chyba! Ako sa dalo očakávať!

![AttributeError][2]

 [2]: images/attribute_error2.png

Pamätáš si, čo je ďalší krok? Samozrejme: pridávanie view!

## Pridaj view do detailu príspevku

Tentokrát má náš *view* extra parameter `pk`. Náš *view* ho potrebuje zachytiť, že? Takže definujeme našu funkciu ako `def post_detail(request, pk):`. Všimni si, že musíme použiť rovnaké meno, ako to, ktoré sme špecifikovali v Url (`pk`). Vynechanie tejto premmenej je nesprávne a bude mať za následok chybu!

Teraz chceme aby sme dostali jeden a iba jeden príspevok blogu. Na to môžeme použiť querysets takto:

```python
Post.objects.get(pk=pk)
```

Ale tento kód má problém. Pokiaľ tu nie je žiaden `Post` s daným `primárnym kľúčom`(`pk`) budeme mať super škaredú chybu!

![DoesNotExist error][3]

 [3]: images/does_not_exist2.png

To nechceme! Ale samozrejme Django prichádza s niečim, čo si s tým poradí: `get_object_or_404`. V príade, že neexistuje žiaden `Post` s daným `pk` zobrazí oveľa krajšiu stránku (nazývanú `Page Not Found 404`).

![Page not found][4]

 [4]: images/404_2.png

Dobrá správa je, že si môžeš vytvoriť svoju vlastnú `Page not found` stránku a spraviť ju tak peknú ako len chceš. Ale to nie je momentálne príliš dôležité, takže to preskočíme.

Dobre, čas pridať *view* do nášho `views.py` súboru!

Mali by sme otvoriť `blog/views.py` a pridať nasledujúci kód:

```python
from django.shortcuts import render, get_object_or_404
```


Blízko riadkov `from`. A na konci súboru pridáme náš *view*:

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```


Áno. Nastal čas obnoviť stránku: http://127.0.0.1:8000/

![Post list view][5]

 [5]: images/post_list2.png

Funguje to! Ale čo sa stane, keď klikneš na odkaz v názve príspevku blogu?

![TemplateDoesNotExist error][6]

 [6]: images/template_does_not_exist2.png

Ale nie! Ďalšia chyba! Ale už vieme, s čim mám dočinenia, že? Potrebujeme pridať šablónu!

## Vytvor šablónu pre detail príspevku

Vytvoríme súbor v `blog/templates/blog` s názvom `post_detail.html`.

Bude to vyzerať takto:

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

Znova raz rozširujeme `base.html`. V bloku `content` chceme zobraziť published_date príspevku (pokiaľ existuje), titulok a text. Ale mali by sme prebrať pár dôležitých vecí, však?

{% raw %}`{% if ... %} ... {% endif %}` je tag šablóny, ktorý môžeme použiť ak chceme niečo skontrolovať (pamätáš na `if ... else ..` z kapitoly **Úvod do Pythonu**?). V tomto prípade chceme skontrolovať, či `published_date` príspevku nie je prázdny.{% endraw %}

Dobre, môžeme obnoviť našu stránku a pozrieť sa, či `Page not found` zmizlo.

![Post detail page][7]

 [7]: images/post_detail2.png

Jupí! Funguje to!

## Ešte jedna vec: čas nasadiť aplikáciu!

Bolo by dobré vedieť, či tvoja stránka stále funguje na PythonAnywhere, že? Pokúsme sa ju znova nasadiť.

```
$ git status
$ git add -A .
$ git status
$ git commit -m "Pridaný view a šablóna pre detail príspevku blogu a taktiež CSS pre stránku."
$ git push
```

*   Potom v [Bash konzole PythonAnywhere][8]:

 [8]: https://www.pythonanywhere.com/consoles/

```
$ cd my-first-blog
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```

*   A nakoniec preskoč na [kartu Web][9] and klinki na **Reload**.

 [9]: https://www.pythonanywhere.com/web_app_setup/

A to by malo byť všetko! Gratulujeme :)
