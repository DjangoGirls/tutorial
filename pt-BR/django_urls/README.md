# URLs

Estamos prestes a construir nossa primeira página Web: uma página inicial para o seu blog! Mas primeiro, vamos aprender um pouco mais sobre as URLs do Django.

## O que é uma URL?

Uma URL é um endereço da web. Você pode ver uma URL toda vez que você visita um website - ela aparece na barra de endereços do seu navegador. (Sim! `127.0.0.1:8000` é uma URL! E `https://djangogirls.org` também é uma URL.)

![URL](images/url.png)

Cada página na Internet precisa de sua própria URL. Desta forma, sua aplicação sabe o que deve mostrar a um usuário que abre uma URL. Em Django, usamos algo chamado `URLconf` (configuração de URLs). URLconf é um conjunto de padrões que o Django vai usar para comparar com a URL recebida para encontrar a resposta correta.

## Como funcionam as URLs em Django?

Abra o arquivo `mysite/urls.py` no seu editor de código preferido e veja o que aparece:

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

Como você pode ver, o Django já colocou alguma coisa aqui para nós.

Linhas entre aspas triplas (`'''` ou `"""`) são chamadas de docstrings -- você pode escrevê-las no topo de um arquivo, classe ou método para descrever o que ele faz. Elas não serão executadas pelo Python.

A URL do admin, que você visitou no capítulo anterior, já está aqui:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Isso significa que para cada URL que começa com `admin/`, o Django irá encontrar uma *view* correspondente. Neste caso nós estamos incluindo várias URLs de admin de uma vez a partir de uma lista criada pelo próprio Django em <0>admin.site.urls</0>. Desta forma, não temos que repetir todas URLs no nosso modesto arquivo -- é mais legível e mais limpo.

## Sua primeira URL no Django!

É hora de criar nossa primeira URL! Queremos que http://127.0.0.1:8000 / seja a página inicial do nosso blog e exiba uma lista de posts.

Também queremos manter o arquivo de `mysite/urls.py` limpo, e portanto importaremos as URLS da nossa aplicação `blog` no arquivo principal `mysite/urls.py`.

Vá em frente, adicione uma linha que importará `blog.urls` Você também irá precisar alterar a linha `from django.urls...` porque nós estamos utilizando a função `include` aqui, então você precisará adicionar aquele import para a linha.

O seu arquivo `mysite/urls.py` deve agora se parecer com isto:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

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

Aqui, estamos importando do Django a função `url` e todas as nossas `views` do aplicativo `blog`. (Não temos nenhuma ainda, mas chegaremos a isso em um minuto!)

Depois disso podemos adicionar nosso primeiro padrão de URLs:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Como você pode ver, estamos agora atribuindo uma `view` chamada `post_list` à URL raiz. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full URL path. Este padrão dirá ao Django que `views.post_list` é o lugar correto aonde ir se alguém entra em seu site pelo endereço 'http://127.0.0.1:8000 /'.

A última parte, `name='post_list'`, é o nome da URL que será usado para identificar a view. Pode ser o mesmo nome da view, mas também pode ser algo completamente diferente. Nós vamos usar URLs nomeadas mais à frente, então é importante nomearmos agora todas as URLs de nossa aplicação. Também devemos fazer com que os nomes das URLs sejam únicos e fáceis de lembrar.

Se você tentar visitar http://127.0.0.1:8000 / agora, vai encontrar alguma mensagem do tipo 'página web não disponível'. Isso ocorre porque o servidor (lembre-se de digitar `runserver`?) não está mais funcionando. Dê uma olhada na sua janela de console do servidor para descobrir o porquê.

![Erro](images/error1.png)

Seu console está mostrando um erro, mas não se preocupe -- este erro é bastante útil: ele está dizendo que não existe nenhum atributo **post_list** no módulo de views. Esse é o nome da *view* que Django está tentando encontrar e usar, mas ainda não a criamos. Por enquanto, seu `/admin/` também não funcionará. Mas não se preocupe, nós chegaremos lá. Se você vir uma mensagem de erro diferente, tente reiniciar seu servidor da web. Para fazer isso, na janela do console que esta executando o servidor web, interrompa o processo pressionando Ctrl+C (as teclas Control e C juntas). On Windows, you might have to press Ctrl+Break. Então, você precisará reiniciar o servidor web executando o comando `python manage.py runserver`.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/urls/