# Template genişletmek

Django'nun size sunduğu başka bir güzellik de **template genişletmek**tir. O da ne demek? Şu demek, HTML dosyanızın bazı bölümlerini birden fazla sayfanızda kullanabilirsiniz.

Templatelar aynı bilgiyi ya da yerleştirmeyi (layout) birden fazla yerde kullanmak istediğinizde yardım ederler. Yaptığınızı her dosya için tekrar etmek zorunda kalmazsınız. Ve bir şey değiştirmek isterseniz, tüm templatelarda değil sadece bir tanesinde değiştirirsiniz!

## Bir Temel Template Oluştur

Temel template web sitenizin bütün sayfalarında genişletebileceğiniz en temel template'inizdir.

Şimdi `blog/templates/blog/` klasörü içinde `base.html` adlı bir dosya oluşturalım:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Sonra bunu açalım ve `post_list.html` dosyasındaki her şeyi aşağıdaki gibi `base.html`'ye kopyalayalım:

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

Sonra, `base.html` dosyasındaki `<body>`'nizi (`<body>` ve `</body>` arasında kalan her şeyi) şununla değiştirin:

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

{% raw %}Her şeyin bununla değiştirildiğini fark edebilirsiniz`{% for post in posts %}`dan`{% endfor %}`bununla:{% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Ama neden? Bir `blok` oluşturdunuz! `{% block %}` içinde HTML ekleyecek alan yapmak için şablon etiketi kullandınız. HTML başka bir şablondan gelecek (`base.html`) bu şablonu genişletir. Bunun nasıl yapıldığını da hemen göstereceğiz.

Şimdi `base.html`'i kaydedelim ve `blog/templates/blog/post_list.html` dosyamızı tekrar açalım. {% raw %} `{% for post in posts %}`'ın üzerindeki ve `{% endfor %}`'ın altındaki her şeyi kaldıracaksınız. İşiniz bittiğinde dosya şu şekilde görünecektir:{% endraw %}

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

Bunu, bütün içerik blokları için şablonumuzun bir parçası olarak kullanmak istiyoruz. Şimdi bu dosyaya blok etiketleri ekleme zamanı!

{% raw %}Blok etiketinizin `base.html` dosyanızdaki etikete uymasını istiyorsunuz. Ayrıca içerik bloklarınına ait bütün kodu da dahil etmek istiyorsun. Bunu yapmak için, her şeyi `{% block content %}`ve`{% endblock %}`'un arasına yerleştir. Şunun gibi:{% endraw %}

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

Geriye tek bir şey kaldı. Bu iki şablonu birbirine bağlamamız gerekiyor. Genişleyen şablonlar tam da bununla ilgili! Bunu dosyanın başlangıcına genişleyebilir etiketler ekleyerek yapacağız. Bunun gibi:

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

İşte bu! Dosyayı kaydedip sitenizin hala düzgün çalışıp çalışmadığını kontrol edin. :)

> Eğer `TemplateDoesNotExist` hatasını alıyorsanız, bunun anlamı `blog/base.html` dosyası yok ve konsolda `runserver`'ı çalıştırıyorsunuz demektir. Konsolda durdurmayı deneyin (Ctrl+C -Control ve C tuşlarına birlikte basarak) ve `python manage.py runserver` komutunu çalıştırarak yeniden başlatın.