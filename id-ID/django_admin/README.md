# Admin Django

Untuk menambahkan, mengedit dan menghapus tulisan yang baru saja kita telusuri, kita akan menggunakan admin Django.

Mari buka file ` blog / admin.py </ 0> dan ganti isinya dengan ini:</p>

<p>{% filename%} blog / admin.py {% endfilename%}</p>

<pre><code class="python">dari admin impor django.contrib dari .Models import Post admin.site.register (Post)
`</pre> 

Sebagaimana dapat anda lihat, kita mengimport (meng Include) model Post yang telah didefinisikan di bab sebelumnya. Agar model kita tampil pada halaman admin, kita perlu mendaftarkan model tersebut dengan `admin.site.register(Post)`.

Oke, saatnya kita lihat model Post kita. Ingat untuk menjalankan `python manage.py runserver` di konsol untuk menjalankan web server. Buka browser Anda dan ketikkan alamat http://127.0.0.1:8000/admin/. Anda akan melihat halaman login seperti ini:

![Halaman masuk](images/login_page2.png)

Untuk masuk, Anda perlu membuat * superuser </ 0> - akun pengguna yang memiliki kontrol atas segala hal di situs. Go back to the command line, type `python manage.py createsuperuser`, and press enter.</p> 

> Ingat, untuk menulis perintah baru saat server web berjalan, buka jendela terminal baru dan aktifkan virtualenv Anda. Kami meninjau bagaimana menulis perintah baru di ** proyek Django pertama Anda! </ 0> bab, di bagian ** Starting the web server </ 0> .</p> </blockquote> 
> 
> {% filename %}Mac OS X or Linux:{% endfilename %}
> 
>     (myvenv) ~/djangogirls$ python manage.py createsuperuser
>     
> 
> {% filename %}Windows:{% endfilename %}
> 
>     (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
>     
> 
> Saat diminta, ketik nama akun anda (huruf kecil, tidak ada spasi), alamat email, dan kata sandi. ** Jangan khawatir ketika anda tidak dapat melihat kata sandi yang anda ketik - begitulah semestinya. ** Ketik saja dan tekan ` masukkan ` untuk melanjutkan. Outputnya akan terlihat seperti ini (dimana nama akun dan emailnya seharusnya menjadi milik anda):
> 
>     Nama akun: admin
>     Alamat Email: admin@admin.com
>     Kata Sandi: Kata Sandi (lagi): 
>     Superuser berhasil dibuat.
>     
> 
> Kembali ke browser anda. Masuklah dengan kredensial superuser yang anda pilih; anda harus melihat dasbor admin Django.
> 
> ![Django admin](images/django_admin3.png)
> 
> Beralih ke Postingan-postinga dan bereksperimen sedikit dengannya. Tambahkan lima atau enam entri blog. Jangan khawatir tentang konten tersebut - anda cukup menkopi beberapa teks dari tutorial ini untuk menghemat waktu. :)
> 
> Pastikan paling tidak ada dua atau tiga postingan (tapi tidak semua) yang memiliki tanggal terbitan. Ini akan sangat membantu nantinya.
> 
> ![Django admin](images/edit_post3.png)
> 
> If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/
> 
> Ini mungkin saja saat yang tepat untuk minum kopi (atau teh) atau sesuatu yang bisa dimakan untuk mengembalikan tenaga anda. Anda menciptakan model Django yang pertama - Anda layak untuk sedikit beristirahat!