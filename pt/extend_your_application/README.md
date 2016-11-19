# Amplie sua aplicação

Já concluímos todos os passos necessários para a criação do nosso site: sabemos como criar um modelo, uma url, uma view e um template. Também sabemos como melhorar a aparência do nosso website.

Hora de praticar!

A primeira coisa que precisamos no nosso blog é, obviamente, uma página para mostrar uma postagem, certo?

Já temos um modelo de `Post`, então não precisamos adicionar nada ao `models.py`.

## Criar um link no template

Vamos começar com a adição de um link dentro do arquivo `blog/templates/blog/post_list.html`. Neste momento ele deve se parecer com:

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
{% endblock content %}
```

Queremos ter um link para uma página de detalhe no título do post. Vamos transformar `< h1 >< href = "" >{{ post.title }} < /a >< / h1 >` em um link:

```html
<h1><a href="{% url 'blog.views.post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Tempo para explicar o misterioso `{% url 'blog.views.post_detail' pk=post.pk %}`. Como você pode suspeitar, a notação de `{% %}` significa que estamos usando as tags de template do Django. Desta vez vamos usar uma que vai criar uma URL para nós!{% endraw %}

`blog.views.post_detail` é um caminho para um `post_detail` *Vista* que queremos criar. Preste atenção: `blog` é o nome da sua aplicação (o diretório `blog`), `views` vem do nome do arquivo `views.py` e, a última parte - `post_detail` - é o nome da *view*.

Agora quando formos para: http://127.0.0.1:8000/ teremos um erro (como esperado, já que não temos uma URL ou uma *view* para `post_detail`). Vai se parecer com isso:

![NoReverseMatch error][1]

 [1]: images/no_reverse_match2.png

Vamos criar a URL em `urls.py` para a nossa`post_detail` *view*!

### URL: http://127.0.0.1:8000/post/1/

Queremos criar uma URL para guiar o Django para a *view* chamada `post_detail`, que irá mostrar um post completo do blog. Adicione a linha `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),` ao arquivo `blog/urls.py`. Deve ficar assim:
    
```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),
]
```

Parece assustador, mas não se preocupe - vamos explicar ele para você: - começa com `^` de novo... "o início" - `post /` significa apenas que após o começo, da URL deve ter a palavra **post** e **/**. Até aqui, tudo bem. - `(?P<pk>[0-9]+)` - essa parte é mais complicada. Isso significa que o Django vai levar tudo que você colocar aqui e transferir para uma view como uma variável chamada `pk`. `[0-9]` também nos diz que só pode ser um número, não uma letra (tudo entre 0 e 9). `+` significa que precisa existir um ou mais dígitos. Então algo como `http://127.0.0.1:8000/post//` não é válido, mas `http://127.0.0.1:8000/post/1234567890/` é perfeitamente ok! -`/` - então precisamos de **/** outra vez - `$` - "o fim"!

Isso significa que se você digitar `http://127.0.0.1:8000/post/5/` em seu navegador, Django vai entender que você está procurando uma *view* chamada `post_detail` e transferir a informação de que `pk` é igual a `5` para aquela *view*.

`pk` é uma abreviação para `primary key` (chave primária). Esse nome geralmente é usado nos projetos feitos em Django. Mas você pode dar o nome que quiser às variáveis (lembre-se: minúsculo e `_` ao invés de espaços em branco!). Por exemplo em vez de `(?P<pk>[0-9]+)` podemos ter uma variável`post_id`, então esta parte ficaria como: `(?P<post_id>[0-9]+)`.

Razoável! Vamos atualizar a página: http://127.0.0.1:8000 / Boom! Ainda outro erro! Como esperado!

![AttributeError][2]

 [2]: images/attribute_error2.png

Você se lembra qual é o próximo passo? Claro: adicionando uma view!

## post_detail view

Desta vez a nossa *view* recebe um parâmetro extra `pk`. Nossa *view* precisa pegá-la, certo? Então vamos definir nossa função como `def post_detail (request, pk):`. Observe que precisamos usar exatamente o mesmo nome que especificamos em urls (`pk`). Omitir essa variável é errado e resultará em um erro!

Agora queremos receber apenas um post do blog. Para isso podemos usar querysets como este:

    Post.objects.get(pk=pk)
    

Mas este código tem um problema. Se não houver nenhum `Post` com a `chave primária` (`pk`) fornecida teremos um erro horroroso!

![DoesNotExist error][3]

 [3]: images/does_not_exist2.png

Não queremos isso! Mas, claro, o Django vem com algo que vai lidar com isso para nós: `get_object_or_404`. Caso não haja nenhum `Post` com o dado `pk` exibirá uma página muito mais agradável (chamada `Page Not Found 404` - página não encontrada).

![Page not found][4]

 [4]: images/404_2.png

A boa notícia é que você realmente pode criar sua própria página de `Page not found` e torná-lo tão bonita quanto você quiser. Mas isso não é super importante agora, então nós vamos ignorá-la.

Ok, hora de adicionar uma *view* ao nosso arquivo `views.py`!

Devemos abrir `blog/views.py` e adicionar o seguinte código:

    from django.shortcuts import render, get_object_or_404
    

Perto de outras linhas `from`. E no final do arquivo, adicionaremos a nossa *view*:

    def post_detail(request, pk):
        post = get_object_or_404(Post, pk=pk)
        return render(request, 'blog/post_detail.html', {'post': post})
    

Sim. Está na hora de atualizar a página: http://127.0.0.1:8000 /

![Post list view][5]

 [5]: images/post_list2.png

Funcionou! Mas o que acontece quando você clica em um link no título do post do blog?

![TemplateDoesNotExist error][6]

 [6]: images/template_does_not_exist2.png

Ah não! Outro erro! Mas nós já sabemos como lidar com isso, né? Precisamos adicionar um template!

Vamos criar um arquivo em `blog/templates/blog` chamado `post_detail.html`.

Será algo parecido com isto:

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

{% raw %}`{% if ... %} ... {% endif %}` é uma tag de template que podemos usar quando queremos verificar algo (Lembre-se `if ... else...` do **capítulo introdução ao Python**?). Neste cenário, queremos verificar se `published_date` de um post não está vazia.{% endraw %}

Ok, podemos atualizar nossa página e ver se `Page not found` já se foi.

![Post detail page][7]

 [7]: images/post_detail2.png

Yay! Funciona!

## Mais uma coisa: hora de implantar!

Seria bom ver se seu site ainda estará trabalhando em PythonAnywhere, certo? Vamos tentar fazer deploy novamente.
```bash
$ git status
$ git add --all .
$ git status
$ git commit -m "Added views to create/edit blog post inside the site."
$ git push
```    

*   Então, em um [console PythonAnywhere Bash][8]:
    
```
$ cd my-first-blog 
$ git pull
```

*   Finalmente, pule para a [Web tab][9] e aperte **Reload**.

 [8]: https://www.pythonanywhere.com/consoles/
 [9]: https://www.pythonanywhere.com/web_app_setup/

E deve ser isso! Parabéns :)
