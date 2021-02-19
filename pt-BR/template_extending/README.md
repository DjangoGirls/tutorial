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
    

Em seguida, abra o arquivo no editor de código e copie tudo de `post_list.html` para `base.html`, desse jeito:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header class="page-header">
          <div class="container">
              <h1><a href="/">Django Girls Blog</a></h1>
          </div>
        </header>

        <main class="container">
            <div class="row">
                <div class="col">
                {% for post in posts %}
                    <article class="post">
                        <time class="date">
                            {{ post.published_date }}
                        </time>
                        <h2><a href="">{{ post.title }}</a></h2>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </article>
                {% endfor %}
                </div>
            </div>
        </main>
    </body>
</html>
```

Então, em `base.html`, substitua todo o seu `<body>` (tudo entre `<body>` e `</body>`) por isso:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <header class="page-header">
      <div class="container">
          <h1><a href="/">Django Girls Blog</a></h1>
      </div>
    </header>
    <main class="container">
        <div class="row">
            <div class="col">
            {% block content %}
            {% endblock %}
            </div>
        </div>
    </main>
</body>
```

{% raw %}Você pode ver que essa ação substituiu tudo a partir de `{% for post in posts %}` até `{% endfor %}` por: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Mas por quê? Você acabou de criar um `bloco`! Você usou o a etiqueta de template (template tag) `{% block %}` para criar uma área que terá HTML inserido nela. Esse HTML virá de outro template que vai estender este template (`base.html`). Nós vamos te mostrar como fazer isso já já.

Agora, salve `base.html` e abra novamente o seu `blog/templates/blog/post_list.html` no editor de código. {% raw %} Remova tudo acima de `{% for post in posts %}` e abaixo de `{% endfor %}`. Quando terminar, o arquivo deve estar parecido com isso: {% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time class="date">
            {{ post.published_date }}
        </time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

Queremos usar isso como parte do nosso template para todos os blocos de conteúdo. É hora de adicionar as tags (etiquetas) de blocos neste arquivo!

{% raw %}Você quer que sua etiqueta de bloco coincida com a etiqueta no seu arquivo `base.html`. Você também quer que inclua todo o código que pertence aos seus blocos de conteúdo. Para isso, coloque tudo entre `{% block content %}` e `{% endblock %}`. Assim:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

Só falta uma coisa. Precisamos juntar estes dois templates. Isto é o que significa 'estender templates'! Vamos fazer isso adicionando uma etiqueta de extensão ao início do arquivo. Assim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

É isso! Salve o arquivo e veja se o seu site ainda está funcionando corretamente. :)

> Se você receber o erro `TemplateDoesNotExist`, significa que não há um arquivo em `blog/base.html` e você está rodando o `runserver` na janela do terminal. Tente encerrá-lo (apertando Ctrl+C -- as teclas Control e C juntas) e reiniciá-lo rodando o comando `python manage.py runserver`.