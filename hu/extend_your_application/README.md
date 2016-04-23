# Egészítsd ki az applikációdat

Most már teljesítettük az összes szükséges lépést a website-unk létrehozásához: tudjuk hogyan írjunk egy modelt, url-t, view-t és template-et. Azt is tudjuk, hogy hogyan csinosítsuk ki az oldalunkat.

Itt az idő gyakorolni!

Az első dolog, amire szükségünk van, nyilván egy oldal, ami megjelenít egy bejegyzést, ugye?

Már van egy `Post` modellünk, úgyhogy nem kell hozzáadnunk semmit a `models.py`-hoz.

## Template link a bejegyzés részleteihez

Kezdjük azzal, hogy hozzáadunk egy linket a `blog/templates/blog/post_list.html` fájlhoz. Eddig így kell kinéznie:

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```
    

{% raw %}Szükségünk van egy linkre a bejegyzések címei és a bejegyzések részletes oldala között. Cseréljük ki a `<h1><a href="">{{ post.title }}</a></h1>` sort úgy, hogy a bejegyzés részletes oldalára vezet: {% endraw %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Itt az ideje elmagyarázni a rejtélyes `{% url 'post_detail' pk=post.pk %}` részt. Ahogy gyaníthattad, a `{% %}` jelölés azt jelenti, hogy Django template tag-eket használunk. Ezúttal egy olyat, ami létrehoz egy URL-t nekünk!{% endraw %}

A `blog.views.post_detail` egy elérési út a `post_detail` *view*-hez, amit létre akarunk hozni. Jegyezd meg: `blog` az applikációnk neve (a `blog` könyvtár), `views` a `views.py` nevéből van, és az utolsó rész - `post_detail` - a *nézet* neve.

Most amikor a http://127.0.0.1:8000/ címre megyünk, lesz egy hibaüzenetünk (ahogy vártuk is, mivel nincsen sem URL, sem *view* a `post_detail`-hez). Így fog kinézni:

![NoReverseMatch hiba][1]

 [1]: images/no_reverse_match2.png

## URL a bejegyzés részleteihez

Hozzunk létre egy URL-t a `urls.py`-ban a `post_detail` *view*-hoz!

Az első bejegyzésünk részleteit a kövekező **URL** címen akarjuk megjeleníteni: http://127.0.0.1:8000/post/1/

Hozzunk létre egy URL-t a `blog/urls.py` fájlban, ami egy `post_detail` nevű *view*-ra mutat -- ez majd egy egész blogbejegyzést jelenít meg. Add hozzá a `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),` sort a `blog/urls.py` fájlhoz. Így kell kinéznie a fájlnak:

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
]
```

Ez a rész `^post/(?P<pk>[0-9]+)/$` elég ijesztően néz ki, de ne aggódj,elmagyarázzuk: - `^`-vel kezdődik -- "eleje" - `post/` azt jelenti, hogy az eleje után az URL-nek tartalmaznia kell ezt: **post** és **/**. Eddig jó. - `(?P<pk>[0-9]+)` - ez a rész trükkösebb. Ez azt jelenti, a Django fogja, amit ideraksz, és átirányítja egy nézethez egy `pk` nevű változóként. `[0-9]` azt közli, hogy ez csak egy számjegy lehet, betű nem (tehát minden 0 és 9 között). `+` azt jelenti, hogy egy vagy több számjegynek kell lennie. Tehát `http://127.0.0.1:8000/post//` nem érvényes, de `http://127.0.0.1:8000/post/1234567890/` teljesen jó! - `/` - kell még egy **/** - `$` - "vége"!

Ez azt jelenti, hogy ha beírod a `http://127.0.0.1:8000/post/5/` címet a böngésződbe, akkor a Django megérti, hogy egy `post_detail` nevű 1>nézetet</em> keresel, és közvetíti az információt, hogy a `pk` `5-tel` egyenlő annál a *nézetnél*.

`pk` a `primary key` rövid változata. Ezt a kifejezést gyakran használják Django projektekben. De úgy nevezed el a változódat, ahogy akarod (ne feledd: kisbetűkkel és szóköz helyett `_` karakterrel!). Például `(?P<pk>[0-9]+)` esetén használhatunk `post_id` változót, amivel így nézne ki: `(?P<post_id>[0-9]+)`.

Ok, hozzáadtunk egy új URL-t a `blog/urls.py`-hoz! Frissítsük az oldalt: http://127.0.0.1:8000/ Boom! Már megint egy újabb hiba! Várható volt!

![AttributeError][2]

 [2]: images/attribute_error2.png

Emlékszel, mi a következő lépés? Hát persze: hozzáadni egy új nézetet!

## Nézet a bejegyzés részleteihez

Ezúttal adunk a *nézetünknek* egy extra paramétert: `pk`. A *nézetünknek* ezt meg kell kapnia, igaz? Úgyhogy a function-t úgy fogjuk meghatározni, hogy `def post_detail(request, pk):`. Jegyezd meg, hogy pontosan ugyanazt a nevet kell használnunk, amit az url-ben jelöltünk meg (`pk`). A változó kihagyása helytelen, és hibát fog eredményezni!

Most egyetlen egy blogbejegyzést akarunk szerezni. Ehhez egy ilyen queryset-et használhatunk:

    Post.objects.get(pk=pk)
    

De ennél a kódnál van egy kis gond. Ha nincsen `Post` az adott `primary key`-vel (`pk`), akkor egy nagyon csúnya hibát kapunk!

![DoesNotExist hiba][3]

 [3]: images/does_not_exist2.png

Mi ezt nem akarjuk! De, természetesen a Django-nak van valamije, ami ezt megoldja nekünk: `get_object_or_404`. Abban az esetben, ha nincsen `Post` az adott `pk`-val, akkor egy sokkal szebb oldalt ad ki (`Page Not Found 404` oldalt).

![Az oldal nem található][4]

 [4]: images/404_2.png

A jó hír az, hogy elkészítheted a saját `Page not found` oldaladat, és olyan szépre alakíthatod, amilyenre akarod. De ez nem olyan fontos egyelőre, úgyhogy átugorhatjuk.

Oké, itt az idő, hogy hozzáadjuk a *view*-t a `views.py` fájlunkhoz!

Nyisd meg a `blog/views.py` fájlt és add hozzá a következő kódot:

    from django.shortcuts import render, get_object_or_404
    

A többi `from` sor mellé. És a fájl alján hozzáadjuk a *view*-t:

    def post_detail(request, pk):
        post = get_object_or_404(Post, pk=pk)
        return render(request, 'blog/post_detail.html', {'post': post})
    

Igen. Ideje frissíteni az oldalt: http://127.0.0.1:8000/

![Post list nézet][5]

 [5]: images/post_list2.png

Sikerült! De mi történik, ha ráklikkelsz egy linkre a blog bejegyzés címében?

![TemplateDoesNotExist hiba][6]

 [6]: images/template_does_not_exist2.png

Jaj ne! Egy másik hiba! De már tudjuk, hogyan kezeljük, igaz? Létre kell hoznunk egy template-et!

## Template a bejegyzés részleteihez

Létrehozunk egy fájlt a `blog/templates/blog` könyvtárban, és elnevezzük: `post_detail.html`.

Ez fog történni:

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
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endblock %}
```

Itt megint a `base.html`-t bővítjük ki. A `content` blokkban meg szeretnénk jeleníteni a bejegyzés címét, szövegét és a megjelenési idejét (published_date) - ha van. De pár fontos dolgot tisztáznunk kell még, igaz?

{% raw %}`{% if ... %} ... {% endif %}` egy template tag, amit akkor használni, amikor ellenőrizni akarunk valamit (emlékszel az `if ... else ..` részre a **Bevezetés a Python-ba** fejezetnél?). Ebben az esetben azt akarjuk leellenőrizni, hogy a bejegyzés `published_date` eleme nem üres.{% endraw %}

Ok, most már frissíthetjük az oldalunkat és kiderül, hogy a `Page not found` eltűnt.

![Post részletei oldal][7]

 [7]: images/post_detail2.png

Juppi! Működik!

## Még egy dolog: itt az ideje egy újabb deploynak!

Jó lenne ellenőrizni, hogy még mindig működik-e a weboldalad a PythonAnywhere-en, igaz? Próbáld meg újra deployolni.

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

*   Aztán írd be ezt a [PythonAnywhere Bash konzol][8]ba:

 [8]: https://www.pythonanywhere.com/consoles/

    $ cd my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]
    

*   Végül menj a [Web tab][9]-ra, és nyomj **Reload**ot.

 [9]: https://www.pythonanywhere.com/web_app_setup/

Ennyi az egész. Gratulálunk :)