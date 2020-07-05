# CSS - mempercantik!

Blog kita masih terlihat jelek, kan? Saatnya mempercantiknya! Kita akan menggunakan CSS untuk itu.

## Apa itu CSS?

Cascading Style Sheets (CSS) adalah bahasa yang menjelaskan tampilan dan format situs web. Seperti halnya HTML, yang merupakan bahasa markup. CSS adalah sesuatu seperti "make-up" dari situs web Kita. ;)

Tapi kita tidak ingin memulai dari nol lagi kan? Sekali lagi, kita akan menggunakan sesuatu yang dirilis oleh programer dan tersedia secara gratis di Internet. Seperti istilah "Reinventing the wheel (Menemukan kembali roda)" hal tersebut tidaklah menyenangkan.

## Mari kita gunakan Bootstrap!

Bootstrap adalah salah satu kerangka kerja HTML dan CSS yang paling populer untuk mengembangkan situs web yang indah: https://getbootstrap.com/

Itu ditulis oleh programmer yang bekerja untuk Twitter. Sekarang dikembangkan oleh sukarelawan dari seluruh dunia!

## Memasang Bootstrap

Buka file `.html` Anda di editor kode Anda dan tambahkan berikut ini ke bagian `<head>` untuk menginstal bootstrap:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Ini tidak akan menambahkan file apa pun ke proyek Anda. Kode hanya merujuk ke file yang ada di Internet. Jadi buka dan *refresh* (muat ulang) situs web Anda. Inilah hasilnya!

![Gambar 14.1](images/bootstrap1.png)

Terlihat lebih menarikkan!

## Static files di Django

Akhirnya kita bisa lebih dekat dengan sesuatu yang dipanggil **static files** atau file statis. Statis file ini adalah semua hal yang berhubungan dengan CSS dan gambar. Kontennya tidak tergantung pada konteks permintaan, tetapi berlaku sama untuk semua pengguna.

### Dimana menyimpan static files untuk Django

Django sudah tahu di mana menemukan file statis untuk aplikasi "admin" bawaan. Sekarang kita hanya perlu menambahkan beberapa file statis untuk aplikasi kita sendiri, di dalam direktori `blog`.

Lakukan dengan cara membuat folder bernama `static` di dalam direktori blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django secara otomatis akan menemukan folder yang disebut "static" di dalam folder aplikasi Anda. Dan kemudian file ini bisa digunakan isinya sebagai file statis.

## File CSS pertamamu!

Sekarang, mari kita buat file CSS, untuk mempercantik halaman web Anda. Buat sebuah folder bernama `css` di dalam folder `static`. Kemudian buat sebuah file bernama `blog.css` di dalam folder `css`. Siap?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Saatnya menulis CSS! Buka file `blog/static/css/blog.css` di editor kode Anda.

Kita tidak akan terlalu mendalam mempelajari tentang CSS di sini. Bila ingin belajar lebih mendalam terkait CSS ini Anda bisa kunjungi [halaman ini](https://www.w3schools.com/css/).

Tapi kita akan sedikit modifikasi. Mungkin kita akan mengubah warna *headers* kita. Untuk mengetahui warna, komputer menggunakan kode unik. Kode ini dimulai dengan ` # </ 0> diikuti oleh 6 huruf (A-F) dan angka (0-9). Misalnya, kode untuk warna biru adalah <code> #0000FF </ 0> . Anda dapat menemukan kode warna untuk berbagai warna di sini: http://www.colorpicker.com/. Kamu juga dapat menggunakan <a href="http://www.w3schools.com/colors/colors_names.asp">warna yang telah ditetapkan</a>, seperti <code>red` dan `green`.

Dalam berkas `blog/static/css/blog.css` kamu mesti menambahkan kode seperti berikut:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` adalah selector dalam CSS. Ini berarti kita akan memberikan gaya pada setiap elemen `a` yang terdapat dalam elemen `h1`; begitu pula dengan selector `h2 a`, melakukan hal yang sama. Jadi ketika kita memiliki sesuatu seperti `<h1><a href="">link</a></h1>`, gaya elemen `h1 a` akanberubah. Dalam kasus ini, kita akan mengubah warnanya menjadi `#C25100`, ini menandakan warna jingga gelap. Atau kamu bisa memilih sendiri warnanya, tapi pastikan warna tersebut berbeda dengan warna putih dari latar!

Dalam file CSS kita menentukan gaya untuk elemen yang berada pada file HTML. Mulanya kita menuliskan elemen dengan nama elemen itu sendiri. Kamu mungkin ingat ini merupakan tag dari HTML. Seperti `a`, `h1`, dan `body` adalah contoh dari nama elemen. Kita juga menuliskan elemen dengan atribut `class` atau atribut `id`. Nama class dan id ini dimaksudkan untuk elemen-elemen yang kita tuliskan. Class dimaksudkan untuk kumpulan elemen, dan id dimaksudkan untuk elemen tertentu. Misalnya, kamu dapat menuliskan ini dengan menggunakan nama tag `a`, class `external_link`, atau id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Kamu bisa baca lebih lanjut tentang [CSS Selectors di w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Kita juga mesti memberti tahu template HTML kita yang telah ditambahkan beberapa CSS. Buka file `blog/templates/blog/post_list.html` di kode editor dan tambahkan baris ini di paling atas dalam file tersebut:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

```html
{% load static %}
```

Kita hanya perlu memuat file statisnya di sini. :) Di antara tag `<head>` dan `</head>`, setelah tautan ke file CSS Bootstrap, tambahkan baris ini:

{% filename%}blog/templates/blog/post_list.html{% endfilename%}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Browser akan membaca file tersebut sesuai urutan, jadi kita perlu memastikan baris tersebut ada di posisi yang tepat. Jika tidak, kode dalam file kita mungkin akan diganti dengan kode dalam file Bootstrap. Kita baru saja menambahakan lokasi file template kita.

Seharusnya isi dalam filenya seperti ini:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

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

OK, simpan file dan segarkan situsnya!

![Gambar 14.2](images/color2.png)

Kerja bagus! Mungkin kita juga akan memberi sedikit ruang pada website kita dan menambahkan margin di sisi luar kiri? Coba ini!

{% filename%} blog / static / css / blog.css {% endfilename%}

```css
body {
     padding-left: 15px;
}
```

Tambahkan ke CSS kamu, simpan dan lihat hasilnya!

![Gambar 14.3](images/margin2.png)

Mungkin kita bisa mengubah huruf di header kita? Tempelkan ini ke file kamu `<head>` di `blog/templates/blog/post_list.html`:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Seperti sebelumnya, periksa urutan dan tempat sebelum ditautkan ke `blog / static / css / blog.css`. Baris ini akan mengimpor huruf yang disebut *Lobster* dari Google Fonts (https://www.google.com/fonts).

Temukan blok ini `h1 a` (kode antara tanda kurung `{` dan `}`) di file CSS `blog/static/css/blog.css`. Sekarang tambahkan baris `font-family: 'Lobster';` di antara kurung kurawal, dan segarkan halamannya:

{% filename%}blog/static/css/blog.css{% endfilename%}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Gambar 14.3](images/font.png)

Bagus!

Seperti disebutkan di atas, CSS memiliki konsep class. Ini memungkinkan kamu memberi atribut ke dalam bagian kode HTML dan mempercantik hanya pada elemen tertentu, sehingga tidak memengaruhi elemen lain. Ini bisa sangat membantu! Mungkin kamu memiliki dua `div` dengan fungsi berbeda (seperti header dan postingan kamu). Sebuah class dapat membantu kamu membuatnya telihat berbeda.

Silakan beri atribut class ke beberapa bagian HTML. Tambahkan sebuah kelas yang disebut `page-header` ke `div` yang berisi header kamu, seperti ini:

{% filename%}blog/templates/blog/post_list.html{% endfilename%}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

```

Dan sekarang tambahkan sebuah kelas `post` ke `div` Anda yang berisi posting blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Kami sekarang akan menambahkan blok deklarasi ke penyeleksi yang berbeda. Pemilih dimulai dengan ` . </ 0> berhubungan dengan kelas. Ada banyak tutorial dan penjelasan bagus tentang CSS di Web yang dapat membantu Anda memahami kode berikut. Untuk saat ini, cukup copy dan paste ke file <code>blog/static/css/blog.css` Anda:

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

Kode HTML yang bertanggung jawab untuk menampilkan posting blog harus diperluas oleh kelas. Ganti kode berikut:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

di `blog/templates/blog/post_list.html` dengan ini:

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

Simpan dan *refresh* (segarkan) halaman Anda.

![Gambar 14.4](images/final.png)

Woo hoo! Terlihat mengagumkan, kan? Lihatlah kode yang baru kita tempel untuk menemukan tempat di mana kita menambahkan kelas dalam HTML dan menggunakannya di CSS. Dimana Anda akan membuat perubahan, jika Anda ingin merubah warna tanggal menjadi turquoise?

Jangan takut untuk bermain-main dengan file CSS dan mencoba mengubah beberapa hal. Bermain dengan CSS dapat membantu Anda memahami hal-hal yang lain. Jangan khawatir jika sesuatu rusak, Anda selalu dapat balik ke masa lalu dengan cara *undo*!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Siap untuk bab berikutnya ?! :)