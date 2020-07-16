# Template Daftar Data Dinamis

Kami memiliki beberapa bagian yang berbeda: model ` Post ` didefinisikan pada ` models.py `, kami memiliki ` post_list ` di ` views.py ` dan template ditambahkan. Tapi bagaimana kita benar-benar membuat posting Anda muncul di template HTML Anda? Karena itulah yang ingin kita lakukan - ambil beberapa konten (model yang tersimpan di database) dan tampilkan dengan baik di template kita kan?

Inilah yang seharusnya dilihat * dilihat *: hubungkan model dan template. Pada ` post_list ` * tampilan * kita perlu mengambil model yang ingin kita tampilkan dan menyebarkannya ke template. Pada tampilan * * kita menentukan apa (model) yang akan ditampilkan di template.

Baiklah, jadi bagaimana kita bisa mencapai ini?

We need to open our `blog/views.py` in our code editor. So far `post_list` *view* looks like this:

{% filename %}blog/static/css/views.py{% endfilename %}

```python
dari django.shortcuts import render

def post_list (permintaan):
     mengembalikan render (permintaan, 'blog / post_list.html', {})
```

Ingat ketika kita berbicara tentang termasuk kode yang ditulis dalam file yang berbeda?   Konteks | Permintaan Konteks? Sekarang adalah saat ketika kita harus menyertakan model yang telah kita tulis di ` models.py `.   Konteks | Permintaan Konteks. Kami akan menambahkan baris ` dari .Models import Post ` seperti ini:

{% filename %}blog/static/css/views.py{% endfilename %}

```python
pythonfrom django.shortcuts import admin
from .models import P
```

Titik sebelum ` model ` berarti * direktori saat ini * atau * aplikasi saat ini *. Kedua ` views.py ` dan ` models.py ` ada di direktori yang sama. Ini berarti kita bisa menggunakan `. ` dan nama file (tanpa `.py `). Kemudian kita mengimpor nama modelnya (` Post `).

Tapi apa selanjutnya? Untuk mengambil postingan blog yang sebenarnya dari model ` Post ` kita memerlukan sesuatu yang disebut ` QuerySet `.

## QuerySet

Anda seharusnya sudah terbiasa dengan bagaimana QuerySets bekerja. Kami membicarakannya di [ bagian Django ORM (Query Sets) ](../django_orm/README.md).

Jadi sekarang kita ingin posting blog yang dipublikasikan diurutkan menurut ` published_date `, kan? Kami sudah melakukannya di bab QuerySets!

{% filename %}blog/static/css/views.py{% endfilename %}

```python
& gt; & gt; & gt; Post.objects.filter (published_date__lte = timezone.now ()) order_by ('published_date')
```

So, let's open the `blog/views.py` file in the code editor, and add this piece of code to the function `def post_list(request)` -- but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/static/css/views.py{% endfilename %}

```python
dari django.shortcuts import render
dari zona waktu impor django.utils
dari .Model impor Post

def post_list(permintaan):
     posting = Post.objects.filter (published_date__lte = timezone.now ()) order_by ('published_date')
     mengembalikan render (permintaan, 'blog / post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Perlu diketahui bahwa kami membuat variabel * * untuk QuerySet kami: ` posts `. Perlakukan ini sebagai nama QuerySet kami. Mulai sekarang kita bisa merujuknya dengan nama ini.

Pada fungsi ` render ` kita memiliki satu parameter ` request ` (semua yang kita terima dari pengguna melalui Internet) dan yang lain memberi file template (` 'blog / post_list.html '`). Parameter terakhir, ` {} `, adalah tempat di mana kita dapat menambahkan beberapa hal untuk template yang akan digunakan. Kita perlu memberi mereka nama (kita akan tetap berpegang pada ` 'posts' ` sekarang). :) Seharusnya terlihat seperti ini: ` {'posts': posts} `. Harap dicatat bahwa bagian sebelum `: ` adalah string; Anda perlu membungkusnya dengan tanda petik: ` '' `.

Jadi akhirnya file `blog/views.py` kita akan terlihat seperti ini:

{% filename %}blog/views.py{% endfilename %}

```python
dari django.shortcuts import render
dari zona waktu impor django.utils
dari .Model impor Post

def post_list (permintaan):
     posting = Post.objects.filter (published_date__lte = timezone.now ()) order_by ('published_date')
     mengembalikan render (permintaan, 'blog / post_list.html', {'posts': posts})
```

Itu dia! Waktunya kembali ke template kita dan menampilkan QuerySet ini!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/