# Admin Django

Untuk menambahkan, mengedit dan menghapus tulisan yang baru saja kita telusuri, kita akan menggunakan admin Django.

Mari buka berkas `blog/admin.py` dalam editor kode dan ganti isinya dengan ini:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Sebagaimana dapat Anda lihat, kita mengimpor (include) model Post yang telah didefinisikan di bab sebelumnya. Agar model kita tampil pada halaman admin, kita perlu mendaftarkan model tersebut dengan `admin.site.register(Post)`.

Oke, saatnya kita lihat model Post kita. Ingat untuk menjalankan `python manage.py runserver` di konsol untuk menjalankan web server. Buka browser Anda dan ketikkan alamat http://127.0.0.1:8000/admin/. Anda akan melihat halaman login seperti ini:

![Halaman masuk](images/login_page2.png)

Untuk masuk, Anda perlu membuat * superuser </ 0> - akun pengguna yang memiliki kontrol atas segala hal di situs. Go back to the command line, type `python manage.py createsuperuser`, and press enter.</p> 

> Ingat, untuk menulis perintah baru saat server web berjalan, buka jendela terminal baru dan aktifkan virtualenv Anda. Kami meninjau bagaimana menulis perintah baru di ** proyek Django pertama Anda! </ 0> bab, di bagian ** Starting the web server </ 0> .</p> </blockquote> 
> 
> {% filename %}Mac OS X atau Linux:{% endfilename %}
> 
>     (myvenv) ~/djangogirls$ python manage.py createsuperuser
>     
> 
> {% filename %}Windows:{% endfilename %}
> 
>     (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
>     
> 
> Saat diminta, ketik nama akun anda (huruf kecil, tidak ada spasi), alamat email, dan kata sandi. **Jangan khawatir ketika Anda tidak dapat melihat kata sandi yang Anda ketik - begitulah semestinya.** Ketik saja dan tekan `enter` untuk melanjutkan. Keluarannya akan terlihat seperti ini (dimana nama akun dan emailnya seharusnya adalah milik Anda):
> 
>     Nama pengguna: ola
>     Alamat email: ola@example.com
>     Kata sandi:
>     Kata sandi (lagi):
>     Superuser sukses dibuat.
>     
> 
> Kembali ke browser Anda. Masuklah dengan kredensial superuser yang Anda pilih; Anda harus melihat dasbor admin Django.
> 
> ![Admin Django](images/django_admin3.png)
> 
> Pergilah ke Posts dan bereksperimenlah sedikit dengannya. Tambahkan lima atau enam posting blog. Jangan khawatir tentang isi -- ini hanya tampak ke Anda pada komputer lokal Anda - Anda dapat menyalin-tempel sebagian teks dari tutorial ini untuk menghemat waktu. :)
> 
> Pastikan paling tidak ada dua atau tiga postingan (tapi tidak semua) yang memiliki tanggal terbitan. Ini akan sangat membantu nantinya.
> 
> ![Admin Django](images/edit_post3.png)
> 
> Jika Anda ingin tahu lebih banyak tentang admin Django, Anda harus memeriksa dokumentasi Django: https://docs.djangoproject.com/en/2.2/ref/contrib/admin/
> 
> Ini mungkin saja saat yang tepat untuk minum kopi (atau teh) atau sesuatu yang bisa dimakan untuk mengembalikan tenaga anda. Anda menciptakan model Django yang pertama - Anda layak untuk sedikit beristirahat!