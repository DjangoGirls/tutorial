# Django Querysets

Nós temos diferentes peças aqui: o model `Post` está definido em `models.py`, nós temos `post_list` no `views.py` e o template adicionado. Mas como nós faremos de fato para fazer com que as nossas postagens apareçam no nosso template em HTML? Porque é isso que nós queremos: pegar algum conteúdo (models salvos no banco de dados) e exibi-lo de uma maneira bacana no nosso template, certo?

E isso é exatamente o que as *views* devem fazer: conectar models e templates. Na nossa view `post_list` *view* nós vamos precisar pegar os models que queremos exibir e passá-los para o template. Então, basicamente, em uma *view* nós decidimos o que (um model) será exibido no template.

Certo, e como nós faremos isso?

Precisamos abrir o nosso `blog/views.py`. Até agora a *view*`post_list` se parece com isso:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Lembra quando falamos sobre a inclusão de código escrito em arquivos diferentes? Agora é o momento em que temos de incluir o model que temos escrito em `models.py`. Vamos adicionar esta linha `from .models import Post` como este:

```python
from django.shortcuts import render
from .models import Post
```

O ponto depois de `from` significa o *diretório atual* ou o *aplicativo atual*. Como `views.py` e `models.py` estão no mesmo diretório podemos simplesmente usar `.` e o nome do arquivo (sem `.py`). Então nós importamos o nome do modelo (`Post`).

E o que vem agora? Para pegar os posts reais do model `Post` nós precisamos de uma coisa chamada `QuerySet`.

## QuerySet

Você já deve estar familiarizado com o modo que os QuerySets funcionam. Nós conversamos sobre isso no [capítulo ORM do Django (QuerySets)][2]. 
Agora nós estamos interessados em uma lista de posts que são publicados e classificados por `published_date`, certo? Nós já fizemos isso no capítulo QuerySets!

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```    

Agora nós colocamos este pedaço de código dentro do arquivo `blog/views.py` adicionando-o à função `def post_list(request)`:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Note que criamos uma *variável* para nosso o QuerySet: `posts`. Trate isto como o nome do nosso QuerySet. De agora em diante nós podemos nos referir a ele por este nome.

A última parte que falta é passar o QuerySet `posts` para o template (veremos como exibi-lo em um próximo capítulo).

Na função `render` já temos o parâmetro `request` (tudo o que recebemos do usuário através da Internet) e um arquivo de template `'blog/post_list.html'`. O último parâmetro, que se parece com isso: `{}` é um lugar em que podemos acrescentar algumas coisas para que o template use. Precisamos nomeá-los (ficaremos com `'posts'` por enquanto :)). Deve ficar assim: `{'posts': posts}`. Observe que a parte antes de `:` está entre aspas `''`.

Então finalmente nosso arquivo `blog/views.py` deve se parecer com isto:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Feito! Hora de voltar para o nosso template e exibir essa QuerySet!

Se quiser ler mais sobre QuerySets no Django você deve dar uma olhada aqui: https://docs.djangoproject.com/en/1.8/ref/models/querysets/

 [2]: /django_orm/README.html
