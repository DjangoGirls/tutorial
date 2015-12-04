# Şablon genişletmek

Django'nun size sunduğu başka bir güzellik de **şablon genişletmek**tir. O da ne demek? Şu demek, HTML dosyanızın bazı bölümlerini birden fazla sayfanızda kullanabilirsiniz.

Böylece aynı bilgi/yerleştirmeyi kullanmak istediğinizde her dosyada kendinizi tekrar etmenize gerek kalmaz. Ve bir değişiklik yapmak istediğinizde bunu bütün şablonlarda yapmanıza gerek kalmaz, bir kere değiştirmek yeterlidir!

## Temel şablonu oluşturma

Temel şablonunuz sizin diğer bütün sayfalarda genişletebileceğiniz en basit şablonunuzdur.

Şimdi `blog/templates/blog/` klasörü içinde `base.html` adlı dosyayı oluşturalım:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Sonra, `post_list.html` dosyasındaki her şeyi `base.html`'ye kopyalayalım, şu şekilde:

    html
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
                            <p>{{ post.text|linebreaks }}</p>
                        </div>
                    {% endfor %}
                    </div>
                </div>
            </div>
        </body>
    </html>
    

Sonra, `base.html` dosyasındaki `<body>`'nizi (`<body>` ve `</body>` arasında kalan her şeyi) şununla değiştirin:

    html
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
    

Aslında sadece `{% for post in posts %}{% endfor %}` arasındaki her şeyi şununla değiştirmiş olduk:

    html
    {% block content %}
    {% endblock %}
    

Peki bu ne anlama geliyor? Az önce bir `block` oluşturdunuz. Bloklar şablon etiketleridir, blokların içine HTML ekleyerek `base.html`'yi genişleten şablonlara erişebilirsiniz. Bunun nasıl yapıldığını da hemen göstereceğiz.

Şimdi kaydedin, ve tekrar `blog/templates/blog/post_list.html` dosyasını açın. Body içinde kalanlar hariç her şeyi silin. Ve ayrıca `<div class="page-header"></div>` bölümünü de silin. Dosyanız şöyle görünecektir:

    html
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
    

Ve şimdi bu satırı sayfanın başına ekleyin:

    {% extends 'blog/base.html' %}
    

{% raw %}Bu şu anlama geliyor: `post_list.html` dosyasında `base.html` şablonunu genişletiyoruz. Sadece bir şey kaldı: Her şeyi (en son eklediğimiz satır hariç) `{% block content %}` ve `{% endblock content %}` arasına koyun. Şunun gibi:{% endraw %}

    html
    {% extends 'blog/base.html' %}
    
    {% block content %}
        {% for post in posts %}
            <div class="post">
                <div class="date">
                    {{ post.published_date }}
                </div>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaks }}</p>
            </div>
        {% endfor %}
    {% endblock content %}
    

İşte bu! Sitenizin hala düzgün çalışıp çalışmadığını kontrol edin :)

> `blog/base.html` dosyası olmadığını söyleyen bir `TemplateDoesNotExists` hatası alıyorsanız, ve `runserver` konsolda çalışmaya devam ediyorsa Ctrl ve C butonlarına aynı anda basarak durdurmaya çalışın. Ve `python manage.py runserver` komutu ile yeniden başlatmayı deneyin.