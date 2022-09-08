# Django URL

Chystáme sa vytvoriť našu prvú webovú stránku: domovskú stránka tvojho blogu! Ale ešte predtým sa poďme naučiť niečo o Django URL.

## Čo je URL?

URL je webová adresa. URL si môžeš všimnúť zakaždým, keď navštíviš webovú stránku - vidno ju v prehliadači. (Áno! `127.0.0.1:8000` je URL! A `https://djangogirls.org` je tiež URL.)

![URL](images/url.png)

Každá stránka na internete potrebuje svoju vlastnú URL. Tak aplikácia vie, čo by mala ukázať užívateľke či užívateľovi, ktorý otvorí URL. V Djangu používame takzvaný `URLconf` (URL konfiguráciu). URLconf je súbor vzorov, ktoré sa Django pokúsi porovnať s prijatou URL, aby tak našiel správny view.

## Ako fungujú URL v Djangu?

Otvorme súbor `mysite/urls.py` v editore kódu a pozrime sa, ako vyzerá:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Ako vidíš, Django sem už pre nás niečo umiestnilo.

Riadky medzi trojitými uvodzovkami (`'''` or `"""`) sa nazývajú docstringy - môžeš ich pridať na začiatku súboru, triedy alebo metódy, aby si popísala, čo robí. Python ich nebude spúšťať.

Adminovská URL, ktorú si navštívila v predchádzajúcej kapitole, je už tu:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Tento riadok znamená, že pre každú URL, ktorá začína na `admin`, Django nájde zodpovedajúci *view*. V tomto prípade pridávame množstvo adminovských URL, takže to nie je všetko natlačené v jednom malom súbore - je to čitateľnejšie a čistejšie.

## Tvoja prvá Django URL!

Je čas vytvoriť našu prvú URL! Chceme, aby 'http://127.0.0.1:8000/' bola domovská stránka nášho blogu a zobrazovala zoznam príspevkov.

Tiež chceme udržiavať súbor `mysite/urls.py` čistý, takže naimportujeme URL z našej aplikácie `blog` do hlavného súboru `mysite/urls.py`.

Poď na to, pridaj riadok, ktorý naimportuje `blog.urls`. Budeš tiež musieť zmeniť riadok `from django.urls…`, pretože v súbore chceme používať funkciu `include`, takže ju musíme pridať k importom.

Súbor `mysite/urls.py` by mal teraz vyzerať takto:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django teraz presmeruje všetko, čo prichádza na 'http://127.0.0.1:8000/', do `blog.urls` a tam bude hľadať ďalšie inštrukcie.

## blog.urls

Vytvor nový prázdny súbor s názvom `urls.py` v priečinku `blog` a otvor ho v editore. Okej! Pridaj tieto prvé dva riadky:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Tu iba importujeme Django metódu `path` a všetky naše `viewy` z aplikácie `blog` (zatiaľ žiadne nemáme, ale k tomu sa o chvíľu dostaneme!)

Potom môžeme pridať náš prvý URL vzor:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Ako vidíš, priradili sme základnej URL `view` pod názvom `post_list`. Takýto URL vzor zaberie na prázdny string a Django URL resolver bude ignorovať meno domény (teda http://127.0.0.1:8000/), ktorá predchádza celej URL ceste. Tento vzor hovorí Djangu, že ak niekto vstúpi na tvoju stránku na adrese "http://127.0.0.1:8000/", má sa oňho postarať `views.post_list`.

Posledná časť `name='post_list'` je názov URL, ktorý sa použije na identifikáciu správneho viewu. Názov URL môže byť rovnaký ako názov viewu, ale pokojne to môže byť aj niečo úplne iné. Neskôr budeme v projekte používať pomenované URL, takže je dôležité pomenovať všetky URL v aplikácii. Názvy by mali byť unikátne a ľahké na zapamätanie.

Ak sa teraz pokúsiš navštiviť http://127.0.0.1:8000/, uvidíš správu, že stránka nie je dostupná ("web page not available"). Toto je z toho dôvodu, že server (spomínaš si, ako si spúšťala `runserver`?) už nebeží. Pozri sa na konzolu svojho serveru, aby si zistila prečo.

{% filename %}{{ warning_icon }} command-line{% endfilename %}

        return _bootstrap._gcd_import(name[level:], package, level)
      File "<frozen importlib._bootstrap>", line 1030, in _gcd_import
      File "<frozen importlib._bootstrap>", line 1007, in _find_and_load
      File "<frozen importlib._bootstrap>", line 986, in _find_and_load_unlocked
      File "<frozen importlib._bootstrap>", line 680, in _load_unlocked
      File "<frozen importlib._bootstrap_external>", line 850, in exec_module
      File "<frozen importlib._bootstrap>", line 228, in _call_with_frames_removed
      File "/Users/ola/djangogirls/blog/urls.py", line 5, in <module>
        path('', views.post_list, name='post_list'),
    AttributeError: module 'blog.views' has no attribute 'post_list'
    

Konzola zobrazuje chybu, ale neboj sa - je to práveže nápomocné: hovorí ti, že neexistuje atribút post_list (**no attribute 'post_list'**). To je názov *viewu*, ktorý sa Django pokúša nájsť a použiť, ale my sme ho ešte nevytvorili. V tejto fáze `/admin/` tiež nefunguje. Žiadne obavy, aj k tomu sa dostaneme. Ak vidíš inú chybovú hlášku, skúš reštartovať web server. To môžeš docieliť tak, že v príkazovom okne, kde beží tvoj web server, stlačíš Ctrl + C (klávesy Control a C) naraz. Na Windowse možno bude treba stlačiť Ctrl + Break. Svoj web server potom znova spustíš príkazom `python manage.py runserver`.

> Ak chceš vedieť viac o Django URL konfigurácii, pozri sa na oficiálnu dokumentáciu: https://docs.djangoproject.com/en/3.2/topics/http/urls/