# CSS - menjadikannya cantik!

Blog kita masih kelihatan hodoh, betul? Masa untuk menjadikannya cantik! Kami akan menggunakan CSS untuk itu.

## Apakah CSS?

Cascading Style Sheets (CSS) adalah bahasa yang digunakan untuk menggambarkan rupa dan pemformatan laman web yang ditulis dalam bahasa markup (seperti HTML). Rawat ia sebagai make-up untuk laman web kami. ;)

Tetapi kita tidak mahu bermula dari awal lagi, bukan? Sekali lagi, kami akan menggunakan sesuatu yang dilancarkan oleh programmer di Internet secara percuma. Menghidupkan semula roda tidak menyenangkan, anda tahu.

## Mari kita gunakan Bootstrap!

Bootstrap adalah salah satu kerangka kerja HTML dan CSS yang paling populer untuk mengembangkan situs web yang indah: https://getbootstrap.com/

Ia ditulis oleh pengaturcara yang bekerja untuk Twitter. Kini ia dibangunkan oleh sukarelawan dari seluruh dunia!

## Memasang Bootstrap

To install Bootstrap, open up your `.html` file in the code editor and add this to the `<head>` section:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![Rajah 14.1](images/bootstrap1.png)

Kelihatan lebih cantik!

## Fail Statik dalam Django

Akhir sekali, kita akan melihat dengan lebih dekat kepada **fail-fail statik**. Fail statik adalah semua CSS dan imej anda. Kandungan mereka tidak bergantung pada konteks permintaan dan akan sama bagi setiap pengguna.

### Di mana meletakkan fail-fail statik untuk Django

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

Kita melaksanakannya dengan mencipta folder yang dipanggil `statik` di dalam aplikasi blog ini:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django secara automatik akan mencari folder yang dipanggil "statik" dalam folder folder apl anda. Kemudian ia akan dapat menggunakan kandungannya sebagai fail statik.

## Fail CSS anda yang pertama!

Mari buat fail CSS sekarang, untuk menambah gaya anda sendiri ke halaman web anda. Cipta satu direktori baru yang dipanggil `css` dalam direktori `statik`. Kemudian cipta fail baru yang dipanggil `blog.css` di dalam direktori `css`. Sedia?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Masa untuk menulis beberapa CSS! Buka fail `blog/static/css/blog.css` dalam Penyunting kod anda.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

Tetapi mari kita lakukan sekurang-kurangnya sedikit. Maybe we could change the color of our headers? Untuk memahami warna, komputer menggunakan kod khas. These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). For example, the code for blue is `#0000FF`. You can find the color codes for many colors here: http://www.colorpicker.com/. Anda juga boleh menggunakan [warna-warna yang telah ditetapkan](http://www.w3schools.com/colors/colors_names.asp), seperti `red` dan `green`.

Dalam fail `blog/static/css/blog.css`, anda perlu menambah kod berikut:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` adalah Pilihan CSS. This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

Di dalam sebuah fail CSS, kita tentukan gaya bagi unsur-unsur dalam fail HTML. Cara pertama kami mengenal pasti elemen adalah dengan nama elemen. Anda mungkin ingat ini sebagai tanda dari bahagian HTML. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Class dan id adalah nama-nama yang anda berikan pada unsur sendiri. Kelas menentukan kumpulan elemen, dan id titik untuk unsur-unsur tertentu. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file in the code editor and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Pelayar membaca fail dalam perintah mereka diberikan, jadi kami harus memastikan kalau semua ini adalah di tempat yang tepat. Otherwise the code in our file may be overriden by code in Bootstrap files. We just told our template where our CSS file is located.

File anda sekarang harus kelihatan seperti ini:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        {% for post in posts %}
            <div>
                <p>published: {{ post.published_date }}</p>
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

OK, simpan file dan refresh situsnya

![Rajah 14.2](images/color2.png)

Kerja yang bagus! Mungkin kita juga ingin memberi kami web sedikit udara dan meningkatkan margin di sebelah kiri? Mari kita coba yang ini!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Tambah yang anda CSS, simpan fail dan melihat bagaimana ia berfungsi!

![Rajah 14.3](images/margin2.png)

Maybe we can customize the font in our header? Paste this into your `<head>` in `blog/templates/blog/post_list.html` file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Rajah 14.3](images/font.png)

Great!

Seperti kekurangan di atas, CSS memiliki konsep kelas. Ini membolehkan anda menamakan sebahagian daripada kod HTML dan menggunakan gaya hanya untuk bahagian ini, tanpa menjejaskan bahagian lain. Ini boleh menjadi sangat membantu! Mungkin anda mempunyai dua div yang melakukan sesuatu yang berbeza (seperti header dan pos anda). Kelas boleh membantu anda membuat mereka kelihatan berbeza.

Go ahead and name some parts of the HTML code. Add a class called `page-header` to your `div` that contains your header, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

And now add a class `post` to your `div` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Sekarang kita akan menambah deklarasi blok untuk berbeza pemilih. Selectors starting with `.` relate to classes. Ada banyak tutorial dan penjelasan mengenai CSS di Web yang boleh membantu kau mengerti berikut kod. For now, copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

Kemudian mengelilingi HTML kod yang memaparkan catatan dengan deklarasi kelas. Menggantikan ini:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

in the `blog/templates/blog/post_list.html` with this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Simpan fail tersebut dan muat semula laman web anda.

![Rajah 14.4](images/final.png)

Woohoo! Nampak hebat, kan? Melihat kod kita hanya disisipkan untuk mencari tempat di mana kita ditambah kelas di HTML dan menggunakan mereka dalam CSS. Di mana anda akan membuat perubahan jika anda ingin tarikh untuk menjadi biru?

Jangan takut untuk bermain-main dengan CSS ini sedikit dan cuba untuk mengubah beberapa hal. Bermain dengan CSS boleh membantu anda untuk memahami apa yang perkara-perkara yang berbeza lakukan. Jika anda memecahkan sesuatu, jangan khawatir – anda sentiasa boleh membatalkannya!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Sedia untuk bab seterusnya ?! :)