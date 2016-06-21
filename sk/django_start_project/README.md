# Tvoj prvý Django projekt!

> Časť tejto kapitoly je založená na tutoriáli Geek Girls Carrots (http://django.carrots.pl/).
>
> Časti tejto kapiolty sú založená na [django-marcador tutorial][1] pod licenciou Creative Commons Attribution-ShareAlike 4.0 International License. Tutoriál django-marcador je autorsky chránený Markusom Zapke-Gründemannom et al.

 [1]: http://django-marcador.keimlink.de/

Vytvoríme jednoduchý blog!

Prvý krok je vytvoriť nový Django projekt. To v podstate znamená, že spustíme pár skriptov, poskytovaných Djangom, ktoré pre nás vytvoria kostru Django projektu. Je to len pár zložiek a súborov, ktoré použijeme neskôr.

Mená niektorých súborov a zložiek sú pre Django veľmi dôležité. Súbory, ktoré teraz vytvoríme, by si nemala premenovať. Ich presúvanie na iné miesto taktiež nie je dobrý nápad. Django potrebuje udržovať určitú štruktúru, aby bol schopný nájsť dôležité veci.

> Nezabudni všetko spúšťať vo virtualenv. Pokiaľ vo svojej konzole nevidíš prefix `(myvenv)` musíš aktivovať virtualenv. Ako na to bolo vysvetlené v kapitole **Inštalácia Django** v časti **Práca s virtualenv**. Pokiaľ napíšeš `myvenv\Scripts\activate` na Windowsoch, alebo `source myvenv/bin/activate` na Mac OS / Linux, malo by všetko fungovať.

Vo svojej MacOS alebo Linux konzole spusti tento príkaz; **nezabudni pridať bodku `.` na konci**:

```
(myvenv) ~/djangogirls$ django-admin startproject mysite .
```

Na Windowsoch: **nezabudni pridať bodku `.` na konci**:

```
(myvenv) C:\Users\Name\djangogirls> django-admin.py startproject mysite .
```

> Bodka `.` je dôležitá, pretože hovorí skriptom, aby nainštalovali Django v tvojej aktuálnej zložke (pre ktorú je bodka `.` skratkou)
>
> **Poznámka** Pri písaní predchádzajúcich príkazov nezabudni, že píšeš len časti, ktoré začínajú `django-admin` alebo `django-admin.py`. `(myvenv) ~/djangogirls$` a `(myvenv) C:\Users\Name\djangogirls>` sú len príkladom cesty, kam budeš zadávať svoje príkazy.

`django-admin.py` je skript, ktorý pre teba vytvorí zložky a súbory. Momentálne by si mala mať štruktúru adresárov, ktorá vyzerá takto:

```
djangogirls
├───manage.py
└───mysite
        settings.py
        urls.py
        wsgi.py
        __init__.py
```

`manage.py` je skript, ktorý pomáha so správou stránky. Okrem iného budeme vďaka nemu môcť spustiť na našom počítači webový server, bez toho, aby sme inštalovali čokoľvek iné.

Súbor `settings.py` obsahuje konfiguráciu tvojej webovej stránky.

Pamätáš, keď sme rozprávali o doručovateľovi listov, ktorý zisťuje kam doručiť list? `urls.py` obsahuje zoznam vzorov, ktoré používa `urlresolver`.

Zatiaľ ignorujme ostatné súbory, keďže ich teraz aj tak nebudeme meniť. Jediná vec na ktorú netreba zabudnúť je, že ich nesmieš omylom zmazať!

## Zmena nastavení

Spravme pár zmien v `mysite/settings.py`. Otvor súbor v editore kódu, ktorý si si nainštalovala predtým.

Bolo by dobré mať na našej stránke správny čas. Choď na [zoznam časových pásiem na wikipedii][2] a skopíruj svoje časové pásmo (TZ). (napr. `Europe/Bratislava`)

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

V súbore settings.py, nájdi riadok, ktorý obsahuje `TIME_ZONE` a uprav ho tak, aby obsahoval tvoje časové pásmo:

```python
TIME_ZONE = 'Europe/Bratislava'
```

Prípadne zvoľ iné pásmo ako "Europe/Bratislava", ak je to potrebné

Tiež budeme musieť pridať cestu k statickým súborom (všetko o statických súboroch a CSS sa dozvieme neskôr v ďalších kapitolách tutorialu). Prejdi dole na *koniec* súboru a hneď pod záznam `STATIC_URL` pridaj nový s názvom `STATIC_ROOT`:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

## Nastavenie databázy

Existuje veľa rôznych databázových softvérov, ktoré umožňujú ukladať údaje pre tvoje web stránky. My budeme používať predvolenú databázu - `sqlite3`.

Tá je už nastavená v tejto časti súboru `mysite/settings.py`:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Databázu pre náš blog vytvoríme spustením tohto príkazu v konzole: `python manage.py migrate` (musíme byť v adresári `djangogirls`, ktorý obsahuje súbor `manage.py`). Ak všetko prešlo dobre, mala by si vidieť niečo takéto:

```
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
```

A je to! Teraz treba spustiť webový server a uvidíme či je naša web stránka funkčná!

Musíš sa nachádzať v adresári, v ktorom sa nachádza súbor `manage.py` (adresár `djangogirls`). V konzole spustíme webový server zadaním `python manage.py runserver`:

```
(myvenv) ~/djangogirls$ python manage.py runserver
```

Ak si vo Windowse a padne ti to s chybovou hláškou `UnicodeDecodeError`, použi namiesto toho tento príkaz:

```
(myvenv) ~/djangogirls$ python manage.py runserver 0:8000
```

Teraz už musíš len skontrolovať, či tvoja web stránka funguje. Otvor si prehliadač (Firefox, Chrome, Safari, Internet Explorer alebo čokoľvek používaš) a zadaj adresu:

```
http://127.0.0.1:8000/
```

Príkazový riadok bude obsadený webovým serverom, až kým ho nezastavíš. Ak chceš zadať viac príkazov, kým je spustený, otvor nové okno terminálu a aktivuj svoj virtualenv. Ak chceš zastaviť webový server, prepni sa späť do okna, v ktorom beží a stlač Ctrl + C súčasne (na Windowse možno budeš musiť stlačiť Ctrl + Break).

Blahoželáme! Práve si vytvorila svoju prvú web stránku, ktorá beží na tvojom webovom serveri. Nie je to úžasné?

![Fungovalo to!][3]

 [3]: images/it_worked2.png

Pripravená na ďalší krok? Je na čase vytvoriť nejaký obsah!
