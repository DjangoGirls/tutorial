# Amplie sua aplicação

Já concluímos todos os passos necessários para a criação do nosso site: sabemos como criar um modelo, uma url, uma view e um template. Também sabemos como melhorar a aparência do nosso website.

Hora de praticar!

A primeira que precisamos no nosso blog é, obviamente, uma página para mostrar uma postagem, certo?

Já temos um modelo de `Post`, então não precisamos adicionar nada ao `models.py`.

## Criando um link para detalhes de um post

We will start with adding a link inside `blog/templates/blog/post_list.html` file. So far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Nós queremos um link no título do post na lista de posts para a página de detalhes do post. Vamos mudar `<h1><a href="">{{ post.title }}</a></h1>` e adicionar um link para a página de detalhe do post:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Hora de explicar aquele misterioso `{% url 'post_detail' pk=post.pk %}`. Como você pode suspeitar, a notação de `{% %}` significa que estamos usando as tags de template do Django. Dessa vez usamos uma que cria uma URL para nós!{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![NoReverseMatch error](images/no_reverse_match2.png)

## Criando uma URL para página de detalhes de um post

Vamos criar a URL em `urls.py` para a nossa`post_detail` *view*!

Queremos que a página de detalhes de nosso primeiro post seja exibir através dessa **URL**: http://127.0.0.1:8000/post/1/

Vamos criar uma URL no arquivo `blog/urls.py` que aponta para uma *view* chamada `post_detail`, que vai nos mostrar o post completo. Adicione a linha `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),` ao arquivo `blog/urls.py`. O arquivo deverá ficar assim:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. Isso significa que o Django vai levar tudo que você colocar aqui e transferir para uma view como uma variável chamada `pk`. (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` significa que precisa existir um ou mais dígitos. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

Isso significa que se você digitar `http://127.0.0.1:8000/post/5/` em seu navegador, Django vai entender que você está procurando uma *view* chamada `post_detail` e transferir a informação de que `pk` é igual a `5` para aquela *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Vamos atualizar a página: http://127.0.0.1:8000 / Boom! O servidor parou novamente. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Você se lembra qual é o próximo passo? Claro: adicionar uma view!

## Adicionando a view de detalhes do post

This time our *view* is given an extra parameter, `pk`. Nossa *view* precisa pegá-la, certo? Então vamos definir nossa função como `def post_detail (request, pk):`. Observe que precisamos usar exatamente o mesmo nome que especificamos em urls (`pk`). Omitir essa variável é errado e resultará em um erro!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

Não queremos isso! Mas, claro, o Django vem com algo que vai lidar com isso para nós: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

A boa notícia é que você realmente pode criar sua própria página de `Page not found` e torná-lo tão bonita quanto você quiser. Mas isso não é super importante agora, então nós vamos ignorá-la.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Sim. Está na hora de atualizar a página: http://127.0.0.1:8000 /

![Post list view](images/post_list2.png)

Funcionou! Mas o que acontece quando você clica em um link no título do post do blog?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Ah não! Outro erro! Mas nós já sabemos como lidar com isso, né? Precisamos adicionar um template!

## Create a template for the post details

Vamos criar um arquivo em `blog/templates/blog` chamado `post_detail.html`.

Vai ficar deste jeito:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Mais uma vez estamos estendendo `base.html`. No bloco de `content` queremos exibir o published_date (data de publicação) do post (se houver), título e texto. Mas devemos discutir algumas coisas importantes, certo?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Página de detalhes da postagem](images/post_detail2.png)

Uhul! Funciona!

## Mais uma coisa: hora de implantar!

Seria bom ver se seu site ainda estará trabalhando no PythonAnywhere, certo? Vamos tentar fazer a implantação novamente.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Então, em um [console Bash do PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

Finalmente, pule para a [aba Web](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload**.

E deve ser isso! Parabéns :)