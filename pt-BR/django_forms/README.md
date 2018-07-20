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

Nothing! We are once again on the same page and our text is gone… and no new post is added. So what went wrong?

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

So in our *view* we have two separate situations to handle: first, when we access the page for the first time and we want a blank form, and second, when we go back to the *view* with all form data we just typed. Desse modo, precisamos adicionar uma condição (usaremos `if` para isso):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

It's time to fill in the dots `[...]`. If `method` is `POST` then we want to construct the `PostForm` with data from the form, right? We will do that as follows:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

The next thing is to check if the form is correct (all required fields are set and no incorrect values have been submitted). We do that with `form.is_valid()`.

Verificamos se o formulário é válido e se estiver tudo certo, podemos salvá-lo!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
     post = form.save(commit=False)
     post.author = request.user
     post.published_date = timezone.now()
     post.save()
```

Basicamente, temos duas coisas aqui: Salvamos o formulário com `form.save` e adicionados um autor(desde que não haja o campo `author` em `PostForm`, e este campo é obrigatório). `commit=False` means that we don't want to save the `Post` model yet – we want to add the author first. Most of the time you will use `form.save()` without `commit=False`, but in this case, we need to supply it. `post.save()` will preserve changes (adding the author) and a new blog post is created!

Finally, it would be awesome if we could immediately go to the `post_detail` page for our newly created blog post, right? To do that we need one more import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Add it at the very beginning of your file. And now we can say, "go to the `post_detail` page for the newly created post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` é o nome da vista (view) à qual queremos ir. Lembre-se que essa *view* exige uma variável `pk`? To pass it to the views, we use `pk=post.pk`, where `post` is the newly created blog post!

OK, we've talked a lot, but we probably want to see what the whole *view* looks like now, right?

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

Vamos ver se funciona. Go to the page http://127.0.0.1:8000/post/new/, add a `title` and `text`, save it… and voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

Isso é incrível!

> As we have recently used the Django admin interface, the system currently thinks we are still logged in. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. Isso vai resolver o problema temporariamente. Há um ajuste permanente esperando por você em **lição de casa: adicionar segurança no seu site!**, capítulo após o tutorial principal.

![Erro de  usuário logado](images/post_create_error.png)

## Validação de formulários

Agora, nós lhe mostraremos como os fórmularios são legais. O post do blog precisa ter os campos `title` e `text`. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Validação de formulários](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Editando o formulário

Agora sabemos como adicionar um novo formulário. Mas e se quisermos editar um já existente? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

Open `blog/templates/blog/post_detail.html` and add the line

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

so that the template will look like this:

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

Let's open `blog/views.py` and add this at the very end of the file:

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

Isso é quase exatamente igual a nossa view de `post_new`, certo? Mas não totalmente. For one, we pass an extra `pk` parameter from urls. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

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