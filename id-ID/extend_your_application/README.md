# Perluas aplikasi Anda

Kami telah menyelesaikan semua langkah berbeda yang diperlukan untuk pembuatan situs web kami: kami tahu cara menulis model, url, tampilan dan template. Kita juga tahu bagaimana membuat website kita cantik.

Waktunya berlatih!

Hal pertama yang kita butuhkan di blog kita adalah, jelas, halaman untuk menampilkan satu posting, bukan?

Kita sudah memiliki model ` Post </ 0> , jadi kita tidak perlu menambahkan apapun ke <code> models.py </ 0> .</p>

<h2>Buat link template ke detail posting</h2>

<p>Kita akan mulai dengan menambahkan link di dalam file <code> blog / template / blog / post_list.html </ 0> . Sejauh ini seharusnya terlihat seperti ini:
 {% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html">{% meluas 'blog/base.html' %}{% block content %} {% for post in posts %} <div class="post"><div class="date">{{ post.published_date }}</div> <h1><a href="">{{ post.title }}</a></h1> <p>{{ post.text|linebreaksbr }}</p></div> {% endfor %}{% endblock %}
`</pre> 

{% raw %}Kami ingin memiliki tautan dari judul posting di daftar pos ke halaman detail post. Mari kita ubah `<h1><a href="">{{ post.title }}</a></h1>` sehingga link ke halaman detail posting:{% endraw %}

{% filename %}blog / template/ blog/post_list.html {% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %} saatnya untuk menjelaskan misterius `{% url 'post_detail' pk =post.pk%}`. Seperti yang Anda duga, notasi ` {% %}` berarti kita menggunakan tag template Django. Kali ini kita akan menggunakan satu yang akan membuat URL untuk Kita!{% endraw %}

Bagian `detail_post` berarti Django akan mengharapkan URL di `blog /urls.py` dengan nama = detail_post

Dan bagaimana dengan `pk=post.pk`? `pk` adalah singkatan dari primary key, yang merupakan nama unik untuk setiap record dalam database. Karena kita tidak menetapkan primary key dalam model `posting` kami, Django menciptakan satu untuk kita (secara default, nomor yang meningkat oleh satu untuk masing-masing rekaman, yaitu 1, 2, 3) dan menambah itu sebagai sebuah bidang yang bernama `pk` masing-masing posting kami. Kita mengakses primary key dengan menulis `post.pk`, dengan cara yang sama kita mengakses bidang lain (`judul`, `penulis`, dll) di objek `posting` kami!

Sekarang ketika kita pergi ke http://127.0.0.1:8000 / kita akan memiliki kesalahan (seperti yang diharapkan, karena kita belum memiliki URL atau *pemandangan* untuk `post_detail`). Ini akan terlihat seperti ini:

![Kesalahan NoReverseMatch](images/no_reverse_match2.png)

## Membuat URL posting detail

Mari kita membuat URL di `urls.py` untuk `post_detail` kita *Lihat*!

Kami ingin posting pertama kami detail untuk ditampilkan di **URL**: http://127.0.0.1:8000/post/1 /

Mari kita membuat URL dalam `blog/urls.py` file untuk Django titik *pemandangan* bernama `post_detail`, yang akan menunjukkan seluruh blog posting. Tambahkan baris `url (r'^ posting / (? P <pk>\d+)/$', views.post_detail, nama = 'post_detail'),` ke `blog/urls.py` file. File Anda seharusnya terlihat seperti ini:

{% filename %}blog/static/css/urls.py{% endfilename %}

```python
dari django.conf.urls impor url dari. Impor dilihat urlpatterns = [url (r'^ $', views.post_list, nama = 'post_list'), url (r'^ posting / (? P <pk>\d+)/$', views.post_detail, nama = 'post_detail'),]
```

Bagian ini `^ posting / (? P <pk>\d+)/$` terlihat menakutkan, tetapi jangan khawatir-kami akan menjelaskan hal itu untuk Anda:

- dimulai dengan `^ ^` lagi-"awal".
- `posting /` hanya berarti bahwa setelah awal, URL harus berisi kata **posting** dan **/**. Sejauh ini baik-baik saja.
- `(?. P <pk>\d+)` – ini rumit. Itu berarti bahwa Django akan mengambil segala sesuatu yang Anda tempat di sini dan transfer ke pemandangan sebagai variabel disebut `pk`. (Catatan bahwa ini sesuai dengan nama yang kami berikan utama kunci variabel kembali di `blog/templates/blog/post_list.html`!) `\d` juga memberitahu kita bahwa itu hanya dapat digit, bukan surat (sehingga semuanya antara 0 hingga 9). `+` berarti bahwa ada kebutuhan untuk satu atau lebih angka tidak. Jadi sesuatu seperti `http://127.0.0.1:8000/post / /` tidak sah, tetapi `http://127.0.0.1:8000/post/1234567890/` ini sangat OK!
- `/`- maka kita perlu **/** lagi.
- `$` – "akhir"!

Itu berarti jika Anda memasukkan ` http://127.0.0.1:8000/post/5/ ` ke browser Anda, Django akan mengerti bahwa Anda mencari *Tampilan* yang disebut `detil_post` dan transfer informasi `pk ` sama dengan `5` ke *tampilan*.

Ok, kami sudah menambahkan pola URL baru ke `blog/url.py`! Mari segarkan halaman: http://127.0.0.1:80000/ Boom! Server berhenti berjalan lagi. Lihat konsol - seperti yang diharapkan, ada lagi kesalahan lain!

![Atribut rusak](images/attribute_error2.png)

Anda ingat apakah langkah selanjutnya? Tentu: Menambah tampilan!

## Add a post's detail view

Kali ini *view* diberikan parameter tambahan, `pk`. *view* kita perlu menangkapnya, bukan? Jadi kita akan mendefinisikan fungsi kita sebagai `def post_detail(request, pk):`. Perhatikan bahwa kita perlu menggunakan nama yang sama persis dengan yang kita tentukan dalam url (`pk`). Menghilangkan variabel ini tidak benar dan akan mengakibatkan kesalahan!

Sekarang, kita ingin mendapatkan satu dan hanya satu posting blog. Untuk melakukan ini, kita bisa menggunakan querysets, seperti ini:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Tapi kode ini bermasalah. Jika tidak ada `Posting`dengan kunci utama` ` (`pk`), kita akan memiliki kesalahan yang sangat jelek!

![Kesalahan DoesNotExist](images/does_not_exist2.png)

Kami tidak menginginkan itu! Tapi, tentu saja, Django hadir dengan sesuatu yang akan menangani hal itu untuk kita: `get_object_or_404`. Jika tidak ada `Posting`dengan`pk` yang diberikan, halaman itu akan menampilkan halaman yang jauh lebih bagus, halaman `Halaman Tidak Ditemukan 404`.

![Halaman tidak ditemukan](images/404_2.png)

Kabar baiknya adalah Anda benar-benar dapat membuat laman `Halaman tidak ditemukan`dan membuatnya sama cantiknya dengan yang Anda inginkan. Tapi itu tidak terlalu penting saat ini, jadi kita akan melewatinya.

OK, saatnya menambahkan *view* untuk kami `views.py` file!

Di `blog/urls.py` kami membuat aturan URL bernama `post_detail` yang mengacu pada tampilan yang disebut `views.post_detail`. Ini berarti bahwa Django akan mengharapkan fungsi tampilan yang disebut `post_detail` di dalam `blog/views.py`.

Kita harus membuka `blog/views.py` dan menambahkan kode berikut di dekat baris `dari` lainnya:

{% filename %}blog/views.py{% endfilename %}

```python
dari django.shortcuts import render, get_object_or_404
```

Dan di akhir file kita akan menambahkan kita *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Yes. It is time to refresh the page: http://127.0.0.1:8000/

![Tampilan daftar pos](images/post_list2.png)

Ini berhasil! Tapi apa jadinya bila anda mengklik link di judul posting blog?

![TemplateDoesNotExist kesalahan](images/template_does_not_exist2.png)

Oh tidak! Kesalahan lain Tapi kita sudah tahu bagaimana mengatasinya, kan? Kita perlu menambahkan template!

## Buat template untuk detail posting

Kami akan membuat file di `blog/template/blog` yang disebut `post_detail.html`.

Ini akan terlihat seperti ini:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Sekali lagi kita memperluas `base.html`. Di blok `konten` kami ingin menampilkan publikasi post_date (jika ada), judul dan teks. Tapi kita harus membahas beberapa hal penting, bukan?

{% raw %}`{% if ... %} ... {% endif %}` adalah tag templat yang dapat kami gunakan saat kami ingin memeriksa sesuatu. (Ingat `jika ... lain ..`dari**Pengenalan bab Python**?) Dalam skenario ini, kami ingin memeriksa apakah `published_date` tidak kosong.{% endraw %}

Oke, kita bisa me-refresh halaman kita dan melihat apakah `TemplateDoesNotExist` hilang sekarang.

![Post detail page](images/post_detail2.png)

Yay! Berhasil!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}baris-perintah{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Kemudian dalam konsol Bash [PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}baris-perintah{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)