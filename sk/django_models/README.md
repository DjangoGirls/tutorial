# Django modely

Teraz pôjdeme vytvoriť niečo, čo bude uchovávať naše blogové príspevky. Aby sme to vedeli spraviť, musíme si najskôr povedať niečo o `objektoch`.

## Objekty

V programovaní sa používa pojem `objektovo orientované programovanie`. Myšlienka spočíva v tom, že namiesto vypisovania nudných sekvencií programátorských príkazov môžeme veci modelovať a definovať, ako majú navzájom komunikovať.

Takže, čo je to objekt? Je to zbierka vlastností a akcií. Znie to čudne, ale ukážeme si príklad.

Ak chceme namodelovať mačku, vytvoríme objekt `Macka`, ktorá má nejaké vlastnosti, napríklad: `farba`, `vek`, `nalada` (t. j. dobrá, zlá, ospalá ;)), a `majitelka` (ktorý je objektom `Osoba`, alebo možno v prípade túlavej mačky bude táto vlastnosť prázdna).

Ďalej má `Macka` niekoľko akcií: `priast`, `skriabat` alebo `krmit` (v ktorej dáme mačke nejaké `MacacieZradlo`, ktoré by mohlo byť samostatným objektom s vlastnosťami, napr. `chut`).

    Macka
    --------
    farba
    vek
    nalada
    majitelka
    priast()
    skriabat()
    krmit(mac_zradlo)
    
    
    MacacieZradlo
    --------
    chut
    

    MacacieZradlo
    --------
    chut
    

Takže v podstate hlavná myšlienka je popísať reálne veci kódom pomocou vlastností (ktorým hovoríme `vlastnosti objektu/object properties`) a akcií (tie nazývame `metódy`).

Ako teda budeme modelovať blogový príspevok? Chceme predsa vytvoriť blog, nie?

Musíme odpovedať na otázku: Čo je vlastne blogový príspevok? Aké vlastnosti by mal mať?

No, náš blogový príspevok určite potrebuje nejaký text s obsahom a titulkom, nie? Bolo by tiež fajn vedieť, kto ho napísal - takže potrebujeme autorku či autora. A nakoniec, chceme vedieť, kedy bol príspevok vytvorený a zverejnený.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Čo všetko môžeme s blogovým príspevkom robiť? Bolo by dobré mať nejakú `metódu`, ktorá príspevok publikuje, však?

Takže budeme potrebovať metódu `publish`.

Keďže už vieme, čo chceme dosiahnuť, začnime tvoriť model v Djangu!

## Django model

Keďže už vieme, čo je objekt, môžeme vytvoriť Django model pre náš blogový príspevok.

Model v Djangu je špeciálny typ objektu - je uložený v `databáze`. Databáza je súbor údajov. Je to miesto, kde budeš ukladať informácie o užívateľoch/užívateľkách, blogových príspevkoch atď. Na ukladanie údajov budeme používať databázu SQLite. Je to prednastavený databázový adaptér v Djangu -- nateraz nám bude stačiť.

Model v databáze si môžeš predstaviť ako tabuľku so stĺpcami (polia) a riadkami (dáta).

### Vytvorenie aplikácie

Aby sme mali všetko pekne upratané, vytvoríme vo vnútri nášho projektu samostatnú aplikáciu. Je dobré mať všetko zorganizované hneď od začiatku. Aby sme vytvorili aplikáciu, musíme v konzole spustiť nasledujúci príkaz (v priečinku `djangogirls`, kde sa nachádza súbor `manage.py`):

{% filename %}Mac OS X a Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Uvidíš, že pribudne nový priečinok `blog`, ktorý obsahuje množstvo súborov. Priečinky a súbory v našom projekte by mali vyzerať takto:

    djangogirls
    ├── blog
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── asgi.py
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    
    

Po vytvorení aplikácie tiež musíš Djangu povedať, že ju má použiť. To spravíme v súbore `mysite/settings.py` - otvor ho vo svojom editore. Musíme nájsť `INSTALLED_APPS` a pridať riadok `'blog',` tesne pred uzatváraciu zátvorku `]`. Takže výsledok nášho snaženia bude vyzerať takto:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### Vytvorenie modelu príspevku

V súbore `blog/models.py` definujeme všetky objekty, ktoré sa nazývajú `modely` - na tomto mieste definujeme náš príspevok.

Otvor `blog/models.py` v editore, všetko z neho odstráň a napíš nasledovný kód:

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Dvakrát skontroluj, či si použila 2 podčiarkovníky (`_`) na oboch stranách `str`. Táto konvencia sa v Pythone často používa a niekedy sa tomu hovorí "dunder" (skratka pre anglické double-underscore).

Vyzerá to strašidelne, nie? Ale neboj sa, vysvetlíme si, čo tieto riadky znamenajú!

Všetky riadky začínajúce na `from` alebo `import` pridávajú časti z iných súborov. Takže namiesto kopírovania tých istých vecí v každom súbore môžeme vložiť niektoré časti pomocou `from ... import ...`.

`class Post(models.Model):` - tento riadok definuje náš model (je to `objekt`).

- `class` je špeciálne kľúčové slovo, ktoré naznačuje, že definujeme objekt.
- `Post` je meno nášho modelu. Môžeme mu dať iný názov (ale musíme sa vyhnúť špeciálnym znakom a medzerám). Názov triedy vždy začni písmenami.
- `models.Model` znamená, že Post je djangový model, takže Django vie, že by mal byť uložený v databáze.

Teraz zadefinujeme vlastnosti, o ktorých sme hovorili: `title` (titulka), `text`, `created_date` (dátum vytvorenia), `published_date` (dátum zverejnenia) a `author` (autor(ka)). Na to ale musíme zadefinovať typ každého poľa (Je to text? Číslo? Dátum? Vzťah k inému objektu, napr. objektu User?)

- `models.CharField` - takto môžeš definovať text s obmedzeným počtom znakov.
- `models.TextField` - toto je pre dlhé texty bez obmedzenia. To znie ideálne pre blogový príspevok, nie?
- `models.DateTimeField` - toto je dátum a čas.
- `models.ForeignKey` - toto je odkaz na iný model.

Nebudeme si tu vysvetľovať každý kúsok kódu, pretože by to zabralo príliš veľa času. Ak chceš vedieť viac o modelových poliach a definovaní ďalších vecí okrem tých, čo sme popísali vyššie, skús sa pozrieť do dokumentácie Djanga (https://docs.djangoproject.com/en/3.2/ref/models/fields/#field-types).

A čo `def publish(self):`? To je presne tá metóda `publish`, o ktorej sme hovorili predtým. `def` znamená, že ide o funkciu/metódu, a `publish` je jej názov. Názov metódy môžeš zmeniť, ak chceš. Pravidlo pre názvy metód je, že používame malé písmená a podčiarkovníky namiesto medzier. Napríklad metóda, ktorá vypočíta priemernú cenu by sa mohla nazývať `pocitaj_priemernu_cenu`.

Metódy často niečo vracajú (`return`). Príklad nájdeš napríklad v metóde `__str__`. V tomto prípade, keď zavoláme `__str__()`, dostaneme text (**string**) s názvom príspevku.

Tiež si všimni, že `def publish(self):` a `def __str__(self):` sú odsadené vo vnútri našej triedy. Keďže Python je citlivý na medzery, musíme odsadiť naše metódy vo vnútri triedy. Inak metódy nebudú patriť do triedy a môže dojsť k neočakávanému správaniu.

Ak čokoľvek nie je jasné, neváhaj a spýtaj sa mentora či mentorky! Vieme, že je to komplikované, najmä ak sa učíš, čo sú objekty a funkcie súčasne. Ale dúfame, že teraz už to vyzerá trochu menej magicky!

### Vytváranie tabuliek pre modely v databáze

Posledným krokom je pridať náš nový model do databázy. Najprv musíme Djangu dať vedieť, že sme urobili nejaké zmeny v našom modeli. (Práve sme ho vytvorili!) Choď do konzoly a zadaj `python manage.py makemigrations blog`. Bude to vyzerať takto:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py
    
        - Create model Post
    

**Poznámka:** Nezabudni uložiť súbory, ktoré upravuješ. Inak počítač spustí starú verziu, ktorá môže skončiť chybou.

Django pripravil migračný súbor, ktorý musíme aplikovať na našu databázu. Napíš `python manage.py migrate blog` a výstup by mal byť:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurá! Náš model Post je už v databáze! Bolo by fajn ho vidieť, nie? Prejdi na nasledujúcu kapitolu a uvidíš, ako vyzerá tvoj Post!