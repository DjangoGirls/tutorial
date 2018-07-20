# Django URLs

Estamos prestes a construir nossa primeira página Web: uma página inicial para o seu blog! Mas primeiro, vamos aprender um pouco mais sobre as URLs do Django.

## O que é uma URL?

Uma URL é simplesmente um endereço da web. Você pode ver uma URL toda vez que você visita um website - ela é visível na barra de endereços do seu navegador. (Sim! `127.0.0.1:8000` é uma URL! E `https://djangogirls.org` também é uma URL.)

![URL](images/url.png)

Cada página na Internet precisa de sua própria URL. Desta forma, sua aplicação sabe o que deve mostrar a um usuário que abre uma URL. Em Django, usamos algo chamado `URLconf` (configuração de URLs). URLconf é um conjunto de padrões que o Django vai usar para comparar com a URL recebida para encontrar a resposta correta.

## Como funcionam as URLs em Django?

Vamos abrir o arquivo `mysite/urls.py` no seu editor de código preferido e ver o que aparece:

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

Como você pode ver, o Django já colocou alguma coisa aqui pra nós.

Linhas entre aspas triplas (`'''` ou `"""`) são chamados de docstrings -- você pode escrevê-las no topo de um arquivo, classe ou método para descrever o que ele faz. Elas não serão executadas pelo Python.

A URL do admin, que você visitou no capítulo anterior, já está aqui:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Isso significa que para cada URL que começa com `admin /` o Django irá encontrar uma *view* correspondente. Neste caso nós estamos incluindo várias URLs de admin de uma vez a partir de uma lista criada pelo próprio Django em <0>admin.site.urls</0>. Desta forma, não temos que repetir todas URLs no nosso modesto arquivo -- é mais legível e mais limpo.

## Sua primeira URL no Django!

É hora de criar nossa primeira URL! Queremos que http://127.0.0.1:8000 / seja a página inicial do nosso blog e exiba uma lista de posts.

Também queremos manter o arquivo de `mysite/urls.py` limpo e desta forma importaremos as URLS da nossa aplicação `blog` no arquivo principal `mysite/urls.py`.

Adicione uma linha para importar `blog.urls`. Note que estamos usando a função `include`, então você também precisará importar esta função.

O seu arquivo `mysite/urls.py` deve agora se parecer com isto:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

O Django agora irá redirecionar tudo o que entra em 'http://127.0.0.1:8000 /'para `blog.urls` e procurar por novas instruções lá.

## blog.urls

Crie um novo arquivo vazio chamado `urls.py` no diretório `blog`. É fácil! Basta adicionar essas duas linhas:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Aqui nós estamos importando do Django a função `url` e todas nossas `views` do aplicativo `blog` (Não temos nenhuma ainda, mas nós chegaremos a isso em um minuto!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Como você pode ver, estamos agora atribuindo uma `view` chamada `post_list` à URL raiz. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/