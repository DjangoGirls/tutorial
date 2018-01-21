# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## O que é uma URL?

Uma URL é simplesmente um endereço da web. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000` é uma URL! And `https://djangogirls.org` is also a URL.)

![URL](images/url.png)

Cada página na Internet precisa de sua própria URL. This way your application knows what it should show to a user who opens that URL. Em Django, usamos algo chamado `URLconf` (configuração de URL). URLconf is a set of patterns that Django will try to match with the requested URL to find the correct view.

## Como funcionam as URLs em Django?

Vamos abrir o arquivo `mysite/urls.py` no seu editor de código preferido e ver o que aparece:

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

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. Elas não serão executadas pelo Python.

The admin URL, which you visited in previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Regex

Você quer saber como o Django coincide com URLs para views? Bem, esta parte é complicada. O Django usa `regex`, contração de "regular expressions", que significa "expressões regulares", do Inglês. Regex tem muito (muito!) de normas que formam um padrão de pesquisa. Como expressões regulares são um tópico mais avançado, não veremos em detalhes como elas funcionam.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Escrever views separadas para todos os números de post seria muito chato. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the url (right after `^`)
* **(\d+)** significa que haverá um número (um ou mais dígitos) e que queremos o número capturado e extraído
* **/** diz para o Django que deve seguir outro `/`
* **$** indica o final da URL significando que apenas sequências terminando com o `/` irão corresponder a esse padrão

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

O seu arquivo `mysite/urls.py` deve agora se parecer com isto:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

O Django agora irá redirecionar tudo o que entra em 'http://127.0.0.1:8000 /'para `blog.urls` e procurar por novas instruções lá.

Writing regular expressions in Python is always done with `r` in front of the string. Essa é uma dica para o Python que a string pode conter caracteres especiais que não possuem significado para o interpretador Python, mas sim para a expressão regular.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Depois disso nós podemos adicionar nosso primeira URL padrão:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. Está correto, porque no Django 'http://127.0.0.1:8000/' não faz parte da URL. Essa expressão diz algo Django que `views.post_list` é o que deve ser chamado quando alguém acessar seu website pelo endereço 'http://127.0.0.1:8000/'.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. Este nome pode ser o mesmo nome da view, mas também pode ser algo completamente diferente. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

Se você tentar visitar http://127.0.0.1:8000 / agora, então você vai encontrar algum tipo de mensagem 'página web não disponível'. Isso ocorre porque o servidor (Lembre-se de digitar `runserver`?) não está mais funcionando. Dê uma olhada na sua janela de console do servidor para descobrir o porquê.

![Erro](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. Esse é o nome da *view* que Django está a tentando encontrar e usar, mas ainda não a criamos. At this stage your `/admin/` will also not work. No worries – we will get there.

> Se você quer saber mais sobre Django URLconfs, veja a documentação oficial: https://docs.djangoproject.com/en/1.11/topics/http/urls/