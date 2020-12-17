# Admin Django

Untuk menambahkan, mengedit dan menghapus tulisan yang baru saja kita telusuri, kita akan menggunakan admin Django.

Mari buka berkas `blog/admin.py` dalam editor kode dan ganti isinya dengan ini:

{% filename %}blog/admin.py{% endfilename %}

```python
dari admin impor django.contrib dari .Models import Post admin.site.register (Post)
```

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
> Saat diminta, ketik nama akun anda (huruf kecil, tidak ada spasi), alamat email, dan kata sandi. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Type it in and press `enter` to continue. Outputnya akan terlihat seperti ini (dimana nama akun dan emailnya seharusnya menjadi milik anda):
> 
>     Username: ola
>     Email address: ola@example.com
>     Password:
>     Password (again):
>     Superuser created successfully.
>     
> 
> Kembali ke browser anda. Masuklah dengan kredensial superuser yang anda pilih; anda harus melihat dasbor admin Django.
> 
> ![Django admin](images/django_admin3.png)
> 
> Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content –- it's only visible to you on your local computer -- you can copy-paste some text from this tutorial to save time. :)
> 
> Pastikan paling tidak ada dua atau tiga postingan (tapi tidak semua) yang memiliki tanggal terbitan. Ini akan sangat membantu nantinya.
> 
> ![Django admin](images/edit_post3.png)
> 
> If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.2/ref/contrib/admin/
> 
> Ini mungkin saja saat yang tepat untuk minum kopi (atau teh) atau sesuatu yang bisa dimakan untuk mengembalikan tenaga anda. Anda menciptakan model Django yang pertama - Anda layak untuk sedikit beristirahat!