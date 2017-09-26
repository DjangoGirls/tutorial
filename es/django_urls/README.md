# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## ¿Qué es una URL?

Una URL es simplemente una dirección web. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! ¡`127.0.0.1:8000` es una URL! And `https://djangogirls.org` is also a URL.)

![URL](images/url.png)

Cada página en Internet necesita su propia URL. This way your application knows what it should show to a user who opens that URL. En Django utilizamos algo que se llama `URLconf` (configuración de URL). URLconf is a set of patterns that Django will try to match with the requested URL to find the correct view.

## ¿Cómo funcionan las URLs en Django?

Vamos a abrir el archivo `mysite/urls.py` en el editor de código de tu elección y veamos lo que tiene:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

As you can see, Django has already put something here for us.

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. They won't be run by Python.

The admin URL, which you visited in previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Regex

¿Te preguntas cómo compara Django las direcciones URL con las vistas? Bueno, esta parte es complicada. Django usa `regex`, abreviatura de "expresiones regulares". Regex tiene muchas normas (¡un montón!) que forman un patrón de búsqueda. Como las regex son un tema avanzado, no vamos a entrar en detalle de cómo funcionan.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Escribir vistas separadas para todos los números de entradas en el blog sería realmente molesto. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the url (right after `^`)
* **(\d+)** significa que habrá un número (de uno o más dígitos) y que queremos que ese número sea capturado y extraído
* **/** le dice a Django que otro caracter `/` debería venir a continuación
* **$** indica el final de la URL, lo que significa que sólo coincidirán con este patrón las cadenas que terminen en `/`

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so **you will need** to add that to the import on the first line of the file.

El archivo `mysite/urls.py` debería verse ahora así:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

Ahora Django redirigirá todo lo que entre a 'http://127.0.0.1:8000/' hacia `blog.urls` y buscará más instrucciones allí.

Writing regular expressions in Python is always done with `r` in front of the string. Esto le da una pista a Python de que la cadena puede contener caracteres especiales que no son para Python en sí, sino para la expresión regular.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Luego de esto, podemos agregar nuestro primer patrón URL:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. Es correcto, porque en el sistema de resolución de URL de Django, 'http://127.0.0.1:8000/' no forma parte de la URL. Este patrón le dirá a Django que `views.post_list` es el lugar correcto al que ir si alguien entra a tu sitio web con la dirección 'http://127.0.0.1:8000/'.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Puede coincidir con el nombre de la vista pero también puede ser algo completamente distinto. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/1.11/topics/http/urls/