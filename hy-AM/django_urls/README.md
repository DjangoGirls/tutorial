# Django URLs

Մենք պատրաստվում ենք ստեղծել մեր առաջին վեբ էջը. Ձեր բլոգի գլխավոր էջը: Բայց նախ եկեք մի փոքր սովորենք Django URL- ների մասին:

## Ի՞նչ է URL-ը:

URL- ը վեբ հասցե է: Դուք կարող եք տեսնել URL ՝ ամեն անգամ կայք այցելելիս. Այն տեսանելի է ձեր զննարկչի հասցեի տողում: Այո `127.0.0.1:8000` URL է: Եվ `https://djangogirls.org` նույնպես URL է:

![URL](images/url.png)

Ինտերնետում յուրաքանչյուր էջ իր սեփական URL- ի կարիքն ունի: Այս կերպ ձեր հավելվածը գիտի, թե ինչ պետք է ցույց տա այդ URL- ը բացող օգտվողին: Django- ում մենք օգտագործում ենք `URLconf` անունով մի բան (URL configuration/URL կազմաձևում): URLconf- ը օրինաչափությունների ամբողջություն է, որոնք Django- ն կփորձի համապատասխանել ստացված URL- ի հետ `դիտման համար ճիշտ մեթոդ ընտրելու համար:

## Ինչպե՞ս են աշխատում URL- ները Django- ում:

Եկեք բացենք `mysite/urls.py` ֆայլը ձեր ընտրած կոդի խմբագրում և տեսնենք, թե ինչ տեսք ունի այն.

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Ինչպես տեսնում եք, Django- ն այստեղ արդեն ինչ-որ բան է տեղադրել մեզ համար:

Եռապատիկ չակերտների միջեւ տողերը(`'''` or `"""`) կոչվում են docstrings/փաստաթղթերի գծեր. դուք կարող եք դրանք գրել ֆայլի, դասի կամ մեթոդի վերևում `բացատրելու համար, թե ինչ է դա անում: Դրանք չեն գործարկվի Python- ի կողմից:

Նախորդ գլխում այցելած ադմինիստրատորի URL- ն արդեն առկա է այստեղ ՝

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Այս տողը նշանակում է, որ յուրաքանչյուր URL- ի համար, որը սկսվում է `admin/`, /ադմինիստրատորով Django- ն կգտնի համապատասխան *view* /տեսք: Այս դեպքում մենք ընդգրկում ենք մեծ թվով ադմինիստրատորի URL- ներ, որոնք հստակ գրված չեն այս փոքր ֆայլում. Սա շատ ավելի կոկիկ է և ավելի ընթեռնելի:

## Ձեր առաջին Django URL- ը:

Ժամանակն է ստեղծել ձեր առաջին URL- ը: Մենք ուզում ենք, որ «http://127.0.0.1:8000/» - ը լինի մեր բլոգի գլխավոր էջը `դրանում տեղադրված հաղորդագրությունների ցուցակով:

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Առաջ անցեք, տող ավելացրեք `blog.urls` - ը ներմուծելու համար: Նշենք, որ մենք այստեղ օգտագործում ենք `include/ներառման` գործառույթը/function, այնպես որ դուք ստիպված կլինեք այն ներմուծել `from django.urls…` տողում:

Ձեր `mysite/urls.py` ֆայլը այժմ պետք է ունենա այսպիսի տեսք.

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django- ն այժմ «http://127.0.0.1:8000/» - ի բոլոր խնդրանքները կուղղորդի դեպի `blog.urls` և այնտեղ կփնտրի հետագա հրահանգները:

## blog.urls

`blog` գրացուցակում ստեղծեք նոր դատարկ ֆայլ `urls.py` անունով և բացեք այն ձեր կոդի խմբագրում: Շատ լավ! Ավելացրեք այս առաջին երկու տողերը.

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Այստեղ մենք ներմուծում ենք Django- ի `path` գործառույթը և մեր բոլոր `views/դիտումները ` `blog` հավելվածից: (Մենք դեռ դրանք չունենք, բայց մի րոպեից նրանք կհայտնվեն):

Դրանից հետո մենք կարող ենք ավելացնել մեր առաջին URL նմուշը.

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Ինչպես տեսնում եք, մենք կապել ենք `post_list` անունով `view` -ն և արմատային url- ը: This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full URL path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

Եթե ​​այժմ փորձեք այցելել http://127.0.0.1:8000/, ապա դուք պետք է տեսնեք այնպիսի հաղորդագրություն, որում ասվում է ՝ «ինտերնետային էջը հասանելի չէ»/'web page not available' : Դա այն պատճառով է, որ սերվերը (Հիշո՞ւմ եք մուտքագրեք `runserver`) այլևս չի աշխատում: Հայացք գցեք ձեր սերվերի վահանակի պատուհանից ՝ պարզելու պատճառը:

![Error](images/error1.png)

Ձեր վահանակը սխալ է ցույց տալիս, բայց մի անհանգստացեք. Սա իրականում շատ օգտակար է. այն Ձեզ ասում են, որ **no attribute 'post_list'**("բացակայում է հատկությունը 'post_list'"-ում): Դա այն *view*-ի անունն է, որը Django- ն փորձում է գտնել և օգտագործել, բայց մենք այն դեռ չենք ստեղծել: Այս փուլում ձեր `/admin/`/ադմինիստրատորը նույնպես չի աշխատի: Մի անհանգստացեք. Մենք կհասնենք այնտեղ: Եթե ​​այլ սխալի հաղորդագրություն եք տեսնում, փորձեք վերագործարկել/restart ձեր վեբ սերվերը: Դա անելու համար վեբ սերվերը աշխատող վահանակի պատուհանում դադարեցրեք այն ՝ սեղմելով Ctrl + C (Control և C ստեղները միասին): Windows- ում գուցե ստիպված լինեք սեղմել Ctrl + Break: Ապա դուք պետք է վերագործարկեք վեբ սերվերը ՝ գործարկելով <`python manage.py runserver` հրամանը:

> Եթե ​​ցանկանում եք ավելին իմանալ Django- ի ադմինիստրատորի մասին, տես պաշտոնական փաստաթղթերի այս բաժինը ՝ https://docs.djangoproject.com/en/2.2/topics/http/urls/