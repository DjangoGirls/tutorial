# Estendendo os templates

Outra coisa boa que o Django tem para você é o **template extending** - extensão de templates. O que isso significa? Significa que você pode usar as mesmas partes do seu HTML em diferentes páginas do seu site.

Templates ajudam quando você quer usar a mesma informação ou layout em mais de um lugar. Você não precisa se repetir em todos os arquivos. E, caso queira mudar algo, você não precisa fazê-lo em todos os templates, apenas em um!

## Crie um template base

Um template base é o template mais básico que você estenderá em cada página do seu site.

Vamos criar um arquivo `base.html` na pasta `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Em seguida, abra o arquivo criado e copie tudo que está no arquivo `post_list.html` para `base.html`, desse jeito:

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

Então em `base.html`, substitua todo seu `<body>` (tudo entre `<body>` e `</body>`) com isso:

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

{% raw %}Você pode notar que isto substituiu tudo a partir de `{% for post in posts %}` até `{% endfor %}` por: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Mas, por quê? Você acabou de criar um `bloco`! Você usou o a etiqueta de template (template tag) `{% block %}` para criar uma área que terá HTML inserido nele. Esse HTML virá de outro template que vai estender este template (`base.html`). Nós vamos te mostrar como fazer isso já já.

Agora salve `base.html` e abra seu `blog/templates/blog/post_list.html` novamente. {% raw %}Você vai remover tudo acima de `{% for post in posts %}` e abaixo de `{% endfor %}`. Quando terminar, o arquivo deve estar parecendo com isso:{% endraw %}

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

Queremos usar isso como parte do nosso modelo para todos os blocos de conteúdo. É hora de adicionar etiquetas de bloco para este arquivo!

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

Só resta uma coisa. Precisamos ligar estes dois modelos juntos. Isto é o que significa 'estender modelos'! Vamos fazer isso adicionando uma etiqueta de extensão no início do arquivo. Assim:

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

É isso! Veja se o seu site ainda está funcionando direito. :)

> Se você receber o erro `TemplateDoesNotExist`, isso significa que não há um arquivo em `blog/base.html` e você está rodando o `runserver` no console. Tente encerrá-lo (apertando Ctrl+C - as teclas Control e C juntas) e reiniciá-lo rodando o comando `python manage.py runserver`.