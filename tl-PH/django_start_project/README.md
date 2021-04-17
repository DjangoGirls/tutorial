# Ang kauna-unahang proyekto mo sa Django!

> Kasama sa kabanatang ito ay nakabase sa mga tutorial ng Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Kasama sa kabanatang ito ay nakasalig sa [django-marcador na tutorial](http://django-marcador.keimlink.de/) na lisensyado sa ilalim ng Creative Commons Attribution-ShareAlike 4.0 International License. The django-marcador na tutorial ay nakacopyright kay Markus Zapke-Gründemann et al.

We're going to create a small blog!

Ang unang hakbang ay ang pagsimula ng bagong proyekto sa Django. Ibig sabihin nito, magpapatakbo tayo ng mga script na ibinigay ni Django na maglikha ng banghay ng proyekto ng Django para sa atin. Ito ay lipon lang ng mga directory at mga file na gagamitin natin mamaya.

Ang pangalan ng ibang file at directory ay nakaimportante para kay Django. Hindi mo dapat palitan ng pangalan ang mga file na ating malikha. Ang paglipat nito sa ibang lugar ay hindi rin magandang ideya. Kinakailangan ni Django na panatilihin ang istraktura nito para mahanap niya ang mga importanteng bagay.

> Tandaan na patakbuhin ang mga ito sa loob ng virtualenv. Kung hindi ka makakita ng unlapi na `(myenv)` sa iyong console, kailangan mong gamitin ang iyong virtualenv. Ating naipaliwanag kung paano ito gawin sa **pag-install ng Django** na kabanata sa parte na **Working with virtualenv**. Ang pagtype ng `myenv\Scripts\activate` sa Windows o `source myenv/bin/activate` sa Mac OS X o Linux ang gagawa nito para sa iyo.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Sa iyong Mac OS X o Linux na console, dapat mong patakbuhin ang sumusunod na mga command. **Huwag kalimutan ang magdagdag the tuldok `.` sa bandang huli!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Ang tuldok `.` ay mahalaga dahil nagsasabi ito sa script na i-install ang Django sa kasalukuyang directory (kung saan ang tuldok `.` ay ang pinaikling pagbanggit).
> 
> **Paalala** Habang nagtatype ng command sa taas, tandaan na ang dapat mo lang i-type ang parte na nagsisimula sa `django-admin`. Ang `(myenv) ~/djangogirls$` na parteng pinakita dito ay isa lang halimbawa sa prompt na magkukuha sa iyong input sa iyong command line.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Sa Windows dapat mong patakbuhin ang sumusunod na command. **(Huwag kalimutang magdagdag ng tuldok `.` sa bandang huli)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Ang period `.` ay mahalaga dahil ito ang nagsasabi sa script na i-install ang Django sa kasalukuyang directory (kung saan ang tuldok `.` ay ang pinaikling pagbanggit).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin.exe`. The `(myvenv) C:\Users\Name\djangogirls>` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

Ang `django-admin.py` ay isang script na maglilikha ng mga directory at mga files para sa iyo. Sa ngayon dapat mayroon ka ng directory structure gaya nito:

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
    

> **Paalala**: sa iyong directory structure, makikita mo rin ang iyong `venv` na directory na nilikha natin kanina.

Ang `manage.py` ay isang script na makakatulong sa pagpapamahala ng site. Gamit ito maaari tayong (bukod sa iba pang mga bagay) magpatakbo sa web server sa kompyuter nang hindi mag-install ng kahit na ano.

Ang `settings.py` ay ang file na naglalaman ng mga kompigurasyon ng iyong website.

Naalala mo ba noong nag-usap tayo tungkol sa mail carrier na nagsururi kung saan magpadala ng sulat? Ang `urls.py` ay isang file na nalalaman ng lista ng mga pattern na ginagamit ng `urlresolver`.

Balewalain muna natin ang ibang mga file, sa ngayon hindi natin sila babaguhin. Ang dapat mo lang tandaan ay huwag aksidenteng mabura ang mga ito!

## Pagbago ng mga setting

Ngayon gagawa tayo ng mga pagbabago sa `mysite/settings.py`. Buksa ang file gamit ang iyong editor ng code na ininstall kanina.

**Paalala**: Laging isipin na ang `settings.py` ay isang karaniwang file lang, gaya ng iba. Maari mo itong buksan sa loob ng editor ng code, gamit ang "file -> open" na aksyon ng menu. Ito ay magpalabas ng karaniwang window kung saan maari kang mag-navigate sa iyong `settings.py` at piliin ito. Ang alternatibo, maari mong buksan ang file sa pamamagitan ng pagnavigate sa djangogirls na folder sa iyong desktop at pag right-click nito. Pagkatapos, piliin mo ang iyong editor ng code mula sa listahan. Ang pagpili ng editor ay importante dahil maaring may ibang programang nakainstall na makapagbukas nito ngunit hindi ka hahayaang makapag-edit nito.

Maganda sana kung may tamang oras tayo sa ating website. Pumunta sa [lista ng mga time zone ni Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) at kopyahin ang iyong time zone (TX) (e.g. `Europe/Berlin`).

Sa `settings.py`, hanapin ang linya na naglalaman ng `TIME_ZONE` at baguhin ito gamit ang iyong timezone. Halimbawa:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. Kaya magkakaroon ka ng "Cancel" na button na naisalin sa wika na iyong binigay dito. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

If you want a different language, change the language code by changing the following line:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Kailangan din nating magdagdag ng mga path para sa ating static na mga file. (Malalaman natin ang lahat tungkol sa mga static na files at mga CSS sa mamayang parte ng tutorial.) Bumaba sa *katapusan* ng file, at sa baba ng `STATIC_URL` na entry, magdagdag ng bago na tinatawag na `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Kung ang `DEBUG` ay `True` at ang `ALLOWED_HOSTS` ay walang laman, ang host ay ihahambing sa `['localhost','127.0.0.1','[::1]']`. Ito ay hindi magtugma sa ating hostname sa PythonAnywhere pagkatapos nating i-deploy ang ating aplikasyon kaya kailangan nating baguhin ang sumusunod na setting:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Paalala**: Kung ikaw ay gumagamit ng Chromebook, idagdag ang linyang ito sa baba ng iyong settings.py na file: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage''`
> 
> Also add `.amazonaws.com` to the `ALLOWED_HOSTS` if you are using cloud9
> 
> If you are hosting your project on `Glitch.com`, let us protect the Django secret key that needs to remain confidential (otherwise, anyone remixing your project could see it):
> 
> - First, we are going to create a random secret key. Open the Glitch terminal again, and type the following command: {% filename %}.env{% endfilename %} 
>         bash
>         python -c 'from django.core.management.utils import get_random_secret_key; \
>               print(get_random_secret_key())' This should display a long random string, perfect to use as a secret key for your brand new Django web site. We will now paste this key into a 
>     
>     `.env` file that Glitch will only show you if you are the owner of the web site. 
> - Create a file `.env` at the root of your project and add the following property in it: {% filename %}.env{% endfilename %} 
>         bash
>         # Here, inside the single quotes, you can cut and paste the random key generated above
>         SECRET='3!0k#7ds5mp^-x$lqs2%le6v97h#@xopab&oj5y7d=hxe511jl'
> 
> - Then update the Django settings file to inject this secret value and set the Django web site name: {% filename %}mysite/settings.py{% endfilename %} 
>         python
>         SECRET_KEY = os.getenv('SECRET')
> 
> - And a little further, in the same file, we inject the name of your new Glitch website: {% filename %}mysite/settings.py{% endfilename %} 
>         python
>         ALLOWED_HOSTS = [os.getenv('PROJECT_DOMAIN') + ".glitch.me"] The 
>     
>     `PROJECT_DOMAIN` value is automatically generated by Glitch. It will correspond to the name of your project.

## Mag-setup ng database

May maraming iba-ibang dabatase na software ang maaaring magstore ng mga datos para sa ating site. Gagamit tayo ng default na, `sqlite3`.

Ito ay nakaset-up na sa parteng ito ng ating `mysite/settings.py` na file:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Para maglikha ng database para sa ating blog, patakbuhin natin ang sumunod sa ating console: `python manage.py migrate`(kailangan na nasa `djangogirls` na directory tayo na naglalaman ng `manage.py` na file). Kung walang problema, dapat makakita ka ng gaya nito:

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
    

At tapos na tayo! Oras na para patakbuhin ang ating web server at tingnan kung gumana ang ating website!

## Nagpapatakbo ng web server

Kailangan kang nasa loob ng directory na naglalaman ng `manage.py` na file (ang `djangogirls` na directory). Sa console, mapatakbo natin ang web server sa pamamagitan ng pagpatakbo ng `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Kung ikaw ay nasa Chromebook, sa halip ay gamitin mo ang command na ito:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

or this one if you are using Glitch:

{% filename %}Glitch.com terminal{% endfilename %}

    $ refresh
    
    

If you are on Windows and this fails with `UnicodeDecodeError`, use this command instead:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

or on Glitch:

    https://name-of-your-glitch-project.glitch.me
    

Congratulations! You've just created your first website and run it using a web server! Isn't that awesome?

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> Ating pinagbalik-aralan kung paano gumagana ang mga web server sa **How the Internet words** na kabanata.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!