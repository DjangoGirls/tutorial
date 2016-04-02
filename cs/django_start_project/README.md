# Tvůj první Django projekt!

> Část této kapitoly je založena na kurzu Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
>
> Části této kapitoly jsou založeny na [django-marcador tutorial][1] licencováno pod Creative Commons Attribution-ShareAlike 4.0 mezinárodní licencí. Ochranou známku pro Django-marcador drží Markus Zapke-Gründemann et al.

 [1]: http://django-marcador.keimlink.de/

Chceme vytvořit jednoduchý blog!

Prvním krokem je začít s novým projektem Django. V podstatě to znamená, že budeš spouštět některé skripty z Django, které vytvoří kostru Django projektu pro tebe. To je jen halda adresářů a souborů, které budeme později používat.

Názvy některých souborů a adresářů jsou pro Django velmi důležité. Neměla bys přejmenovávat soubory, které vytvoříme. Přesouvat je na jiné místo také není dobrý nápad. V Django je třeba zachovat určitou strukturu, abychom mohli najít důležité věci.

> Nezapomeň spouštět vše ve svém virtualenv. Pokud nevidíš předponu `(myvenv)` ve své konzoli je potřeba aktivovat virtualenv. Jak se to dělá jsme vysvětlili v kapitole **Django instalace** v části **práce s virtualenv**. Napiš `myvenv\Scripts\activate` na systému Windows nebo `source myvenv/bin/activate` na systému Mac OS / Linux.

V MacOS a Linux konzoli bys měla spustit následující příkaz; **nezapomeň přidat tečku `.` na konci**:

```
    (myvenv) ~/djangogirls$ django-admin startproject mysite .
```  

V systému Windows; **nezapomeň přidat tečku `.` na konci**:

```
    (myvenv) C:\Users\Name\djangogirls> django-admin.py startproject mysite .
```  

> Tečka `.` je zásadní, protože říká že skript pro instalaci Django se má provést v aktuálním adresáři (pro který je tečka `.` zkratkou - odkazem)
>
> **Poznámka:** Při zadávání příkazů výše, nezapomeň zadat pouze část, která začíná `django admin` nebo `django-admin.py`. `(myvenv) ~/djangogirls$` a `(myvenv) C:\Users\Name\djangogirls>` tyto části jsou jen příklad cesty, kam budeš zadávat své příkazy.

`django-admin.py` je skript, který za tebe vytvoří adresáře a soubory. Nyní bys měla mít adresářovou strukturu, která vypadá následovně:

```
    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
```  

`manage.py` je skript, který slouží k řízení tvé webové stránky. S ním bude možné, kromě jiného, spustit webový server na tvém počítači bez instalovaní čehokoli jiného.

Soubor `settings.py` obsahuje konfiguraci tvé webové stránky.

Pamatuješ, jak jsme mluvili o pošťákovi který zjišťuje kam doručit dopis? Soubor `urls.py` obsahuje seznam vzorů, které používá `urlresolver`.

Prozatím budeme ignorovat ostatní soubory - nechceme v nich nic měnit. Jediná věc, kterou nezapomeň, žádný ze souborů se nemaže!

## Změna nastavení

Pojďme udělat nějaké změny v `mysite/settings.py`. Otevři soubor pomocí editoru kódu, který jsi si nainstalovala dříve.

Bylo by hezké mít správný čas na našich stránkách. Přejdi na [wikipedia timezones list][2] a zkopíruj příslušné časové pásmo (TZ). (např. `Europe/Prague`)

 [2]: http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

V settings.py najdi řádek, který obsahuje `TIME_ZONE` a uprav jej tak, aby obsahoval tvoje vlastní časové pásmo:

```python
    TIME_ZONE = 'Europe/Prague'
```  

Uprav "Europe/Prague" podle potřeby

Budeme také muset přidat cestu pro statické soubory (o statických souborech a CSS se dozvíme dále v tutorialu). Přejdi na *konec* souboru a pod položkou `STATIC_URL`, přidej nový název `STATIC_ROOT`:

```python
    STATIC_URL = '/static/'
    STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```  

## Nastavení databáze

Existuje mnoho různých databázových softwarů, které mohou ukládat data pro tvůj web. My budeme používat výchozí `sqlite3`.

Ta je již nastavena v konfiguračním souboru `mysite/settings.py`:

```python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }
```  

Chceš-li vytvořit databázi pro náš blog, spusť následující příkaz v konzoli: `python manage.py migrate` (pro spuštění musíš být v adresáři `djangogirls`, který obsahuje soubor `manage.py`). Pokud vše půjde dobře, měla bys vidět něco takového:

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
      Rendering model states... DONE   Applying contenttypes.0001_initial... OK
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

A máme hotovo! Čas spustit webový server a měla bys vidět naše fungující webové stránky!

Pro spuštění musíš být v adresáři, který obsahuje soubor `manage.py` (adresář `djangogirls`). V konzoli spustíš webový server zadáním `pythonu manage.py runserver`:

```
    (myvenv) ~/djangogirls$ python manage.py runserver
```  

Pokud pracuješ v systému Windows a nezdaří se to s chybovou zprávou `UnicodeDecodeError`, použij tento příkaz:

```
    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
```  

Nyní vše co musíš udělat je zkontrolovat, zda naše webové stránky běží - otevři svůj prohlížeč (Firefox, Chrome, Safari, Internet Explorer nebo co používáš) a zadej adresu:

```
    http://127.0.0.1:8000/
```  

Webový server převezme příkazová řádka, dokud jej nezastavíš. Chceš-li zadat více příkazů spusť nové okno terminálu a aktivuj svůj virtualenv. Chceš-li zastavit server WWW, přepni se zpět do okna, ve kterém je spuštěn a kombinací kláves CTRL + C - tlačítka CTRL a C, které stiskneš dohromady (na Windows, možná musíš stisknout kombinaci kláves Ctrl + Break).

Blahopřejeme! Právě jsi vytvořila svůj první web a spustila jej pomocí webového serveru! Není to super?

![Fungovalo to!][3]

 [3]: images/it_worked2.png

Připravena pro další krok? Je tu čas k vytvoření nějakého obsahu!
