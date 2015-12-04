# Uygulamanı genişlet

Websitemizi oluşturmak için gerekli adımların hepsini tamamladık: bir modelin, url'nin, view'ün ve template'in nasıl yazılacağını biliyoruz. Websitemizi nasıl güzelleştirebiliriz onu da biliyoruz.

Pratik zamanı!

Blog'umuzda lazım olan ilk şey bir gönderiyi göstermek için bir sayfa, değil mi?

Halihazırda bir `Post` modelimiz var, dolayısıyla `models.py` dosyasına birşey eklememize gerek yok.

## Bir gönderinin detayı için bir şablon linki oluşturun

`blog/templates/blog/post_list.html` dosyasına bir link ekleyerek başlayacağız. Şu ana kadar yaptıklarımız şöyle gözüküyor olması lazım:

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```
    

{% raw %}Gönderi listesindeki bir gönderinin başlığından bir gönderinin detay sayfasına bir link'imiz olsun istiyoruz. `<h1><a href="">{{ post.title }}</a></h1>`'i gönderinin detay sayfasına link verecek şekilde değiştirelim:{% endraw %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Gizemli `{% url 'post_detail' pk=post.pk %}` satırını anlatma zamanı. Şüphelendiğiniz üzere, `{% %}` notasyonu, Django template tags (şablon etiketleri) kullandığımız manasına geliyor. Bu sefer bizim için URL oluşturacak bir şablon etiketi kullanacağız!{% endraw %}

`blog.views.post_detail`, oluşturmak istediğimiz `post_detail` *view*'una bir yol. Lütfen dikkat: `blog` uygulamamızın adı (`blog` dizini); `views`, `views.py` dosyasının adından geliyor ve son kısım - `post_detail` - *view*'ün adından geliyor.

Şimdi http://127.0.0.1:8000/'ye gittiğimizde bir hata alacağız (beklediğimiz birşey, çünkü URL'miz veya `post_detail` için bir *view*'ümüz yok). Şöyle görünecektir:

![NoReverseMatch error (Tersi yok hatası)][1]

 [1]: images/no_reverse_match2.png

## Bir gönderinin detayı için URL oluşturun

`post_detail` *view*'ümüz için `urls.py`'un içinde bir URL oluşturalım!

İlk gönderimizin detayının şu **URL**'de gösterilmesini istiyoruz: http://127.0.0.1:8000/post/1/

`blog/urls.py` dosyasında `post_detail` adında bir Django *view*'una işaret eden bir URL yapalım. Bu <1>view</1> bir gönderinin tümünü gösterecek. `blog/urls.py` dosyasına `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),` satırını ekleyin. Dosyanın şu hale gelmiş olması gerekiyor:

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
]
```

Şu kısım `^post/(?P<pk>[0-9]+)/$` korkutucu gözüküyor, ama endişelenmeyin, açıklayacağız: - Gene `^` ile başlıyor. - "başlangıç' - `post/` sadece URL'nin başlangıçtan sonra **post** ve **/<1> ifadelerinin geçmesi gerektiği anlamına geliyor. Şimdilik iyi gidiyor. - `(?P<pk>[0-9]+)` - bu kısım biraz daha karışık. Buranın anlamı şu: Django bu alana yerleştirdiğimiz herşeyi alacak ve onu `pk` adında bir değişken olarak view'a aktaracak. `[0-9]` bize eşleşenlerin sadece rakam (yani harf olamaz) olabileceğini söylüyor (0 ile 9 arasındaki herşey). `+` en az bir veya daha fazla rakam olması gerektiğini ifade ediyor. Yani `http://127.0.0.1:8000/post//` eşleşmez ama `http://127.0.0.1:8000/post/1234567890/` eşleşir! - `/` - gene **/** - `$` - "son"!</p> 
Bu şu demek, eğer tarayıcınıza `http://127.0.0.1:8000/post/5/` yazarsanız, Django `post_detail` adında bir *view* aradığınızı anlar ve `pk` eşittir `5` bilgisini *view*'a aktarır.

`pk`, `primary key`'in (tekil anahtarın) kısaltılmış hali. Bu isim sıklıkla Django projelerinde kullanılır. Değişkeninize istediğiniz ismi verebilirsiniz (hatırlayın: küçük harfler ve boşluk yerine `_`!). Örneğin `(?P<pk>[0-9]+)` yerine `post_id` değişkenini kullanabilirdik. O zaman şöyle olurdu: `(?P<post_id>[0-9]+)`.

Tamam, `blog/urls.py` dosyasına yeni bir URL kalıbı ekledik! Sayfayı tazeleyelim: http://127.0.0.1:8000/ Bam! Yeni bir hata daha! Beklenildiği üzere!

![AttributeError (Özellik hatası)][2]

Bir sonraki adımın ne olduğunu hatırlıyor musunuz? Tabi ki: view'u eklemek!

## Gönderi detayı için bir view ekleyin

Bu sefer *view*'umuza `pk` adında bir parametre ekleyeceğiz. *view*'umuzun onu yakalaması gerekiyor, değil mi? Fonksiyonumuzu `def post_detail(request, pk):` olarak tanımlayacağız. Dikkat edin, url'lerde kullandığımız ismin birebir aynısını kullanmamız gerekiyor (`pk`). Bu değişkeni kullanmamak yanlıştır ve hataya sebep olacaktır!

Şimdi sadece ve sadece bir blog gönderisini almak istiyoruz. Bunu yapmak için querysets'i şu şekilde kullanabiliriz:

    Post.objects.get(pk=pk)
    

Ama bu kodun bir problemi var. Eğer gelen `primary key` (`pk` - tekil anahtar) ile bir `Post` (gönderi) yoksa, çok çirkin bir hatamız olacak!

![DoesNotExist error (Yok hatası)][3]

Bunu istemiyoruz! Ama tabi Django'da bunu ele alan birşey var: `get_object_or404`. Eğer verilen `pk` ile bir `Post` bulunamazsa, çok daha güzel bir sayfa gösterilecek (`Sayfa bulunamadı 404` sayfası).

![Page not found (Sayfa bulunamadı)][4]

İyi haber şu, kendi `Sayfa bulunamadı` sayfasını yapabilir ve istediğiniz kadar güzelleştirebilirsiniz. Ama şu anda çok önemli değil, o yüzden bu kısmı atlayacağız.

Evet, `views.py` dosyamıza bir *view* (görünüm) ekleme zamanı!

`blog/views.py` dosyasını açıp aşağıdaki kodu ekleyelim:

    from django.shortcuts import render, get_object_or_404
    

Bunu diğer `from` satırlarının yakınına eklememiz gerekiyor. Dosyanın sonuna *view*'umuzu ekleyeceğiz:

    def post_detail(request, pk):
        post = get_object_or_404(Post, pk=pk)
        return render(request, 'blog/post_detail.html', {'post': post})
    

Evet. http://127.0.0.1:8000/ sayfasını tazeleme zamanı

![Post list view (Gönderi listesi görünümü)][5]

Çalıştı! Fakat blog gönderisi başlığındaki bir bağlantıya tıkladığınızda ne oluyor?

![TemplateDoesNotExist error (Şablon yok hatası)][6]

Of hayır! Başka bir hata! Ama onu nasıl halledeceğimizi biliyoruz, di mi? Bir şablon (template) eklememiz gerekiyor!

## Gönderi detayı için bir şablon oluşturun

`blog/templates/blog` dizininde `post_detail.html` adında bir dosya oluşturacağız.

Şöyle görünmeli:

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
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endblock %}
```

Bir kere daha `base.html` dosyasını genişleteceğiz. `content` bloğunda bir gönderinin varsa yayınlanma tarihini (published_date), başlığını ve metnini göstermek istiyoruz. Ama daha önemli şeyleri konuşmalıyız, değil mi?

{% raw %}`{% if ... %} ... {% endif %}` birşeyi kontrol etmek istediğimizde kullanabileceğimiz bir şablon etiketidir (template tag) ( **Introduction to Python** bölümünden <1>if ... else ..</code> 'i hatırladınız mı?). Bu senaryoda gönderinin `published_date` (yayınlanma tarihi) boş olup olmadığına bakmak istiyoruz.{% endraw %}

Tamam, sayfamızı tazeleyip `Sayfa bulunamadı` hatasının gidip gitmediğine bakabiliriz.

![Post detail page (Gönderi detay sayfası)][7]

Heyo! Çalışıyor!

## Bir şey daha: deployment zamanı!

Sitenizin hala PythonAnywhere'de çalışıp çalışmadığına bakmakta fayda var, değil mi? Yeniden taşımayı deneyelim.

```
$ git status
$ git add -A .
$ git status
$ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
$ git push
```

*   Sonra bir [PythonAnywhere Bash console][8] una gidip:

```
$ cd my-first-blog
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```

*   Nihayet, [Web tab][9] ına gidip **Reload** edelim.

O kadar! Tebrikler :)

 [2]: images/attribute_error2.png
 [3]: images/does_not_exist2.png
 [4]: images/404_2.png
 [5]: images/post_list2.png
 [6]: images/template_does_not_exist2.png
 [7]: images/post_detail2.png
 [8]: https://www.pythonanywhere.com/consoles/
 [9]: https://www.pythonanywhere.com/web_app_setup/