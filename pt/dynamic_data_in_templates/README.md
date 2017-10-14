# Dados dinâmicos nos templates

Nós temos diferentes peças aqui: o model `Post` está definido em `models.py`, nós temos `post_list` no `views.py` e o template adicionado. Mas como nós faremos de fato para fazer com que as nossas postagens apareçam no nosso template em HTML? Porque é isso que nós queremos: pegar algum conteúdo (models salvos no banco de dados) e exibi-lo de uma maneira bacana no nosso template, certo?

E isso é exatamente o que as *views* devem fazer: conectar models e templates. Na nossa *view* `post_list` nós vamos precisar pegar os models que queremos exibir e passá-los para o template. Então, basicamente, em uma *view* nós decidimos o que (um model) será exibido no template.

Certo, e como nós faremos isso?

Precisamos abrir o nosso `blog/views.py`. Até agora a *view*`post_list` se parece com isso:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Lembra quando falamos sobre a inclusão de código escrito em arquivos diferentes? Agora é o momento em que temos de incluir o model que temos escrito em `models.py`. Vamos adicionar a linha `from .models import Post` desta forma:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import render
from .models import Post
```

O ponto antes de `models` significa o *diretório atual* ou o *aplicativo atual*. Ambos `views.py` e `models.py` estão no mesmo diretório. Isso significa que ns podemos usar um `.` e o nome do arquivo (sem `.py`). Então nós importamos o nome do modelo (`Post`).

E o que vem agora? Para pegar os posts reais do model `Post` nós precisamos de uma coisa chamada `QuerySet`.

## QuerySet

Você já deve estar familiarizada com o modo que os QuerySets funcionam. Nós conversamos sobre isso no [capítulo Django ORM (QuerySets)](../django_orm/README.md).

Agora nós estamos interessadas em uma lista de posts que são publicados e classificados por `published_date`, certo? Nós já fizemos isso no capítulo QuerySets!

{% filename %}blog/views.py{% endfilename %}
```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Agora nós colocamos este pedaço de código dentro do arquivo `blog/views.py` adicionando-o à função `def post_list(request)`,
mas não se esqueça de primeiro adicionar `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

A última, e omitida, parte está passando o QuerySet para o template de contexto. Não se preocupe – nós iremos explicar como exibir ele posteriormente.

Por favor, note que criamos uma *variável* para o nosso QuerySet: `posts`. Trate isto como o nome do nosso QuerySet. De agora em diante nós podemos nos referir a ele por este nome.

Na função `render` nós temos um parâmetro `request` (tudo o que recebemos do usuário através da Internet) e outro informando o arquivo de template (`'blog/post_list.html'`). O último parâmetro, `{}`, é o lugar em que podemos acrescentar algumas coisas para que o template use. Precisamos nomeá-los (ficaremos com `'posts'` por enquanto :)). Deve ficar assim: `{'posts': posts}`. Por favor, observe que a parte antes de `:` é uma string; você precisa envolver ela com aspas: `''`.

Então, finalmente nosso arquivo `blog/views.py` deve se parecer com isto:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Feito! Hora de voltar para o nosso template e exibir essa QuerySet!

Se quiser ler mais sobre QuerySets no Django você deve dar uma olhada aqui: https://docs.djangoproject.com/en/1.9/ref/models/querysets/
