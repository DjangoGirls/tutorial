# Template melanjutkan

Satu lagi perkara yang baik Django telah untuk anda **template melanjutkan**. Apa artinya ini? Ia bermakna bahawa anda boleh menggunakan yang sama bahagian HTML anda untuk halaman laman web anda.

Template membantu ketika anda ingin menggunakan maklumat yang sama atau atur dalam lebih daripada di satu tempat. Anda tidak perlu mengulangi sendiri dalam setiap fail. Dan jika anda ingin mengubah sesuatu, anda tidak perlu melakukannya dalam setiap template, hanya satu!

## Membuat pangkalan template

Pangkalan template yang paling asas template yang anda melanjutkan pada setiap halaman laman web anda.

Mari kita buat `base.html` fail dalam `blog/templates/blog/`:

    blog
    └───template
        └───blog
                base.html
                post_list.html
    

Then open it up in the code editor and copy everything from `post_list.html` to `base.html` file, like this:

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

Kemudian dalam `base.html`, menggantikan anda keseluruhan `<body>` (segala sesuatu di antara `<body>` dan `</body>`) dengan ini:

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

{% raw %}Anda mungkin melihat ini digantikan segala-galanya dari `{% for post in posts %}` to `{% endfor %}` dengan: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Tapi mengapa? Anda hanya mencipta `blok`! Anda digunakan tag template `{% block %}` untuk membuat kawasan yang akan HTML dimasukkan di dalamnya. Itu HTML akan datang dari template lain yang memanjang template ini (`base.html`). Kami akan menunjukkan anda bagaimana untuk melakukan ini dalam sekejap.

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %}Kau akan membuang semuanya di atas `{% for post in posts %}` dan di bawah `{% endfor %}`. Apabila anda selesai, fail akan kelihatan seperti ini:{% endraw %}

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

Kita ingin untuk menggunakan ini sebagai sebahagian daripada template kami untuk semua kandungan blok. Masa untuk menambah blok tag ini fail!

{% raw %}Anda ingin blok anda tag untuk perlawanan tag anda `base.html` fail. Anda juga ingin termasuk semua kod milik dalam kandungan anda blok. Untuk melakukan itu, letakkan segala sesuatu di antara `{% block content %}` dan `{% endblock %}`. Seperti ini:{% endraw %}

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

Hanya satu hal yang tersisa. Kita perlu untuk menyambung dua template bersama-sama. Ini adalah apa yang melanjutkan template adalah semua tentang! Kita akan melakukan ini dengan menambah memanjangkan tag untuk awal fail. Seperti ini:

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

That's it! Save the file, and check if your website is still working properly. :)

> Jika anda mendapatkan ralat `TemplateDoesNotExist`, itu berarti bahwa tidak ada `blog/base.html` file dan anda telah `runserver` berjalan di konsol. Mencoba untuk menghentikannya (dengan menekan Ctrl+C – Kawalan dan C kunci bersama-sama) dan mulakan semula oleh berjalan `python menguruskan.dengan salinan runserver` perintah.