# Django url-ek

Mindjárt elkészíted az első weblapodat: a blogod honlapját! De előbb tanuljunk egy kicsit a Django url-ekről.

## Mi az URL?

Az URL egyszerűen csak egy webes cím. Minden alkalommal látsz URL-eket, amikor meglátogatsz egy weboldalt - a böngésződ címsorában találodm meg (igen! a `127.0.0.1:8000` egy URL! És a `https://djangogirls.org` is egy URL):

![Url][1]

 [1]: images/url.png

Az interneten minden oldalnak szüksége van egy saját URL-re. Innen tudja az alkalmazásod, hogy mit mutasson a felhasználónak, aki megnyitott egy URL-t. A Django-ban egy `URLconf` nevű dolgot használunk (URL configuration, vagyis URL beállítások). Az URLConf egy csomó minta, amit a Django megpróbál összehasonlítani az URL-lel, amit kapott, és ez alapján találja meg a helyes view-t.

## Hogy működnek az URL-ek a Django-ban?

Nyisd meg a `mysite/urls.py` fájlt a kódszerkesztőben, és nézd meg:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
]
```

Amint láthatod, a Django már előre iderakott nekünk pár dolgot.

Azok a sorok, amik így kezdődnek: `#`, kommentek - ez azt jelenti, hogy ezeket a sorokat a Python nem futtatja le. Hasznos, igaz?

Az admin URL, amit az előző fejezetben már meglátogattál, már itt van:

```python
    url(r'^admin/', include(admin.site.urls)),
```

Ez azt jelenti, hogy minden URL-nél, ami `admin/`-nal kezdődik, a Django meg fogja találni a hozzátartozó *view*-t. Ebben az esetben sok admin URL-t hozzáadunk, hogy ne kelljen az egészet ebbe a kis fájlba tömni - így olvashatóbb és letisztultabb.

## Regex

Kíváncsi vagy, hogyan párosítja össze a Django az URL-eket és a view-kat? Na, ez a rész trükkös. A Django `regex`-et használ (a "regular expressions", vagyis reguláris kifejezések rövidítése). A regexnek nagyon (nagyon!) sok szabálya van arra, hogy hogyan épít fel egy keresési mintázatot. Mivel a regex egy magasabb szintű téma, most nem megyünk bele a részletekbe.

Ha szeretnéd megérteni, hogy hogyan hoztuk létre a mintákat, itt egy példa - csak néhány szabályra van szükségünk, hogy felépítsük a mintát, amit keresünk, például:

    ^ a szöveg eleje
    $ a szöveg vége
    \d számjegy
    + ez azt jelzi, hogy az előző elem egynél többször ismétlődik
    () ez a minta egy részét fogja össze
    

A Django minden mást, ami az url definícióban van, szó szerint fog értelmezni.

Képzeld el, hogy van egy weboldalad ezzel a címmel: `http://www.mysite.com/post/12345/`, ahol a `12345/` a bejegyzésed száma.

Minden egyes poszt számához új view-t írni nagyon idegesítő lenne. A reguláris kifejezésekkel létrehozhatunk egy mintát, ami megtalálja az URL-t, és kiszedi belőle a számot: `^post/(\d+)/$`. Nézzük meg lépésről lépésre, hogy mi történik itt:

*   A **^post/** azt mondja meg a Django-nak, hogy minden olyan url-t találjon meg, ami `post/`-tal kezdődik (rögtön ezután: `^`)
*   A **(\d+)** azt jelenti, hogy ezután egy szám fog következni (egy vagy több számjegyű), és ezt a számot ki szeretnénk olvasni az URL-ből
*   A **/** azt mondja meg a Django-nak, hogy utána még egy `/` karakternek kell következnie
*   A **$** az URL végét jelzi, vagyis csak azok a stringeket fogja megfeleltetni a mintának, amik így végződnek: `/`

## Az első Django URL-ed!

Itt az ideje, hogy létrehozzuk az első URL-t! Azt szeretnénk, ha a 'http://127.0.0.1:8000/' lenne a blog kezdőoldala, és itt egy listát láthatnánk a blogbejegyzésekből.

Fontos, hogy tisztán tartsuk a `mysite/urls.py` fájlt, ezért a `blog` alkalmazásból fogjuk importálni az url-eket.

Töröld ki a kikommentelt soroket (azokat, amik `#` jellel kezdődnek), és adj hozzá egy sort, ami importálja a `blog.urls` a fő url-be (`''`).

A `mysite/urls.py` fájlod most így néz ki:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include('blog.urls')),
]
```

Mostantól a Django mindent, ami a 'http://127.0.0.1:8000/'-re jön, átirányít a `blog.urls`-re, és ott fogja keresni a további tennivalókat.

Amikor Pythonban írunk reguláris kifejezéseket, a stringek előtt mindig egy `r` áll. Ez egy hasznos tipp a Pythonnak, hogy a string tartalmazhat speciális karaktereket, de ezek a reguláris kifejezés alkotóelemei, és nem magának a Pythonnak szólnak.

## blog.urls

Hozz létre egy új, üres fájlt `blog/urls.py` néven. Nagyszerű! Most írd be az első két sort:

```python
from django.conf.urls import url
from . import views
```

Itt csak annyi történik, hogy importáljuk a Django methodjait és az összes `view`nkat a `blog` alkalmazásból (még egyet sem írtunk meg, de mindjárt ezzel is foglalkozunk!)

Ezután megírhatjuk az első URL mintát:

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Amint láthatod, itt egy `post_list` nevű `view`t rendeltünk hozzá a `^$` URL-hez. Ez a regex a `^` karaktert (string kezdete) és az utána következő `$` karaktert (string vége) fogja keresni - vagyis csak az üres string felel meg neki. Ez így helyes, mert a Django URL resolverében a 'http://127.0.0.1:8000/' nem számít az URL részének. Ez a minta mondja meg a Django-nak, hogy ha valaki a 'http://127.0.0.1:8000/' címen lép be a weboldaladra, a `views.post_list` a helyes lépés.

Az utolsó rész, `name='post_list'` az URL neve, amit a view azonosítására használunk. Ez lehet ugyanaz, mint a view neve, de lehet teljesen más is. A projekt későbbi részeiben ezeket az elnevezett URL-eket fogjuk használni, ezért fontos, hogy az app minden URL-jének nevet adjunk. Törekedj arra, hogy egyedi és könnyen megjegyezhető neveket adj.

Minden világos? Nyisd meg a http://127.0.0.1:8000/ URL-t a böngésződben, hogy lásd az eredményt.

![Hiba][2]

 [2]: images/error1.png

Már nincs ott az "It works", igaz? Ne aggódj, ez csak egy hibaoldal, semmi félelmetes nincs benne! Tulajdonképpen nagyon is hasznos az ilyesmi:

Azt olvashatod, hogy **no attribute 'post_list'**, vagyis "nincs post_list nevű attribútum". Eszedbe jut valami a *post_list*-ről? Így neveztük el a view-t! Ez azt jelenti, hogy minden a megfelelő helyen van, csak még nem hoztuk létre a *view*-t. Ne aggódj, mindjárt eljutunk odáig.

> Ha többet szeretnél megtudni a Django URLconf-ról, nézz bele a hivatalos dokumentációba: https://docs.djangoproject.com/en/1.8/topics/http/urls/