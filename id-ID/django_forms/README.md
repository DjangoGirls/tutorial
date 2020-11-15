# Form Django

Hal penting terakhir yang akan kita lakukan adalah bagaimana membuat agar user dapat menambah dan mengedit post blog dengan mudah. `Admin` django sudah bagus, tapi sedikit sulit untuk meng-customize dan membuatnya lebih cantik. Dengan ` bentuk </ 0> kita akan memiliki kekuatan mutlak atas antarmuka kita - kita dapat melakukan hampir semua hal yang dapat kita bayangkan!</p>

<p>Bagusnya form django adalah bahwa kita dapat mendefinisikannya dengan mudah atau dengan membuat sebuah <code>ModelForm` yang akan memberikan keluaran form tersebut ke dalam model terkait.

Ini benar-benar merupakan hal yang kita ingin lakukan. Kita akan membuat sebuah form yang kita tujukan untuk model `Post` kita.

Sama seperti tiap bagian penting dari Django, form memiliki file sendiri, yaitu forms.py.

Kita perlu membuat sebuah file dengan nama tersebut di dalam directory `blog`.

    blog
       └── forms.py
    

OK, let's open it in the code editor and type the following code:

{% filename%} blog / forms.py {% endfilename%}

```python
dari bentuk impor Django dari .Models import Post class PostForm (forms.ModelForm):

     class Meta:
         model = Post
         fields = ('title', 'text',)
```

We need to import Django forms first (`from django import forms`) and our `Post` model (`from .models import Post`).

`PostForm`, sebagaimana yang barangkali anda duga, adalah nama form kita. Kita perlu memberi tahu Django bahwa bentuk ini adalah ` ModelForm </ 0> (jadi Django akan melakukan sihir untuk kita) - <code> forms.ModelForm </ 0> bertanggung jawab untuk itu.</p>

<p>Selanjutnya, kita memiliki <code>class Meta` dimana kita memberitahu django model yang mana yang harus digunakan untuk menciptakan form ini (`model=post`).

Akhirnya, kita dapat menyatakan field-field mana yang akan muncul di dalam form kita. Dalam skenario ini kita hanya ingin ` title </ 0> dan <code> text </ 0> yang akan terbuka - <code> author </ 0> harus menjadi orang yang saat ini masuk (Anda!) Dan < 0> create_date </ 0> harus disetel secara otomatis saat kita membuat sebuah posting (yaitu dalam kode), bukan?</p>

<p>Begitulah caranya! Yang kita perlu lakukan sekarang adalah menggunakan <em>view</em> dan menampilkannya di dalam sebuah template.</p>

<p>Jadi sekali lagi kita akan membuat link ke halaman, URL, tampilan dan template.</p>

<h2>Mengarahkan link menuju sebuah halaman dengan Form</h2>

<p>It's time to open <code>blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename%} blog / templates / blog / base.html {% endfilename%}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"> </ 0>
```

Perhatikan bahwa kami ingin memanggil tampilan baru kami ` post_new </ 0> . Kelas <code> "glyphicon glyphicon-plus" </ 0> disediakan oleh tema bootstrap yang kami gunakan, dan akan menampilkan tanda tambah bagi kami.</p>

<p>Setelah menambahkan baris, file HTML Anda sekarang harus terlihat seperti ini:</p>

<p>{% filename%} blog / templates / blog / base.html {% endfilename%}</p>

<pre><code class="html">{% load static %}
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
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
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
</html>
`</pre> 

After saving and refreshing the page http://127.0.0.1:8000 you will see a familiar `NoReverseMatch` error. Is that the case? Good!

## URL

We open `blog/urls.py` in the code editor and add a line:

{% filename%} blog / urls.py {% endfilename%}

```python
path('post/new/', views.post_new, name='post_new'),
```

Dan kode terakhir akan tampak seperti ini:

{% filename%} blog / urls.py {% endfilename%}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

Setelah menyegarkan situs, kita melihat ` AttributeError </ 0> , karena kita tidak memiliki tampilan <code> post_new </ 0> yang diterapkan. Mari kita tambahkan sekarang juga.</p>

<h2>view post_view</h2>

<p>Time to open the <code>blog/views.py` file in the code editor and add the following lines with the rest of the `from` rows:

{% filename%} blog / views.py {% endfilename%}

```python
dari .forms import PostForm
```

Dan kemudian * tampilan </ 0> kami :</p> 

{% filename%} blog / views.py {% endfilename%}

```python
def post_new (request):
     form = PostForm ()
     mengembalikan render (request, 'blog / post_edit.html', {'form': form} )
```

Untuk membuat sebuah form `post` baru, kita perlu memanggil `PostForm` dan mengirimkannya ke dalam template tersebut. Kita akan kembali ke tampilan * ini </ 0> , tapi untuk saat ini, mari kita buat template untuk formulir dengan cepat.</p> 

## Template

We need to create a file `post_edit.html` in the `blog/templates/blog` directory, and open it in the code editor. To make a form work we need several things:

* We have to display the form. We can do that with (for example) {% raw %}`{{ form.as_p }}`{% endraw %}.
* Baris di atas tersebut perlu diletakkan di dalam tag form HTML: `<form method="POST">...</form>`.
* Kita perlu sebuah tombol `Save`. Kita lakukan hal itu dengan sebuah tombol HTML: `<button type="submit">Save</button>`.
* Dan akhirnya, tepat setelah tag pembuka `<form ...>` kita perlu menambahkan {% raw%} ` {% csrf_token%} </ 1> {% endraw%} . Ini sangat penting, karena akan menjadikan form anda aman! Jika Anda lupa sedikit ini, Django akan mengeluh saat Anda mencoba menyimpan formulir:</li>
</ul>

<p><img src="images/csrf2.png" alt="Halaman terlarang CSFR" /></p>

<p>Baiklah, jadi mari kita lihat bagaimana HTML di <code> post_edit.html </ 0> akan terlihat:</p>

<p>{% filename%} blog / templates / blog / post_edit.html {% endfilename%}</p>

<pre><code class="html">{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
`</pre> 
    Saatnya merefresh web kita! Wow...! Form anda tampil!
    
    ![Form Baru](images/new_form2.png)
    
    Tapi tunggu sebentar! Saat Anda mengetikkan sesuatu di bidang ` title </ 0> dan <code> text </ 0> dan coba simpan, apa yang akan terjadi?</p>

<p>Tidak ada! Kami sekali lagi ada di halaman yang sama dan teks kami hilang ... dan tidak ada tulisan baru yang ditambahkan. Jadi apa yang salah?</p>

<p>Jawabnya: tidak ada yang salah. Kita hanya perlu bekerja sedikit lagi pada <em>view kita</em>.</p>

<h2>Menyimpan Form</h2>

<p>Open <code>blog/views.py` once again in the code editor. Currently all we have in the `post_new` view is the following:
    
    {% filename%} blog / views.py {% endfilename%}
    
    ```python
    def post_new (request):
         form = PostForm ()
         mengembalikan render (request, 'blog / post_edit.html', {'form': form} )
    ```
    
    Saat kita mengirimkan formulir, kita dibawa kembali ke tampilan yang sama, tapi kali ini kita memiliki beberapa data lagi di ` request </ 0> , lebih khusus lagi pada permintaan <code> .POST </ 0> (penamaannya telah tidak ada hubungannya dengan blog "post", ada kaitannya dengan fakta bahwa kita "memposting" data). Ingat bagaimana dalam file HTML, definisi <code><form>` kami memiliki variabel ` method = "POST" </ 1> ? Semua field dari from tersebut kini dalam <code>request.POST`. Anda tidak boleh merename `POST` apapun namanya (satu-satunya nilai valed dari `method` adalah `GET`, akan tetapi kami tidak punya cukup waktu untuk menjelaskan perbedaannya).
    
    Jadi dalam kami * pandangan </ 0> kita memiliki dua situasi yang terpisah untuk menangani: pertama, ketika kita mengakses halaman untuk pertama kalinya dan kami ingin formulir kosong, dan kedua, ketika kita kembali ke * tampilan </ 0> dengan semua data formulir yang baru saja kita ketik. Sehingga kita perlu menambahkan sebuah kondisi (akan kita gunakan `if` untuk keperluan tersebut):</p> 
    
    {% filename%} blog / views.py {% endfilename%}
    
    ```python
    jika request.method == "POST":
     [...] 
    else:
     form = PostForm ()        
    ```
    
    Saatnya untuk mengisi titik-titik ` [...] </ 0> . Jika <code> method </ 0> adalah <code> POST </ 0> maka kita ingin membuat <code> PostForm </ 0> dengan data dari form, kan? Kami akan melakukannya sebagai berikut:</p>

<p>{% filename%} blog / views.py {% endfilename%}</p>

<pre><code class="python">form = PostForm (request.POST)
`</pre> 
    
    The next thing is to check if the form is correct (all required fields are set and no incorrect values have been submitted). We do that with `form.is_valid()`.
    
    Kita cek apakah form tersebut valid dan jika ya, kita dapat menyimpannya!
    
    {% filename%} blog / views.py {% endfilename%}
    
    ```python
    jika form.is_valid ():
         post = form.save (komit = salah)
         post.author = request.user
         post.published_date = timezone.now ()
         post.save () post.save ()
    ```
    
    Pada dasarnya, kita memiliki dua hal di sini: kita simpan form dengan ` form.save </ 0> dan kita tambahkan seorang penulis (karena tidak ada bidang <code> author </ 0> di <code> PostForm </ 0> dan bidang ini diperlukan). <code> commit = Salah </ 0> berarti kita tidak ingin menyimpan model <code> Post </ 0> - kita ingin menambahkan penulis terlebih dahulu. Sebagian besar waktu Anda akan menggunakan <code> form.save () </ 0> tanpa <code> commit = False </ 0> , namun dalam kasus ini, kita perlu menyediakannya. <code> post.save () </ 0> akan menyimpan perubahan (menambahkan penulis) dan sebuah posting blog baru dibuat!</p>

<p>Akhirnya, akan sangat mengagumkan jika kita bisa langsung masuk ke halaman <code> post_detail </ 0> untuk posting blog kita yang baru dibuat, bukan? Untuk melakukan itu kita memerlukan satu impor lagi:</p>

<p>{% filename%} blog / views.py {% endfilename%}</p>

<pre><code class="python">dari django.shortcuts import redirect
`</pre> 
    
    Tambahkan di awal file Anda. Dan sekarang kita bisa mengatakan, "pergi ke halaman ` post_detail </ 0> untuk posting yang baru dibuat":</p>

<p>{% filename%} blog / views.py {% endfilename%}</p>

<pre><code class="python">pengalihan kembali ('post_detail', pk = post.pk)
`</pre> 
    
    ` post_detail </ 0> adalah nama tampilan yang ingin kita tuju. Ingat bahwa <em>view</em> ini memerlukan sebuah variabel <code>pk`? Untuk menyebarkannya ke tampilan, kita menggunakan ` pk = post.pk </ 0> , di mana <code> post </ 0> adalah postingan blog yang baru dibuat!</p>

<p>Baiklah, kita sudah banyak bicara, tapi kita mungkin ingin melihat seperti apa tampilan <em> lihat </ 0> sekarang juga kan?</p>

<p>{% filename%} blog / views.py {% endfilename%}</p>

<pre><code class="python">def post_new (request):
     if request.method == "POST":
         form = PostForm (request.POST)
         jika form.is_valid ():
             post = form.save (commit = false)
             post.author = request.user
             post.             publish_date = timezone.now ()
 post.save ()
             pengalihan kembali ('post_detail', pk = post.pk)
     else:
         form = PostForm ()
     mengembalikan render (permintaan, 'blog / post_edit.html', {'form': bentuk} )
`</pre> 
    
    Mari lihat, apakah dapat berjalan. Pergi ke halaman http://127.0.0.1:8000/post/new/, tambahkan ` judul </ 0> dan <code> teks </ 0> , simpan ... dan voila! Posting blog baru ditambahkan dan kami diarahkan ke halaman <code> post_detail </ 0> !</p>

<p>Anda mungkin telah memperhatikan bahwa kami menetapkan tanggal publikasi sebelum menyimpan pos. Nantinya, kami akan mengenalkan <em> tombol publish </ 0> di <strong> Django Girls Tutorial: Extensions </ 1> .</p>

<p>Sejauh ini bagus !</p>

<blockquote>
  <p>Karena kita baru saja menggunakan antarmuka admin Django, sistem saat ini berpikir kita masih login. Ada beberapa situasi yang bisa menyebabkan kita keluar (menutup browser, memulai ulang DB, dll.). Jika, ketika membuat sebuah posting, Anda menemukan bahwa Anda mendapatkan kesalahan yang mengacu pada kurangnya pengguna yang masuk, masuk ke halaman admin http://127.0.0.1:8000/admin dan masuk lagi. Ini sementara akan menyelesaikan permasalahan. Ada penyelesain permanen yang menanti anda pada bab <strong>Homework: add security to your website!</strong> setelah tutorial utama.</p>
</blockquote>

<p><img src="images/post_create_error.png" alt="Login Error" /></p>

<h2>Validasi Form</h2>

<p>Sekarang, akan kami perlihatkan betapa hebatnya form django itu. Sebuah post blog perlu memiliki field <code>title` dan `text`. Pada model ` Post </ 0> kami tidak mengatakan bahwa bidang ini (berlawanan dengan <code> published_date </ 0> ) tidak diperlukan, jadi Django, secara default, mengharapkannya disetel.</p>

<p>Cobalah untuk menyimpan formulir tanpa <code> judul </ 0> dan <code> teks </ 0> . Coba tebak apa yang akan terjadi!</p>

<p><img src="images/form_validation2.png" alt="Validasi Form" /></p>

<p>Django berusaha untuk memvalidasi bahwa semua bidang dalam formulir kami benar. Bukankah itu mengagumkan?</p>

<h2>Form Edit</h2>

<p>Now we know how to add a new post. Tetapi, bagaimana jika kita ingin mengedit yang sudah ada ? Ini sangat mirip dengan apa yang baru saja kita lakukan. Mari buat beberapa hal penting dengan cepat. (Jika Anda tidak mengerti sesuatu, Anda harus bertanya kepada pelatih Anda atau melihat bab-bab sebelumnya, karena kami telah menyelesaikan semua langkah ini.)</p>

<p>Open <code>blog/templates/blog/post_detail.html` in the code editor and add the line
    
    {% filename%} blog / templates / blog / post_detail.html {% endfilename%}
    
    ```html
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"> </ 0>
    ```
    
    sehingga template akan terlihat seperti ini:
    
    {% filename%} blog / templates / blog / post_detail.html {% endfilename%}
    
    ```html
    {% extends 'blog/base.html' %}
    
    {% block content %}
        <div class="post">
            {% if post.published_date %}
                <div class="date">
                    {{ post.published_date }}
                </div>
            {% endif %}
            <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
            <h2>{{ post.title }}</h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endblock %}
    ```
    
    Open `blog/urls.py` in the code editor, and add this line:
    
    {% filename%} blog / urls.py {% endfilename%}
    
    ```python
        path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
    ```
    
    Kita akan menggunakan kembali template `blog/templates/blog/post_edit.html`, sehingga sesuatu yang belum adalah sebuah *view*.
    
    Let's open `blog/views.py` in the code editor and add this at the very end of the file:
    
    {% filename%} blog / views.py {% endfilename%}
    
    ```python
    def post_edit (request, pk):
         post = get_object_or_404 (Post, pk = pk)
         jika request.method == "POST":
             form = PostForm (request.POST, instance = post)
             if form.is_valid ():
                 post = form .save (commit = False)
                 post.author = request.user
                 post.published_date = timezone.now ()
                 post.save ()
                 pengalihan kembali ('post_detail', pk = post.pk)
         else:
             form = PostForm (instance = post )
         mengembalikan render (permintaan, 'blog / post_edit.html', {'form': form} )
    ```
    
    Ini tampak hampir sama persis dengan view `post_new` kita, benar ? Tetapi tidak seluruhnya sama persis. For one, we pass an extra `pk` parameter from `urls`. Selanjutnya, kita mendapatkan ` Post </ 0> model yang ingin kita edit dengan <code> get_object_or_404 (Post, pk = pk) </ 0> dan kemudian, ketika kita membuat sebuah form, kita melewati postingan ini sebagai < 0> contoh </ 0> , saat kita menyimpan form ...</p>

<p>{% filename%} blog / views.py {% endfilename%}</p>

<pre><code class="python">form = PostForm (request.POST, instance = post)
`</pre> 
    
    ... dan saat kami baru saja membuka formulir dengan tulisan ini untuk diedit:
    
    {% filename%} blog / views.py {% endfilename%}
    
    ```python
    form = PostForm (contoh = post)
    ```
    
    Baiklah, mari kita uji jika berhasil! Ayo pergi ke halaman ` post_detail </ 0> . Harus ada tombol edit di pojok kanan atas:</p>

<p><img src="images/edit_button2.png" alt="Tombol Edit" /></p>

<p>Ketika anda mengkliknya, anda aka melihat form tersebut berisi post blog kita:</p>

<p><img src="images/edit_form2.png" alt="Form Edit" /></p>

<p>Jangan ragu untuk mengganti judul atau teks dan simpan perubahannya!</p>

<p>Selamat! Aplikasi anda makin lama makin lengkap!</p>

<p>If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/</p>

<h2>Keamanan</h2>

<p>Being able to create new posts by clicking a link is awesome! Tapi sekarang, siapa pun yang mengunjungi situs Anda akan dapat membuat posting blog baru, dan itu mungkin bukan sesuatu yang Anda inginkan. Mari kita membuatnya jadi tombol muncul untuk Anda tapi tidak untuk orang lain.</p>

<p>Open <code>blog/templates/blog/base.html` in the code editor, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:
    
    {% filename%} blog / templates / blog / base.html {% endfilename%}
    
    ```html
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"> </ 0>
    ```
    
    Kami akan menambahkan tag ` {% jika%} </ 0> ke ini, yang akan membuat tautan hanya muncul untuk pengguna yang masuk ke admin. Sekarang, itu hanya kamu! Ubah tag 0><a>` agar menjadi ini:
    
    {% filename%} blog / templates / blog / base.html {% endfilename%}
    
    ```html
    {% if user.is_authenticated %}
        <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
    {% endif %}
    ```
    
    Ini ` {% jika%} </ 0> akan menyebabkan tautan dikirim ke browser hanya jika pengguna yang meminta halaman masuk. Ini tidak melindungi adanya penulisan post baru seluruhnya, tapi cukup bagus untuk langkah awal. Kita akan mempelajari masalah keamanan lebih jauh pada pelajaran tentang extension.</p>

<p>Ingat ikon edit yang baru saja kita tambahkan ke halaman detail kita? Kami juga ingin menambahkan perubahan yang sama di sana, sehingga orang lain tidak dapat mengedit posting yang ada.</p>

<p>Open <code>blog/templates/blog/post_detail.html` in the code editor and find this line:
    
    {% filename%} blog / templates / blog / post_detail.html {% endfilename%}
    
    ```html
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"> </ 0>
    ```
    
    Ubah ke ini:
    
    {% filename%} blog / templates / blog / post_detail.html {% endfilename%}
    
    ```html
    {% jika user.is_authenticated%} 
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"> </ 0> {% endif%}     
    
    ```
    
    Karena Anda mungkin masuk, jika Anda menyegarkan halaman, Anda tidak akan melihat sesuatu yang berbeda. Muatkan halaman di browser lain atau jendela penyamaran (disebut "InPrivate" di Windows Edge), meskipun, dan Anda akan melihat bahwa tautan tidak muncul, dan ikonnya juga tidak ditampilkan!
    
    ## Satu hal lagi: saatnya melakukan deploy!
    
    Mari kita lihat apakah itu semua dapat berjalan di PythonAnywhere. Saatnya melakukan deploy lagi!
    
    * First, commit your new code, and push it up to GitHub:
    
    {% filename%} baris perintah {% endfilename%}
    
        $ git status
        $ git add .
        $ git status
        $ git commit -m "Added views to create/edit blog post inside the site."
        $ git push
        
    
    * Kemudian dalam konsol Bash [PythonAnywhere](https://www.pythonanywhere.com/consoles/):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    
        $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
        $ git pull
        [...]
        
    
    (Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)
    
    * Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.
    
    And that should be it! Congrats :)