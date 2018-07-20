# Formulários

Por último, queremos uma forma legal de adicionar e editar as postagens do nosso blog. A `ferramenta de administração` do Django é legal, mas ela é um pouco difícil de customizar e de deixar mais bonita. Com `formulários`, temos poder absoluto sobre nosso interface - podemos fazer quase tudo que podemos imaginar!

Uma coisa legal do Django é que nós podemos tanto criar um formulário do zero como podemos criar um `ModelForm` que salva o resultado do formulário em um determinado modelo.

Isso é exatamente o que nós queremos fazer: criaremos um formulário para o nosso modelo `Post`.

Assim como toda parte importante do Django, forms têm seu próprio arquivo: `forms.py`.

Precisamos criar um arquivo com este nome dentro da pasta `blog`.

    blog
       └── forms.py
    

Agora vamos abri-lo e digitar o seguinte código:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Primeiro precisamos importar o módulo de formulários do Django (`from django import forms`) e, obviamente, nosso modelo `Post` (`from .models import Post`).

`PostForm`, como você já deve suspeitar, é o nome do nosso formulário. Nós precisamos dizer ao Django que esse form é um `ModelForm` (pro Django fazer algumas mágicas para nós) – `forms.ModelForm` é o responsável por essa parte.

Em seguida, nós temos a `class Meta` onde dizemos ao Django qual modelo deverá ser usado para criar este formulário (`model = Post`).

Por fim, nós podemos dizer qual(is) campo(s) devem entrar no nosso formulário. Neste cenário nós queremos apenas que o `title` e o `text` sejam expostos - `author` deveria ser a pessoa que está logada no sistema (nesse caso, você!) e `created_date` deveria ser setado automaticamente quando nós criamos um post (no código), correto?

E é isso aí! Tudo o que precisamos fazer agora é usar o formulário em uma *view* e mostrá-lo em um template.

Novamente nós criaremos um link para a página, uma URL, uma view e um template.

## Link para a página com o formulário

É hora de abrir `blog/templates/blog/base.html`. Nós iremos adicionar um link em `div` chamado `page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Note que queremos chamar nossa nova view de `post_new`. A classe `"glyphicon glyphicon-plus"` é fornecida pelo tema (bootstrap) que estamos usando, e irá mostrar um sinal de mais para nós.

Após adicionar essa linha, o seu HTML vai estar assim:

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

Depois de salvar e recarregar a página `http://127.0.0.1:8000` você verá, obviamente, um erro familiar `NoReverseMatch` certo?

## URL

Vamos abrir o arquivo `blog/urls.py` e escrever:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new', views.post_new, name='post_new'),
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

Após recarregar a página, nós veremos um `AttributeError`, já que nós não temos a view `post_new` implementada. Vamos adicioná-la agora.

## View post_new

Hora de abrir o arquivo `blog/views.py` e adicionar as linhas seguintes com o resto das linhas `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

E daí nosso *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Para criar um novo formulario `Post`, nós devemos chamar `PostForm()` e passá-lo para o template. Vamos voltar para este *view* depois, mais por em quanto, vamos criar uma template para o formulário.

## Template

Precisamos criar um arquivo `post_edit.html` na pasta `blog/templates/blog`. Pra fazer o formulário funcionar precisamos de muitas coisas:

* Temos que exibir o formulário. Podemos fazer isso com (por exemplo) {% raw %}`{{ form.as_p }}`{% endraw %}.
* A linha acima precisa estar dentro de uma tag HTML form: `<form method="POST">...</form>`.
* Precisamos de um botão `Salvar`. Fazemos isso com um botão HTML: `<button type="submit">Save</button>`.
* E finalmente, depois de abrir a tag `<form ...>` precisamos adicionar {% raw %}`{% csrf_token %}`{% endraw %}. Isso é muito importante, pois é isso que faz o nosso formulário ficar seguro! Se você esquecer esta parte, Django vai reclamar quando você tentar salvar o formulário:

![CSFR Página proíbida](images/csrf2.png)

Beleza, então vamos ver como ficou o HTML `post_edit.html`:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>Nova postagem</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Hora de atualizar! Há! Seu formulário apareceu!

![Novo formulário](images/new_form2.png)

Mas, espere um minuto! Quando você digita alguma coisa nos campos `title` e `text` e tenta salvar o que acontece?

Nada! Estamos novamente na mesma página e nosso texto sumiu... e nenhum post foi adicionado. Então o que deu errado?

A resposta é: nada. Precisamos trabalhar um pouco mais na nossa *view*.

## Salvando o formulário

Abre `blog/views.py` mais uma vez. Atualmente tudo que temos na view `post_new` é:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Quando enviamos o formulário, somos trazidos de volta para o mesmo view, mas desta vez temos mais alguns dados no `request`, especificamente em `request.POST` (o nome não tem nada a ver com "post" de blog; tem a ver com o fato que estamos "postando" dados). Você se lembra que no arquivo HTML, nossa definição de `form` incluiu o variável `method="POST"`? Todos os campos vindos do "form" estarão disponíveis agora em `request.POST`. Você não deveria renomear `POST` para nada diferente disso (o único outro valor válido para `method` é `GET`, mas nós não temos tempo para explicar qual é a diferença).

Então em nossa *view* temos duas situações diferentes para lidar: primeiro, quando acessamos a página pela primeira vez e queremos um formulário em branco e, segundo, quando voltamos para a *view* com todos os dados do formulário que acabamos de digitar. Desse modo, precisamos adicionar uma condição (usaremos `if` para isso):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

É hora de preencher os pontos `[...]`. Se `method` é `POST` então queremos construir o `PostForm` com dados do formulário, certo? Faremos como a seguir:

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

Basicamente, temos duas coisas aqui: Salvamos o formulário com `form.save` e adicionados um autor(desde que não haja o campo `author` em `PostForm`, e este campo é obrigatório). `commit=False` significa que não queremos salvar o modelo de `Post` ainda - queremos adicionar o autor primeiro. Na maioria das vezes você irá usar `form.save()`, sem `commit=False`, mas neste caso, precisamos fazer isso. `post.save()` irá preservar as alterações(adicionando autor) e é criado um novo post no blog!

Finalmente, seria fantástico se nós pudéssemos imediatamente ir à página `post_detail` para o recém-criado post do blog, certo? Para fazer isso nós precisaremos de mais uma importação:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Adicione-o logo no início do seu arquivo. E agora podemos dizer: "vá para a página `post_detail` para um recém-criado post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` é o nome da vista (view) à qual queremos ir. Lembre-se que essa *view* exige uma variável `pk`? Para passar isso nas `views` usamos `pk=post.pk`, onde post é o recém-criado post do blog!

Ok, nós falamos muito, mas provavelmente queremos ver o que toda a *view* irá parecer agora, certo?

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

Vamos ver se funciona. Vá para a página http://127.0.0.1:8000/post/new/, adicione um `title` e o `text`, salve... e pronto! O novo post do blog é adicionado e somos redirecionados à página de `post_detail`!

Você deve ter percebido que estamos estabelecendo a data de publicação antes de salvar o post. Mais tarde, vamos introduzir um botão de *Publicar* em **Django Girls Tutorial: Extensões**.

Isso é incrível!

> Como recentemente usamos a interface de administração do Django, o sistema entende que estamos logados. Existem algumas situações que poderiam levar a sermos desligados do sistema (fechar o navegador, reiniciar banco de dados etc.). Se, quando criar um post, você perceber que está recebendo erros que se referem à ausência de um usuário logado, vá até a página de admin http://127.0.0.1:8000/admin e faça login novamente. Isso vai resolver o problema temporariamente. Há um ajuste permanente esperando por você em **lição de casa: adicionar segurança no seu site!**, capítulo após o tutorial principal.

![Erro de  usuário logado](images/post_create_error.png)

## Validação de formulários

Agora, nós lhe mostraremos como os fórmularios são legais. O post do blog precisa ter os campos `title` e `text`. Em nosso modelo `Post` não dissemos (em oposição a `published_date`) que esses campos não são necessários, então Django, por padrão, espera que sejam definidos.

Tente salvar o formulário sem `title` e `text`. Adivinhe o que vai acontecer!

![Validação de formulários](images/form_validation2.png)

Django está tomando conta de validar se todos os campos de nosso formulário estão corretos. Não é incrível?

## Editando o formulário

Agora sabemos como adicionar um novo formulário. Mas e se quisermos editar um já existente? É muito semelhante ao que fizemos. Vamos criar algumas coisas importantes rapidamente. (Se você não entender alguma coisa - você deve perguntar ao seu treinador ou veja os capítulos anteriores, já cobrimos todas essas etapas anteriormente.)

Abra `blog/templates/blog/post_detail.html` e adicione esta linha

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
         <h1>{{ post.title }}</h1>
         <p>{{ post.text|linebreaksbr }}</p>
     </div>
{% endblock %}
```

Em `blog/urls.py` adicionamos esta linha:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Nós reutilizaremos o template `blog/templates/blog/post_edit.html`, então a última coisa que falta é uma *view*.

Vamos abrir `blog/views.py` e adicionar ao final do arquivo:

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

Isso é quase exatamente igual a nossa view de `post_new`, certo? Mas não totalmente. Primeira coisa: passamos um parâmetro extra `pk` da url. Em seguida: pegamos o modelo `Post` que queremos editar com `get_object_or_404 (Post, pk=pk)` e então, quando criamos um formulário, passamos este post como uma `instância`, tanto quando salvamos o formulário…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…and when we've just opened a form with this post to edit:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK, let's test if it works! Let's go to the `post_detail` page. There should be an edit button in the top-right corner:

![Botão editar](images/edit_button2.png)

Quando você clicar nele você verá o formulário com a nossa postagem:

![Editando o formulário](images/edit_form2.png)

Feel free to change the title or the text and save the changes!

Parabéns! Sua aplicação está ficando cada vez mais completa!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.0/topics/forms/

## Segurança

Ser capaz de criar novos posts apenas clicando em um link é ótimo! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Vamos fazer o botão aparece para você, mas para mais ninguém.

Em `blog/templates/blog/base.html`, procure nossa `div` `page-header` e a tag de link que você colocou mais cedo. Deve se parecer com:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Mude a tag `<a>` para que fique assim:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. Isso não protege completamente a criação de um novo post, mas é um bom começo. Vamos abordar mais sobre segurança nas próximas lições.

Lembra do ícone Editar que acabamos de adicionar à nossa página de detalhes? Nós também queremos adicionar o mesmo la, para que outras pessoas não sejam capazes de editar as mensagens existentes.

Open `blog/templates/blog/post_detail.html` and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Change it to this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Desde que você está provavelmente logado, se você atualizar a página, você não verá nada de diferente. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## Mais uma coisa: hora de implantar!

Vamos ver se tudo isso funciona no PythonAnywhere. Tempo para outro deploy!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status 
    $ git add --all . 
    $ git status 
    $ git commit -m "Added views to create/edit blog post inside the site." 
    $ git push
    

* Então, em um [console Bash do PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

* Finalmente, pule para a [aba Web](https://www.pythonanywhere.com/web_app_setup/) e aperte **Reload**.

And that should be it! Congrats :)