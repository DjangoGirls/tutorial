# Django URLs

Estamos prestes a construir nossa primeira página Web - uma página inicial para o seu blog! Mas primeiro, vamos aprender um pouco mais sobre Django URLs.

## O que é uma URL?

Uma URL é simplesmente um endereço web, você pode ver uma URL toda vez que você visita qualquer site - é visível na barra de endereços do seu navegador (Sim! `127.0.0.1:8000` é uma URL! E http://djangogirls.org também é uma URL):

![Url](images/url.png)

Cada página na Internet precisa de sua própria URL. Desta forma, seu aplicativo sabe o que deve mostrar ao usuário que abre uma URL. No Django, nós usamos algo chamado `URLconf` (configuração de URL), que é um conjunto de padrões que o Django vai tentar coincidir com a URL recebida, para encontrar a visão correta.

## Como funcionam as URLs em Django?

Vamos abrir o arquivo `mysite/urls.py` e ver com que ele se parece:

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

Como você pode ver, o Django já colocou alguma coisa lá pra nós.

Linhas entre aspas triplas (`'''` ou `"""`)  são chamadas docstrings – você pode escrevê-las no início do arquivo, classe ou
método para descrever o que é feito. Essas linhas não serão executadas pelo Python.

A URL do admin, que você visitou no capítulo anterior já está aqui:

{% filename %}mysite/urls.py{% endfilename %}
```python
    url(r'^admin/', admin.site.urls),
```

Isso significa que para cada URL que começa com `admin /` o Django irá encontrar uma *view* correspondente. Neste caso nós estamos incluindo um monte de URLs admin para que isso não fique tudo empacotado neste pequeno arquivo -- fica mais legível e mais limpo.

## Regex

Você quer saber como o Django coincide as URLs com as views? Bem, esta parte é complicada. o Django usa a `regex` -- abreviação de "expressões regulares". Regex tem muitas (muitas!) normas que formam um padrão de pesquisa. Como regexes são um tópico avançado, nós não veremos em detalhes como elas funcionam.

Se você ainda quiser entender como criamos os padrões, aqui está um exemplo do processo - só precisamos de um subconjunto limitado de regras para expressar o padrão que procuramos, ou seja:

* `^` para o início do texto
* `$` para o final do texto
* `\d` para um dígito
* `+` para indicar que o item anterior deve ser repetido pelo menos uma vez 
* `()` para capturar parte do padrão

Qualquer outra coisa na definição da url será literalmente considerada.

Agora imagine que você tem um site com o endereço assim: `http://www.mysite.com/post/12345/`, onde `12345` é o número do seu post.

Escrever views separadas para todos os números de post seria muito chato. Com expressões regulares podemos criar um padrão que irá coincidir com a url e extrair o número para nós: `^post/(\d+)/$`. Vamos separar em etapas o que estamos fazendo aqui:

*   **^post/** está dizendo ao Django para pegar tudo que tenha `post/` no início da url (logo após o `^`)
*   **(\d+)** significa que haverá um número (um ou mais dígitos) e que queremos o número capturado e extraído
*   **/** diz para o Django que outro caractere `/` deve estar na sequência
*   **$** indica o final da URL, significando que apenas sequências terminando com o `/` irão corresponder a esse padrão

## Sua primeira URL Django!

É hora de criar nossa primeira URL! Queremos http://127.0.0.1:8000 / para ser uma página inicial do nosso blog e exibir uma lista de posts.

Também queremos manter o arquivom`mysite/urls.py` limpo, então nós importaremos as URLs da nossa aplicação `blog` para o arquivo principal `mysite/urls.py`.

Vá em frente, adicione uma linha que irá importar `blog.urls`. Note que nós estamos usando a função `include` aqui, então **você precisará** adicionar ela no "import", na primeira linha do arquivo.

Seu arquivo `mysite/urls.py` deve agora se parecer com isso:

{% filename %}mysite/urls.py{% endfilename %}
```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

O Django agora irá redirecionar tudo o que entra em 'http://127.0.0.1:8000 /'para `blog.urls` e procurar por novas instruções lá.

Ao escrever expressões regulares em Python sempre é colocado `r` na frente da sequência de caracteres ("string"). Isso é só uma dica útil para Python que a sequência pode conter caracteres especiais que não são destinadas para Python em si, mas em vez disso são parte da expressão regular.

## blog.urls

Crie um novo arquivo vazio `blog/urls.py`. Tudo bem! Adicione estas duas primeiras linhas:

{% filename %}blog/urls.py{% endfilename %}
```python
from django.conf.urls import url
from . import views
```

Aqui nós estamos apenas importando a função `url` do Django e todos as nossas `views` do aplicativo `blog` (ainda não temos nenhuma, mas teremos em um minuto!)

Depois disso nós podemos adicionar nosso primeiro padrão de URL:

{% filename %}blog/urls.py{% endfilename %}
```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Como você pode ver, estamos agora atribuindo uma `view` chamada `post_list` para a URL `^$`. Essa expressão regular corresponderá a `^` (um começo) seguido por `$` (um fim) - então somente uma sequência vazia irá corresponder. E isso está correto, porque para os resolvedores de URL do Django, ' http://127.0.0.1:8000 /' não é uma parte da URL. Este padrão irá mostrar ao Django que `views.post_list` é o lugar certo para ir, se alguém entra em seu site pelo endereço 'http://127.0.0.1:8000 /'.

A última parte, `name='post_list'`, é o nome da URL que será usado para identificar a view. Ele pode ser o mesmo nome da view, mas também pode ser algo completamente diferente. Nós iremos usar URLs nomeadas mais tarde no projeto, então é importante nomear cada URL da app. Nós devemos também tentar manter os nomes das URLs únicos e fáceis de lembrar.

Se você tentar visitar http://127.0.0.1:8000/ agora, então você verá uma mensagem do tipo 'web page not available' (página não disponível). Isso acontece porquê o servidor (lembra de digitar `runserver`?) não está mais rodando. De uma olhada na janela do console do servidor para descobrir o porquê.

![Error](images/error1.png)

O seu console está exibindo um erro, mas não se preocupe – ele é bem útil: Ele está dizendo a você que existe um __no attribute 'post_list'__. Esse é o nome da *view* que o Django está tentando encontrar e usar, mas nós ainda não a criamos. Nesse momento sua `/admin/` também não funciona. Não se preocupe – nós chegaremos lá.

> Se você quer saber mais sobre Django URLconfs, veja a documentação oficial: https://docs.djangoproject.com/en/1.9/topics/http/urls/
