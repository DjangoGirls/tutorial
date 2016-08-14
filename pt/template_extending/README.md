# Estendendo os templates

Outra coisa boa que o Django tem pra você é o **template extending**. O que isso significa? Isso significa que você pode usar as mesmas partes do seu HTML em diferentes páginas do seu site.

Dessa forma você não precisa ficar se repetindo em cada arquivo quando quiser usar a mesma informação/layout. E se você quiser mudar alguma coisa não precisa fazer isso em todo template, só uma vez!

## Criar template base

Um template base é o template mais básico que você estenderá em cada página do seu site.

Vamos criar um arquivo `base.html` na pasta `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Abra-o e copie tudo que está no arquivo `post_list.html` para `base.html`, desse jeito:

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

{% raw %}Basicamente nós substituimos tudo entre `{% for post in posts %}{% endfor %}` por:{% endraw %}

```html
{% block content %}
{% endblock %}
```

O que isso significa? Você acabou de criar um `block` (bloco), que é uma tag de template que te permite inserir HTML neste bloco em outros templates que estendem `base.html`. Nós vamos te mostrar como fazer isso já já.

Salve e abra o arquivo `blog/templates/blog/post_list.html` novamente. Apague exatamente tudo que não estiver dentro da tag body e apague também `<div class="page-header"></div>`, de forma que o arquivo fique da seguinte maneira:

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

Agora adicione esta linha ao início do arquivo:

```html
{% extends 'blog/base.html' %}
```

Isso significa que, agora, nós estamos estendendo o template `base.html` em `post_list.html`. Uma última coisa: colocar tudo (exceto pela linha que acabamos de adicionar) entre `{% block content %}` e `{% endblock content %}`. Como a seguir:

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

É isso! Veja se o seu site ainda está funcionando direito :)

> Se ocorrer um erro de `TemplateDoesNotExists`, que diz que não existe nenhum arquivo chamado `blog/base.html` e se você tiver o `runserver` executando no terminal, tenta interrompê-lo (precionando Ctrl+C - o botão Control mais o botão C juntos) e reinicie ele rodando o comando `python manage.py runserver`.
