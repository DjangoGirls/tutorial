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

Kemudian di `base.html`, ganti seluruh `<body>` ( diantara semua `<body>` dan `</body>`) dengan ini:

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

{% raw%} Anda mungkin melihat ini mengganti semuanya dari ` {% untuk posting di posting%} </ 0> menjadi <code> {% endfor%} </ 0> dengan: {% endraw%}</p>

<p>{% filename %}blog/templates/blog/base.html{% endfilename %}</p>

<pre><code class="html">{% block content %}
{% endblock %}
`</pre> 

Tapi mengapa? Anda baru saja membuat `block`! Anda menggunakan template tag `{% blok %}` Untuk membuat area yang memiliki HTML yang Dimasukkan didalamnya. HTML akan datang dari template lain yang memperluas template ini (`base.html`). Kami akan menunjukkan kepada kamu bagaimana melakukan ini dalam sesaat.

Sekarang simpan`base.html` dan buka `blog/template/blog/post_list.html` kamu lagi di kode editor. {% raw %} kamu akan menghapus segalanya diatas `{% for post in posts %}` dan dibawah `{% endfor %}`. Saat kamu sudah selesai, berkas akan terlihat seperti ini:{% endraw %}

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

Kami akan menggunakan ini sebagai bagian dari template kami untuk semua konten blok. Saatnya untuk menambahkan tag blok untuk berkas ini!

{% raw %} Anda ingin tag blok anda cocok dengan tag di dalam berkas `base.html` anda. Anda juga ingin memasukkan semua kode yang termasuk dalam blok konten Anda. Untuk melakukannya, letakkan semuanya diantara `{% block content %}` dan `{% endblock %}`. Seperti ini:{% endraw %}

{% filename %}blog/template/blog/post_list.html{% endfilename %}

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

Hanya tersisa satu hal. Kita perlu menghubungkan dua template ini bersama-sama. Inilah semua tentang memperluas template! Kami akan melakukan ini dengan menambahkan tag meluas ke awal file. Seperti ini:

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

Itu saja! Simpan filenya, dan periksa apakah situs Anda berfungsi dengan baik. :)

> Jika Anda mendapatkan error `TemplateDoesNotExist`, itu berarti tidak ada file `blog/base.html`dan Anda memiliki `runserver` yang berjalan di konsol. Cobalah untuk menghentikannya (dengan menekan Ctrl+C - tombol Control and C bersamaan) dan restart dengan menjalankan perintah `python manage.py runserver`.