# Dados dinâmicos em templates

Até o momento, temos diferentes peças: o modelo `Post` está definido em `models.py`, temos `post_list` em `views.py` e o template adicionado. Mas como faremos de fato para que as postagens apareçam no nosso template em HTML? Porque é isso que nós queremos: pegar algum conteúdo (modelos salvos no banco de dados) e exibi-lo de uma maneira bacana no nosso template, certo?

E isso é exatamente o que as *views* devem fazer: conectar modelos e templates. Vamos precisar pegar os modelos que queremos exibir e passá-los para o template na nossa lista de postagens `post_list` *view*. Em uma *view*, nós decidimos o que (qual modelo) será exibido em um template.

Tudo bem, e como vamos fazer isso?

Precisamos abrir o nosso `blog/views.py`. Até agora, a *view* `post_list` se parece com isso:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Lembra de quando falamos sobre a inclusão de código que foi escrito em arquivos diferentes? Agora é o momento em que precisamos que incluir o modelo que temos escrito em `models.py`. Vamos adicionar a linha `from .models import Post` assim:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

O ponto antes de `models` significa *diretório atual* ou *aplicativo atual*. Tanto `views.py` como `models.py` estão no mesmo diretório. Isto significa que podemos usar `.` e o nome do arquivo (sem `py`). Em seguida, importamos o nome do modelo (`Post`).

E o que vem agora? Para pegar os posts reais do modelo `Post`, precisamos de uma coisa chamada `QuerySet`.

## QuerySet

Você já deve estar familiarizada com o modo que os QuerySets funcionam. Nós conversamos sobre isso no [capítulo QuerySets e ORM do Django](/django_orm/README. html).</p> 

Agora queremos classificar as postagens publicadas por `published_date`, certo? Nós já fizemos isso no capítulo sobre QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Agora vamos colocar esse pedaço de código dentro do arquivo `blog.views.py` adicionando-o à função `def post_list(request)`. Não esqueça de adicionar `from django.utils import timezone` antes!

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post


def post_list(request): 
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date') 
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Note que criamos uma *variável* para nosso o QuerySet: `posts`. Esse é o nome do nosso QuerySet. De agora em diante, podemos nos referir a ele por este nome.

Na função `render` já temos um parâmetro `request` (tudo o que recebemos do usuário através da Internet) e um arquivo de template (`'blog/post_list.html'`). O último parâmetro -- `{}` -- é um lugar em que podemos acrescentar algumas coisas para o template usar. Precisamos nomear os parâmetros (continuaremos com `'posts'`, por enquanto). :) Deve ficar assim: `{'posts': posts}`. Note que a parte antes de `:` é uma string; por isso você precisa colocá-la entre aspas: `"`.

Agora, nosso arquivo `blog/views.py` deve ter essa cara:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post


def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date') 
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Pronto! Hora de voltar para o nosso template e exibir essa QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/