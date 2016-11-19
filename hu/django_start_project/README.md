# Az első Django projekted!

> Ez a fejezet részben a Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) tutorial-jain alapszik.
> 
> A fejezet néhány része a [django-marcador tutorial][1] alapján készült, ami a Creative Commons Attribution-ShareAlike 4.0 International License alatt áll. A django-marcador tutorial jogait, Markus Zapke-Gründemann és társai birtokolják.

 [1]: http://django-marcador.keimlink.de/

Most egy egyszerű blogot fogunk készíteni!

Az első lépés, hogy indítsunk egy új Django projektet. Ez annyit jelent, hogy lefuttatunk néhány scriptet, amit a Django tartalmaz, ezzel létrehozzuk a projekt vázát. Ez tulajdonképpen néhány mappa és fájl, amit majd később fogunk használni.

Néhány fájl és könyvtár neve nagyon fontos a Django-ban. A fájlokat, amiket most hozunk létre, ne nevezd át! Az áthelyezésük sem egy jó ötlet. Fontos, hogy megtartsunk egy bizonyos szerkezetet, ami segít a Django-nak, hogy megtalálja a fontos dolgokat.

> Figyelem: mindent a virtualenv-ben futtass. Ha nem látod a `(myvenv)` előtagot a konzolodban, aktiválnod kell a virtuális környezetedet. Ezt a **Django telepítés** fejezetben írtuk le, a **Virtuális környezetben való fejlesztés** résznél. Windows környezetben a `myvenv\Scripts\activate` parancssal, Mac OS / Linux alatt a `source myvenv/bin/activate` paranccsal tudod megtenni.

Ha Mac OS-t vagy Linuxot használsz, a következő parancsot kell futtatnod; **ne felejtsd el kitenni a pontot `.` a végén**:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

Ha Windowst használsz: **ne felejtsd el kitenni a pontot `.` a végén**:

    (myvenv) C:\Users\Name\djangogirls> django-admin startproject mysite .
    

> A pont `.` nagyon fontos, mert ez mondja meg a scriptnek, hogy abba a könyvtárba telepítse a Django-t, ahol éppen vagy (a pont `.` egy rövidítése ennek).
> 
> **Megjegyzés** Amikor begépeled a fenti parancsokat, csak azokat a részeket írd be, amik úgy kezdődnek, hogy `django-admin` vagy `django-admin.py`. A `(myvenv) ~/djangogirls$` és `(myvenv) C:\Users\Name\djangogirls>` csak példák a parancssorodra, amely azt várja, hogy parancsokat gépelj be neki.

A `django-admin.py` egy script, ami könyvtárakat és fájlokat hoz létre neked. Most ilyen könyvtárszerkezetednek kell lennie:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

A `manage.py` egy script, ami az oldal menedzselésében segít. Segítségével elindíthatsz egy webszervert a saját gépeden, anélkül, hogy bármit kellene installálnod, és más dolgokra is jó.

A `settings.py` tartalmazza a weboldalat konfigurációját (beállításait),.

Emlékszel, mit olvastál a postásról, aki azt próbálja kitalálni, hova vigye a levelet? Az `urls.py` fájl tartalmazza a mintákat, amiket az `urlresolver` használ..

Most ne foglalkozzunk a többi fájllal, mert azokat nem fogjuk módosítani. Az egyetlen dolog, amit ne felejts el, hogy ne töröld ki őket véletlenül!

## A beállítások megváltoztatása

Változtassunk meg néhány dolgot a `mysite/settings.py` fájlban. Nyisd meg a fájlt a kódszerkesztővel, amit korábban telepítettél!

Jó lenne, ha a weboldalunk a mi időzónánk szerinti időt mutatná. Nézd meg a [wikipedia időzóna listát][2], és másold ki az időzónádat (TZ, time zone). (például `Europe/Budapest` )

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

Keresd meg a settings.py azt a sort, ami így keződik: `TIME_ZONE`, és írd át, hogy a saját időzónádat használja:

```python
    TIME_ZONE = 'Europe/Budapest'
```

Az "Europe/Budapest"-et változtasd meg kedved szerint.

Szükségünk lesz még arra, hogy megadjuk a statikus fájlokhoz vezető elérési útvonalat (később mindent megtudhatsz a statikus fájlokról és a CSS-ről). Menj a fájl *végére*, és a `STATIC_URL` bejegyzés alatt adj hozzá egy következő bejegyzést `STATIC_ROOT` névvel:

```python
    STATIC_URL = '/static/'
    STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

## Adatbázis létrehozása

Sok különféle adatbázis-szoftver létezik, ami adatokat tud tárolni a weboldalakhoz. Mi az alapértelmezettet fogjuk használni, az `sqlite3`-ot.

Ez már be van állítva a `mysite/settings.py` fájlodban:

```python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
```

Hogy létrehozz egy adatbázist a blogodhoz, futtasd le a következő parancsot a konzolban: `python manage.py migrate` (fontos, hogy a `djangogirls` könyvtárban legyél, ami tartalmazza a `djangogirls` fájlt). Ha minden jól megy, valami ilyesmit kell látnod:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Synchronize unmigrated apps: messages, staticfiles
      Apply all migrations: contenttypes, sessions, admin, auth
    Synchronizing apps without migrations:
       Creating tables...
          Running deferred SQL...
       Installing custom SQL...
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying sessions.0001_initial... OK
    

Készen is vagyunk! Itt az ideje, hogy elindítsd a webszervert, és meglásd, hogy működik-e.

Ehhez abban a könyvtárban kell lenned, ahol a `manage.py` fájl van (a `djangogirls` könyvtárban). A konzolban a következő paranccsal tudod elindítani a szervert: `python manage.py runserver`.

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Ha Windowst használsz, és `UnicodeDecodeError` hibaüzenetet kapsz, ezt a parancsot használd:

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Most nincs más dolgod, mint ellenőrizni, hogy fut-e a weboldalad. Nyisd meg a böngésződet (Firefox, Chrome, Safari, Internet Explorer, vagy bármi más, amit használsz), és írd be a következő címet:

    http://127.0.0.1:8000/
    

A webszerver átvette az irányítást a parancssorod fölött, egészen addig, amíg le nem állítod. Hogy újabb parancsokat írhass be, amíg fut a szerver, új terminálablakot kell nyitnod, és újraaktiválni a virtuális környezetedet. Hogy leállítsd a szervert, lépj vissza az ablakba, ahol fut, és nyomd meg a CTRL + C (Control és C billentyű egyszerre) billentyűkombinációt. (Windowson lehet, hogy a Ctrl+Break fog működni).

Gratulálunk! Létrehoztad az első weboldaladat, és futtatad is egy webszerver segítségével! Hát nem fantasztikus?

![It worked!][3]

 [3]: images/it_worked2.png

Készen állsz a következő lépésre? Itt az ideje, hogy létrehozzunk némi tartalmat!
