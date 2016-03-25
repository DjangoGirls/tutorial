# Template genişletmek

Django'nun size sunduğu başka bir güzellik de **template genişletmek**tir. O da ne demek? Şu demek, HTML dosyanızın bazı bölümlerini birden fazla sayfanızda kullanabilirsiniz.

Böylece aynı bilgi/yerleştirmeyi kullanmak istediğinizde her dosyada kendinizi tekrar etmenize gerek kalmaz. Ve bir değişiklik yapmak istediğinizde bunu bütün template dosyalarında yapmanıza gerek kalmaz, bir kere değiştirmek yeterlidir!

## Temel template oluşturun

Temel template web sitenizin bütün sayfalarında genişletebileceğiniz en temel template'inizdir.

Şimdi `blog/templates/blog/` klasörü içinde `base.html` adlı bir dosya oluşturalım:

```
blog
└───templates
    └───blog
            base.html
            post_list.html
```

Sonra bunu açalım ve `post_list.html` dosyasındaki her şeyi aşağıdaki gibi bu `base.html`'ye kopyalayalım:

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
                            {{ post.yayinlama_tarihi }}
                        </div>
                        <h1><a href="">{{ post.baslik }}</a></h1>
                        <p>{{ post.yazi|linebreaks }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Sonra, `base.html` dosyasındaki `<body>`'nizi (`<body>` ve `</body>` arasında kalan her şeyi) şununla değiştirin:

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

Aslında sadece `{% for post in posts %}{% endfor %}` arasındaki her şeyi şununla değiştirmiş olduk:

```html
{% block content %}
{% endblock %}
```

Peki bu ne anlama geliyor? Az önce bir template etiketi olan `block`'u kullanarak bir blok oluşturdunuz. Diğer template'leri bu bloğun içine HTML ekleyerek `base.html`'yi genişletebilirsiniz. Bunun nasıl yapıldığını da hemen göstereceğiz.

Şimdi bunu kaydedin ve tekrar `blog/templates/blog/post_list.html` dosyanızı açın. Body içinde kalanlar hariç her şeyi silin. Ve ayrıca `<div class="page-header"></div>` bölümünü de silin. Dosyanız şöyle görünecektir:

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.yayinlama_tarihi }}
        </div>
        <h1><a href="">{{ post.baslik }}</a></h1>
        <p>{{ post.yazi|linebreaks }}</p>
    </div>
{% endfor %}
```

Ve şimdi şu satırı sayfanın başına ekleyin:

```
{% extends 'blog/base.html' %}
```

{% raw %}Bu şu anlama geliyor: `post_list.html` dosyasında `base.html` template'i genişletiyoruz. Sadece bir şey kaldı: Her şeyi (en son eklediğimiz satır hariç) `{% block content %}` ve `{% endblock content %}` arasına koyun. Şunun gibi:{% endraw %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.yayinlama_tarihi }}
            </div>
            <h1><a href="">{{ post.baslik }}</a></h1>
            <p>{{ post.yazi|linebreaks }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```

İşte bu! Sitenizin hala düzgün çalışıp çalışmadığını kontrol edin :)

> `blog/base.html` dosyası olmadığını söyleyen bir `TemplateDoesNotExists` hatası alıyorsanız, ve `runserver` konsolda çalışmaya devam ediyorsa Ctrl ve C butonlarına aynı anda basarak durdurmaya çalışın. Ve `python manage.py runserver` komutu ile yeniden başlatmayı deneyin.