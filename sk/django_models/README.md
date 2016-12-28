# Django modely

Teraz pôjdeme vytvoriť niečo, čo bude uchovávať naše posty v blogu. Aby sme to vedeli spraviť, musíme si najskôr povedať niečo o `objektoch`.

## Objekty

V programovaní sa používa pojem `objektovo orientované programovanie`. Myšlienka spočíva v tom, že namiesto vypisovania nudných sekvencií programátorských príkazov môžeme veci modelovať a definovať ako majú navzájom komunikovať.

Takže čo je to objekt? Je to zbierka vlastností a akcií. Znie to čudne, ale ukážeme si príklad.

Ak chceme modelovať mačku, vytvoríme objekt `Macka`, ktorá má nejaké vlastnosti, napríklad: `farba`, `vek`, `nalada` (t. j. dobra, zla, ospala ;)), a `majitel` (ktorý je objektom `Osoba` alebo možno v prípade túlavej mačky bude táto vlastnosť prázdna).

Ďalej má `Macka` niekoľko akcií: `priast`, `skrabat` alebo `krmit` (v ktorej dáme mačke nejaké `MacacieZradlo`, ktoré by mohlo byť samostatným objektom s vlastnosťami, t.j. `chut`).

```
Macka
--------
farba
vek
nalada
majitel
priast()
skrabat()
krmit(mac_zradlo)


MacacieZradlo
--------
chut
```

Takže v podstate myšlienka je popísať reálne veci kódom pomocou vlastností (ktorým hovoríme `vlastnosti objektu/object properties`) a akcií (tie nazývame `metódy`).

Ako teda budeme modelovať blog post? Chceme vytvoriť blog, však?

Musíme odpovedať na otázku: Čo je vlastne blog post? Aké vlastnosti by mal mať?

No, náš blog post určite potrebuje nejaký text s obsahom a titulkom, nie? Bolo by tiež fajn vedieť, kto ho napísal - takže potrebujeme autora. A nakoniec, chceme vedieť, kedy bol post vytvorený a zverejnený.

```
Post
--------
title
text
author
created_date
published_date
```

Čo všetko môžeme s blog postom robiť? Bolo by dobré mať nejakú `metódu`, ktorá post publikuje, však?

Takže budeme potrebovať metódu `publish`.

Keďže už vieme, čo chceme dosiahnuť, začnime tvoriť model v Djangu!

## Django model

Keďže už vieme, čo je objekt, môžeme vytvoriť Django model pre náš blog post.

Model v Djangu je špeciálny typ objektu - je uložený v `databáze`. Databáza je súbor údajov. Je to miesto, kde budeš ukladať informácie o užívateľoch, príspevkoch na blogu, atď. Na ukladanie údajov budeme používať databázu SQLite. Je to štandardný východzí databázový adaptér v Djangu -- nateraz nám bude stačiť.

Model v databáze si môžeš predstaviť ako tabuľku so stĺpcami (polia) a riadkami (dáta).

### Vytvorenie aplikácie

Aby sme mali všetko pekne upratané, vytvoríme vo vnútri nášho projektu samostatnú aplikáciu. Je dobré mať všetko zorganizované hneď od začiatku. Aby sme vytvorili aplikáciu, musíš v konzole spustiť nasledujúci príkaz (v adresári `djangogirls`, kde sa nachádza súbor `manage.py`):

```
~/djangogirls$ (myvenv) python manage.py startapp blog
```

Uvidíš, že bude vytvorený nový adresár `blog`, ktorý obsahuje množstvo súborov. Adresáre a súbory v našom projekte by mali vyzerať takto:

```
djangogirls
├── mysite
|       __init__.py
|       settings.py
|       urls.py
|       wsgi.py
├── manage.py
└── blog
    ├── migrations
    |       __init__.py
    ├── __init__.py
    ├── admin.py
    ├── models.py
    ├── tests.py
    └── views.py
```

Po vytvorení aplikácie tiež musíš Djangu povedať, že by ju mal použiť. To urobíme v súbore `mysite/settings.py`. Musíme nájsť `INSTALLED_APPS` a pridať riadok obsahujúci `'blog'` tesne pred uzatváraciu zátvorku`)`. Takže výsledok nášho snaženia bude vyzerať takto:

```python
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
)
```

### Vytvorenie modelu blog postu

V súbore `blog/models.py` definujeme všetky objekty, ktoré sa nazývajú `modely` - na tomto mieste definujeme náš blog post.

Otvor `blog/models.py`, všetko z neho odstráň a napíš tento kód:

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Dvakrát skontroluj, či si použila 2 podčiarkovníky (`_`) na oboch stranách `str`. Táto konvencia sa v Pythone často používa a niekedy sa tomu hovorí "dunder" (skratka pre anglické Double-UNDERscore).

Vyzerá to asi strašidelne. Ale neboj sa, vysvetlíme si, čo tieto riadky znamenajú!

Všetky riadky začínajúce s `from` alebo `import` pridávajú časti z iných súborov. Takže namiesto kopírovania rovnakých vecí v každom súbore môžeme zahrnúť niektoré časti pomocou `from ... import ...`.

`class Post(models.Model):` - tento riadok definuje náš model (je to `objekt`).

*   `class` je špeciálne kľúčové slovo, ktoré naznačuje, že definujeme objekt.
*   `Post` je meno nášho modelu. Môžeme mu dať iný názov (ale musíme sa vyhnúť špeciálnym a prázdnym znakom). Názov triedy vždy začnite písmenami.
*   `models.Model` znamená, že Post je Django Model, takže Django vie, že by mal byť uložený v databáze.

Teraz zadefinujeme vlastnosti, o ktorých sme hovorili: `title` (titulka), `text`, `created_date` (dátum vytvorenia), `published_date` (dátum zverejnenia) a `author` (autor). Na to ale musíme zadefinovať typ každého poľa (Je to text? Číslo? Dátum? Vzťah k inému objektu, t.j. používateľovi?).

*   `modely. CharField` - takto môžeš definovať text s obmedzeným počtom znakov.
*   `models.TextField` - toto je pre dlhé texty bez obmedzenia. To znie ideálne pre blogový príspevok, nie?
*   `models.DateTimeField` - dátum a čas.
*   `models.ForeignKey` - odkaz na iný model.

Nebudeme si tu vysvetľovať každý kúsok kódu, pretože by to zabralo príliš veľa času. Ak chceš vedieť viac o poliach modelu a definovaní ďalších vecí okrem tých, čo sme popísali vyššie, skús sa pozrieť do dokumentácie Djanga (https://docs.djangoproject.com/en/1.8/ref/models/fields/#field-types).

A čo `def publish(self):`? To je presne tá metóda `publish`, o ktorej sme hovorili predtým. `def` znamená, že ide o funkciu/metódu a `publish` je názov metódy. Názov metódy môžeš zmeniť, ak chceš. Pravidlo pre názvy je, že používame malé písmená a podčiarkovníky namiesto medzier. Napríklad metóda, ktorá vypočíta priemernú cenu by sa mohla nazývať `pocitaj_priemernu_cenu`.

Metódy často niečo vracajú (angl. `return`). Príklad nájdeš napríklad v metóde `__str__`. V tomto prípade, keď zavoláme `__str__()`, dostaneme text (**string**) s názvom postu.

Ak čokoľvek nie je jasné, neváhaj a spýtaj sa mentora! Je nám jasné, že je to komplikované, najmä ak sa učíš, čo sú objekty a funkcie súčasne. Ale dúfame, že teraz už to vyzerá trochu menej magicky!

### Vytváranie tabuliek pre modely v databáze

Posledným krokom je pridať náš nový model do databázy. Najprv musíme Djangu dať vedieť, že sme urobili nejaké zmeny v našom modeli (práve sme ho vytvorili!). Napíš `python manage.py makemigrations blog`. Bude to vyzerať takto:

```
(myvenv) ~/djangogirls$ python manage.py makemigrations blog
Migrations for 'blog':
  0001_initial.py:
  - Create model Post
```

Django pre nás pripravil migračný súbor, ktorý musíme aplikovať na našu databázu. Napíš `python manage.py migrate blog` a výstup by mal byť:

```
(myvenv) ~/djangogirls$ python manage.py migrate blog
Operations to perform:
  Apply all migrations: blog
Running migrations:
  Rendering model states... DONE
  Applying blog.0001_initial... OK
```

Hurá! Náš Post model je už v databáze! Bolo by fajn ho vidieť, nie? Prejdi na nasledujúcu kapitolu a uvidíš ako vyzerá tvoj Post!
