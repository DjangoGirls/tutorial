# Model Django

Apa yang akan kita buat sekarang adalah sesuatu untuk menyimpan semua postingan pada blog kita. tetapi untuk bisa melakukan hal itu kita akan sedikit membahas tentang `objects`.

## Benda

Ada konsep dalam pemrograman yang disebut ` pemrograman berorientasi obyek </ 0> . Idenya adalah bahwa alih-alih menulis segala sesuatu sebagai urutan instruksi pemrograman yang membosankan, kita dapat memodelkan berbagai hal dan menentukan bagaimana mereka berinteraksi satu sama lain.</p>

<p>Jadi apa itu obyek? Ini adalah kumpulan properti dan tindakan. Kedengarannya aneh, tapi kami akan memberi contoh.</p>

<p>Jika kita ingin model kucing, kita akan membuat objek <code> Cat </ 0> yang memiliki beberapa properti seperti <code> warna </ 0> , <code> usia </ 0> , <code> mood < / 0> (seperti baik, buruk, atau mengantuk;)), dan <code> pemilik </ 0> (yang dapat diberi objek <code> Person </ 0> - atau mungkin, jika ada kucing yang tersesat, properti ini bisa kosong).</p>

<p>Kemudian <code> Cat </ 0> memiliki beberapa tindakan: <code> purr </ 0> , <code> scratch </ 0> , atau <code> feed </ 0> (dalam hal ini, kami akan memberikannya Cat beberapa <code> CatFood </ 0> , yang bisa jadi objek terpisah dengan properti, seperti <code> taste </ 0> ).</p>

<pre><code>Cat -------- usia warna mood owner purr () scratch () feed (cat_food)
`</pre> 

    Makanan Kucing --------
    

Jadi intinya idenya adalah untuk mendeskripsikan hal-hal nyata dalam kode dengan properti (disebut ` object properties </ 0> ) dan tindakan (disebut <code> methods </ 0> ).</p>

<p>Bagaimana kita akan model posting blog itu? Kami ingin membangun blog, bukan?</p>

<p>Kita perlu menjawab pertanyaan: Apa itu posting blog? Properti apa yang seharusnya dimiliki?</p>

<p>Nah, pastinya posting blog kita butuh beberapa teks dengan konten dan judulnya kan? Akan sangat menyenangkan mengetahui siapa yang menulisnya - jadi kita butuh seorang penulis. Akhirnya, kami ingin tahu kapan posting itu dibuat dan dipublikasikan.</p>

<pre><code>Posting -------- judul teks penulis created_date published_date
`</pre> 

Hal apa saja yang bisa dilakukan dengan posting blog? Akan menyenangkan untuk memiliki beberapa ` metode </ 0> yang menerbitkan posting, kan?</p>

<p>Jadi kita perlu <code> mempublikasikan </ 0> method.</p>

<p>Karena kita sudah tahu apa yang ingin kita capai, mari kita mulai pemodelannya di Django!</p>

<h2>Model Django</h2>

<p>Mengetahui apa itu objek, kita bisa membuat model Django untuk posting blog kita.</p>

<p>Model di Django adalah jenis khusus dari objek - itu disimpan dalam <code> Database </ 0> . Database adalah kumpulan data. Ini adalah tempat di mana Anda akan menyimpan informasi tentang pengguna, posting blog Anda, dll. Kami akan menggunakan database SQLite untuk menyimpan data kami. Ini adalah default database Django adaptor - itu akan cukup bagi kita sekarang.</p>

<p>Anda bisa memikirkan model dalam database sebagai spreadsheet dengan kolom (field) dan baris (data).</p>

<h3>Membuat aplikasi</h3>

<p>Agar semuanya tetap rapi, kami akan membuat aplikasi terpisah di dalam proyek kami. Sangat menyenangkan untuk memiliki semua yang terorganisir sejak awal. Untuk membuat aplikasi kita perlu menjalankan perintah berikut di console (dari <code> djangogirls </ 0> directory dimana <code> manage.py </ 0> file is):</p>

<p>{% filename %}Mac OS X and Linux:{% endfilename %}</p>

<pre><code>(myvenv) ~ / djangogirls $ python manage.py startapp blog
`</pre> 

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Anda akan melihat bahwa sebuah petunjuk `blog` baru dibuat dan berisi sejumlah file sekarang. Petunjuk dan file dalam proyek kami akan terlihat seperti ini:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

Setelah membuat sebuah aplikasi, kita juga perlu memberitahukan Django bahwa aplikasi tersebut harus menggunakannya. We do that in the file `mysite/settings.py` -- open it in your code editor. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. Jadi produk akhir akan tampak seperti ini:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### Membuat model posting blog

Pada file `blog/models.py` kami menemukan semua objek yang disebut `Model` - ini merupakan tempat di mana kita akan menemukan posting blog kita.

Let's open `blog/models.py` in the code editor, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Periksa bahwa Anda menggunakan karakter dua garis bawah (`_`) pada setiap sisi `str`. Konvensi ini sering digunakan dengan Python dan terkadang kita juga menyebutnya "dunder" (singkatan dari "double-underscore").

Terlihat menakutkan bukan? Tapi jangan khawatir - kami akan menjelaskan arti garis-garis ini!

Semua baris yang dimulai dengan `dari` atau ` impor ` adalah baris yang menambahkan beberapa bit dari berkass lain. Jadi, alih-alih menyalin dan menempelkan hal yang sama di setiap berkas, kita dapat menyertakan beberapa bagian dengan ` dari ... impor ... ` .

`class Post(models.Model):` – this line defines our model (it is an `object`).

- ` class </ 0> adalah kata kunci khusus yang menunjukkan bahwa kita mendefinisikan suatu objek.</li>
<li><code> Posting </ 0> adalah nama model kami. Kita bisa memberikannya nama yang berbeda (tapi kita harus menghindari karakter dan spasi khusus). Selalu mulai nama kelas dengan huruf besar.</li>
<li><code> models.Model </ 0> berarti bahwa Post adalah Model Django, jadi Django tahu bahwa itu harus disimpan dalam database.</li>
</ul>

<p>Sekarang kita menetapkan properti yang sedang kita bicarakan: <code>title`, `text`, `created_date`, `published_date` and `author`. Untuk melakukan itu, kita harus menetapkan jenis masing-masing bidang (apakah itu teks? Nomor? Tanggal? Sebuah hubungan dengan objek yang lain, seperti Pengguna?)</p> 
    - ` models.CharField </ 0> - begitulah cara Anda mendefinisikan teks dengan jumlah karakter yang terbatas.</li>
<li><code> models.TextField </ 0> - ini untuk teks panjang tanpa batas. Kedengarannya ideal untuk konten posting blog kan?</li>
<li><code> models.DateTimeField </ 0> - ini adalah tanggal dan waktu.</li>
<li><code> models.ForeignKey </ 0> - ini adalah link ke model lain.</li>
</ul>

<p>Kami tidak akan menjelaskan setiap kode bit di sini karena ini akan memakan terlalu banyak waktu. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).</p>

<p>Bagaimana dengan <code>def publish(self):`? Ini merupakan metode `publish` yang kita bicarakan sebelumnya. `def` berarti bahwa ini merupakan sebuah fungsi/metode dan `publish` merupakan nama metode. Anda bisa mengganti nama metode tersebut jika anda mau. The naming rule is that we use lowercase and underscores instead of spaces. Misalnya, metode yang menghitung nilai rata-rata bisa dinamakan ` calculate_average_price`.</p> 
        Methods often `return` something. Ada contoh bahwa dalam `__str__`metode. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.
        
        Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Karena Python sensitif terhadap spasi, kita perlu mengidentifikasi metode kita di dalam kelas. Jika tidak, metode tidak akan termasuk dalam kelas, dan anda bisa mendapatkan beberapa perilaku tak terduga.
        
        Jika ada sesuatu yang masih belum jelas tentang model, jangan ragu untuk bertanya pada pelatih anda! Kami tahu ini rumit, terutama saat anda mempelajari benda dan fungsi apa yang ada pada waktu bersamaan. Tapi mudah-mudahan ini terlihat sedikit kurang ajaib untuk anda sekarang!
        
        ### Buat tabel untuk model di database Anda
        
        Langkah terakhirnya adalah menambahkan model baru ke database kami. Pertama kita harus membuat Django tahu bahwa kita memiliki beberapa perubahan dalam model kita. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. Ini akan terlihat seperti ini:
        
        {% filename %}command-line{% endfilename %}
        
            (myvenv) ~/djangogirls$ python manage.py makemigrations blog
            Migrations for 'blog':
              blog/migrations/0001_initial.py:
            
              - Create model Post
            
        
        **Catatan:** Ingatlah untuk menyimpan berkas yang anda sunting. Jika tidak, komputer anda akan menjalankan versi sebelumnya yang mungkin memberi anda pesan kesalahan yang tidak terduga.
        
        Django menyiapkan berkas migrasi untuk kita yang sekarang harus kita terapkan ke database kita. Mengetik `python manage.py bermigrasi blog` dan hasilnya harus seperti berikut:
        
        {% filename %}command-line{% endfilename %}
        
            (myvenv) ~/djangogirls$ python manage.py migrate blog
            Operations to perform:
              Apply all migrations: blog
            Running migrations:
              Applying blog.0001_initial... OK
            
        
        Hore! Model Post kami sekarang ada di database kami! Alangkah baiknya melihatnya, bukan? Langsung ke bab berikutnya untuk melihat seperti apa Post anda!