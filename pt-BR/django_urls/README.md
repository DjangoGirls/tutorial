# URLs

Estamos prestes a construir nossa primeira página Web: uma página inicial para o seu blog! Mas primeiro, vamos aprender um pouco mais sobre as URLs do Django.

## O que é uma URL?

A URL is a web address. Você pode ver uma URL toda vez que você visita um website - ela aparece na barra de endereços do seu navegador. (Sim! `127.0.0.1:8000` é uma URL! E `https://djangogirls.org` também é uma URL.)

![URL](images/url.png)

Cada página na Internet precisa de sua própria URL. Desta forma, sua aplicação sabe o que deve mostrar a um usuário que abre uma URL. Em Django, usamos algo chamado `URLconf` (configuração de URLs). URLconf é um conjunto de padrões que o Django vai usar para comparar com a URL recebida para encontrar a resposta correta.

## Como funcionam as URLs em Django?

Abra o arquivo `mysite/urls.py` no seu editor de código preferido e veja o que aparece:

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

Aqui, estamos importando do Django a função `url` e todas as nossas `views` do aplicativo `blog`. (Não temos nenhuma ainda, mas chegaremos a isso em um minuto!)

Depois disso podemos adicionar nosso primeiro padrão de URLs:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Como você pode ver, estamos agora atribuindo uma `view` chamada `post_list` à URL raiz. Este padrão de URL corresponde a uma sequência de caracteres vazia, e o resolvedor de URLs do Django irá ignorar o nome de domínio (ou seja, http://127.0.0.1:8000 /) que antecede o caminho completo da URL. Este padrão dirá ao Django que `views.post_list` é o lugar correto aonde ir se alguém entra em seu site pelo endereço 'http://127.0.0.1:8000 /'.

A última parte, `name='post_list'`, é o nome da URL que será usado para identificar a view. Pode ser o mesmo nome da view, mas também pode ser algo completamente diferente. Nós vamos usar URLs nomeadas mais à frente, então é importante nomearmos agora todas as URLs de nossa aplicação. Também devemos fazer com que os nomes das URLs sejam únicos e fáceis de lembrar.

Se você tentar visitar http://127.0.0.1:8000 / agora, vai encontrar alguma mensagem do tipo 'página web não disponível'. Isso ocorre porque o servidor (lembre-se de digitar `runserver`?) não está mais funcionando. Dê uma olhada na sua janela de console do servidor para descobrir o porquê.

![Erro](images/error1.png)

Seu console está mostrando um erro, mas não se preocupe -- este erro é bastante útil: ele está dizendo que não existe nenhum atributo **post_list** no módulo de views. Esse é o nome da *view* que Django está tentando encontrar e usar, mas ainda não a criamos. Por enquanto, seu `/admin/` também não funcionará. Mas não se preocupe, nós chegaremos lá.

> Se você quer saber mais sobre a configuração de URLs no Django, veja a documentação oficial: https://docs.djangoproject.com/en/2.0/topics/http/urls/