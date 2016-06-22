# Rozšiřování šablon

Další pěknou věcí, kterou pro nás Django má je **rozšiřování šablon**. Co to znamená? To znamená, že můžeš použít stejné HTML pro různé stránky na svém blogu.

Tímto způsobem nemusíš opakovat v každém souboru stejný kód, když chceš použít stejné informace/rozvržení. A pokud chceš něco změnit, není nutné to dělat v každé šabloně, stačí jen v jedné!

## Vytvoření základní šablony

Základní šablona je šablona, kterou rozšíříme na každé stránce našich webových stránek.

Vytvoříme soubor `base.html` v `blog/templates/blog/`:

```
    blog
    └───templates
         └───blog
                 base.html
                 post_list.html
```  

Pak jej otevři a zkopírujte vše z `post_list.html` do `base.html` souboru, jako je to níže:

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

Pak v `base.html`, nahraď celé `< body >` (vše mezi `< body >` a `< / body >`) tímto:

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

Nahradili jsme v podstatě všechno, co bylo mezi `{% for post in posts %}{% endfor %}` za:

```html
    {% block content %}
    {% endblock %}
```    

Co to znamená? Právě jsi vytvořila `block`, což je šablonovací značka, která umožňuje vkládat HTML kód do tohoto bloku v jiných šablonách, které rozšiřují `base.html`. Hned ti ukážeme jak to udělat.

Nyní ulož a znovu otevři svůj `blog/templates/blog/post_list.html`. Odstraň vše, co není uvnitř body a pak také odstraň `< div class="page-header" >< / div >`, takže soubor bude vypadat takto:

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

A teď přidej na začátek souboru tento řádek:

```html
    {% extends 'blog/base.html' %}
```    

{% raw %} to znamená, že nyní rozšiřujeme šablonu `base.html` v `post_list.html`. Jen jedna věc zbývá: vše dát (kromě řádku, který jsme právě přidali) mezi `{% block content %}` a `{% endblock content %}`. Takto:{% endraw %}

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

To je ono! Zkontroluj, zda tvoje stránky stále správně fungují :)

> Jestliže dostaneš chybu `TemplateDoesNotExists`, která říká, že neexistuje žádný soubor `blog/base.html` a máš `runserver` v konzoli, zkus zastavit (stisknutím kombinace kláves Ctrl + C - ctrl a tlačítka C společně) a restartovat spuštěním příkazu `pythonu manage.py runserver`.
