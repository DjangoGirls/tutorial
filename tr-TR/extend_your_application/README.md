{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Uygulamanı genişlet

Websitemizi oluşturmak için gerekli adımların hepsini tamamladık: bir modelin, url'nin, view'ün ve template'in nasıl yazılacağını biliyoruz. Websitemizi nasıl güzelleştirebiliriz onu da biliyoruz.

Pratik zamanı!

Blog'umuzda lazım olan ilk şey bir gönderiyi göstermek için bir sayfa, değil mi?

Halihazırda bir `Post` modelimiz var, dolayısıyla `models.py` dosyasına bir şey eklememize gerek yok.

## Bir gönderinin detayı için bir şablon linki oluşturun

`blog/templates/blog/post_list.html` dosyasının içine bir bağlantı ekleyerek başlayacağız.Şimdiye kadar bunun gibi görünmesi gerek: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %}Gönderi listesindeki bir gönderinin başlığından bir gönderinin detay sayfasına bir link (bağlantı) olsun istiyoruz. `<h1><a href="">{{ post.title }}</a></h1>`'i gönderinin detay sayfasına link verecek şekilde değiştirelim:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Gizemli `{% url 'post_detail' pk=post.pk %}` satırını anlatma zamanı. Şüphelendiğiniz üzere, `{% %}` notasyonu, Django template tags (şablon etiketleri) kullandığımız manasına geliyor. Bu sefer bizim için URL oluşturacak bir şablon (template) etiketi kullanacağız!{% endraw %}

`post_detail` kısmı Django'nun `blog/urls.py/0> dosyasının içinde post_detail adlı bir URL beklediği anlamına gelir.</p>

<p>Peki <code>pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Şimdi http://127.0.0.1:8000/ adresine gittiğimizde bir hata ile karşılaşacağız (`post_detail` için bir URL ya da *görüntü (view)* olmadığı için hatayı almamız normal). Hata böyle görünecektir:

![NoReverseMatch error](images/no_reverse_match2.png)

## Bir gönderinin detayı için URL oluşturun

`post_detail` *view*'ümüz için `urls.py`'un içinde bir URL oluşturalım!

İlk gönderimizin detayının şu **URL**'de gösterilmesini istiyoruz: http://127.0.0.1:8000/post/1/

`blog/urls.py` dosyasında `post_detail` adında bir Django *view*'una işaret eden bir URL yapalım. Bu <1>view</1> bir gönderinin tümünü gösterecek. `blog/urls.py` dosyasına şu satırı ekleyin `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),`. Dosya şöyle gözükmeli:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

`^post/(?P<pk>\d+)/$` kısmı korkunç görünüyor, ama endişe etmeyin - sizin için açıklayalım:

- "başlangıç" yine `^` ile başlar.
- başlangıçtan sonraki `post/` kısmı URL **post** ve bir tane **/** içermesi gerekir anlamına gelir. Şimdiye kadar her şey iyi.
- `(?P<pk>\d+)` - bu kısım biraz daha hileli. Buranın anlamı şu: Django bu alana yerleştirdiğimiz her şeyi alacak ve onu `pk` adında bir değişken olarak view'e aktaracak. (Bunun `blog/templates/blog/post_list.html` 'de vermiş olduğumuz birincil anahtar değeriyle eşleştiğini note edin!) aynı zamanda `\d` işareti bize sadece bir rakam olabileceğini söyler, harf değil (yani her şey 0 ve 9 arasındadır). `+` en az bir veya daha fazla rakam olması gerektiğini ifade ediyor. Yani `http://127.0.0.1:8000/post//` gibi bir şey geçerli değil, ama `http://127.0.0.1:8000/post/1234567890/` uygun!
- `/` - sonra yine **/**'a ihtiyacımız var.
- `$`-"son"!

Bu şu demek, eğer tarayıcınıza `http://127.0.0.1:8000/post/5/` yazarsanız, Django `post_detail` adında bir *view* aradığınızı anlar ve `pk` eşittir `5` bilgisini *view*'e aktarır.

Tamamdır.`blog/urls.py`!'e yeni bir URL kalıbı ekledik! Http://127.0.0.1:8000/ sayfasını yenileyelim.Boom! Sunucu çalıştırmayı tekrar durdurdu. Konsola göz at, beklendiği gibi bir hata daha var!

![AttributeError](images/attribute_error2.png)

Bir sonraki adımın ne olduğunu hatırlıyor musunuz? Tabi ki: view'ü eklemek!

## Gönderi detayı için bir view ekleyin

Bu sefer *view*'ümüze `pk` adında bir parametre ekleyeceğiz. *view*'ümüzün onu yakalaması gerekiyor, değil mi? Fonksiyonumuzu `def post_detail(request, pk):` olarak tanımlayacağız. Dikkat edin, url'lerde kullandığımız ismin birebir aynısını kullanmamız gerekiyor (`pk`). Omitting this variable is incorrect and will result in an error!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

We don't want that! But, of course, Django comes with something that will handle that for us: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

The good news is that you can actually create your own `Page not found` page and make it as pretty as you want. But it's not super important right now, so we will skip it.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

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

![Post list view](images/post_list2.png)

It worked! But what happens when you click a link in blog post title?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh no! Another error! But we already know how to deal with it, right? We need to add a template!

## Gönderi detayları için bir şablon oluştur

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

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Yay! It works!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Site için CSS ve ayrıntılı blog gönderisi için görünüm ve şablon eklendi."
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