# Django ORM dan QuerySets

Pada chapter kali ini, kamu akan belajar bagaimana Django terkoneksi dengan database dan menyimpan data tersebut didalamnya. Mari kita mulai!

## Apa itu QuerySet?

QuerySet pada dasarnya adalah daftar objek dari Model yang diberikan. QuerySets memungkinkan Anda untuk membaca data dari database, memfilter dan memesannya.

Ini paling mudah untuk belajar lewat contoh. Mari kita coba ini, gimana?

## Django shell

Buka konsol lokal kamu (bukan di PythonAnywhere) dan ketik baris perintah ini:

{% filename%} baris perintah {% endfilename%}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Hasilnya akan seperti ini:

{% filename%} baris perintah {% endfilename%}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### Semua benda

Mari kita coba tampilkan semua postingan kita dulu. Kamu bisa melakukan itu dengan perintah seperti ini:

{% filename%} baris perintah {% endfilename%}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ups! Sebuah kesalahan muncul. Ini memberitahu kita bahwa tidak ada Post. Benar - kita lupa mengimpornya dulu!

{% filename%} baris perintah {% endfilename%}

```python
>>> from blog.models import Post
```

We import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename%} baris perintah {% endfilename%}

```python
& gt; & gt; & gt; Post.objects.all ()
 <QuerySet [<Post: my post title> , <Post: another post title> ] & gt;
```

Ini adalah daftar posting yang kami buat tadi! Kami membuat posting ini menggunakan antarmuka admin Django. Tapi sekarang kita ingin membuat posting baru menggunakan Python, jadi bagaimana kita melakukannya?

### Buat objek

Beginilah cara Anda membuat objek Post baru di database:

{% filename%} baris perintah {% endfilename%}

```python
& gt; & gt; & gt; Post.objects.create (author = me, title = 'Contoh judul', teks = 'Uji')
```

Tapi kami punya satu unsur yang hilang di sini: ` saya </ 0> . Kita perlu melewatkan sebuah instance dari model <code> User </ 0> sebagai penulis. Bagaimana kita melakukannya?</p>

<p>Mari impor model Pengguna terlebih dahulu:</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code class="python">& gt; & gt; & gt; dari django.contrib.auth.models import User
`</pre> 

Pengguna apa yang ada di database kami? Coba ini:

{% filename%} baris perintah {% endfilename%}

```python
& gt; & gt; & gt; User.objects.all ()
 <QuerySet [<User: ola> ] & gt;
```

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename%} baris perintah {% endfilename%}

```python
& gt; & gt; & gt; saya = User.objects.get (username = 'ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

Sekarang kita akhirnya bisa membuat tulisan kita:

{% filename%} baris perintah {% endfilename%}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Hore! Ingin memeriksa apakah berhasil?

{% filename%} baris perintah {% endfilename%}

```python
& gt; & gt; & gt; Post.objects.all ()
 <QuerySet [<Post: my post title> , <Post: another post title> , <Post: Sample title> ] & gt;
```

Itu dia, satu lagi posting di daftar!

### Tambahkan lebih banyak pos

Anda sekarang dapat bersenang-senang dan menambahkan lebih banyak pos untuk melihat cara kerjanya. Tambahkan dua atau tiga lagi dan kemudian lanjutkan ke bagian selanjutnya.

### Filter objek

Sebagian besar QuerySets adalah kemampuan untuk memfilternya. Katakanlah kita ingin menemukan semua tulisan yang pengguna ola tulis. Kita akan menggunakan ` filter </ 0> daripada <code> all </ 0> di <code> Post.objects.all () </ 0> . Dalam kurung kita menyatakan kondisi apa yang harus dipatok oleh posting blog agar bisa berakhir dalam queryset kita. Dalam kasus kami, kondisinya adalah bahwa <code> penulis </ 0> harus sama dengan <code> saya </ 0> . Cara untuk menuliskannya di Django adalah <code> author = me </ 0> . Sekarang potongan kode kita terlihat seperti ini:</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code class="python">>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
`</pre> 

Atau mungkin kita ingin melihat semua tulisan yang berisi kata 'title' di bidang ` title </ 0> ?</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code class="python">>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
`</pre> 

> ** Catatan </ 0> Ada dua karakter garis bawah ( ` _ </ 1> ) antara <code> judul </ 1> dan <code> berisi </ 1> . ORM Django menggunakan aturan ini untuk memisahkan nama field ("judul") dan operasi atau filter ("contains"). Jika Anda hanya menggunakan satu garis bawah, Anda akan mendapatkan pesan kesalahan seperti "FieldError: Tidak dapat menyelesaikan judul kata kunci_contains".</p>
</blockquote>

<p>Anda juga bisa mendapatkan daftar semua posting yang dipublikasikan. Kami melakukan ini dengan memfilter semua posting yang telah <code> publish_date </ 0> di sebelumnya:</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code class="python">>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
`</pre> 
> 
> Sayangnya, posting yang kami tambahkan dari konsol Python belum dipublikasikan. Tapi kita bisa mengubah itu! Pertama dapatkan sebuah instance dari sebuah postingan yang ingin kita publikasikan:
> 
> {% filename%} baris perintah {% endfilename%}
> 
> ```python
& gt; & gt; & gt; post = Post.objects.get (judul = "judul contoh")
```

Kemudian publikasikan dengan metode ` publish </ 0> :</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code class="python">& gt; & gt; & gt; post.publish ()
`</pre> 

Sekarang cobalah untuk mendapatkan daftar posting yang dipublikasikan lagi (tekan tombol panah atas tiga kali dan tekan ` enter </ 0> ):</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code class="python">>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
`</pre> 

### Memesan benda

QuerySets juga memungkinkan Anda untuk memesan daftar objek. Mari kita coba untuk memesannya dengan bidang ` create_date </ 0> :</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code class="python">>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
`</pre> 

Kita juga bisa membalik pemesanan dengan menambahkan ` - </ 0> di awal:</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code class="python">>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
`</pre> 

### Chaining QuerySets

Anda juga dapat menggabungkan QuerySets dengan ** chaining </ 0> bersama-sama:</p> 

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Ini benar-benar hebat dan memungkinkan Anda menulis kueri yang cukup rumit.

Keren! Anda sekarang siap untuk bagian selanjutnya! Untuk menutup shell, ketik ini:

{% filename%} baris perintah {% endfilename%}

```python
& gt; & gt; & gt; keluar () $
```