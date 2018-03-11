# Django modellek

Most valami olyasmire van szükségünk, ami eltárolja az összes blogbejegyzést. De ahhoz, hogy létre tudjunk hozni ilyesmit, előbb egy kicsit beszélnünk kell az `objektumokról`.

## Objektumok

Létezik egy `objektumorientált programozás` nevű fogalom a programozáson belül. Ennek az az alapötlete, hogy ahelyett, hogy mindent utasítások unalmas sorozataként írnánk le, modellezhetjük is a dolgokat, és definiálhatjuk, hogyan lépnek kapcsolatba egymással.

Tehát mi az az objektum? Tulajdonságok és tevékenységek gyűjteménye. Furán hangozhat, de mindjárt mutatunk egy példát.

Ha egy macskát szeretnék modellezni, létrehozunk egy `Cat` (macska) objektumot, aminek van néhány tulajdonsága: `color` (szín), `age` (életkor), `mood` (kedv -például jó, rossz, álmos ;)), és `owner` (tulajdonos - aki egy `Person` (személy) objektum, és talán, ha kóbor macskáról van szó, ez a tulajdonság üres).

Aztán a `Cat`-hez tartozik néhány tevékenység: `purr` (dorombolás), `scratch` (karmolás), vagy `feed` (evés - ahol a macskának adunk egy kis macskaeledelt, vagyis `CatFood`-ot, ami egy külön objektum, saját tulajdonságokkal, mint például `taste` (íz)).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

Tehát az egésznek az az alapötlete, hogy a valós dolgokat kódban tulajdonságokkal (vagyis `object property`-kkel) és tevékenységekkel (vagyis `method`-okkal) írjuk le.

Hogyan modellezzük a blogposztokat? Egy blogot szeretnénk fejleszteni, ugye?

Erre a kérdésre keressük a választ: Mi egy blogposzt? Milyen tulajdonságai vannak?

Nos, a bejegyzésünknek biztos van szövege, és címe, igaz? Azt is jó lenne tudni, hogy ki írta - vagyis szükségünk van egy szerzőre is. Végül tudni szeretnénk, mikor lett megírva és közzétéve a poszt.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Milyen dolgokat lehet csinálni egy blogbejegyzéssel? Jó lenne, ha lenne valamiféle `method`, ami közzéteszi a posztot, nem?

Tehát szükségünk van egy `publish` methodra.

Most, hogy tudjuk, mit szeretnénk elérni, kezdjük el modellezni Django-ban!

## Django modell

Most, hogy tudjuk, mik az objektumok, már el tudjuk készíteni a blogposzt Django modelljét.

A Django-ban a modellek speciális objektumok - az `adatbázisban` vannak elmentve. Az adatbázis tulajdonképpen adatok gyűjteménye. Ez az a hely, ahol adatokat tárolhatsz a felhasználókról, a blogposztokról, stb. Mi egy SQLite adatbázist fogunk használni az adataink tárolásához. Ez az alapértelmezett Django adatbázis adapter -- ez egyelőre elég is lesz nekünk.

Az adatbázisban lévő modellt úgy képzeld el, mint egy táblázatot (pl. az Excelben), ahol oszlopok (mezők) és sorok (adatok) vannak.

### Készítsünk egy alkalmazást!

Hogy minden szép rendben maradjon, most a projekten belül egy külön alkalmazást hozunk létre. Jó, ha már az elejétől fogva rendezetten tartjuk a dolgokat. Ahhoz, hogy létrehozzuk az alkalmazást, ezt a parancsot kell futtatnunk a parancssorban (a `djangogirls` könyvtárban, ahol a `manage.py` fájl van):

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

Azt fogod látni, hogy egy új `blog` könyvtár keletkezett, és már most van benne néhány fájl. Így kell kinézniük a könyvtáraknak és fájloknak a projekten belül:

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
    

Miután létrejött az alkalmazás, meg kell mondanunk a Django-nak, hogy használja is azt. A `mysite/settings.py` tehetjük meg. Keresd meg az `INSTALLED_APPS` részt, és adj hozzá egy sort a `]` fölött, amiben ez áll: `'blog'`. Így kell kinéznie ennek a résznek:

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

### Hozzuk létre a blogposzt modelljét

A `Model` nevű objektumokat a `blog/models.py` fájlban definiáljuk - tehát itt fogjuk definiálni a blogposztunkat is.

Nyisd meg a `blog/models.py`-t, törölj ki mindent, és ezt a kódot írd bele:

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
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

> Jól figyelj, hogy mindenképp két underscore (alulvonás) karaktert (`_`) használj a `str` mindkét oldalán. Ez a jelölés gyakran előfordul a Pythonban, és néha "dunder"-nek hívjuk (a "double underscore" - dupla alulvonás rövidítése).

Ijesztőnek tűnik? Ne aggódj, mindjárt elmagyarázzuk, hogy mit jelentenek ezek a sorok.

Azok a sorok, amik úgy kezdődnek, hogy `from` vagy `import`, más fájlokban lévő dolgokat adnak hozzá a fájlunkhoz. Ahelyett, hogy minden fájlba átmásolnánk ugyanazokat a dolgokat, beemelhetünk néhány dolgot a `from ... import ...` segítségével..

`class Post(models.Model):` - ez a sor definiálja a modellünket (ami egy `objektum`).

*   a `class` egy speciális kulcsszó, ami azt mutatja meg, hogy éppen egy objektumot definiálunk.
*   a `Post` a modellünk neve. Más nevet is adhatnál neki (de kerüld el a speciális karaktereket - pl ékezetes karakterek - és a szóközt). Az osztályok (classok) nevét mindig nagybetűvel kezdjük.
*   a `models.Model` azt jelenti, hogy a Post egy Django Model, így a Django tudni fogja, hogy el kell menteni az adatbázisba.

Most pedig azokat a tulajdonságokat definiáljuk, amikről korábban beszéltünk:`title` (cím), `text` (szöveg), `created_date` (létrehozás dátuma), `published_date` (közzététel dátuma) és `author` (szerző). Ahhoz, hogy ezt megtehessük, mindegyik mezőnek meg kell határoznunk a típusát (Szöveg lesz benne? Egy szám? Dátum? Egy másik objektumhoz fog kapcsolni, például egy User-hez (felhasználó)?).

*   `models.CharField` - így definiálsz olyan szövegmezőt, ami meghatározott számú karaktert tartalmazhat.
*   `models.TextField` - ez hosszú szövegekhez van, korlátozás nélkül. Pont jó egy blogbejegyzéshez, igaz?
*   `models.DateTimeField` - ez dátumot és időt tartalmaz.
*   `models.ForeignKey` - ez egy másik modellel való kapcsolatot jelent.

Most nem magyarázzuk el nagyon részletesen a kódot, mert túl sok idő lenne. Ha szeretnél többet tudni a Model mezőkről, és hogy milyen más dolgokat lehet definiálni bennünk, olvashatsz róla a Django dokumentációban (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

És mi a helyzet a `def publish(self):` résszel? Ez pontosan az a `publish` (közzététel) method, amiről korábban beszéltünk. A `def` azt jelenti, hogy ez egy függvény (function) / method, és a `publish` ennek a methodnak a neve. Ha szeretnéd, megváltoztathatod a metódus nevét. Az a szabály, hogy csak kisbetűket használunk, és szóköz helyett underscore-t (alulvonás). Például egy olyan method neve, ami az átlagárat számolja ki, ez lehetne: `calculate_average_price`.

A methodok gyakran `return`-ölnek (visszaadnak) valamit. Erre van is egy példa a `__str__` methodban. Ebben az esetben amikor meghívjuk a `__str__()`-t, egy szöveget kapunk vissza (**string**), ami a Post címe.

Vedd észre azt is, hogy mind `def publish(self):` mind `def __str__(self):` indentálva van a class-on bellül. Python számára fontosak a szóközök, ezért a method-okat indentálni kell az osztályokon bellül. Ha ez elmarad, akkor a method nem az adott osztályhoz fog tartozni, és furcsán fog viselkedni a program.

Ha valami még nem teljesen világos a modellekkel kapcsolatban, nyugodtan kérdezd meg a coachodat! Tudjuk, hogy bonyolult, főleg, ha egyszerre tanulsz az objektumokról és a függvényekről. De reméljük, már sokkal kevésbé tűnik varázslatnak az egész!

### Készíts táblákat a modelleknek az adatbázisodban

Az utolsó lépés, hogy hozzáadjuk az új modellünket az adatbázishoz. Először valahogy tudatnunk kell a Django-val, hogy változtattunk a modellünkön (vagyis most alkottuk meg!). Gépeld be, hogy `python manage.py makemigrations blog`. Ez fog történni:

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post
    
**Megjegyzés** Ne felejtsd el elmenteni a módosított file-okat. Különben a számítógéped az előző változatot futtatja le, amely váratlan hibaüzeneteket eredményezhet.

A Django létrehozott nekünk egy migrációs fájlt, amit most futtatni fogunk az adatbázison. Írd be, hogy `python manage.py migrate blog`, és ezt az outputot kell kapnod:

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

Hurrá! Bekerült az adatbázisba a Post modellünk! Jó lenne látni is, nem igaz? A következő fejezetben kiderül, hogy néz ki!
