# Estendendo os templates

Outra coisa boa que o Django tem pra você é o __template extending__. O que isso significa? Isso significa que você pode usar as mesmas partes do seu HTML em diferentes páginas do seu site.

Templates são úteis quando você quer usar a mesma informação/layout em mais de um lugar. Você não precisa ficar se repetindo em cada arquivo. E, se você quiser mudar alguma coisa, não precisa fazer isso em todos os templates, apenas em um!

## Criar template base

Um template base é o template mais básico que você estenderá em cada página do seu site.

Vamos criar um arquivo `base.html` na pasta `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html


Abra-o e copie tudo que está no arquivo `post_list.html` para `base.html`, desse jeito:

{% filename %}blog/templates/blog/base.html{% endfilename %}
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

{% raw %}Basicamente nós substituímos tudo entre `{% for post in posts %}{% endfor %}` por:{% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
{% block content %}
{% endblock %}
```

Mas, por quê? Você acabou de criar um `block` (bloco)! Você usou uma tag de template `{% block %}` para criar uma área onde será inserido HTML. Esse HTML virá de outro template que estende esse template (`base.html`). Nós vamos te mostrar como fazer isso já já.

Agora salve `base.html` e abra o arquivo `blog/templates/blog/post_list.html` novamente. {% raw %}Você irá remover tudo que estiver acima de `{% for post in posts %}` e abaixo de `{% endfor %}`. Quando terminar, o arquivo ficará dessa forma:{% endraw %}

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

Nós queremos usar essa parte de nosso template para todos os blocos "content".
Hora de adicionar tags de bloco ("block") nesse arquivo!

{% raw %}Você quer que sua tag de bloco ("block") corresponda com a tag em seu arquivo `base.html`. Você também quer que ela inclua todo o código que pertence ao seus blocos "content". Para fazer isso, coloque tudo entre `{% block content %}` e `{% endblock %}`. Dessa forma:{% endraw %}

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

Só falta uma coisa. Nós precisamos fazer a conexão entre esses dois templates.  É isso que "extendendo templates" significa! Nós iremos fazer isso adicionando uma tag de extender ("extends") ao início do arquivo. Dessa forma:

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

É isso! Veja se o seu site ainda está funcionando direito :)

> Se ocorrer um erro de `TemplateDoesNotExists`, que diz que não existe nenhum arquivo chamado `blog/base.html` e se você tiver o `runserver` executando no terminal, tenta interrompê-lo (precionando Ctrl+C - o botão Control mais o botão C juntos) e reinicie ele rodando o comando `python manage.py runserver`.
