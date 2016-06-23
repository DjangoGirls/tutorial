# Urls

Estamos prestes a construir nossa primeira Web page - uma página inicial para o seu blog! Mas primeiro, vamos aprender um pouco mais sobre Django urls.

## O que é uma URL?

Uma URL é simplesmente um endereço da web, você pode ver uma URL toda vez que você visita qualquer site - é visível na barra de endereços do seu navegador (Sim! `127.0.0.1:8000` é uma URL! E http://djangogirls.org também é uma URL):

![URL][1]

 [1]: images/url.png

Cada página na Internet precisa de sua própria URL. Desta forma seu aplicativo sabe o que deve mostrar a um usuário que abre uma URL. Em Django, nós usamos algo chamado `URLconf` (configuração de URL), que é um conjunto de padrões que Django vai tentar coincidir com a URL recebida para encontrar a visão correta.

## Como funcionam as URLs em Django?

Vamos abrir o arquivo `mysite/urls.py` e ver com que ele se parece:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
]
```

Como você pode ver, o Django já colocou alguma coisa lá pra nós.

As linhas que começam com `#` são comentários - isso significa que essas linhas não serão executadas pelo Python. Muito útil, não?

A URL do admin, que você visitou no capítulo anterior já está aqui:

```python
    url(r'^admin/', include(admin.site.urls)),
```

Isso significa que para cada URL que começa com `admin /` o Django irá encontrar um correspondente *modo de exibição*. Neste caso nós estamos incluindo um monte de admin URLs para que isso não fique tudo embalado neste pequeno arquivo..--é mais legível e mais limpo.

## Regex

Você quer saber como o Django coincide com URLs para views? Bem, esta parte é complicada. o Django usa o `regex` -- expressões regulares. Regex tem muito (muito!) de normas que formam um padrão de pesquisa. Como regexes são um tópico avançado, nós veremos em detalhes como elas funcionam.

Se você ainda quiser entender como criamos os padrões, aqui está um exemplo do processo - só precisamos um subconjunto limitado de regras para expressar o padrão que procuramos, ou seja:

    ^ para o início do texto
    $ para o final do texto 
    \d para um dígito 
    + para indicar que o item anterior deve ser repetido pelo menos uma vez 
    () para capturar parte do padrão
    

Qualquer outra coisa na definição de url será levada literalmente.

Agora imagine que você tem um site com o endereço assim: `http://www.mysite.com/post/12345/`, onde `12345` é o número do seu post.

Escrever views separadas para todos os números de post seria muito chato. Com expressões regulares podemos criar um padrão que irá coincidir com a url e extrair o número para nós: `^ post/(\d+) / $`. Vamos aos poucos ver o que estamos fazendo aqui:

*   **^ post /** está dizendo ao Django para pegar tudo que tenha `post /` no início da url (logo após o `^`)
*   **(\d+)** significa que haverá um número (um ou mais dígitos) e que queremos o número capturado e extraído
*   **/** diz para o Django que deve seguir outro `/`
*   **$** indica o final da URL significando que apenas sequências terminando com o `/` irão corresponder a esse padrão

## Sua primeira url Django!

É hora de criar nossa primeira URL! Queremos http://127.0.0.1:8000 / para ser uma página inicial do nosso blog e exibir uma lista de posts.

Também queremos manter o arquivo de `mysite/urls.py` limpo, aí nós importaremosurls da nossa aplicação `blog` para o arquivo principal `mysite/urls.py`.

Vá em frente, apague as linhas comentadas (as linhas que começam com `#`) e adicione uma linha que vai importar `blog.urls` para a url principal (`''`).

O seu arquivo `mysite/urls.py` deve agora se parecer com isto:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include('blog.urls')),
]
```

O Django agora irá redirecionar tudo o que entra em 'http://127.0.0.1:8000 /'para `blog.urls` e procurar por novas instruções lá.

Ao escrever as expressões regulares em Python é sempre feito com `r` na frente da sequência - isso é só uma dica útil para Python que a seqüência pode conter caracteres especiais que não são destinadas para Python em si, mas em vez disso são parte da expressão regular.

## blog.urls

Crie um novo arquivo vazio `blog/urls.py`. Tudo bem! Adicione estas duas primeiras linhas:

```python
from django.conf.urls import include, url
from . import views
```

Aqui nós estamos apenas importando métodos do Django e todos os nossos `views` do aplicativo `blog` (ainda não temos nenhuma, mas teremos em um minuto!)

Depois disso nós podemos adicionar nosso primeira URL padrão:

```python
urlpatterns = [
    url(r'^$', views.post_list),
]
``` 

Como você pode ver, estamos agora atribuindo uma `view` chamada `post_list` para `^ $` URL. Essa expressão regular corresponderá a `^` (um começo) seguido por `$` (fim) - então somente uma seqüência vazia irá corresponder. E isso é correto, porque em resolvedores de Django url, ' http://127.0.0.1:8000 /' não é uma parte da URL. Este padrão irá mostrar o Django que `views.post_list` é o lugar certo para ir, se alguém entra em seu site no endereço 'http://127.0.0.1:8000 /'.

Tudo certo? Abra http://127.0.0.1:8000 no seu navegador pra ver o resultado.

![Erro][2]

 [2]: images/error1.png

Não tem mais "It Works!' mais ein? Não se preocupe, é só uma página de erro, nada a temer! Elas são na verdade muito úteis:

Você pode ler que não há **no attribute 'post_list'**. O *post_list* te lembra alguma coisa? Isto é como chamamos o nosso view! Isso significa que está tudo no lugar, só não criamos nossa *view* ainda. Não se preocupe, nós chegaremos lá.

> Se você quer saber mais sobre Django URLconfs, veja a documentação oficial: https://docs.djangoproject.com/en/1.8/topics/http/urls/
