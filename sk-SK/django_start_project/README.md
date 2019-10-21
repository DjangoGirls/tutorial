# Tvoj prvý Django projekt!

> Časť tejto kapitoly je založená na tutoriáli Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Časti tejto kapiolty sú založená na [django-marcador tutorial](http://django-marcador.keimlink.de/) pod licenciou Creative Commons Attribution-ShareAlike 4.0 International License. Tutoriál django-marcador je autorsky chránený Markusom Zapke-Gründemannom et al.

Vytvoríme jednoduchý blog!

Prvý krok je vytvoriť nový Django projekt. To v podstate znamená, že spustíme pár skriptov, poskytovaných Djangom, ktoré pre nás vytvoria kostru Django projektu. Je to len pár zložiek a súborov, ktoré použijeme neskôr.

Mená niektorých súborov a zložiek sú pre Django veľmi dôležité. Súbory, ktoré teraz vytvoríme, by si nemala premenovať. Ich presúvanie na iné miesto taktiež nie je dobrý nápad. Django potrebuje udržovať určitú štruktúru, aby bol schopný nájsť dôležité veci.

> Nezabudni všetko spúšťať vo virtualenv. Pokiaľ vo svojej konzole nevidíš prefix `(myvenv)` musíš aktivovať virtualenv. Ako na to bolo vysvetlené v kapitole **Inštalácia Django** v časti **Práca s virtualenv**. Pokiaľ napíšeš `myvenv\Scripts\activate` na Windowsoch, alebo `source myvenv/bin/activate` na Mac OS X alebo Linux, malo by všetko fungovať.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Vo svojej Mac OS X alebo Linux konzole spusti tento príkaz; **nezabudni pridať bodku `.` na konci**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Bodka `.` je dôležitá, pretože hovorí skriptom, aby nainštalovali Django v tvojej aktuálnej zložke (pre ktorú je bodka `.` skratkou).
> 
> **Poznámka** Pri písaní predchádzajúceho príkazu nezabudni, že píšeš len časť, ktorá začína django-admin alebo `django-admin. py`. `(myvenv) ~/djangogirls$` zobrazené tu je len príkladom cesty, kam budeš zadávať svoje príkazy.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Vo Windowse spusti tento príkaz; **nezabudni pridať bodku `.` na konci**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Bodka `.` je dôležitá, pretože hovorí skriptom, aby nainštalovali Django v tvojej aktuálnej zložke (pre ktorú je bodka `.` skratkou).
> 
> **Poznámka** Pri písaní predchádzajúceho príkazu nezabudni, že píšeš len časť, ktorá začína `django-admin.exe`. `(myvenv) C:\Users\Name\djangogirls>` zobrazené tu je len príkladom cesty, kam budeš zadávať svoje príkazy.

<!--endsec-->

`django-admin.py` je skript, ktorý pre teba vytvorí zložky a súbory. Momentálne by si mala mať štruktúru adresárov, ktorá vyzerá takto:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **Poznámka**: adresárovej štruktúre, uvidíš `venv` adresár, ktorý sme vytvorili.

`manage.py` je skript, ktorý pomáha so správou stránky. Okrem iného budeme vďaka nemu môcť spustiť na našom počítači webový server, bez toho, aby sme inštalovali čokoľvek iné.

Súbor `settings.py` obsahuje konfiguráciu tvojej webovej stránky.

Pamätáš, keď sme rozprávali o doručovateľovi listov, ktorý zisťuje kam doručiť list? `urls.py` obsahuje zoznam vzorov, ktoré používa `urlresolver`.

Zatiaľ ignorujme ostatné súbory, keďže ich teraz aj tak nebudeme meniť. Jediná vec na ktorú netreba zabudnúť je, že ich nesmieš omylom zmazať!

## Zmena nastavení

Spravme pár zmien v `mysite/settings.py`. Otvor súbor v editore kódu, ktorý si si nainštalovala predtým.

**Poznámka**: Pamätaj, že `settings.py` je obyčajný súbor, ako každý iný. Môžeš ho otvoriť z kodového editoru, pomocou "Súbor -> Otvoriť" možnosti v menu. Malo by sa ti zobraziť štandardné okno v ktorom vyhľadáš svoj `settings.py` súbor a označíš ho. Prípadne môžeš ísť do priečinka djangogirls na pracovnej ploche a kliknúť na súbor pravým tlačidlom myši. Potom vyber editor kódu zo zoznamu. Výber editora je dôležitý, pretože môžeš mať nainštalované iné programy, ktoré dokážu tento súbor otvoriť, ale nedovolia ti ho upravovať.

Bolo by dobré mať na našej stránke správny čas. Choď na [zoznam časových pásiem na wikipedii](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) a skopíruj svoje časové pásmo (napr. `Europe/Berlin`).

V súbore `settings.py`, nájdi riadok, ktorý obsahuje `TIME_ZONE` a uprav ho tak, aby obsahoval tvoje časové pásmo. Napríklad:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. Potom bude tlačidlo "Cancel" preložené do jazyka, ktorý tu definuješ. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

If you want a different language, change the language code by changing the following line:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Budeme tiež musieť pridať cestu pre statické súbory. (Dozvieme sa všetko o statických súboroch a CSS neskôr v tutoriále.) Prejdi na *koniec* súboru a pod `STATIC_URL` riadkom, pridaj ďalší s názvom `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Keď `DEBUG` je `True` a `ALLOWED_HOSTS` je prázdne, host je overovaný vôči `['localhost', '127.0.0.1', '[::1]']`. Toto sa nebude zhodovať s naším hostname na PythonAnywhere, keď nasadíme našu aplikáciu, kvôli tomu zmeníme nasledovné nastavenie:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Poznámka**: Ak používaš Chromebook, pridaj nasledovný riadok na koniec settings.py súboru: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Also add `.amazonaws.com` to the `ALLOWED_HOSTS` if you are using cloud9

## Nastavenie databázy

Existuje veľa rôznych databázových softvérov, ktoré umožňujú ukladať údaje pre tvoje web stránky. My budeme používať predvolenú databázu - `sqlite3`.

Tá je už nastavená v tejto časti súboru `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Databázu pre náš blog vytvoríme spustením tohto príkazu v konzole: `python manage.py migrate` (musíme byť v adresári `djangogirls`, ktorý obsahuje súbor `manage.py`). Ak všetko prešlo dobre, mala by si vidieť niečo takéto:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... OK
    

A je to! Teraz treba spustiť webový server a uvidíme či je naša web stránka funkčná!

## Spustenie webového servera

Musíš sa nachádzať v adresári, v ktorom sa nachádza súbor `manage.py` (adresár `djangogirls`). V konzole spustíme webový server zadaním `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Ak používaš Chromebook, použi nasledovný príkaz:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Ak si vo Windowse a padne ti to s chybovou hláškou `UnicodeDecodeError`, použi namiesto toho tento príkaz:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Blahoželáme! Práve si vytvorila svoju prvú web stránku, ktorá beží na tvojom webovom serveri. Nie je to úžasné?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> Ako webový server funguje sme si povedali v kapitole **Ako funguje Internet**.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). Ak chceš zastaviť webový server, prepni sa späť do okna, v ktorom beží a stlač Ctrl + C súčasne (na Windowse možno budeš musiť stlačiť Ctrl + Break).

Pripravená na ďalší krok? Je na čase vytvoriť nejaký obsah!