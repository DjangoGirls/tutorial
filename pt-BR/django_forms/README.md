# Formulários do Django

Por último, queremos uma forma legal de adicionar e editar as postagens do nosso blog. A `ferramenta de administração` do Django é legal, mas é um pouco difícil de personalizar e de deixar mais bonita. Com `formulários`, temos poder absoluto sobre nossa interface - podemos fazer quase tudo que pudermos imaginar!

Uma coisa legal do Django é que podemos tanto criar um formulário do zero, como criar um `ModelForm` que salva o resultado do formulário em um determinado modelo.

É exatamente isso que queremos fazer: criar um formulário para o nosso modelo `Post`.

Assim como todas as partes importantes do Django, forms têm seu próprio arquivo: `forms.py`.

Precisamos criar um arquivo com este nome dentro da pasta `blog`.

    blog
       └── forms.py
    

Agora vamos abri-lo no editor de código e digitar o seguinte:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Primeiro, precisamos importar o módulo de formulários do Django (*from django import forms*) e, obviamente, o nosso modelo *Post* (*from .models import Post*).

`PostForm`, como você já deve suspeitar, é o nome do nosso formulário. Precisamos dizer ao Django que esse form é um `ModelForm` (pro Django fazer algumas mágicas para nós) – `forms.ModelForm` é o responsável por essa parte.

Em seguida, temos a `class Meta` em que dizemos ao Django qual modelo deverá ser usado para criar este formulário (`model = Post`).

Por fim, podemos dizer quais campos devem entrar no nosso formulário. Neste cenário, queremos que apenas o `title` e o `text` sejam expostos -- `author` deve ser a pessoa que está logada no sistema (nesse caso, você!) e `created_date` deve ser configurado automaticamente quando criamos um post (no código), correto?

E é isso! Tudo o que precisamos fazer agora é usar o formulário em uma *view* e mostrá-lo em um template.

Novamente, criaremos um link para a página, uma URL, uma view e um template.

## Link para a página com o formulário

It's time to open `blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Note que queremos chamar nossa nova view de `post_new`. A classe `"glyphicon glyphicon-plus"` é fornecida pelo tema (bootstrap) que estamos usando, e nos mostrará um sinal de mais.

Depois de adicionar essa linha, o seu HTML vai ficar assim:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Depois de salvar e recarregar a página *http://127.0.0.1:8000* você verá um erro familiar `NoReverseMatch` certo? É isso!

## URL

Vamos abrir o arquivo *blog/urls.py* e escrever:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

O código final deve se parecer com isso:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

Após recarregar a página, veremos um `AttributeError` por que não temos a view `post_new` implementada. Vamos adicioná-la agora.

## View post_new

Hora de abrir o arquivo *blog/views.py* e adicionar o seguinte às linhas *from*:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

E então a nossa *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Para criar um novo formulario `Post`, devemos chamar `PostForm()` e passá-lo para o template. Voltaremos a esta *view* depois, mas por enquanto, vamos criar um template para o formulário.

## Template

Precisamos criar um arquivo *post_edit.html* na pasta *blog/templates/blog*. Para fazer o formulário funcionar, precisamos de várias coisas:

* Temos que exibir o formulário. Podemos fazer isso com (por exemplo) {% raw %}`{{ form.as_p }}`{% endraw %}.
* A linha acima precisa estar dentro de uma tag HTML form: `<form method="POST">...</form>`.
* Precisamos de um botão `Salvar`. Fazemos isso com um botão HTML: `<button type="submit">Save</button>`.
* E finalmente, depois de abrir a tag `<form ...>`, precisamos adicionar {% raw %}`{% csrf_token %}`{% endraw %}. Isso é muito importante, pois é isso que torna o nosso formulário seguro! Se você esquecer esta parte, o Django vai reclamar quando você tentar salvar o formulário:

![CSFR Página proibida](images/csrf2.png)

Legal, então vamos ver como ficou o HTML `post_edit.html`:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Hora de atualizar! Uhuu! Seu formulário apareceu!

![Novo formulário](images/new_form2.png)

Mas espere um minuto! O que vai acontecer quando você digitar alguma coisa nos campos `title` e `text` e tentar salvar?

Nada! Estamos novamente na mesma página e nosso texto sumiu... e nenhum post foi adicionado. Então o que deu errado?

A resposta é: nada. Precisamos trabalhar um pouco mais na nossa *view*.

## Salvando o formulário

Abra *blog/views.py* no editor de código mais uma vez. No momento, tudo que temos na view *post_new* é:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Quando enviamos o formulário, somos trazidas de volta à mesma view, mas desta vez temos mais alguns dados no `request`, especificamente em `request.POST` (o nome não tem nada a ver com "post" de blog; tem a ver com o fato que estamos "postando" dados). Lembra que no arquivo HTML, nossa definição de `form` incluiu a variável `method="POST"`? Todos os campos vindos do "form" estarão disponíveis agora em `request.POST`. Não renomeie `POST` para nada diferente disso (o único outro valor válido para `method` é `GET`, mas não temos tempo para explicar a diferença).

Então em nossa *view* temos duas situações diferentes com as quais lidar: primeiro, quando acessamos a página pela primeira vez e queremos um formulário em branco e segundo, quando voltamos para a *view* com todos os dados do formulário que acabamos de digitar. Desse modo, precisamos adicionar uma condição (usaremos `if` para isso):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

É hora de preencher os pontos `[...]`. Se `method` é `POST`, queremos construir o `PostForm` com dados do formulário, certo? Faremos assim:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

O próximo passo é checar se o formulário está correto (todos os campos requeridos estão prontos e valores incorretos não serão salvos). Fazemos isso com `form.is_valid()`.

Verificamos se o formulário é válido e se estiver tudo certo, podemos salvá-lo!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
     post = form.save(commit=False)
     post.author = request.user
     post.published_date = timezone.now()
     post.save()
```

Basicamente, temos duas coisas aqui: salvamos o formulário com `form.save` e adicionamos um autor (já que houve um campo `author` em `PostForm`, e este campo é obrigatório). `commit=False` significa que não queremos salvar o modelo de `Post` ainda - queremos adicionar o autor primeiro. Na maioria das vezes você irá usar `form.save()`, sem `commit=False`, mas neste caso, precisamos fazer isso. `post.save()` vai preservar as alterações (adicionando o autor) e é criado um novo post no blog!

Finalmente, seria fantástico se pudéssemos ir à página `post_detail`, direto para o nosso recém-criado post no blog, né? Para fazer isso, precisaremos de mais uma importação:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Adicione isso logo no início do seu arquivo. Agora podemos dizer: "vá para a página `post_detail` para o post recém-criado":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` é o nome da visualização (view) à qual queremos ir. Lembra que essa *view* exige uma variável `pk`? Para passar isso para as `views`, usamos `pk=post.pk`, em que post é o recém-criado post do blog!

Ok, nós falamos muito, e agora queremos ver a cara da *view* completa, né?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
     if request.method == "POST":
         form = PostForm(request.POST)
         if form.is_valid():
             post = form.save(commit=False)
             post.author = request.user
             post.published_date = timezone.now()
             post.save()
             return redirect('post_detail', pk=post.pk)
     else:
         form = PostForm()
     return render(request, 'blog/post_edit.html', {'form': form})
```

Vamos ver se funciona. Vá para a página http://127.0.0.1:8000/post/new/, adicione um `title` e o `text`, salve... e pronto! O novo post do blog é adicionado e somos redirecionadas à página de `post_detail`!

Você deve ter percebido que estamos estabelecendo a data de publicação antes de salvar o post. Mais tarde, vamos introduzir um botão de *Publicar* em **Django Girls Tutorial: Extensões**.

Isso é incrível!

> Como recentemente usamos a interface de administração do Django, o sistema entende que estamos logadas. Existem algumas situações que poderiam nos desligar do sistema (fechar o navegador, reiniciar banco de dados etc.). Se ao criar um post você receber erros que se referem à ausência de um usuário logado, vá até a página de admin http://127.0.0.1:8000/admin e faça login novamente. Isso vai resolver o problema temporariamente. Há um ajuste permanente esperando por você em **lição de casa: adicionar segurança ao seu site!**, um capítulo posterior ao tutorial principal.

![Erro de usuário logado](images/post_create_error.png)

## Validação de formulários

Agora, mostraremos como os fórmularios do Django são legais. O post do blog precisa ter os campos `title` e `text`. Em nosso modelo `Post` não dissemos (em oposição a `published_date`) que esses campos são opcionais, então o Django, por padrão, espera que sejam definidos.

Tente salvar o formulário sem `title` e `text`. Adivinhe o que vai acontecer!

![Validação de formulários](images/form_validation2.png)

Django está confirmando que todos os campos de nosso formulário estão corretos. Não é incrível?

## Editando o formulário

Now we know how to add a new post. Mas e se quisermos editar um que já existe? É muito parecido com o que acabamos de fazer. Vamos criar algumas coisas importantes rapidinho. (Se você não entender alguma coisa, pergunte para a sua monitora ou veja os capítulos anteriores -- já cobrimos todas essas etapas anteriormente.)

Abra *blog/templates/blog/post_detail.html* e adicione esta linha

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

agora, o template estará parecido com:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Abra o arquivo *blog/urls.py* no editor de código e digite:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Vamos reutilizar o template `blog/templates/blog/post_edit.html`, então a última coisa que falta é uma *view*.

Vamos abrir *blog/views.py* no editor de código e adicionar o seguinte ao final do arquivo:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
     post = get_object_or_404(Post, pk=pk)
     if request.method == "POST":
         form = PostForm(request.POST, instance=post)
         if form.is_valid():
             post = form.save(commit=False)
             post.author = request.user
             post.published_date = timezone.now()
             post.save()
             return redirect('post_detail', pk=post.pk)
     else:
         form = PostForm(instance=post)
     return render(request, 'blog/post_edit.html', {'form': form})
```

Isso é quase igual à nossa view de `post_new`, né? Mas não inteiramente. For one, we pass an extra `pk` parameter from `urls`. Em seguida, pegamos o modelo `Post` que queremos editar com `get_object_or_404 (Post, pk=pk)` e então, quando criamos um formulário, passamos este post como uma `instância` tanto quando salvamos o formulário…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

... como quando apenas abrimos um formulário para editar esse post:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Ok, vamos testar para ver se funciona! Vamos para a página `post_detail`. Deve haver um botão editar no canto superior direito:

![Botão editar](images/edit_button2.png)

Quando você clicar nesse botão, verá o formulário com a nossa postagem:

![Editando o formulário](images/edit_form2.png)

Sinta-se livre para mudar o título ou o texto e salvar as alterações!

Parabéns! Sua aplicação está ficando cada vez mais completa!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Segurança

Poder criar novos posts apenas clicando em um link é ótimo! Mas nesse momento, qualquer um que visitar nosso site poderá criar um novo post, e você isso provavelmente não quer isso. Vamos fazer com que o botão apareça apenas para você e para mais ninguém.

Em `blog/templates/blog/base.html`, procure nossa `div` `page-header` e a tag de link que você colocou mais cedo. Deve se parecer com:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Vamos incluir outra tag `{% if %}` que irá apresentar o link somente para os usuários que estiverem logados como admin. No momento, é apenas você! Mude a tag `<a>` para que fique assim:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Este `{% if %}` fará com que o link seja enviado ao navegador se o usuário que requisitou a página estiver logado. Isso não protege o blog completamente da criação de um novo post, mas é um bom começo. Vamos falar mais sobre segurança nas próximas lições.

Lembra do ícone Editar que acabamos de adicionar à nossa página de detalhes? Queremos fazer a mesma coisa com ele para que outras pessoas não possam editar as mensagens já existentes.

Abra `blog/templates/blog/post_detail.html` e encontre esta linha:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Altere-a para:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Você provavelmente está logada, então se atualizar a página, não verá nada de diferente. Carregue a página em um navegador novo ou em uma janela anônima (chamada "InPrivate" no Windows Edge), e então você verá que o link não aparece, e o ícone também não!

## Mais uma coisa: hora de implantar!

Vamos ver se tudo isso funciona no PythonAnywhere. Hora de fazer outro deploy!

* Primeiro, faça o commit do seu novo código e dê o comando push para colocá-lo no Github:

{% filename %}command-line{% endfilename %}

    $ git status 
    $ git add --all . 
    $ git status 
    $ git commit -m "Added views to create/edit blog post inside the site." 
    $ git push
    

* Então, em um [console Bash do PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Lembre de substituir `<your-pythonanywhere-domain>` pelo seu subdomínio PythonAnywhere, sem os símbolos < e >.)

* Finalmente, vá para a [página "Web"](https://www.pythonanywhere.com/web_app_setup/) (use o botão de menu no canto superior direito do console) e pressione **Recarregar**. Atualize seu blog https://subdominio.pythonanywhere.com para ver as mudanças.

E deve ser isso! Parabéns :)