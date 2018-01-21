# URL Django

Kami akan membuat laman web pertama kami: beranda untuk blog Anda! Tapi pertama, mari pelajari sedikit tentang URL Django.

## Apa itu URL?

URL hanyalah sebuah alamat web. Anda dapat melihat URL setiap kali mengunjungi situs web - ini terlihat di bilah alamat browser Anda. (Iya nih! `127.0.0.1:8000` is a URL! And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

Setiap halaman di Internet membutuhkan URLnya sendiri. Dengan cara ini aplikasi Anda tahu apa yang harus ditunjukkan kepada pengguna yang membuka URL itu. Di Django kita menggunakan sesuatu yang disebut `URLconf` (URL configuration). URLconf adalah seperangkat pola yang akan dicoba Django untuk mencocokkan dengan URL yang diminta untuk menemukan tampilan yang benar.

## Bagaimana cara kerja URL di Django?

Mari buka berkas ` mysite / urls.py ` di editor kode pilihan Anda dan lihat seperti apa:

{% filename %}mysite/urls.py{% endfilename %}

```python
"" "Konfigurasi URL mysite

[...]
"" "
dari django.conf.urls url impor
dari django.contrib import admin

urlpatterns = [
     url (r '^ admin /', admin.site.urls),
]
```

Seperti yang Anda lihat, Django telah meletakkan sesuatu di sini untuk kita.

Baris antara tanda kutip tiga kali (` '' '</ 0> atau <code> "" "</ 0>) disebut docstrings - Anda dapat menuliskannya di bagian atas file, kelas atau metode untuk menjelaskan apa yang dilakukannya. Mereka tidak akan dijalankan oleh Python.</p>

<p>URL admin, yang Anda kunjungi di bab sebelumnya, sudah ada di sini:</p>

<p>{% filename%} mysite / urls.py {% endfilename%}</p>

<pre><code class="python">    url(r'^admin/', admin.site.urls),
`</pre> 

Baris ini berarti bahwa untuk setiap URL yang dimulai dengan ` admin / </ 0>, Django akan menemukan tampilan <em> yang sesuai </ 1>. Dalam hal ini kami menyertakan banyak URL admin sehingga tidak semua dikemas ke dalam file kecil ini - ini lebih mudah dibaca dan bersih.</p>

<h2>Regex</h2>

<p>Apakah Anda bertanya-tanya bagaimana Django mencocokkan URL dengan tampilan? Nah, bagian ini memang rumit. Django menggunakan <code> regex </ 0>, singkatan dari "regular expressions". Regex memiliki banyak (banyak!) Aturan yang membentuk pola pencarian. Karena regex adalah topik lanjutan, kami tidak akan membahas secara terperinci bagaimana mereka bekerja.</p>

<p>Jika Anda masih ingin memahami bagaimana kami menciptakan pola, berikut adalah contoh prosesnya - kami hanya memerlukan subset terbatas peraturan untuk mengungkapkan pola yang kami cari, yaitu:</p>

<ul>
<li><code>^` untuk awal teks</li> 

* `$`untuk akhir teks
* `\d` untuk satu digit
* `+` untuk menunjukkan bahwa item sebelumnya harus diulang setidaknya satu kali
* `()` untuk menangkap sebagian dari pola</ul> 

Ada lagi definisi URL yang akan diambil secara harfiah.

Sekarang bayangkan Anda memiliki situs web dengan alamat seperti `http://www.mysite.com/post/12345/`, where `12345` adalah jumlah posting Anda.

Menulis pandangan terpisah untuk semua nomor posting akan sangat menyebalkan. Dengan ekspresi reguler, kami dapat membuat pola yang sesuai dengan URL dan mengekstrak nomor untuk kami: `^post/(\d+)/$`. Mari kita turunkan sepotong demi sepotong untuk melihat apa yang sedang kita lakukan di sini:

* **^post/** memberitahu Django untuk mengambil apapun yang dimilikinya `post/` di awal url (right after `^`)
* **(\d+)** berarti akan ada angka (satu atau lebih digit) dan kami ingin nomor yang diambil dan diekstraksi
* **/** memberitahu Django bahwa karakter `/` yang lain harus diikuti
* **$** kemudian menunjukkan akhir dari URL yang berarti bahwa hanya string yang diakhiri dengan `/` akan cocok dengan pola ini

## URL Django pertama Anda!

Waktunya membuat URL pertama kami! Kami ingin 'http://127.0.0.1:8000/' menjadi halaman awal blog kami dan untuk menampilkan daftar posting.

Kami juga ingin menyimpan berkas `mysite/urls.py` tetap bersih, jadi kami akan mengimpor URL dari aplikasi `blog`ke`mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Anda ` mysite / urls.py </ 0> File sekarang harus terlihat seperti ini:</p>

<p>{% filename%} mysite / urls.py {% endfilename%}</p>

<pre><code class="python">from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
`</pre> 

Django sekarang akan mengarahkan semua yang masuk ke 'http://127.0.0.1:8000/' ke ` blog.urls </ 0> dan mencari petunjuk lebih lanjut di sana.</p>

<p>Menulis ekspresi reguler dengan Python selalu dilakukan dengan <code> r </ 0> di depan string. Ini adalah petunjuk yang berguna untuk Python bahwa string mungkin berisi karakter khusus yang tidak dimaksudkan untuk Python itu sendiri, namun untuk ekspresi reguler.</p>

<h2>blog.urls</h2>

<p>Buat file kosong baru bernama <code> urls.py </ 0> di direktori <code> blog </ 0> . Baiklah! Tambahkan dua baris pertama ini:</p>

<p>{% filename%} blog / urls.py {% endfilename%}</p>

<pre><code class="python">dari django.conf.urls url impor dari. tampilan impor
`</pre> 

Di sini kita mengimpor fungsi Django ` url </ 0> dan semua <code> views </ 0> dari aplikasi <code> blog </ 0> . (Kami belum memilikinya, tapi kami akan segera melakukannya!)</p>

<p>Setelah itu, kami dapat menambahkan pola URL pertama kami:</p>

<p>{% filename%} blog / urls.py {% endfilename%}</p>

<pre><code class="python">urlpatterns = [
     url (r '^ $', views.post_list, name = 'post_list'),]
`</pre> 

Seperti yang Anda lihat, sekarang kami menetapkan sebuah  view </ 0> yang disebut <code> post_list </ 0> ke <code> ^ $ </ 0> URL. Ekspresi reguler ini akan cocok dengan <code> ^ </ 0> (awal) diikuti oleh <code> $ </ 0> (akhir) - jadi hanya string kosong yang akan cocok. Itu benar, karena di Django URL resolvers, 'http://127.0.0.1:8000/' bukan bagian dari URL. Pola ini akan memberi tahu Django bahwa <code> views.post_list </ 0> adalah tempat yang tepat untuk dikunjungi jika seseorang masuk ke situs Anda di alamat 'http://127.0.0.1:8000/'.</p>

<p>Bagian terakhir, <code> name = 'post_list' </ 0> , adalah nama URL yang akan digunakan untuk mengidentifikasi tampilan. Ini bisa sama dengan nama tampilan tapi bisa juga sama sekali berbeda. Kami akan menggunakan URL yang disebutkan kemudian di proyek, jadi penting untuk memberi nama setiap URL di aplikasi. Kita juga harus berusaha agar nama URL tetap unik dan mudah diingat.</p>

<p>Jika Anda mencoba mengunjungi http://127.0.0.1:8000/ sekarang, Anda akan menemukan pesan 'halaman web tidak tersedia'. Ini karena server (ingat mengetik <code> runserver </ 0> ?) Tidak lagi berjalan. Lihatlah jendela konsol server Anda untuk mencari tahu mengapa.</p>

<p><img src="images/error1.png" alt="Kesalahan" /></p>

<p>Konsol Anda menunjukkan kesalahan, tapi jangan khawatir - itu sebenarnya cukup berguna: Ini memberitahu Anda bahwa ada <strong> tidak ada atribut 'post_list' </ 0> . Itulah nama <em> pandangan </ 0> yang Django sedang mencoba untuk menemukan dan menggunakan, tapi kami belum menciptakannya belum. Pada tahap ini <code> / admin / </ 0> Anda juga tidak akan bekerja. Jangan khawatir - kita akan sampai di sana.</p>

<blockquote>
  <p>Jika Anda ingin tahu lebih banyak tentang Django URLconfs, lihat dokumentasi resmi: https://docs.djangoproject.com/en/1.11/topics/http/urls/</p>
</blockquote>