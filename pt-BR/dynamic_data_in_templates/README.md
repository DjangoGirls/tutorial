# Dados dinâmicos em modelos

Nós temos diferentes peças aqui: o model `Post` está definido em `models.py`, nós temos `post_list` no `views.py` e o template adicionado. Mas como nós faremos de fato para fazer com que as nossas postagens apareçam no nosso template em HTML? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

E isso é exatamente o que as *views* devem fazer: conectar models e templates. In our `post_list` *view* we will need to take the models we want to display and pass them to the template. Em uma *Vista*, nós decidimos que (modelo) será exibido em um padrão.

OK, so how will we achieve this?

Precisamos abrir o nosso `blog/views.py`. Até agora a *view*`post_list` se parece com isso:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Lembra quando falamos sobre a inclusão de código escrito em arquivos diferentes? Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

O ponto antes de `models` significa o *diretório atual* ou o *aplicativo atual*. Tanto `views.py` como `models.py` estão no mesmo diretório. Isto significa que podemos usar `.` e o nome do arquivo (sem `py`). Então nós importamos o nome do modelo (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

Então, agora queremos as postagens publicadas classificadas por `published_date`, certo? Nós já fizemos isso no capítulo sobre QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Now we put this piece of code inside the `blog/views.py` file by adding it to the function `def post_list(request)`, but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post


def post_list(request): 
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date') 
    return render(request, 'blog/post_list.html', {})
```

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

Note que criamos uma *variável* para nosso o QuerySet: `posts`. Trate isto como o nome do nosso QuerySet. De agora em diante nós podemos nos referir a ele por este nome.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. Precisamos nomeá-los (ficaremos com `'posts'` por enquanto). :) Deve ficar assim: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

Então finalmente nosso arquivo `blog/views.py` deve se parecer com isto:

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

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/