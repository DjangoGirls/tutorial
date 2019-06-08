# Iṣẹ́ Django àkọ́kọ́ rẹ!

> Apá kan lára àkòrí yìí dá lórí àwọn àlàyé ti Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Àwọn apá kan lára àkòrí yìí dá lórí [àlàyé django-marcador](http://django-marcador.keimlink.de/) náà tó ní ìwé-àṣẹ lábẹ́ Creative Commons Attribution-ShareAlike 4.0 International License. Àlàyé django-marcador náà ni ẹ̀tọ́ rẹ̀ jẹ́ ti Markus Zapke-Gründemann et al.

A óò ṣẹ̀dá blog kékeré kan!

Ìgbésẹ̀ àkọ́kọ́ ni láti bẹ̀rẹ̀ iṣẹ́ Django tuntun kan. Basically, this means that we'll run some scripts provided by Django that will create the skeleton of a Django project for us. Èyí wulẹ̀ jẹ́ àpapọ̀ àkójọpọ̀ fáìlì àti àwọn fáìlì kan tí a ó lò tó bá yá.

Orúkọ àwọn fáìlì àti àkójọpọ̀ fáìlì kan ṣe pàtàkì gan-an fún Django. Ìwọ kò gbọ́dọ̀ ṣàtúnṣe orúkọ àwọn fáìlì tí a fẹ́ ṣẹ̀dá náà. Moving them to a different place is also not a good idea. Django needs to maintain a certain structure to be able to find important things.

> Rántí láti ṣe gbogbo nnkan nínú virtualenv náà. If you don't see a prefix `(myvenv)` in your console, you need to activate your virtualenv. We explained how to do that in the **Django installation** chapter in the **Working with virtualenv** part. Typing `myvenv\Scripts\activate` on Windows or `source myvenv/bin/activate` on Mac OS X or Linux will do this for you.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

In your Mac OS X or Linux console, you should run the following command. **Don't forget to add the period (or dot) `.` at the end!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> The period `.` is crucial because it tells the script to install Django in your current directory (for which the period `.` is a short-hand reference).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin`. The `(myvenv) ~/djangogirls$` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

On Windows you should run the following command. **(Don't forget to add the period (or dot) `.` at the end)**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> The period `.` is crucial because it tells the script to install Django in your current directory (for which the period `.` is a short-hand reference).
> 
> **Note** When typing the command above, remember that you only type the part which starts by `django-admin.exe`. The `(myvenv) C:\Users\Name\djangogirls>` part shown here is just example of the prompt that will be inviting your input on your command line.

<!--endsec-->

`django-admin.py` is a script that will create the directories and files for you. You should now have a directory structure which looks like this:

    djangogirls
    ├───manage.py
    ├───mysite
    │        settings.py
    │        urls.py
    │        wsgi.py
    │        __init__.py
    └───requirements.txt
    

> **Note**: in your directory structure, you will also see your `venv` directory that we created before.

`manage.py` is a script that helps with management of the site. With it we will be able (amongst other things) to start a web server on our computer without installing anything else.

The `settings.py` file contains the configuration of your website.

Remember when we talked about a mail carrier checking where to deliver a letter? `urls.py` file contains a list of patterns used by `urlresolver`.

Let's ignore the other files for now as we won't change them. The only thing to remember is not to delete them by accident!

## Changing settings

Let's make some changes in `mysite/settings.py`. Open the file using the code editor you installed earlier.

**Note**: Keep in mind that `settings.py` is a regular file, like any other. You can open it from inside the code editor, using the "file -> open" menu actions. This should get you the usual window in which you can navigate to your `settings.py` file and select it. Alternatively, you can open the file by navigating to the djangogirls folder on your desktop and right-clicking on it. Then, select your code editor from the list. Selecting the editor is important as you might have other programs installed that can open the file but will not let you edit it.

It would be nice to have the correct time on our website. Go to [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) and copy your relevant time zone (TZ) (e.g. `Europe/Berlin`).

Nínú `settings.py`, wá ìlà tó ní `TIME_ZONE` kí o ṣàtúnṣe rẹ̀ láti yan agbègbè àkókò tìẹ. Fún àpẹẹrẹ:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Africa/Lagos'
```

Kóòdù èdè kan ma ní èdè náà, fún àpẹẹrẹ `en` fún Gẹ̀ẹ́sì tàbí `yo` fún Yorùbá, àti kóòdù orílẹ̀-èdè náà, fún àpẹẹrẹ `de` fún Jámánì tàbí `ng` fún Nàìjíríà. Tí Gẹ̀ẹ́sì kìí ba ṣe èdè abínibí rẹ, o lè ṣàfikún èyí láti ṣàyípadà àwọn bọ́tìnnì ìpìlẹ̀ àti àwọn ìpàkíyèsí láti Django kó wà ní èdè rẹ. Nítorí náà, ìwọ yíò ní bọ́tìnnì "Cancel" (Fagi lé) tí a túmọ̀ sí èdè tí o yàn níbí. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.0/ref/settings/#language-code).

Tí o bá fẹ́ èdè mìíràn kan, ṣàyípadà kóòdù èdè náà nípasẹ̀ ṣíṣe ìyípadà ìlà tó tẹ̀lé yìí:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

We'll also need to add a path for static files. (We'll find out all about static files and CSS later in the tutorial.) Go down to the *end* of the file, and just underneath the `STATIC_URL` entry, add a new one called `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

When `DEBUG` is `True` and `ALLOWED_HOSTS` is empty, the host is validated against `['localhost', '127.0.0.1', '[::1]']`. This won't match our hostname on PythonAnywhere once we deploy our application so we will change the following setting:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Àkíyèsí**: Tí o bá n lo Chromebook kan, ṣàfikún ìlà yìí nísàlẹ̀ fáìlì settings.py rẹ: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Tún ṣàfikún `.amazonaws.com` sí `ALLOWED_HOSTS` náà tí o bá n lo cloud9

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
    

Tí o bá wà lórí Windows tí èyí sì kùnà pẹ̀lú àṣìṣe `UnicodeDecodeError`, lo àṣẹ yìí dípò:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Ní báyìí, o nílò láti ṣàyẹ̀wò tí ààyè ayélujára rẹ bá n ṣiṣẹ́. Ṣí aṣàwákiri rẹ (Firefox, Chrome, Safari, Internet Explorer tàbí èyíkéyìí tó bá n lò) kí o sì tẹ àdírẹ́ẹ̀sì yìí:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

Tí o bá n lo Chromebook kan àti Cloud9, dípò, tẹ URL tó wà nínú fèrèsé aṣẹ́yọsókè tó yẹ kó ti farahàn ní igun òkè lápá ọ̀tún ti fèrèsé ìpàṣẹ níbi tí server ayélujára náà tí n ṣiṣẹ́. URL náà yíò rí báyìí:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

Kú oríire! O ṣẹ̀ṣẹ̀ ṣẹ̀dá ààyè ayélujára àkọ́kọ́ rẹ tí o sì mú u ṣiṣẹ́ pẹ̀lú lílo server ayélujára kan! Ṣe ìyẹn kò dára ni?

![Àgbékalẹ̀ ti ṣiṣẹ́!](images/install_worked.png)

Ṣàkíyèsí pé fèrèsé ìpàṣẹ kan lè ṣe ohun kan ṣoṣo ní àkókò kan, àti pé fèrèsé ìpàṣẹ tí o ṣí tẹ́lẹ̀ tí n ṣiṣẹ́ pẹ̀lú server ayélujára náà. Níwọ̀n ìgbà tí server ayélujára náà bá n ṣiṣẹ́ tó sì n dúró de àwọn ìbéèrè mìíràn tí ń bọ̀, èbúté náà yíò gba ọ̀rọ̀ tuntun ṣùgbọ́n kò ní ṣiṣẹ́ lórí àwọn àṣẹ tuntun.

> A ti ṣàgbéyẹ̀wò bí àwọn server ayélujára ṣé n ṣiṣẹ́ nínú àkòrí **Bí Íńtánẹ́ẹ̀tì ṣé n ṣiṣẹ́** náà.

Láti tẹ àwọn àṣẹ mìíràn nígbà tí server ayélujára náà bá n ṣiṣẹ́, ṣí fèrèsé èbúté tuntun kan kí o sì mú virtualenv rẹ ṣiṣẹ́ -- láti ṣàgbéyẹ̀wò àwọn ìtọ́sọ́nà lórí bí o ṣe lè ṣí fèrèsé èbúté kejì kan, wo [Ìfihàn sí ìlà ìpàṣẹ náà](../intro_to_command_line/README.md). Láti dáwọ́ server ayélujára náà dúró, padà sí fèrèsé èyí tí server náà tí n ṣiṣẹ́ náà kí o sì tẹ CTRL+C - àwọn bọ́tìnnì Control àti C papọ̀ (lórí Windows, o lè ní láti tẹ Ctrl+Break).

Ṣé o ti ṣetán fún ìgbésẹ̀ tó kàn náà? Àkókò ti tó láti ṣẹ̀dá àwọn àkóónú kan!