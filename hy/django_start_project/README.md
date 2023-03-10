# Ձեր առաջին Django նախագիծը:

> Այս գլխի մի մասը հիմնված է Geek Girls Carrots- ի ձեռնարկների վրա (https://github.com/ggcarrots/django-carrots):
> 
> Այս գլխի մասերը հիմնված են django-marcador ձեռնարկի վրա, որը լիցենզավորված է Creative Commons Attribution-ShareAlike 4.0 միջազգային լիցենզիայի կողմից: Django-marcador ձեռնարկի հեղինակային իրավունքները պաշտպանված են Markus Zapke-Gründemann- ի և այլոց կողմից:

Մենք պատրաստվում ենք ստեղծել փոքրիկ բլոգ:

Առաջին քայլը նոր Django նախագիծ սկսելն է: Ըստ էության, սա նշանակում է, որ մենք գործարկելու ենք մի քանի ստանդարտ սցենարներ Django բաշխումից, որոնք կստեղծեն նախագծի կմախք մեզ համար: Սա ընդամենը գրացուցակների և ֆայլերի մի խումբ է, որոնք մենք կօգտագործենք ավելի ուշ:

Որոշ ֆայլերի և գրացուցակների անունները շատ կարևոր են Django- ի համար: Դուք չպետք է վերանվանեք այն ֆայլերը, որոնք մենք պատրաստվում ենք ստեղծել: Նրանց այլ տեղ տեղափոխելը նույնպես լավ գաղափար չէ: Django- ն պետք է որոշակի կառուցվածք պահպանի, որպեսզի կարողանա գտնել կարևոր բաներ:

> Մի մոռացեք. Դուք պետք է գործադրեք բոլոր հրամանները virtualenv- ով: Եթե ​​հրամանի տողում չեք տեսնում `(myvenv)` նախածանցը, ապա ձեզ հարկավոր է ակտիվացնել virtualenv- ը: Մենք բացատրեցինք, թե ինչպես դա անել, **Django installation/Django տեղադրում** գլխի **Working with virtualenv/ Աշխատանք virtualenv-ի հետ ** բաժնում: Դա անելու համար մուտքագրեք `myvenv\Scripts\activate` Windows- ում կամ `source myvenv/bin/activate` Mac OS / Linux- ում:

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Mac OS- ի կամ Linux- ի վահանակի վրա գործարկեք հետևյալ հրամանը. **մի մոռացեք կետ ավելացնել `  ` at the end!/վերջում**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> `.` կետը կարևոր է, քանի որ այն ասում է, որ սցենարը Django- ն տեղադրի ձեր ընթացիկ գրացուցակում (որի համար `.` կետը կարճ հղում է):
> 
> **Նշում** Վերը նշված հրամանը մուտքագրելիս հիշեք, որ դուք մուտքագրում եք միայն այն հատվածը, որը սկսվում է `django-admin` - ի կողմից: Այս `(myvenv) ~/djangogirls$` հատվածը, որը ցույց է տրված այստեղ, ուղղակի հուշման օրինակ է ՝ հետագա հրամանի մուտքագրման համար:

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Windows- ում պետք է գործարկել հետևյալ հրամանը: ** (Մի մոռացեք վերջում ավելացնել կետը) `. `) **:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> `.` կետը կարևոր է, քանի որ այն ասում է, որ սցենարը Django- ն տեղադրի ձեր ընթացիկ գրացուցակում (որի համար `.` կետը կարճ հղում է):
> 
> ** Նշում ** Վերը նշված հրամանը մուտքագրելիս հիշեք, որ դուք մուտքագրում եք միայն այն մասը, որը սկսվում է `django-admin.exe` - ով: `(myvenv) C:\Users\Name\djangogirls>` սրանք ընդամենը տերմինալային արագ տողերի օրինակներ են ՝ հետագա հրամանի մուտքագրման համար:

<!--endsec-->

`django-admin.py` սա սցենար է, որը կստեղծի գրացուցակի անհրաժեշտ կառուցվածքը և ֆայլերը մեզ համար: Այժմ դուք պետք է ունենաք ծրագրի հետևյալ կառուցվածքը.

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **Նշում**. Գրացուցակի կառուցվածքում կտեսնեք նաև ձեր ` myvenv ` գրացուցակը, որը մենք ավելի վաղ ստեղծել էինք:

`manage.py` սա սցենար է, որն օգնում է կառավարել կայքը: Դրանով մենք կկարողանանք վեբ սերվեր գործարկել ձեր համակարգչում ՝ առանց լրացուցիչ ծրագրեր տեղադրելու:

` settings.py ` ֆայլը պարունակում է ձեր կայքի կարգավորումները:

Հիշո՞ւմ եք փոստատարի հետ մեր անալոգիան, որը ստուգում է, թե որտեղ պետք է նամակ առաքել: ` urls.py ` ֆայլը պարունակում է ` urlresolver ` - ի կողմից օգտագործված օրինաչափությունների ցուցակ:

Եկեք առայժմ մոռանանք մնացած ֆայլերի մասին , քանի որ դրանք չենք փոխելու: Միակ բանը, որ պետք է հիշել, դրանք պատահաբար չջնջելն է:

## Փոխել կարգավորումները

Եկեք որոշ փոփոխություններ կատարենք `mysite/settings.py` - ում: Բացեք ֆայլը ՝ ավելի վաղ տեղադրած կոդերի խմբագրիչի/code editor-ի միջոցով:

**Նշում**. Հիշեք, որ `settings.py`- ը սովորական ֆայլ է, ինչպես ցանկացած այլ: Կարող եք այն բացել ձեր կոդերի խմբագրից `օգտագործելով "file -> open" /«ֆայլ-> բաց » գործողությունների ընտրացանկը: Սա ձեզ կտա սովորական պատուհանը, որում կարող եք անցնել ձեր `settings.py` ֆայլը և ընտրել այն: Այլապես, ֆայլը կարող եք բացել ՝ անցնելով ձեր աշխատասեղանի djangogirls պանակը և սեղմել աջ քլիք ֆայլի վրա: Ապա, ցուցակից ընտրեք ձեր կոդի խմբագիրը: Խմբագրի ընտրությունը կարևոր է, քանի որ կարող եք տեղադրել այլ ծրագրեր, որոնք կարող են բացել ֆայլը, բայց թույլ չեն տալիս խմբագրել այն:

Լավ կլինի մեր կայքում ճիշտ ժամային գոտի սահմանել: Գնացեք [Wikipedia's list of time zones/Վիքիպեդիայի ժամային գոտիների ցուցակ](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) և պատճենեք ձեր համապատասխան ժամային գոտին (TZ) (օրինակ `Europe/Berlin`):

`settings.py` ֆայլում գտեք `TIME_ZONE` պարունակող տողը և փոփոխեք այն ըստ ձեր ժամային գոտու: Օրինակ.

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

Լեզվի կոդը կազմված է մի լեզվով, օրինակ ``en` անգլերենի համար կամ `de` գերմաներենի համար, և երկրի կոդ, ինչպիսիք են `de`- ն Գերմանիայի համար կամ `ch`-ն Շվեյցարիայի համար: Եթե ​​անգլերենը ձեր մայրենի լեզուն չէ, կարող եք լեզու ավելացնել ՝ սկզբնադիր կոճակները և ծանուցումները Django- ից ձեր մայրենի լեզվով փոխելու համար: Այսպիսով, դուք կունենաք "Cancel"/«Չեղարկել» կոճակը թարգմանված այն լեզվով, որը դուք ընտրել եք այստեղ: [Django comes with a lot of prepared translations/ Django- ն տրամադրում է բազմաթիվ թարգմանություններ:](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code):

Եթե ​​այլ լեզվի կարիք ունեք, փոխեք լեզվի կոդը `փոխելով հետևյալ տողը.

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Անհրաժեշտ է նաև ավելացնել ուղի/path ստատիկ ֆայլերի/static files համար: (Ստատիկ ֆայլերի և CSS- ի մասին ամեն ինչ կիմանանք ավելի ուշ ձեռնարկի ընթացքում): Իջեք ֆայլի *end/վերջը* և անմիջապես `STATIC_URL` գրառման տակ, ավելացրեք նորը ՝ `STATIC_ROOT`.

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

Երբ `DEBUG`- ը `True/ճիշտ է`ճիշտ է, և `ALLOWED_HOSTS`- ը սահմանված չէ, ընդունիչը գտնվում է ընդդեմ `['localhost', '127.0.0.1', '[::1]']` . Մեր դիմումը գործադրելուց հետո սա չի համապատասխանում PythonAnywhere-ում մեր hostname-ին (հյուրընկալող անունին ), այնպես որ մենք կփոխենք հետևյալ կարգավորումները:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> ** Նշում**. Եթե օգտագործում եք Chromebook, ավելացրեք այս տողը ձեր settings.py ֆայլի վերջում. `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Ինչպես նաև, ավելացրեք ` .amazonaws.com `-ը ` ALLOWED_HOSTS ` - ին, եթե օգտագործում եք cloud9
> 
> Եթե ​​դուք ընդունում եք ձեր նախագիծը ` Glitch.com ` կայքում, եկեք պաշտպանենք Django գաղտնի բանալին, որը անհրաժեշտ է մնացեք գաղտնի (հակառակ դեպքում ձեր նախագիծը վերամշակող ցանկացած անձ կարող է տեսնել այն).
> 
> - Նախ, մենք պատրաստվում ենք ստեղծել պատահական գաղտնի բանալի: Կրկին բացեք Glitch տերմինալը և մուտքագրեք հետևյալ հրահանգը.
>     
>     {% filename %}command-line{% endfilename %}
>     
>     ```bash
>     python -c 'from django.core.management.utils import get_random_secret_key; \
>           print(get_random_secret_key())'
>     ```
>     
>     Սա պետք է ցուցադրի երկար պատահական տող, որը կատարյալ է որպես գաղտնի բանալի ձեր Django բոլորովին նոր կայքի համար: Այս բանալին մենք այժմ կպցրենք ` .env ` ֆայլի մեջ, որը Glitch- ը ցույց կտա ձեզ միայն այն դեպքում, եթե դուք եք կայքի սեփականատերը:
> 
> - Ձեր նախագծի հիմքում ստեղծեք ` .env ` ֆայլ և դրանում ավելացրեք հետևյալ հատկությունը.
>     
>     {% filename %}.env{% endfilename %}
>     
>     ```bash
>     # Here, inside the single quotes, you can cut and paste the random key generated above
>     SECRET='3!0k#7ds5mp^-x$lqs2%le6v97h#@xopab&oj5y7d=hxe511jl'
>     ```
> 
> - Դրանից հետո թարմացրեք Django- ի կարգավորումների ֆայլը `այս գաղտնի արժեքը ներարկելու համար և տեղադրելով Django կայքի անունը`
>     
>     {% filename %}mysite/settings.py{% endfilename %}
>     
>     ```python
>     SECRET_KEY = os.getenv('SECRET')
>     ```
> 
> - Եվ նույն ֆայլում մի փոքր ներքև, մենք ներարկում ենք ձեր նոր Glitch կայքի անունը (website-ը).
>     
>     {% filename %}mysite/settings.py{% endfilename %}
>     
>     ```python
>     ALLOWED_HOSTS = [os.getenv('PROJECT_DOMAIN') + ".glitch.me"]
>     ```
>     
>     ` PROJECT_DOMAIN ` արժեքն ինքնաբերաբար գեներացվում է Glitch- ի կողմից: Այն կհամապատասխանի ձեր ծրագրի անվանը:

## Ստեղծեք տվյալների բազա

Ծրագրակազմ կան տարբեր տվյալների բազաներ, որոնք կարող են պահել տվյալներ ձեր կայքի համար: Մենք կօգտագործենք սա ՝ `sqlite3`:

Սա արդեն տեղադրված է ձեր ` mysite / settings.py ` ֆայլի այս մասում.

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}
```

Մեր բլոգի համար տվյալների շտեմարան ստեղծելու համար եկեք վահանակում գործարկենք հետևյալը.`python manage.py migrate` (մենք պետք է լինենք `djangogirls` գրացուցակում, որը պարունակում է `manage.py` ֆայլը) Եթե ​​ամեն բան լավ է, դուք պետք է տեսնեք նման մի բան.

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
    

Եվ մենք ավարտեցինք: Ժամանակն է սկսել վեբ սերվերը և տեսնել, թե արդյոք մեր կայքը գործում է:

## Վեբ սերվերի գործարկում

Դուք պետք է լինեք գրացուցակում, որտեղ գտնվում է `manage.py` ֆայլը (մեր դեպքում ՝ `djangogirls`): Վահանակում մենք կարող ենք սկսել վեբ սերվերը ՝ գործարկելով `python manage.py runserver`.

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Եթե ​​աշխատում եք Chromebook- ի վրա, ապա օգտագործեք այս հրահանգը.

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

կամ սա, եթե օգտագործում եք Glitch:

{% filename %}Glitch.com terminal{% endfilename %}

    $ refresh
    
    

Եթե ​​դուք Windows- ում եք, և դա չի հաջողվում ` UnicodeDecodeError ` - ի հետ, փոխարենը օգտագործեք այս հրամանը.

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Այժմ դուք պետք է ստուգեք, արդյո՞ք ձեր կայքը գործում է: Բացեք ձեր բրաուզերը (Firefox, Chrome, Safari, Internet Explorer կամ այլ ինչ որ օգտագործում եք) և մուտքագրեք այս հասցեն.

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

Եթե ​​օգտագործում եք Chromebook և Cloud9, փոխարենը կտտացրեք ելնող պատուհանի URL- ին, որը պետք է որ հայտնվեր հրամանի պատուհանի վերևի աջ անկյունում, որտեղ վեբ սերվերն է աշխատում: URL- ն այսպիսի տեսք կունենա.

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

or on Glitch:

    https://name-of-your-glitch-project.glitch.me
    

Շնորհավորում եմ Դուք պարզապես ստեղծել եք ձեր առաջին վեբ կայքը և այն վարում եք վեբ սերվերի միջոցով: Դա հիանալի, այնպես չէ՞:

![Տեղադրեք աշխատանքը!](images/install_worked.png)

Նկատի ունեցեք, որ հրամանի պատուհանը միանգամից կարող է գործարկել միայն մեկ բան, իսկ ավելի վաղ ձեր բացած հրամանի պատուհանը վեբ սերվերն է գործարկում: Քանի դեռ վեբ սերվերը աշխատում է և սպասում է լրացուցիչ մուտքային հարցումների, տերմինալը կընդունի նոր տեքստ, բայց չի կատարի նոր հրամաններ:

> Մենք ստուգեցինք, թե ինչպես են աշխատում վեբ սերվերները ** Ինչպես է աշխատում ինտերնետը/How the Internet works ** գլխում:

Վեբ սերվերի գործարկման ժամանակ լրացուցիչ հրամաններ մուտքագրելու համար բացեք նոր տերմինալի պատուհան և ակտիվացրեք ձեր virtualenv-ը. երկրորդ տերմինալի պատուհանը բացելու վերաբերյալ հրահանգները վերանայելու համար տե՛ս [Introduction to the command line/Հրամանի տողի ներածություն](../intro_to_command_line/README.md) բաժնում: Վեբ սերվերը դադարեցնելու համար վերադարձրեք այն պատուհանը, որում այն ​​աշխատում է, և միասին սեղմեք CTRL + C - Control և C ստեղները (Windows- ում գուցե ստիպված լինեք սեղմել Ctrl + Break):

Պատրա՞ստ եք հաջորդ քայլին: Ժամանակն է ստեղծել որոշակի բովանդակություն: