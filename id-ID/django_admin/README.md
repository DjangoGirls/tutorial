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
> When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Just type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):
> 
>     Username: admin
>     Email address: admin@admin.com
>     Password:
>     Password (again):
>     Superuser created successfully.
>     
> 
> Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.
> 
> ![Django admin](images/django_admin3.png)
> 
> Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)
> 
> Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.
> 
> ![Django admin](images/edit_post3.png)
> 
> If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/
> 
> This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!