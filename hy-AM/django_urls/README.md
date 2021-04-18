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

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory, and open it in the code editor. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `path` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full URL path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together). On Windows, you might have to press Ctrl+Break. Then you need to restart the web server by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/urls/