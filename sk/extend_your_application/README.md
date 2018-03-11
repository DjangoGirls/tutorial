# Ako rozšíriť aplikáciu

Už sme dokončili všetky kroky potrebné k tomu, aby sme vytvorili našu webovú stránku: vieme ako napísať model, url, view a šablónu. Taktiež vieme ako spraviť našu stránku peknú.

Čas na precvičovanie!

Prvá vec, ktorú potrebujeme na našom blogu je, zjavne, stránka, na ktorej zobrazíme jeden príspevok, že?

Už máme `Post` model, takže nepotrebujeme do `models.py` pridávať nič iné.

## Vytvorenie šablóny odkazu na post detail

Začneme s pridaním odkazu v `blog/templates/blog/post_list.html` súbore. Zatiaľ by mal vyzerať takto: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %}Chceme, aby link z titulku príspevku smeroval na stránku detailov príspevku. Zmeňme `<h1><a href="">{{ post.title }}</a></h1>` tak, aby odkazoval na stránku detailu príspevku:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Je na čase vysvetliť záhadné `{% url 'post_detail' pk=post.pk %}`. Ako možno tušíš, `{% %}` notácia znamená, že používame tagy Django šablóny. Tentoraz použijeme jeden, ktorý pre nás vytvorí URL!{% endraw %}

`post_detail` časť znamená, že Django bude očakávať URL v `blog/urls.py` s name=post_detail

A čo s `pk=post.pk`? `pk` je skratka pre primárny kľúč, ktorý jednoznačne určuje každý záznam v databáze. Keďže sme neurčili primárny kľúč v našom `Post` modely, Django ho vytvorí namiesto nás (štandardne je to číslo ktoré sa zvýši o jedna pre každý záznam, t.j. 1, 2, 3) a pridá ho ako pole s názvom `pk` ku každému z našich príspevkov. K primárny kľúču môžeme pristupovať napísaním `post.pk`, rovnako ako pristupujeme iným poliam (`titul`, `autor`, atď) v našom `Post` objekte!

Teraz keď pôjdeme na: http://127.0.0.1:8000/ uvidíme chybu (ako sa dá očakávať, keďže ešte nemáme URL alebo *view* pre `post_detail`). Bude to vyzerať takto:

![NoReverseMatch error](images/no_reverse_match2.png)

## Vytvor URL na detail príspevku

Vytvorme URL v `urls.py` pre náš `post_detail` *view*!

Chceme aby sa detaily nášho prvého príspevku zobrazili na tejto **URL**: http://127.0.0.1:8000/post/1/

Vytvorme URL v súbore `blog/urls.py` tak, aby odkazoval Django na *view* nazvaný `post_detail`, ktorý zobrazí celý príspevok blogu. Pridaj riadok `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` do súboru `blog/urls.py`. Súbor by mal vyzerať takto:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

Táto časť `^post/(?P<pk>\d+)/$` vyzerá desivo, ale bez obáv - vysvetlíme si:

- začína to opäť s `^` - "začiatok".
- `post/` len znamená, že na začiatku, URL by mala obsahovať slovo **post** a **/**. Zatiaľ všetko v poriadku.
- `(?P<pk>\d+)` - táto časť je zložitejšia. Znamená to, že Django vezme všetko, čo tu vložíš a premiestni to do premennej s názvom `pk`. (Všimni si, že to zodpovedá názvu ktorý sme dali primárnemu kľúču v `blog/templates/blog/post_list.html`!) `\d` nám hovorí, že to môže byť iba číslica, nie písmeno (takže všetko od 0 po 9). `+` znamená, že musíme mať aspoň jedno číslo. Takže niečo ako `http://127.0.0.1:8000/post//` nie je validné, ale `http://127.0.0.1:8000/post/1234567890/` je úplne v poriadku!
- `/` – potom potrebujeme **/** ešte raz.
- `$` – "koniec"!

To znamená, že ak zadáš `http://127.0.0.1:8000/post/5/` do svojho prehliadača, Django pochopí, že hľadáš *view* s názvom `post_detail` a prenesie informácie z `pk` rovné `5` do toho *view*.

OK, pridali sme nový URL vzor `blog/urls.py`! Poďme obnoviť stránku: http://127.0.0.1:8000 / Boom! Server znova prestal bežať. Pozri sa do konzoly - ako sa aj dalo očakávať je tam ďalšia chyba!

![AttributeError](images/attribute_error2.png)

Pamätáš si, čo je ďalší krok? Samozrejme: pridávanie view!

## Pridaj view do detailu príspevku

Tentokrát má náš *view* extra parameter, `pk`. Náš *view* ho potrebuje zachytiť, že? Takže definujeme našu funkciu ako `def post_detail(request, pk):`. Všimni si, že musíme použiť rovnaké meno, ako to, ktoré sme špecifikovali v Url (`pk`). Vynechanie tejto premmenej je nesprávne a bude mať za následok chybu!

Teraz chceme aby sme dostali jeden a len jeden príspevok blogu. Na to môžeme použiť querysets takto:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Ale tento kód má problém. Pokiaľ tu nie je žiaden `Post` s daným `primárnym kľúčom`(`pk`) budeme mať veľmi škaredú chybu!

![DoesNotExist error](images/does_not_exist2.png)

To nechceme! Ale samozrejme Django prichádza s niečim, čo si s tým poradí: `get_object_or_404`. V príade, že neexistuje žiaden `Post` s daným `pk` zobrazí oveľa krajšiu stránku, `Page Not Found 404`.

![Page not found](images/404_2.png)

Dobrá správa je, že si môžeš vytvoriť svoju vlastnú `Page not found` stránku a spraviť ju tak peknú ako len chceš. Ale to nie je momentálne príliš dôležité, takže to preskočíme.

Dobre, čas pridať *view* do nášho `views.py` súboru!

V `blog/urls.py` sme vytvorili URL pravidlo s názvom `post_detail`, ktoré odkazuje na zobrazenies názvom `views.post_detail`. To znamená, že Django očakáva zobrazovaciu funkciu s nazvom `post_detail` v súbore `blog/views.py`.

Mali by sme otvoriť `blog/views.py` a pridať nasledovný kód ku ostatným `from` riadkom:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

A na konci súboru pridáme náš *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Áno. Nastal čas obnoviť stránku: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

Funguje to! Ale čo sa stane, keď klikneš na odkaz v názve príspevku blogu?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Ale nie! Ďalšia chyba! Ale už vieme, s čim mám dočinenia, že? Potrebujeme pridať šablónu!

## Vytvor šablónu pre detaily príspevku

Vytvoríme súbor v `blog/templates/blog` s názvom `post_detail.html`.

Bude to vyzerať takto:

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

Znova raz rozširujeme `base.html`. V bloku `content` chceme zobraziť published_date príspevku (pokiaľ existuje), titulok a text. Ale mali by sme prebrať pár dôležitých vecí, však?

{% raw %}`{% if ... %} ... {% endif %}` je tag šablóny, ktorý môžeme použiť ak chceme niečo skontrolovať. (Pamätáš si `if ... else ..` z **Úvodu do Pythonu**?) V tomto prípade chceme overiť či `published_date` príspevku nie je prázdny.{% endraw %}

Dobre, môžeme obnoviť našu stránku a pozrieť sa, či `TemplateDoesNotExist` zmizlo.

![Post detail page](images/post_detail2.png)

Jupí! Funguje to!

# Je čas nasadiť!

Bolo by dobré vedieť, či tvoja stránka stále funguje na PythonAnywhere, že? Pokúsme sa ju znova nasadiť.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --al .
    $ git status
    $ git commit -m "Pridaný view a šablóna pre detail príspevku blogu a taktiež CSS pre stránku."
    $ git push
    

Potom v [Bash konzole PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Nezabudni nahradiť `<your-pythonanywhere-username>` svojím uživateľským menom na PythonAnywhere, bez hranatých zátvoriek).

## Aktualizovanie statických súborov na serveri

Servre ako PythonAnywhere sa ku "statickým súborom" (ako CSS súbory) správajú inak ako ku Python súborom, lebo ich môžu optimalizovať aby ich bolo možné rýchlejšie načítať. Kvôli tomu, keď meníme naše CSS súbory, musíme spustiť ďalší príkaz na servri aby ich akutalizoval. Názov príkazu je `collectstatic`.

Začni spustením virtualenvu, ak už nie je aktívne (PythonAnywhere používa príkaz `workon`, je to presne ako `source myenv/bin/activate` príkaz ktorý si použila na vlastnom počítači):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

`manage.py collectstatic` príkaz sa trochu podobá na `manage.py migrate`. Robíme zmeny v našom kóde a potom povieme Django aby aplikoval (*apply*) tie zmeny, buď na statické súbory na servri, alebo do databázy.

A nakoniec preskoč na [kartu Web](https://www.pythonanywhere.com/web_app_setup/) and klinki na **Reload**.

A to by malo byť všetko! Gratulujeme :)