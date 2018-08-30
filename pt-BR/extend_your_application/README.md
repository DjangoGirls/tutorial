{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Amplie sua aplicação

Já concluímos todos os passos necessários para a criação do nosso site: sabemos como criar um modelo, uma url, uma view e um template. Também sabemos como deixá-lo bonitinho.

Hora de praticar!

A primeira coisa que precisamos em nosso blog é, obviamente, uma página para mostrar uma postagem, né?

Já temos um modelo de `Post`, então não precisamos adicionar nada ao `models.py`.

## Criando um link para os detalhes de um post

We will start with adding a link inside `blog/templates/blog/post_list.html` file. Open it in the code editor, and so far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %} Queremos um link no título do post dentro da página de lista de posts apontando para a página de detalhes do post respectivo. Vamos mudar `<h1><a href="">{{ post.title }}</a></h1>` e adicionar um link para a página de detalhe:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Hora de explicar o misterioso `{% url 'post_detail' pk=post.pk %}`. Como você deve suspeitar, a notação `{% %}` significa que estamos usando as tags de template do Django. Dessa vez, usamos uma que cria uma URL para nós!{% endraw %}

A parte `post_detail` significa que o Django espera uma URL no arquivo `blog/urls.py` com o nome definido como name='post_detail'

E quanto ao `pk=post.pk`? `pk` é uma abreviação de "primary key" (do inglês chave primária), que é um identificador único de cada entrada em um banco de dados. Uma vez que não especificamos a chave primária em nosso modelo de `Post`, o Django cria uma para nós (que por padrão, é um número que incrementa sequencialmente a partir de 1, 2, 3, etc) e a adiciona como um campo chamado `pk` em cada um dos nossos posts. Acessamos a chave primária escrevendo `post.pk`, do mesmo modo que podemos acessar outros campos (`title`, `author`, etc.) no nosso objeto de `Post`!

Agora, quando formos para: http://127.0.0.1:8000/, veremos um erro (como esperado, já que existe uma URL, mas não uma *view* para `post_detail`). Vai se parecer com isso:

![erro NoReverseMatch](images/no_reverse_match2.png)

## Criando uma URL para a página de detalhes de um post

Vamos criar uma URL em `urls.py` para a nossa `post_detail` *view*!

Queremos que a página de detalhes do nosso primeiro post seja exibida por essa **URL**: http://127.0.0.1:8000/post/1/

Vamos criar uma URL no arquivo `blog/urls.py` que aponta para uma *view* chamada `post_detail`, que vai nos mostrar o post completo. Open the `blog/urls.py` file in the code editor, and add the line `path('post/<int:pk>)/', views.post_detail, name='post_detail'),` so that the file looks like this:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

A parte `post/<int:pk>/` especifica um padrão de URL – vamos explicar:

- `post/` means that the URL should begin with the word **post** followed by a **/**. So far so good.
- `<int:pk>` – essa parte é um pouco mais complicada. Ela nos diz que o Django espera um objeto do tipo inteiro e que vai transferi-lo para a view como uma variável chamada `pk`.
- `/` – then we need a **/** again before finishing the URL.

Isso significa que se você digitar `http://127.0.0.1:8000/post/5/` em seu navegador, o Django vai entender que você está procurando uma *view* chamada `post_detail` e vai transferir a informação de que `pk` é igual a `5` para essa *view*.

Legal, adicionamos um novo padrão de URL para `blog/urls.py`! Vamos atualizar a página: http://127.0.0.1:8000 / Boom! O servidor parou de funcionar de novo. Dê um olhada no console -- como esperado, há ainda outro erro!

![AttributeError](images/attribute_error2.png)

Do you remember what the next step is? It's adding a view!

## Adicionando a view de detalhes do post

Desta vez, a nossa *view* recebe um parâmetro extra: `pk`. Nossa *view* precisa pegá-lo, certo? Então vamos definir nossa função como `def post_detail (request, pk):`. Precisamos usar exatamente o mesmo nome que especificamos em urls (`pk`). Omitir essa variável é incorreto e resultará em um erro!

Agora, queremos receber apenas um post do blog. Para isso, podemos usar queries (buscas) como esta:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Mas este código tem um problema. Se não houver nenhum `Post` com a `chave primária` (`pk`) fornecida, teremos um erro horroroso!

![erro DoesNotExist](images/does_not_exist2.png)

Não queremos isso! But luckily Django comes with something that will handle that for us: `get_object_or_404`. Caso não haja nenhum `Post` com o `pk`, o Django exibirá uma página muito mais agradável que aquela mensagem de erro -- `Page Not Found 404` (página não encontrada).

![Página não encontrada](images/404_2.png)

A boa notícia é que você pode criar sua própria página de `Page not found` e torná-la tão bonita quanto quiser. Mas isso não é super importante agora, então vamos deixar pra lá.

Hora de adicionar uma *view* ao nosso arquivo `views.py`!

Em `blog/urls.py`, criamos uma regra de URL chamada `post_detail` que se refere a uma view chamada `views.post_detail`. Isto significa que o Django espera uma função chamada `post_detail` dentro de `blog/views.py`.

We should open `blog/views.py` in the code editor and add the following code near the other `from` lines:

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

![View da lista de posts](images/post_list2.png)

Funcionou! Mas o que acontece quando você clica em um link no título de um post do blog?

![erro TemplateDoesNotExist](images/template_does_not_exist2.png)

Ah não! Outro erro! Mas nós já sabemos como lidar com isso, né? Precisamos adicionar um template!

## Criando um template para os detalhes do post

We will create a file in `blog/templates/blog` called `post_detail.html`, and open it in the code editor.

Ele vai ter essa cara:

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

Mais uma vez estamos estendendo `base.html`. No bloco `content`, queremos exibir a data de publicação (published_date) do post (se houver), título e texto. Mas ainda temos algumas coisas importantes para discutir, certo?

{% raw %}`{% if ... %} ... {% endif %}` é uma tag de template que podemos usar quando queremos conferir alguma coisa. (Lembra de `if ... else ..` que vimos no capítulo **Introdução ao Python**?) Aqui queremos conferir se a `published_date` de um post não está vazia.{% endraw %}

Pronto, podemos atualizar nossa página e ver se aquele `Page not found` sumiu.

![Página de detalhes da postagem](images/post_detail2.png)

Uhuu! Funcionou!

# Hora do Deploy!

Seria bom ver se seu site ainda estará trabalhando no PythonAnywhere, né? Vamos tentar fazer a implantação novamente.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Agora, em um [console Bash do PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Lembre-se de substituir o `<your-pythonanywhere-username>` pelo seu username do PythonAnywhere, sem os símbolos < e >).

## Atualizando os arquivos estáticos no servidor

Servidores como o PythonAnywhere tratam arquivos estáticos (como os arquivos CSS) de forma diferente dos arquivos em Python, por que assim podem otimizar para que eles carreguem mais rápido. Como resultado, sempre que alteramos nossos arquivos CSS, precisamos rodar um comando extra no servidor para dizer a ele que os atualize. O comando se chama `collectstatic`.

Comece ativando seu virtualenv, se ele já não estiver ativo (para isso, o PythonAnywhere usa um comando chamado `workon` que é bem parecido com o comando `source myenv/bin/activate` que vosê usa no seu computador):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

O comando `manage.py collectstatic` é mais ou menos como `manage.py migrate`. Agora, fazemos algumas mudanças no nosso código e dizemos ao Django que as aplique (*apply*) à coleção de arquivos estáticos, ou ao banco de dados.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://yourname.pythonanywhere.com page to see the result.

Deve estar pronto! Arrasou :)