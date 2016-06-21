# Django url

Chystáme sa vytvoriť našu prvú web stránku: domovská stránka tvojho blogu! Ale ešte predtým sa poďme naučiť niečo o Django url.

## Čo je URL?

URL je jednoducho webová adresa. URL si môžeš všimnúť zakaždým, keď navštíviš webovú stránku - vidno ju v prehliadači v adresnom riadku (áno! `127.0.0.1:8000` je URL! A `https://djangogirls.org` je tiež URL):

![Url][1]

 [1]: images/url.png

Každá stránka na internete potrebuje svoju vlastnú URL. Týmto spôsobom aplikácia vie, čo by mala ukázať užívateľovi, ktorý otvorí URL. V Djangu používame takzvaný `URLconf` (URL konfigurácia). URLconf je súbor vzorov, ktoré sa Django pokúsi priradiť podľa prijatej URL, aby tak našiel správne zobrazenie.

## Ako fungujú URL v Djangu?

Otvorme súbor `mysite/urls.py` v editore kódu a pozrime sa, ako vyzerá:

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

Ako vidíš, Django sem už pre nás niečo umiestnil.

Riadky, ktoré začínajú s `#` sú komentáre - to znamená, že tie riadky Python nespustí. Šikovné, nie?

Adminská URL, ktorú si navštívila v predchádzajúcej kapitole je už tu:

```python
url(r'^admin/', include(admin.site.urls)),
```

To znamená, že pre každú URL, ktorá začína na `admin` Django nájde zodpovedajúce *zobrazenie (view)*. V tomto prípade pridávame množstvo adminských URL, takže to nie je všetko natlačené v jednom malom súbore -- je to čitateľnejšie a čistejšie.

## Regex

Zaujíma ťa, ako Django porovnáva URL so zobrazeniami? No, to je trochu zložitejšie. Django používa `regex`, čo je skratka pre "regulárne výrazy". Regex má veľa (veľa!) pravidiel, ktoré tvoria vzor vyhľadávania. Keďže regexy sú pokročilá téma, nebudeme sa nimi veľmi detailne zaoberať.

Ak chceš porozumieť tvorbe vzorov, tu je príklad procesu - budeme potrebovať iba obmedzenú množinu pravidiel, ktorými vyjadríme vzor, ktorý hľadáme, konkrétne:

```
^ pre začiatok textu
$ pre koniec textu
\d pre číslicu
+ indikuje, že predchádzajúca položka sa má zopakovať aspoň raz
() ohraničuje časť vzoru
```

Všetko ostatné v definícii url bude brané doslovne.

Teraz si predstav, že máš webovú stránky s adresou napríklad `http://www.mysite.com/post/12345/`, kde `12345` je číslo tvojho postu.

Písať samostatné views pre všetky čísla postov by bolo vážne otravné. S regulárnym výrazom však vieme vytvoriť vzor, ktorý bude zodpovedať url a vyextrahovať z nej číslo, ktoré potrebujeme: `^post/(\d+)/$`. Rozoberme si to na drobné, aby sme videli, čo sa tu vlastne deje:

*   **^post/** hovorí Djangu, aby zobral čokoľvek, čo má na začiatku url `post` (hneď po `^`)
*   **(\d+)** znamená, že tam bude číslo (jedna alebo viac číslic) a že chceme číslo zachytiť a extrahovať
*   **/** povie Djangu, že bude nasledovať ďalší znak `/`
*   **$** potom označuje koniec adresy URL, čo znamená, že vzoru budú zodpovedať iba reťazce s `/` na konci

## Tvoja prvá Django url!

Je čas vytvoriť našu prvú URL! Chceme, aby 'http://127.0.0.1:8000/' bola domovská stránka nášho blogu a zobrazovala zoznam príspevkov.

Tiež chceme udržiavať súbor `mysite/urls.py` čistý, takže naimportujeme url z našej aplikácie `blog` do hlavného súboru `mysite/urls.py`.

Neboj sa, zmaž všetky zakomentované riadky (tie, čo začínajú `#`) a pridaj riadok, ktorý naimportuje `blog.urls` do hlavnej url (`''`).

Súbor `mysite/urls.py` by mal teraz vyzerať takto:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include('blog.urls')),
]
```

Django teraz presmeruje všetko, čo prichádza na 'http://127.0.0.1:8000/' do `blog.urls` a tam bude hľadať ďalšie inštrukcie.

Pri písaní regulárnych výrazov je vždy dobré pridať pred reťazec `r`. To je užitočný tip pre Python, že reťazec môže obsahovať špeciálne znaky, ktoré nie sú urečené pre Python samotný, ale pre regulárny výraz.

## blog.urls

Vytvor nový prázdny súbor `blog/urls.py`. Dobre! Pridaj tieto prvé dva riadky:

```python
from django.conf.urls import url
from . import views
```

Tu iba importujeme Django metódy a všetky naše `views` z aplikácie `blog` (zatiaľ žiadne nemáme, ale k tomu sa o chvíľu dostaneme!)

Potom môžeme pridať náš prvý URL vzor:

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Ako vidíš, priradili sme `view` s názvom `post_list` tejto URL: `^$`. Tento regulárny výraz sa bude zhodovať iba ak po `^` (začiatku) bude nasledovať `$` (koniec) - takže zodpovedať bude iba prázdny reťazec. To je správne, pretože v Django URL prekladači 'http://127.0.0.1:8000/' nie je súčasťou URL. Tento vzor povie Djangu, že `views.post_list` je to správne miesto, kam treba ísť, ak niekto vstúpi na stránku cez adresu 'http://127.0.0.1:8000/'.

Posledná časť `name='post_list'` je názov URL, ktorý sa použije na identifikáciu view. Názov URL môže byť rovnaký ako názov view, ale pokojne to môže byť aj niečo úplne iné. Neskôr budeme v projekte používať pomenované URL, takže je dôležité pomenovať všetky URL v aplikácii. Názvy by mali byť unikátne a ľahké na zapamätanie.

Všetko v poriadku? Otvor http://127.0.0.1:8000/ vo svojom prehliadači a pozri sa na výsledok.

![Chyba][2]

 [2]: images/error1.png

"Funguje to!" zmizlo, čo? Neboj sa, je to len chybová stránka, nič, čoho by si sa mala báť! Vlastne bývajú celkom užitočné:

Môžeš si prečítať, že neexistuje **žiadny atribút post_list**. Pripomína ti *post_list* niečo? Tak sme nazvali náš view! To znamená, že je všetko v poriadku, len sme ešte nevytvorili náš *view*. Žiadne obavy, aj k tomu sa dostaneme.

> Ak chceš vedieť viac o Django URLconfs, pozri sa na oficiálnu dokumentáciu: https://docs.djangoproject.com/en/1.8/topics/http/urls/
