# Django URL

Chystáme sa vytvoriť našu prvú webovú stránku: domovská stránka tvojho blogu! Ale ešte predtým sa poďme naučiť niečo o Django URL.

## Čo je URL?

URL je jednoducho povedané webová adresa. URL si môžeš všimnúť zakaždým, keď navštíviš webovú stránku - vidno ju v prehliadači. (Áno! `127.0.0.1:8000` je URL! A `https://djangogirls.org` je tiež URL.)

![Url](images/url.png)

Každá stránka na internete potrebuje svoju vlastnú URL. Týmto spôsobom aplikácia vie, čo by mala ukázať užívateľovi, ktorý otvorí URL. V Djangu používame takzvaný `URLconf` (URL konfigurácia). URLconf je súbor vzorov, ktoré sa Django pokúsi priradiť podľa prijatej URL, aby tak našiel správne zobrazenie.

## Ako fungujú URL v Djangu?

Otvorme súbor `mysite/urls.py` v editore kódu a pozrime sa, ako vyzerá:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Ako vidíš, Django sem už pre nás niečo umiestnil.

Riadky medzi trojitými uvodzovkami (`'''` or `"""`) sa nazývajú docstringy - môžeš ich pridať na začiatku suboru, triedy, alebo metódy aby si popísala čo robí. Python ich nespustí.

Adminovská URL, ktorú si navštívila v predchádzajúcej kapitole je už tu:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Tento riadok znamená, že pre každú URL, ktorá začína na `admin` Django nájde zodpovedajúce *zobrazenie (view)*. V tomto prípade pridávame množstvo adminovských URL, takže to nie je všetko natlačené v jednom malom súbore -- je to čitateľnejšie a čistejšie.

## Tvoja prvá Django URL!

Je čas vytvoriť našu prvú URL! Chceme, aby 'http://127.0.0.1:8000/' bola domovská stránka nášho blogu a zobrazovala zoznam príspevkov.

Tiež chceme udržiavať súbor `mysite/urls.py` čistý, takže naimportujeme URL z našej aplikácie `blog` do hlavného súboru `mysite/urls.py`.

Tak do toho, pridaj riadok čo importuje `blog.urls`. Všimni si, že používame funkciu `include` takže ju budeš musieť taktiež importovať.

Súbor `mysite/urls.py` by mal teraz vyzerať takto:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django teraz presmeruje všetko, čo prichádza na 'http://127.0.0.1:8000/' do `blog.urls` a tam bude hľadať ďalšie inštrukcie.

## blog.urls

Vytvor nový prázdny súbor s názvom `urls.py` v priečinku `blog`. Dobre! Pridaj tieto dva riadky:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Tu iba importujeme Django metódu `path` a všetky naše `views` z aplikácie `blog` (zatiaľ žiadne nemáme, ale k tomu sa o chvíľu dostaneme!)

Potom môžeme pridať náš prvý URL vzor:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

Posledná časť `name='post_list'` je názov URL, ktorý sa použije na identifikáciu zobrazenia. Názov URL môže byť rovnaký ako názov view, ale pokojne to môže byť aj niečo úplne iné. Neskôr budeme v projekte používať pomenované URL, takže je dôležité pomenovať všetky URL v aplikácii. Názvy by mali byť unikátne a ľahké na zapamätanie.

Ak sa teraz pokúsiš navštiviť http://127.0.0.1:8000/ uvidíš správu, že stránka nie je dostupná ('web page not available'). Toto je z toho dôvodu že server (spomínaš si keď si spúšťala `runserver`?) už nebeží. Pozri sa na konzolu svojho serveru, aby si zistila prečo.

![Chyba](images/error1.png)

Konzola zobrazuje chybu, ale neboj sa - je to pomerne užitočné: hovorí ti, že neexistuje atribút post_list (**no attribute 'post_list'**). To je názov *view*, ktorý sa Django pokúša nájsť a použiť, ale sme ho ešte nevytvorili. V tejto fáze `/admin/` tiež nefunguje. Žiadne obavy, aj k tomu sa dostaneme.

> Ak chceš vedieť viac o Django URLconfs, pozri sa na oficiálnu dokumentáciu: https://docs.djangoproject.com/en/2.0/topics/http/urls/