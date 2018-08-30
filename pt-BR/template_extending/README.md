# Estendendo os templates

Outra coisa boa que o Django tem para você é o **template extending** - extensão de templates. O que isso significa? Significa que você pode usar as mesmas partes do seu HTML em diferentes páginas do seu site.

Templates ajudam quando você quer usar a mesma informação ou layout em mais de um lugar. Você não precisa se repetir em todos os arquivos. E, caso queira mudar algo, você não precisa fazê-lo em todos os templates, apenas em um!

## Criando um template base

Um template base é o template mais básico sobre o qual você construirá em cada página do seu site.

Vamos criar um arquivo `base.html` na pasta `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Then open it up in the code editor and copy everything from `post_list.html` to `base.html` file, like this:

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
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <div class="date">
                            {{ post.published_date }}
                        </div>
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Então, em `base.html`, substitua todo o seu `<body>` (tudo entre `<body>` e `</body>`) por isso:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <div class="page-header">
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
```

{% raw %}Você pode ver que essa ação substituiu tudo a partir de `{% for post in posts %}` até `{% endfor %}` por: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Mas por quê? Você acabou de criar um `bloco`! Você usou o a etiqueta de template (template tag) `{% block %}` para criar uma área que terá HTML inserido nela. Esse HTML virá de outro template que vai estender este template (`base.html`). Nós vamos te mostrar como fazer isso já já.

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %} Remova tudo acima de `{% for post in posts %}` e abaixo de `{% endfor %}`. Quando terminar, o arquivo deve estar parecido com isso: {% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

Queremos usar isso como parte do nosso template para todos os blocos de conteúdo. É hora de adicionar as tags (etiquetas) de blocos neste arquivo!

{% raw %}Você quer que sua etiqueta de bloco coincida com a etiqueta no seu arquivo `base.html`. Você também quer que inclua todo o código que pertence aos seus blocos de conteúdo. Para isso, coloque tudo entre `{% block content %}` e `{% endblock %}`. Assim:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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

Só falta uma coisa. Precisamos juntar estes dois templates. Isto é o que significa 'estender templates'! Vamos fazer isso adicionando uma etiqueta de extensão ao início do arquivo. Assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

That's it! Save the file, and check if your website is still working properly. :)

> Se você receber o erro `TemplateDoesNotExist`, significa que não há um arquivo em `blog/base.html` e você está rodando o `runserver` na janela do terminal. Tente encerrá-lo (apertando Ctrl+C -- as teclas Control e C juntas) e reiniciá-lo rodando o comando `python manage.py runserver`.