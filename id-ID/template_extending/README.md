# Template memperpanjang

Hal baik lain yang Django miliki untuk Anda adalah ** template yang diperluas </ 0>. Apa artinya ini? Ini berarti Anda dapat menggunakan bagian HTML yang sama untuk berbagai halaman situs web Anda.</p> 

Template membantu bila kamu ingin menggunakan informasi atau tata letak yang sama di lebih dari satu tempat. Kamu tidak perlu mengulang sendiri di setiap file. Dan jika kamu ingin mengubah sesuatu, Anda tidak perlu melakukannya di setiap template, hanya satu!

## Buat template dasar

Template dasar adalah template paling dasar yang Anda tambahkan di setiap halaman situs web kamu.

Ayo buat file ` base.html </ 0> di <code> blog / templates / blog / </ 0>:</p>

<pre><code>blog └───templates
     └───blog
             base.html
             post_list.html
`</pre> 

Kemudian buka dan salin semua dari `post_list.html` ke `base.html` file, Seperti ini:

{% filenama %}blog/template/blog/base.html{% endfilename %}

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

Kemudian di `base.html`, ganti seluruh `<body>` ( diantara semua `<body>` dan `</body>`) dengan ini:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <div class="page-header">
        <h1><a href="/">Blog Django Girls</a></h1>
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

{% raw%} Anda mungkin melihat ini mengganti semuanya dari ` {% untuk posting di posting%} </ 0> menjadi <code> {% endfor%} </ 0> dengan: {% endraw%}</p>

<p>{% filename %}blog/templates/blog/base.html{% endfilename %}</p>

<pre><code class="html">{% block content %}
{% endblock %}
`</pre> 

Tapi mengapa? Anda baru saja membuat `block`! Anda menggunakan template tag `{% blok %}` Untuk membuat area yang memiliki HTML yang Dimasukkan didalamnya. HTML akan datang dari template lain yang memperluas template ini (`base.html`). Kami akan menunjukkan kepada kamu bagaimana melakukan ini dalam sesaat.

Sekarang simpan`base.html` dan buka `blog/template/blog/post_list.html` kamu lagi. {% raw %} kamu akan menghapus segalanya diatas `{% for post in posts %}` dan dibawah `{% endfor %}`. Saat kamu sudah selesai, berkas akan terlihat seperti ini:{% endraw %}

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

Kami akan menggunakan ini sebagai bagian dari template kami untuk semua konten blok. Saatnya untuk menambahkan tag blok untuk berkas ini!

{% raw %} Anda ingin tag blok anda cocok dengan tag di dalam berkas `base.html` anda. Anda juga ingin memasukkan semua kode yang termasuk dalam blok konten Anda. Untuk melakukannya, letakkan semuanya diantara `{% block content %}` dan `{% endblock %}`. Seperti ini:{% endraw %}

{% filename %}blog/template/blog/post_list.html{% endfilename %}

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

Hanya tersisa satu hal. Kita perlu menghubungkan dua template ini bersama-sama. Inilah semua tentang memperluas template! Kami akan melakukan ini dengan menambahkan tag meluas ke awal file. Seperti ini:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% memperluas 'blog/base.html' %}

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

Itu saja! Periksa apakah situs Anda masih berfungsi sebagaimana mestinya. :)

> Jika Anda mendapatkan error `TemplateDoesNotExist`, itu berarti tidak ada file `blog/base.html`dan Anda memiliki `runserver` yang berjalan di konsol. Cobalah untuk menghentikannya (dengan menekan Ctrl+C - tombol Control and C bersamaan) dan restart dengan menjalankan perintah `python manage.py runserver`.