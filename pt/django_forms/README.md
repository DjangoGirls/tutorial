# Formulários

Por último queremos uma forma legal de adicionar e editar as postagens do nosso blog. A `ferramenta de administração` do Django é legal, mas ela é um pouco difícil de customizar e de deixar mais bonita. Se usarmos `formulários` teremos controle absoluto sobre nossa interface - podemos fazer qualquer coisa que imaginarmos!

Uma coisa legal do Django é que nós podemos tanto criar um formulário do zero como podemos criar um `ModelForm` que salva o resultado do formulário para um determinado modelo.

Isso é exatamente o que nós queremos fazer: criaremos um formulário para o nosso modelo `Post`.

Assim como toda parte importante do Django, forms tem seu próprio arquivo: `forms.py`.

Precisamos criar um arquivo com este nome dentro da pasta `blog`.

    blog
       └── forms.py


Ok, vamos abri-lo e escrever nele o seguinte:

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```


Primeiro precisamos importar o módulo de formulários do Django (`from django import forms`) e, obviamente, nosso modelo `Post` (`from .models import Post`).

`PostForm`, como você já deve suspeitar, é o nome do nosso formulário. Precisamos dizer ao Django que este formulário é um `ModelForm` (assim o Django pode fazer a mágica pra gente) - o `forms.ModelForm` é o responsável por isso.

Segundo, nós temos a classe `Meta` onde dizemos ao Django qual modelo deveria ser usado para criar este formulário (`model = Post`).

Finalmente, nós podemos dizer qual(is) campo(s) deveriam entrar em nosso formulário. Nesse cenário nós queremos apenas o `title` e `text` para ser exposto - `author` deveria ser a pessoa que está logada no sistema (nesse caso, você!) e `created_date` deveria ser setado automaticamente quando nós criamos um post (no código), correto?

E é isso aí! Tudo o que precisamos fazer agora é usar o formulário em uma *view* e mostrá-lo em um template.

Então, mais uma vez, nós iremos criar: um link para a página, uma URL, uma view e um template.

## Link para a página com o formulário

É hora de abrir `blog/templates/blog/base.html`. Nós iremos adicionar um link em `div` nomeado `page-header`:

```html
<a href="{% url 'blog.views.post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Note que nós queremos chamar nossa nova visão `post_new`.

Depois de adicionar a linha, seu html deve se parecer com isso:

```html
{% load staticfiles %}
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
            <a href="{% url 'blog.views.post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
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

```python
url(r'^post/new/$', views.post_new, name='post_new'),
```

O código final deve se parecer com isso:

``` python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

Após recarregar o site, nós veremos um `AttributeError`, desde que nós não temos a visão `post_new` implementada. Vamos adicioná-la agora.

## post_new view

Hora de abrir o arquivo `blog/views.py` e adicionar as linhas seguintes com o resto das linhas `from`:

``` python
from .forms import PostForm
```

e nossa *view*:

``` python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Para criar um novo formulario `Post`, nós devemos chamar `PostForm()` e passá-lo para o template. Nós iremos voltar para esta *view*, mas por agora vamos criar rapidamente um template para o formulário.

## Template(modelos)

Precisamos criar um arquivo `post_edit.html` na pasta `blog/templates/blog`. Pra fazer o formulário funcionar precisamos de muitas coisas:

*   Temos que exibir o formulário. Podemos fazer isso simplesmente com um `{{ form.as_p }}`.
*   A linha acima precisa estar dentro de uma tag HTML form: `<form method="POST">...</form>`
*   Precisamos de um botão `Salvar`. Fazemos isso com um botão HTML: `<button type="submit">Save</button>`
*   E finalmente, depois de abrir a tag `<form ...>` precisamos adicionar um `{% raw %}{% csrf_token %}{% endraw %}`. Isso é muito importante, pois é isso que faz o nosso formulário ficar seguro! O DJango vai reclamar se você esquecer de adicionar isso e simplesmente salvar o formulário:

![CSFR Página proíbida][1]

 [1]: images/csrf2.png

Beleza, então vamos ver como ficou o HTML `post_edit.html`:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Guardar</button>
    </form>
{% endblock %}
```

Hora de atualizar! Há! Seu formulário apareceu!

![Novo formulário][2]

 [2]: images/new_form2.png

Mas, espere um minuto! Quando você digita alguma coisa nos campos `title` e `text` e tenta salvar o que acontece?

Nada! Estamos novamente na mesma página e nosso texto sumiu... E nenhum post foi adicionado. Então o que deu errado?

A resposta é: nada. Precisamos trabalhar um pouco mais na nossa *view*.

## Salvando o formulário

Abra `blog/views.py` mais uma vez. Atualmente tudo que temos na visão `post_new` é:

``` python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Quando nós enviamos o formulário, somos trazidos de volta para a mesma visão, mas desta vez temos mais alguns dados no `request`, mais especificamente em `request.POST` (o nome não tem nada com "post" de blog , tem a ver com o fato de que estamos "postando" dados). Você se lembra que no arquivo HTML nossa definição de ` <form> ` tem a variável `method="POST"`? Todos os campos vindos do "form" estarão disponíveis agora em `request.POST`. Você não deveria renomear `POST` para nada diferente disso (o único outro valor válido para `method` é `GET`, mas nós não temos tempo para explicar qual é a diferença).

Então na nossa *view* nós temos duas situações separadas para lidar. A primeira é quanto acessamos a página pela primeira vez e queremos um formulário em branco. E a segunda, é quando nós temos que voltar para a *view* com todos os dados do formulário que nós digitamos. Desse modo, precisamos adicionar uma condição (usaremos `if` para isso).

``` python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Está na hora de preencher os pontos`[...]`. Se `method` é `POST` então nós queremos construir o `PostForm` com os dados que veem do formulário, certo? Nós iremos fazer assim:

```python
form = PostForm(request.POST)
```

Fácil! Próxima coisa é verificar se o formulário está correto(todos os campos requeridos são definidos e valores incorretos não serão salvos). Fazemos isso com `form.is_valid()`.

Verificamos se o formulário é válido e se estiver tudo certo, podemos salvá-lo!

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Basicamente, temos duas coisas aqui: Salvamos o formulário com `form.save` e adicionados um autor(desde que não haja o campo `author` em `PostForm`, e este campo é obrigatório!). `commit=False` significa que não queremos salvar o modelo `Post` ainda - queremos adicionar autor primeiro. Na maioria das vezes você irá usar `form.save()`, sem `commit=False`, mas neste caso, precisamos fazer isso. `post.save()` irá preservar as alterações(adicionando autor) e é criado um novo post no blog!

Finalmente, não seria fantástico se nós pudéssemos imediatamente ir à página de `post_detail` para o recém-criado blog post, certo? Para fazer isso nós precisaremos de mais uma importação:

```python
from django.shortcuts import redirect
```

Adicione-o logo no início do seu arquivo. E agora podemos dizer: vá para a página `post_detail` para um recém-criado post.

```python
return redirect('blog.views.post_detail', pk=post.pk)
```

`blog.views.post_detail` é o nome da view que queremos ir. Lembre-se que essa *view* exige uma variável `pk`? Para passar isso nas `views` usamos `pk=post.pk`, onde post é o recém-criado blog post.

Ok, nós falamos muito, mas provavelmente queremos ver o que toda a *view* irá parecer agora, certo?

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Vamos ver se funciona. Vá para o página http://127.0.0.1:8000/post/new/, adicione um `title` e o `text`, salve... e voilà! O novo blog post é adicionado e nós somos redirecionados para a página de `post_detail`!

Você provavelmente notou que nós não estamos definindo a data de publicação em tudo. Vamos introduzir um *botão de publicação* em **Django Girls Tutorial: Extensões**.

Isso é incrível!

## Validação de formulários

Agora, nós lhe mostraremos como os fórmularios são legais. O post do blog precisa ter os campos `title` e `text`. Em nosso modelo `Post` não dissemos (em oposição a `published_date`) que esses campos não são necessários, então Django, por padrão, espera-os a ser definido.

Tente salvar o formulário sem `title` e `text`. Adivinhe o que vai acontecer!

![Validação de formulários][3]

 [3]: images/form_validation2.png

Django está tomando conta de validar se todos os campos de nosso formulário estão corretos. Não é incrível?

> Como recentemente usamos a interface de administração do Django o sistema entende que estamos logados. Existem algumas situações que poderiam levar a sermos deslogados do sistema (fechar o navegador, reiniciar banco de dados etc.). Se você perceber que erros estão aparecendo ao criar um post que referencia um usuário que não está logado, vá para a página admin http://127.0.0.1:8000 e logue novamente. Isso vai resolver o problema temporariamente. Há um ajuste permanente esperando por você em **lição de casa: adicionar segurança no seu site!**, capítulo após o tutorial principal.

![Erro de  usuário logado][4]

 [4]: images/post_create_error.png

## Editando o formulário

Agora sabemos como adicionar um novo formulário. Mas e se quisermos editar um já existente? É muito semelhante ao que fizemos. Vamos criar algumas coisas importantes rapidamente (se você não entender alguma coisa - você deve perguntar a seu professor ou veja os capítulos anteriores, já cobrimos todas essas etapas anteriormente).

Abra `blog/templates/blog/post_detail.html` e adicione a linha:

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```


Agora o modelo estará parecido com:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="date">
    {% if post.published_date %}
        {{ post.published_date }}
    {% endif %}
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
    </div>
    <h1>{{ post.title }}</h1>
    <p>{{ post.text|linebreaksbr }}</p>
{% endblock %}
```


Em `blog/urls.py` adicionamos esta linha:

```python
url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```

Nós reutilizaremos o modelo `blog/templates/blog/post_edit.html`, então a última coisa que falta é uma *view*.

Vamos abrir `blog/views.py` e adicionar no final do arquivo:

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
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Isso é quase exatamente igual a nossa view de `post_new`, certo? Mas não totalmente. Primeira coisa: passamos um parâmetro extra da url `pk`. Em seguida: pegamos o modelo `Post` que queremos editar com `get_object_or_404 (Post, pk=pk)` e então, quando criamos um formulário passamos este post como uma `instância`, tanto quando salvamos o formulário:

```python
form = PostForm(request.POST, instance=post)
```

como quando nós apenas abrimos um formulário com este post para editar:

```python
form = PostForm(instance=post)
```

Ok, vamos testar se funciona! Vamos para a página `post_detail`. Deve haver um botão editar no canto superior direito:

![Botão editar][5]

 [5]: images/edit_button2.png

Quando você clicar nele você verá o formulário com a nossa postagem:

![Editando o formulário][6]

 [6]: images/edit_form2.png

Sinta-se livre para mudar o título ou o texto e salvar as mudanças!

Parabéns! Sua aplicação está ficando cada vez mais completa!

Se você precisar de mais informações sobre formulários do Django você deve ler a documentação: https://docs.djangoproject.com/en/1.8/topics/forms/

## Mais uma coisa: hora de implantar!

Vamos ver se tudo isso funciona na PythonAnywhere. Tempo para outro deploy!

*   Primeiro, commit o seu novo código e coloque no Github

```bash
$ git status
$ git add --all .
$ git status
$ git commit -m "Added views to create/edit blog post inside the site."
$ git push
```

*   Então, em um [console PythonAnywhere Bash][7]:

```bash
$ cd my-first-blog
$ git pull
```

*   Finalmente, pule para a [Web tab][8] e aperte **Reload**.

 [7]: https://www.pythonanywhere.com/consoles/
 [8]: https://www.pythonanywhere.com/web_app_setup/

E deve ser isso! Parabéns :)
