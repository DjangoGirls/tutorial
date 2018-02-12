# Melanjutkan permohonan anda

Kita sudah siap semua yang berbeza langkah-langkah yang diperlukan untuk penciptaan kami web: kita tahu bagaimana untuk menulis model, url, paparan dan templat. Kita juga tahu bagaimana untuk membuat website kami cukup.

Masa untuk berlatih!

Benda pertama yang kita perlukan di blog kita adalah, jelas sekali, halaman untuk menampilkan satu siaran, betul?

Kita sudah mempunyai yang `Post` model, jadi kita tidak perlu menambahkan apa-apa untuk `models.py`.

## Membuat template link ke pos detail

Kita akan bermula dengan menambah link di dalam `blog/templates/blog/post_list.html` file. Setakat ini ia harus kelihatan seperti ini: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Kami ingin mempunyai link dari pos tajuk dalam senarai pos ke pos halaman butiran. Mari kita mengubah `<h1><a href="">{{ post.title }}</a></h1>` supaya ia menghubungkan ke pos halaman butiran:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Time to explain the mysterious `{% url 'post_detail' pk=post.pk %}`. Seperti yang anda mungkin tersangka, yang `{% %}` notasi cara yang kami adalah menggunakan Django template tags. Kali ini kita akan menggunakan salah satu yang akan membuat URL untuk kita!{% endraw %}

Yang `post_detail` bahagian bermakna itu Django akan mengharapkan URL di `blog/urls.py` dengan nama=post_detail

And how about `pk=post.pk`? `pk` ini pendek untuk kunci utama, yang merupakan nama yang unik untuk setiap rekod dalam pangkalan data. Karena kita tidak menentukan kunci utama kami `Post` model, Django mewujudkan satu untuk kami (oleh lalai, beberapa yang meningkatkan oleh satu untuk setiap rekod, i.e. 1, 2, 3) dan menambah ia sebagai satu bidang yang dinamakan `pk` untuk setiap jawatan kami. Kita mengakses kunci utama dengan menulis `post.pk`, cara yang sama kami akses lain bidang (`tajuk`, `penulis`, dan lain-lain.) dalam kami `Post` objek!

Sekarang, ketika kita pergi ke http://127.0.0.1:8000/ kami akan mempunyai satu kesilapan (seperti yang dijangka, sejak kita tidak lagi mempunyai URL atau sesuatu *pandangan* bagi `post_detail`). Ia akan kelihatan seperti ini:

![NoReverseMatch error](images/no_reverse_match2.png)

## Mencipta sebuah URL ke sebuah butiran pos

Let's create a URL in `urls.py` for our `post_detail` *view*!

We want our first post's detail to be displayed at this **URL**: http://127.0.0.1:8000/post/1/

Let's make a URL in the `blog/urls.py` file to point Django to a *view* named `post_detail`, that will show an entire blog post. Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. Fail harus kelihatan seperti ini:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. Ia bermakna Django akan mengambil segala sesuatu yang anda meletakkan di sini dan memindahkannya ke lihat sebagai variabel yang dipanggil `pk`. (Perhatikan yang ini sepadan dengan nama kami memberikan kunci utama berubah-ubah kembali dalam `blog/templates/blog/post_list.html`!) `\d` juga memberitahu kita bahwa hal itu hanya dapat angka, tidak surat (jadi semuanya antara 0 dan 9). `+` berarti harus ada satu atau lebih digit sana. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

Itu berarti jika anda masuk `http://127.0.0.1:8000/post/5/` ke pelayar anda, Django akan mengerti bahwa anda sedang mencari *pandangan* dipanggil `post_detail` dan memindahkan maklumat itu `pk` sama dengan `5` untuk itu *pandangan*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! Pelayan telah berhenti berjalan lagi. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Apakah anda ingat apa langkah berikutnya adalah? Tentu saja: menambah melihat!

## Tambah post melihat butiran

This time our *view* is given an extra parameter, `pk`. Our *view* needs to catch it, right? So we will define our function as `def post_detail(request, pk):`. Catatan yang kita perlukan untuk menggunakan nama yang sama sebagai salah satu kita yang dinyatakan dalam urls (`pk`). Meninggalkan berubah-ubah ini adalah salah dan akan mengakibatkan satu kesilapan!

Sekarang, kita mahu untuk mendapatkan salah satu dan hanya satu blog pos. Untuk melakukan ini, kita bisa menggunakan querysets, seperti ini:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

We don't want that! But, of course, Django comes with something that will handle that for us: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

Berita baik adalah bahwa anda benar-benar dapat membuat anda sendiri `Halaman tidak menemukan` halaman dan menjadikannya sebagai cantik seperti yang anda mahu. Tapi itu tidak penting super sekarang, jadi kami akan melewatkan itu.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. Ini bermakna bahawa Django akan mengharapkan lihat fungsi dipanggil `post_detail` di dalam `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Yes. It is time to refresh the page: http://127.0.0.1:8000/

![Menghantar senarai melihat](images/post_list2.png)

Ia bekerja! Tetapi apa yang terjadi apabila anda klik link di blog pos tajuk?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh tidak! Satu lagi kesalahan! Tapi kami sudah tahu bagaimana untuk berurusan dengan itu, kan? Kita perlu untuk menambah template!

## Create a template for the post details

We will create a file in `blog/templates/blog` called `post_detail.html`.

It will look like this:

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

Once again we are extending `base.html`. Dalam `content` blok kami mahu paparan yang post published_date (jika ia wujud), tajuk dan teks. Tetapi kita harus mendiskusikan beberapa hal penting, kan?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, kita boleh menyegarkan kami halaman dan melihat jika `TemplateDoesNotExist` pergi sekarang.

![Pos halaman terperinci](images/post_detail2.png)

Yay! Ia berfungsi!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

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