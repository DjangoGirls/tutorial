# Template genişletmek

Django'nun size sunduğu başka bir güzellik de **template genişletmek**tir. O da ne demek? Şu demek, HTML dosyanızın bazı bölümlerini birden fazla sayfanızda kullanabilirsiniz.

Templatelar aynı bilgiyi ya da yerleştirmeyi (layout) birden fazla yerde kullanmak istediğinizde yardım ederler. Yaptığınızı her dosya için tekrar etmek zorunda kalmazsınız. Ve bir şey değiştimek isterseniz, tüm templatelarda değil sadece bir tanesinde değiştirirsiniz!

## Bir Temel Template Oluştur

Temel template web sitenizin bütün sayfalarında genişletebileceğiniz en temel template'inizdir.

Şimdi `blog/templates/blog/` klasörü içinde `base.html` adlı bir dosya oluşturalım:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Sonra bunu açalım ve `post_list.html` dosyasındaki her şeyi aşağıdaki gibi bu `base.html`'ye kopyalayalım:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls Blog</title>
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

Sonra, `base.html` dosyasındaki `<body>`'nizi (`<body>` ve `</body>` arasında kalan her şeyi) şununla değiştirin:

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

{% raw %}Her şeyin bununla değiştirildiğini farkedebilirsiniz`{% for post in posts %}`dan`{% endfor %}`bununla:{% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Ama neden? Bir `blok` oluşturdunuz! `{% block %}` içinde HTML ekleyecek alan yapmak için şablon etiketi kullandınız. HTML başka bir şablondan gelecek (`base.html`) bu şablonu genişletir. Bunun nasıl yapıldığını da hemen göstereceğiz.

Şimdi `base.html`'i kaydedin ve `blog/templates/blog/post_list.html` dosyanızı tekrar açın. {% raw %}You're going to remove everything above `{% for post in posts %}` and below `{% endfor %}`. When you're done, the file will look like this:{% endraw %}

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

Bunu, bütün içerik blokları için şablonumuzun bir parçası olarak kullanmak istiyoruz. Şimdi bu dosyaya blok etiketleri ekleme zamanı!

{% raw %}You want your block tag to match the tag in your `base.html` file. Ayrıca içerik bloklarınına ait bütün koduda dahil etmek istiyorsun. Bunu yapmak için, herşeyi `{% block content %}`ve`{% endblock %}`'un arasına yerleştir. Şunun gibi:{% endraw %}

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

Geriye tek birşey kaldı. Bu iki şablonu birbirine bağlamamız gerekiyor. Genişleyen şablonlar tam da bununla ilgili! Bunu dosyanın başlangıcına genişleyebilir etiketler ekleyerek yapacağız. Bunun gibi:

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

İşte bu! Sitenizin hala düzgün çalışıp çalışmadığını kontrol edin. :)

> If you get the error `TemplateDoesNotExist`, that means that there is no `blog/base.html` file and you have `runserver` running in the console. Try to stop it (by pressing Ctrl+C – the Control and C keys together) and restart it by running a `python manage.py runserver` command.