# URL-e Django

Zaczynamy budować naszą pierwszą stronę internetową: będzie to miejsce dla twojego bloga! Ale zanim zaczniemy, nauczmy się trochę na temat URL-i w Django.

## Czym jest URL?

Adres URL to po prostu adres w internecie. Możesz zobaczyć URL-a za każdym razem, gdy odwiedzasz stronę internetową - jest on widoczny w pasku adresu przeglądarki internetowej. (Tak! `127.0.0.1:8000` jest adresem URL! Też `https://djangogirls.org` jest adresem URL.)

![Adres URL](images/url.png)

Każda strona w internecie potrzebuje własnego adresu URL. W ten sposób aplikacja wie, co wyświetlić użytkownikowi, który otworzy dany URL. W Django używamy tak zwanego `URLconf` (konfiguracji URL). URLconf to zestaw wzorców, które Django spróbuje dopasować do żądanego adresu URL, aby znaleźć poprawny widok.

## Jak działają adresy URL w Django?

Otwórzmy plik `mysite/urls.py` i przyjrzyjmy się jego treści:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Jak zauważyłaś, Django coś nam już tu umieścił.

Linie między potrójnymi cudzysłowami (` '''` lub `""" `) nazywa się docstrings - możesz zapisać je na górze pliku, klasy lub metody, aby opisać, co robi. Nie będą one uruchamiane przez Pythona.

Adres URL panelu administracyjnego, który odwiedzałaś w poprzednim rozdziale, jest już tutaj dodany:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

To znaczy, że dla każdego adresu zaczynającego się od `admin/` Django spróbuje dopasować odpowiedni *widok*. W tym przypadku używamy wielu adresów URL panelu administracyjnego, dlatego nie wypisujemy ich wszystkich w tym jednym małym pliku - tak jest czytelniej i bardziej estetycznie.

## Twój pierwszy adres URL w Django!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Your `mysite/urls.py` file should now look like this:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Błąd](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> Jeśli chciałabyś dowiedzieć się więcej na temat konfiguracji URL w Django, zajrzyj do oficjalnej dokumentacji: https://docs.djangoproject.com/en/2.0/topics/http/urls/