{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Amplie sua aplicação

Já concluímos todos os passos necessários para a criação do nosso site: sabemos como criar um modelo, uma url, uma view e um template. Também sabemos como deixá-lo bonitinho.

Hora de praticar!

A primeira coisa que precisamos em nosso blog é, obviamente, uma página para mostrar uma postagem, né?

Já temos um modelo de `Post`, então não precisamos adicionar nada ao `models.py`.

## Criando um link para detalhes de um post

Vamos começar adicionando um link dentro do arquivo `blog/templates/blog/post_list.html`. Por enquanto, ele deve se parecer com isto: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %} Queremos um link no título do post dentro da página de lista de posts apontando para a página de detalhes do post respectivo. Vamos mudar `<h1><a href="">{{ post.title }}</a></h1>` e adicionar um link para a página de detalhe: {% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Hora de explicar o misterioso `{% url 'post_detail' pk=post.pk %}`. Como você deve suspeitar, a notação de `{% %}` significa que estamos usando as tags de template do Django. Dessa vez usamos uma que cria uma URL para nós!{% endraw %}

A parte com `post_detail` significa que o Django espera uma URL no arquivo `blog/urls.py` com o nome definido como name='post_detail'

E quanto ao `pk=post.pk`? `pk` é uma abreviação de "primary key" (do inglês chave primária), que é um identificador único de cada entrada em um banco de dados. Uma vez que não especificamos a chave primária em nosso modelo de `Post`, o Django cria uma para nós (que por padrão, é um número que incrementa sequencialmente a partir de 1, 2, 3, etc) e a adiciona como um campo chamado `pk` em cada um dos nossos posts. Acessamos a chave primária escrevendo `post.pk`, do mesmo modo que podemos acessar outros campos (`title`, `author`, etc.) no nosso objeto de `Post`!

Agora, quando formos para: http://127.0.0.1:8000/ veremos um erro (como esperado, já que existe uma URL e nem uma *view* para `post_detail`). Vai se parecer com isso:

![NoReverseMatch error](images/no_reverse_match2.png)

## Criando uma URL para página de detalhes de um post

Vamos criar uma URL em `urls.py` para a nossa `post_detail` *view*!

Queremos que a página de detalhes do nosso primeiro post seja exibida por essa **URL**: http://127.0.0.1:8000/post/1/

Vamos criar uma URL no arquivo `blog/urls.py` que aponta para uma *view* chamada `post_detail`, que vai nos mostrar o post completo. Adicione a linha `url(r'^post/(?P<int:pk>+)/$', views.post_detail, name='post_detail')
 ` ao arquivo `blog/urls.py`. O arquivo deverá ficar assim:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

A parte `post/<int:pk>/` especifica um padrão de URL – vamos explicar:

- `post/` significa apenas que a URL deve começar com a palavra **post** seguida por **/**. Até aqui, tudo bem.
- `<int:pk>` – essa parte é um pouco mais complicada. Ela nos diz que o Django espera um objeto do tipo inteiro e que vai transferí-lo para a view como uma variável chamada `pk`.
- `/` – por fim, precisamos adicionar uma **/** ao final da nossa URL.

Isso significa que se você digitar `http://127.0.0.1:8000/post/5/` em seu navegador, o Django vai entender que você está procurando uma *view* chamada `post_detail` e vai transferir a informação de que `pk` é igual a `5` para essa *view*.

Legal, nós adicionamos um novo padrão de URL para `blog/urls.py`! Vamos atualizar a página: http://127.0.0.1:8000 / Boom! O servidor parou de funcionar de novo. Dê um olhada no console - como esperado, há ainda outro erro!

![AttributeError](images/attribute_error2.png)

Você lembra qual é o próximo passo? Claro: adicionar uma view!

## Adicionando a view de detalhes do post

Desta vez, a nossa *view* recebe um parâmetro extra: `pk`. Nossa *view* precisa pegá-lo, certo? Então vamos definir nossa função como `def post_detail (request, pk):`. Precisamos usar exatamente o mesmo nome que especificamos em urls (`pk`). Omitir essa variável é errado e resultará em um erro!

Agora queremos receber apenas um post do blog. Para isso, podemos usar QuerySets como este:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Mas este código tem um problema. Se não houver nenhum `Post` com a `chave primária` (`pk`) fornecida teremos um erro horroroso!

![DoesNotExist error](images/does_not_exist2.png)

Não queremos isso! Mas é claro que o Django tem algo para lidar com isso por nós: `get_object_or_404`. Caso não haja nenhum `Post` com o `pk`, o Django exibirá uma página muito mais agradável que aquela mensagem de erro - `Page Not Found 404` (página não encontrada).

![Page not found](images/404_2.png)

A boa notícia é que você pode criar sua própria página de `Page not found` e torná-la tão bonita quanto quiser. Mas isso não é super importante agora, então nós vamos deixar pra lá.

Hora de adicionar uma *view* ao nosso arquivo `views.py`!

Em `blog/urls.py`, criamos uma regra de URL chamada `post_detail` que se refere a uma view chamada `views.post_detail`. Isto significa que o Django espera uma função chamada `post_detail` dentro de `blog/views.py`.

Vamos abrir `blog/views.py` e adicionar o seguinte código perto das outras linhas `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

E no final do arquivo, vamos adicionar a nossa *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

É isso aí, está na hora de atualizar a página: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

Funcionou! Mas o que acontece quando você clica em um link no título de um post do blog?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Ah não! Outro erro! Mas nós já sabemos como lidar com isso, né? Precisamos adicionar um template!

## Criando um template de para os detalhes do post

Vamos criar um arquivo em `blog/templates/blog` chamado `post_detail.html`.

It will look like this:

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

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Yay! It works!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)