# Iṣẹ́ Django àkọ́kọ́ rẹ!

> Apá kan lára àkòrí yìí dá lórí àwọn àlàyé ti Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Àwọn apá kan lára àkòrí yìí dá lórí [àlàyé django-marcador](http://django-marcador.keimlink.de/) náà tó ní ìwé-àṣẹ lábẹ́ Creative Commons Attribution-ShareAlike 4.0 International License. Àlàyé django-marcador náà ni ẹ̀tọ́ rẹ̀ jẹ́ ti Markus Zapke-Gründemann et al.

A óò ṣẹ̀dá blog kékeré kan!

Ìgbésẹ̀ àkọ́kọ́ ni láti bẹ̀rẹ̀ iṣẹ́ Django tuntun kan. Ní pàtàkì, èyí túmọ̀ sí pé a ó lo àwọn ìlànà ìṣe (script) kan tí Django pèsè tí yíò ṣẹ̀dá ìgbékalẹ̀ ti iṣé Django kan fún wa. Èyí wulẹ̀ jẹ́ àpapọ̀ àkójọpọ̀ fáìlì àti àwọn fáìlì kan tí a ó lò tó bá yá.

Orúkọ àwọn fáìlì àti àkójọpọ̀ fáìlì kan ṣe pàtàkì gan-an fún Django. Ìwọ kò gbọ́dọ̀ ṣàtúnṣe orúkọ àwọn fáìlì tí a fẹ́ ṣẹ̀dá náà. Gbígbé wọn sí ibi tó yàtọ̀ kan kìí tún ṣe èrò tó dára kan. Django nílò láti máa ní ìgbékalẹ̀ pàtó kan láti lè rí àwọn nnkan pàtàkì.

> Rántí láti ṣe gbogbo nnkan nínú virtualenv náà. Tí ìwọ kò bá rí `(myvenv)` níbẹ̀rẹ̀ nínú console rẹ, o nílò láti mú virtualenv rẹ ṣiṣẹ́. A ti ṣàlàyé bí o ṣe lè ṣe ìyẹn nínú àkòrí **Ìṣàgbékalẹ̀ Django** ní apá **Ìṣiṣẹ́ pẹ̀lú virtualenv** náà. Títẹ `myvenv\Scripts\activate` lórí Windows tàbí `source myvenv/bin/activate` lórí Mac OS X tàbí Linux yíò ṣe èyí fún ọ.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Nínú console Mac OS X tàbí Linux rẹ, ó yẹ kí o ṣe àṣẹ tó tẹ̀le yìí. **Má gbàgbé láti ṣàfikún àmì tó-ín `.` náà ní ìparí!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Àmì tó-ín `.` náà ṣe pàtàkì nítorí pé yíò sọ fún ìlànà ìṣe (script) náà láti ṣàgbékalẹ̀ Django sínú àkójọpọ̀ fáìlì tí o wà lọ́wọ́lọ́wọ́ (fún èyí tí àmì tó-ín `.` náà jẹ́ ìtọ́kasí tí a gé kúrú kan).
> 
> **Àkíyèsí** Nígbà tí o bá n tẹ àṣẹ tó wà lókè náà, rántí pé apá tó bẹ̀rẹ̀ pẹ̀lú `django-admin` nìkan ni o ma tẹ̀. Apá `(myvenv) ~/djangogirls$` náà tí a ṣàfihàn níbí wulẹ̀ jẹ́ àpẹẹrẹ prompt náà tí yíò ma dúró de ohun tí o fẹ́ tẹ̀ sórí ìlà ìpàṣẹ rẹ.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Lórí Windows, ó yẹ kí o ṣe àṣẹ tó tẹ̀le yìí. **(Má gbàgbé láti ṣàfikún àmì tó-ín `.` náà ní ìparí)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Àmì tó-ín `.` náà ṣe pàtàkì nítorí pé yíò sọ fún ìlànà ìṣe (script) náà láti ṣàgbékalẹ̀ Django sínú àkójọpọ̀ fáìlì tí o wà lọ́wọ́lọ́wọ́ (fún èyí tí àmì tó-ín `.` náà jẹ́ ìtọ́kasí tí a gé kúrú kan).
> 
> **Àkíyèsí** Nígbà tí o bá n tẹ àṣẹ tó wà lókè náà, rántí pé apá tó bẹ̀rẹ̀ pẹ̀lú `django-admin.exe` nìkan ni o ma tẹ. Apá `(myvenv) C:\Users\Name\djangogirls>` náà tí a ṣàfihàn níbí wulẹ̀ jẹ́ àpẹẹrẹ prompt náà tí yíò ma dúró de ohun tí o fẹ́ tẹ̀ sórí ìlà ìpàṣẹ rẹ.

<!--endsec-->

`django-admin.py` jẹ́ ìlànà ìṣe (script) kan tí yíò ṣẹ̀dá àwọn àkójọpọ̀ fáìlì àti àwọn fáìlì náà fún ọ. Ó yẹ kí o ní ìgbékalẹ̀ àkójọpọ̀ fáìlì kan tó rí báyìí:

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
    

> **Àkíyèsí**: nínú ìgbékalẹ̀ àkójọpọ̀ fáìlì rẹ, ìwọ yíò tún rí àkójọpọ̀ fáìlì `venv` rẹ tí a ti ṣẹ̀dá ṣáájú.

`manage.py` jẹ́ ìlànà ìṣe (script) kan tí yíò ṣe ìrànlọ́wọ́ pẹ̀lú ìṣàkóso ààyè náà. Pẹ̀lú rẹ̀, a ó lè (láàrín àwọn nnkan mìíràn) bẹ̀rẹ̀ server ayélujára kan lórí kọ̀mpútà wa láìsí ṣíṣe àgbékalẹ̀ ohunkóhun mìíràn.

Fáìlì `settings.py` náà yíò ní ìṣètò ààyè ayélujára rẹ.

Rántí ìgbà tí a sọ̀rọ̀ nípa òṣìṣẹ́ méèlì kan tó n ṣàyẹ̀wò ibi tí yíò fi lẹ́tà kan jíṣẹ́ sí? Fáìlì `urls.py` yíò ní àkójọ àwọn àpẹẹrẹ kan tó n jẹ́ lílò nípasẹ̀ `urlresolver`.

Jẹ́ ká fojú fo àwọn fáìlì yòókù náà nítorí pé a kò ní ṣàyípadà wọn. Ohun kan ṣoṣo láti rántí ni kí o má ṣèèṣì yọ wọ́n kúrò!

## Ṣíṣe ìyípadà àwọn ìṣètò

Jẹ́ ká ṣe àwọn ìyípadà kan nínú `mysite/settings.py`. Ṣí fáìlì náà pẹ̀lú lílo olóòtú kóòdù tí o ti ṣàgbékalẹ̀ ṣáájú.

**Àkíyèsí**: Fi sọ́kàn pé `settings.py` jẹ́ fáìlì déédéé kan, bíi èyíkéyìí mìíràn. O lè ṣí i láti inú olóòtú kóòdù náà, pẹ̀lú lílo àwọn iṣẹ́ àkójọ àṣàyàn "file -> open" (fáìlì -> ṣí) náà. Ó yẹ kí èyí ṣàfihàn fèrèsé tí o sábà náà tí o ti lè lọ sí fáìlì `settings.py` rẹ kí o sì yàn níbẹ̀. Lọ́nà mìíràn, o lè ṣí fáìlì náà nípasẹ̀ lílọ sí fódà djangogirls náà lórí desktop rẹ kí o sì tẹ bọ́tìnnì atọ́ka ọ̀tún lórí rẹ̀. Lẹ́yìn náà, yan olóòtú kóòdù rẹ lára àkójọ náà. Yíyan olóòtú náà ṣe pàtàkì nítorí pé o lè ní àwọn ètò mìíràn tó lè ṣí fáìlì náà ṣùgbọ́n tí kò ní jẹ́ kí o ṣàtúnṣe rẹ̀.

Yíò dára láti ní àkókò tó tọ́ lórí ààyè ayélujára wa. Lọ sí [Àkọsílẹ̀ àwọn agbègbè àkókò ti Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) kí o sì ṣe àdàkọ agbègbè àkókò tó yẹ fún ọ (TZ) (fún àpẹẹrẹ `Africa/Lagos`).

Nínú `settings.py`, wá ìlà tó ní `TIME_ZONE` kí o ṣàtúnṣe rẹ̀ láti yan agbègbè àkókò tìẹ. Fún àpẹẹrẹ:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Africa/Lagos'
```

Kóòdù èdè kan ma ní èdè náà, fún àpẹẹrẹ `en` fún Gẹ̀ẹ́sì tàbí `yo` fún Yorùbá, àti kóòdù orílẹ̀-èdè náà, fún àpẹẹrẹ `de` fún Jámánì tàbí `ng` fún Nàìjíríà. Tí Gẹ̀ẹ́sì kìí ba ṣe èdè abínibí rẹ, o lè ṣàfikún èyí láti ṣàyípadà àwọn bọ́tìnnì ìpìlẹ̀ àti àwọn ìpàkíyèsí láti Django kó wà ní èdè rẹ. Nítorí náà, ìwọ yíò ní bọ́tìnnì "Cancel" (Fagi lé) tí a túmọ̀ sí èdè tí o yàn níbí. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

Tí o bá fẹ́ èdè mìíràn kan, ṣàyípadà kóòdù èdè náà nípasẹ̀ ṣíṣe ìyípadà ìlà tó tẹ̀lé yìí:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

A ó tún nílò láti ṣàfikún atọ́nà kan fún àwọn fáìlì tó wà lójú kan (static files). (A ó ṣèwádìí gbogbo nnkan nípa àwọn fáìlì tó wà lójú kan (static files) àti CSS tó bá yá nínú àlàyé náà.) Lọ sí ìsàlẹ̀ ní *ìparí* fáìlì náà, lábẹ́ ìgbéwọlé `STATIC_URL` náà, ṣàfikún ìgbéwọlé tuntun kan tí a n pè ní `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Nígbà tí `DEBUG` bá jẹ́ `True` tí `ALLOWED_HOSTS` sì jẹ́ òfìfo, olùpèsè náà ma ṣiṣẹ́ lórí `['localhost', '127.0.0.1', '[::1]']`. Èyí kò ní dọ́gba pẹ̀lú orúkọ olùpèsè (hostname) wa lórí PythonAnywhere nígbà tí a bá ṣàgbékalẹ̀ ètò wa, nítorí náà, a ó ṣàyípadà ìṣèto tó tẹ̀le yìí:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Àkíyèsí**: Tí o bá n lo Chromebook kan, ṣàfikún ìlà yìí nísàlẹ̀ fáìlì settings.py rẹ: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Tún ṣàfikún `.amazonaws.com` sí `ALLOWED_HOSTS` náà tí o bá n lo cloud9
> 
> If you are hosting your project on `Glitch.com`, let us protect the Django secret key that needs to remain confidential (otherwise, anyone remixing your project could see it): * First, we are going to create a random secret key. Open the Glitch terminal again, and type the following command: {% filename %}.env{% endfilename %} 
> 
>     bash
>         python -c 'from django.core.management.utils import get_random_secret_key; \
>               print(get_random_secret_key())' This should display a long random string, perfect to use as a secret key for your brand new Django web site. We will now paste this key into a 
> 
> `.env` file that Glitch will only show you if you are the owner of the web site.  
>   
> * Create a file `.env` at the root of your project and add the following property in it: {% filename %}.env{% endfilename %} 
> 
>     bash
>         # Here, inside the single quotes, you can cut and paste the random key generated above
>         SECRET='3!0k#7ds5mp^-x$lqs2%le6v97h#@xopab&oj5y7d=hxe511jl' * Then update the Django settings file to inject this secret value and set the Django web site name: {% filename %}mysite/settings.py{% endfilename %} 
> 
>     python
>         SECRET_KEY = os.getenv('SECRET') * And a little further, in the same file, we inject the name of your new Glitch website: {% filename %}mysite/settings.py{% endfilename %} 
> 
>     python
>         ALLOWED_HOSTS = [os.getenv('PROJECT_DOMAIN') + ".glitch.me"] The 
> 
> `PROJECT_DOMAIN` value is automatically generated by Glitch. It will correspond to the name of your project.

## Ṣàgbékalẹ̀ àkójọpọ̀ dátà kan

Oríṣiríṣi ètò àkójọpọ̀ dátà ló wà tó lè tọ́jú dátà fún ààyè rẹ. A ó lo ti ìpìlẹ̀ náà, `sqlite3`.

Èyí ti wà ní àgbékalẹ̀ tẹ́lẹ̀ nínú apá yìí ti fáìlì `mysite/settings.py` rẹ:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Láti ṣẹ̀dá àkójọpọ̀ dátà kan fún blog wa, jẹ́ ká ṣe èyí nínú console náà: `python manage.py migrate` (a nílò láti wà nínú àkójọpọ̀ fáìlì `djangogirls` tó kó fáìlì `manage.py` náà sínú). Tí ìyẹn bá ń lọ bí ó ti yẹ, ó yẹ kí o rí nnkan kan báyìí:

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
    

Àti pé a ti parí! Àkókò láti bẹ̀rẹ̀ server ayélujára náà àti ṣàyẹ̀wò tí ààyè ayélujára wa bá n ṣiṣẹ́!

## Bíbẹ̀rẹ̀ server ayélujára náà

O nílò láti wà nínú àkójọpọ̀ fáìlì tó kó fáìlì `manage.py` náà sínú (àkójọpọ̀ fáìlì `djangogirls` náà). Nínú console náà, a lè bẹ̀rẹ̀ server ayélujára náà nípasẹ̀ ṣíṣe `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Tí o bá wà lórí Chromebook kan, lo àṣẹ yìí dípò:

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

> A ti ṣàgbéyẹ̀wò bí àwọn server ayélujára ṣé n ṣiṣẹ́ nínú àkòrí **Bí Íńtánẹ́ẹ̀tì ṣé n ṣiṣẹ́** náà.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). To stop the web server, switch back to the window in which it's running and press CTRL+C - Control and C keys together (on Windows, you might have to press Ctrl+Break).

Ready for the next step? It's time to create some content!