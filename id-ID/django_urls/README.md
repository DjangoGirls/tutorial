# URL Django

Kami akan membuat laman web pertama kami: beranda untuk blog Anda! Tapi pertama, mari pelajari sedikit tentang URL Django.

## Apa itu URL?

A URL is a web address. Anda dapat melihat URL setiap kali mengunjungi situs web - ini terlihat di bilah alamat browser Anda. (Iya nih! `127.0.0.1:8000` is a URL! And `https://djangogirls.org` is also a URL.)

![Url](images/url.png)

Setiap halaman di Internet membutuhkan URLnya sendiri. Dengan cara ini aplikasi Anda tahu apa yang harus ditunjukkan kepada pengguna yang membuka URL itu. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## Bagaimana cara kerja URL di Django?

Mari buka berkas ` mysite / urls.py ` di editor kode pilihan Anda dan lihat seperti apa:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Seperti yang Anda lihat, Django telah meletakkan sesuatu di sini untuk kita.

Baris antara tanda kutip tiga kali (` '' '</ 0> atau <code> "" "</ 0>) disebut docstrings - Anda dapat menuliskannya di bagian atas file, kelas atau metode untuk menjelaskan apa yang dilakukannya. Mereka tidak akan dijalankan oleh Python.</p>

<p>The admin URL, which you visited in the previous chapter, is already here:</p>

<p>{% filename%} mysite / urls.py {% endfilename%}</p>

<pre><code class="python">    path('admin/', admin.site.urls),
`</pre> 

Baris ini berarti bahwa untuk setiap URL yang dimulai dengan ` admin / </ 0>, Django akan menemukan tampilan <em> yang sesuai </ 1>. In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.</p>

<h2>Your first Django URL!</h2>

<p>Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.</p>

<p>We also want to keep the <code>mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Your `mysite/urls.py` file should now look like this:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `path` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/