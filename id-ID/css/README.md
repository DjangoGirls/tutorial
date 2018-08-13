# CSS - membuatnya cantik!

Blog yang kita buat masih terlihat jelek, kan? Sekarang waktunya untuk mempercantik tampilannya! Kita akan menggunakan CSS untuk itu.

## Apa itu CSS?

Cascading Style Sheets (CSS) adalah bahasa yang digunakan untuk menggambarkan tampilan dan format situs web yang ditulis dalam bahasa markup (seperti HTML). Perlakukan itu sebagai make-up untuk halaman web kita. ;)

Tapi kita tidak ingin memulai dari nol lagi kan? Sekali lagi, kita akan menggunakan sesuatu yang diprogramkan oleh programer di Internet secara gratis. Reinventing the wheel tidak menyenangkan, lho.

## Mari kita gunakan Bootstrap!

Bootstrap adalah salah satu kerangka kerja HTML dan CSS yang paling populer untuk mengembangkan situs web yang indah: https://getbootstrap.com/

Itu ditulis oleh programmer yang bekerja untuk Twitter. Sekarang dikembangkan oleh sukarelawan dari seluruh dunia!

## Memasang Bootstrap

Untuk menginstal Bootstrap, Anda perlu menambahkan ini ke `<head>` di file ` .html </ 1> Anda :</p>

<p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html"><link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
`</pre> 

Ini tidak menambahkan file ke proyek Anda. Ini hanya menunjuk ke file yang ada di Internet. Langsung saja buka situs Anda dan refresh halamannya. Ini dia!

![Gambar 14.1](images/bootstrap1.png)

Melihat lebih baik sudah!

## Static files di Django

Mari kita bahas apa itu **static files**. Static files are all your CSS and images. Konten mereka tidak bergantung pada konteks permintaan dan akan sama untuk setiap pengguna.

### Dimana menyimpan static files untuk Django

Django sudah tahu di mana menemukan file statis untuk aplikasi "admin" bawaan. Sekarang kita hanya perlu menambahkan beberapa file statis untuk aplikasi kita sendiri, ` blog </ 0> .</p>

<p>Kita melakukan itu dengan cara membuat folder bernama <code>static` didalam blog app:

    djangogirls ├── blog │ ├── migrasi │ ├── static │   └── template └── mysite
    

Django secara otomatis akan menemukan folder yang disebut "statis" di dalam folder aplikasi Anda. Maka akan bisa menggunakan isinya sebagai file statis.

## File CSS pertama mu!

Mari buat file CSS sekarang, untuk menambahkan gaya Anda sendiri ke halaman web Anda. Buat sebuah folder bernama `css` di dalam folder `static`. Kemudian buat sebuah file bernama `blog.css` di dalam folder `css`. Siap?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Saatnya menulis CSS! Buka file `blog/static/css/blog.css` kedalam teks editor mu.

Kami tidak akan terlalu mendalam dalam menyesuaikan dan mempelajari tentang CSS di sini. Ada rekomendasi untuk pembelajaran CSS secara gratis di akhir halaman ini jika anda ingin belajar lebih banyak.

Tapi mari kita lakukan setidaknya sedikit. Mungkin kita bisa mengubah warna header kita? Untuk memahami warna, komputer menggunakan kode khusus. Kode ini dimulai dengan ` # </ 0> diikuti oleh 6 huruf (A-F) dan angka (0-9). Misalnya, kode biru adalah <code> # 0000FF </ 0> . Anda dapat menemukan kode warna untuk banyak warna di sini: http://www.colorpicker.com/. Anda juga dapat menggunakan <a href="http://www.w3schools.com/colors/colors_names.asp"> warna yang telah ditetapkan </ 0> , seperti <code> merah </ 1> dan <code> hijau </ 1> .</p>

<p>Dalam berkas <code>blog/static/css/blog.css` kamu harus ditambahkan kode seperti berikut:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
     warna: # FCA205; }
```

`h1 a` adalah selector dalam CSS. Ini berarti kita menerapkan gaya kita ke elemen ` a </ 0> di dalam elemen <code> h1 </ 0> . Jadi ketika kita memiliki sesuatu seperti <code>&lt;h1&gt;&lt;a href=""&gt; link </ 0> , style <code> h1 a </ 1> akan berlaku. Pada contoh kali ini, kita memberitahukan untuk melakukan perubahan warna menjadi <code>#FCA205`, yang dimana warna tersebut adalah Jingga. Tentu saja, kamu bisa menempatkan warna mu sendiri disini!

Dalam berkas CSS kita menentukan styles untuk elemen yang berada pada berkas HTML. Cara pertama kita mengidentifikasi elemen adalah dengan nama elemen. Anda mungkin ingat ini sebagai tag dari bagian HTML. Hal-hal seperti ` a </ 0> , <code> h1 </ 0> , dan <code> body </ 0> adalah contoh nama elemen.
Kami juga mengidentifikasi elemen dengan atribut <code> class </ 0> atau atribut <code> id </ 0> . Class dan id adalah nama-nama elemen yang kamu berikan sendiri. Class-class mendefinisikan kelompok-kelompok elemen, dan id menunjuk pada elemen khusus. Misalnya, Anda dapat mengidentifikasi tag berikut dengan menggunakan nama tag <code> a </ 0> , kelas <code> external_link </ 0> , atau id <code> link_to_wiki_page </ 0> :</p>

<pre><code class="html"><a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
`</pre> 

Anda dapat membaca lebih lanjut tentang  CSS Selectors di w3schools </ 0> .</p> 

Kita juga perlu memberi tahu template HTML kita bahwa kita menambahkan beberapa CSS. Buka file ` blog / templates / blog / post_list.html </ 0> dan tambahkan baris ini di awal saja:</p>

<p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html">{% load static %}
`</pre> 

Kami hanya memuatkan file statis di sini. :) Antara tag `<head>` dan ` </ 2> </ 1> , setelah link ke file CSS Bootstrap, tambahkan baris ini:</p>

<p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html"><link rel="stylesheet" href="{% static 'css/blog.css' %}">
`</pre> 

Browser membaca file sesuai urutan yang mereka berikan, jadi kita perlu memastikan ini ada di tempat yang tepat. Jika tidak, kode di file kami mungkin akan diganti dengan kode di file Bootstrap. Kami hanya memberi tahu template kami dimana file CSS kami berada.

File Anda seharusnya terlihat seperti ini:

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
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

OK, simpan file dan refresh situsnya

![Gambar 14.2](images/color2.png)

Kerja bagus! Mungkin kita juga ingin memberi website kita sedikit udara dan meningkatkan margin di sisi kiri? Ayo coba ini!

{% filename%} blog / static / css / blog.css {% endfilename%}

```css
badan {
     padding-left: 15px; }
```

Tambahkan itu ke CSS Anda, simpan file dan lihat hasilnya!

![Gambar 14.3](images/margin2.png)

Mungkin kita bisa menyesuaikan font di header kita? Tempel ini ke file `<head>` di ` blog / templates / blog / post_list.html </ 1> Anda :</p>

<p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html"><link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
`</pre> 

Seperti sebelumnya, periksa urutan dan tempat sebelum link ke ` blog / static / css / blog.css </ 0> . Baris ini akan mengimpor font yang disebut <em> Lobster </ 1> dari Google Fonts (https://www.google.com/fonts).</p>

<p>Temukan blok deklarasi <code> h1 a </ 0> (kode antara tanda kurung <code> { </ 0> dan <code> } </ 0> ) di file CSS <code> blog / static / css / blog .css </ 0> .  Sekarang tambahkan baris <code> font-family: 'Lobster'; </ 0> di antara kawat gigi, dan segarkan halaman:</p>

<p>{% filename%} blog / static / css / blog.css {% endfilename%}</p>

<pre><code class="css">h1 a {
     warna: # FCA205;
    font-family: 'Lobster'; }
`</pre> 

![Gambar 14.3](images/font.png)

Besar!

Seperti disebutkan di atas, CSS memiliki konsep kelas. Ini memungkinkan Anda memberi nama bagian dari kode HTML dan menerapkan gaya hanya pada bagian ini, tanpa mempengaruhi bagian lain. Ini bisa sangat membantu! Mungkin Anda memiliki dua divs yang melakukan sesuatu yang berbeda (seperti header dan postingan Anda). Sebuah kelas dapat membantu Anda membuat mereka terlihat berbeda.

Silakan dan beri nama beberapa bagian kode HTML. Tambahkan sebuah kelas yang disebut ` header halaman </ 0> ke <code> div </ 0> yang berisi header Anda, seperti ini:</p>

<p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html">&lt;div class="page-header"&gt; 
&lt;h1&gt;&lt;a href="/"&gt; Django Girls Blog </ 1> </ 0>    

`</pre> 

Dan sekarang tambahkan sebuah kelas ` pos </ 0> ke <code> div </ 0> berisi sebuah posting blog.</p>

<p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html">&lt;div class="post"&gt; 
&lt;p&gt; diterbitkan: {{post.published_date}} </ 1> &lt;h1&gt;&lt;a href=""&gt; {{post.title}} </ 2> &lt;p&gt; {{post.text | linebreaksbr}} </ 1> < / 0>    
    
    

`</pre> 

Kami sekarang akan menambahkan blok deklarasi ke penyeleksi yang berbeda. Pemilih dimulai dengan ` . </ 0> berhubungan dengan kelas. Ada banyak tutorial dan penjelasan bagus tentang CSS di Web yang dapat membantu Anda memahami kode berikut. Untuk saat ini, cukup copy dan paste ke file <code> blog / static / css / blog.css </ 0> Anda :</p>

<p>{% filename%} blog / static / css / blog.css {% endfilename%}</p>

<pre><code class="css">.page-header {
     background-color: # ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px; } .page-header h1, .page-header h1 a, .page-header h1 a: visited, .page-header h1 a: active {
     color: #ffffff;
    ukuran huruf: 36pt;
    hiasan teks: tidak ada; } .content {
     margin-left: 40px; } h1, h2, h3, h4 {
     font-family: 'Lobster', kursif; } .date {
     color: # 828282; } .ave {
     float: benar; } .post-form textarea, .post-form input {
     width: 100%; } .top-menu, .top-menu: hover, .top-menu: visited {
     color: #ffffff;
    float: benar;
    ukuran huruf: 26pt;
    margin-right: 20px; } .post {
     margin-bottom: 70px; } .post h1 a, .post h1 a: visited {
    warna: # 000000; }
`</pre> 

Kemudian hubungilah kode HTML yang menampilkan tulisan dengan deklarasi kelas. Ganti ini:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

di ` blog / templates / blog / post_list.html </ 0> dengan ini:</p>

<p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html"><div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
`</pre> 

Simpan file tersebut dan segarkan situs Anda.

![Gambar 14.4](images/final.png)

Woo hoo! Terlihat mengagumkan, kan? Lihatlah kode yang baru kita tempel untuk menemukan tempat di mana kita menambahkan kelas dalam HTML dan menggunakannya di CSS. Di mana Anda akan membuat perubahan jika Anda ingin tanggal menjadi turquoise?

Jangan takut untuk bermain-main dengan CSS ini sedikit dan mencoba untuk mengubah beberapa hal. Bermain dengan CSS dapat membantu Anda memahami hal-hal yang berbeda. Jika Anda memecahkan sesuatu, jangan khawatir - Anda selalu bisa membatalkannya!

Kami sangat merekomendasikan untuk mengambil online gratis ini  Codeacademy HTML & amp; Kursus CSS </ 0> . Ini dapat membantu Anda mempelajari semua tentang membuat situs web Anda lebih cantik dengan CSS.</p> 

Siap untuk bab berikutnya ?! :)