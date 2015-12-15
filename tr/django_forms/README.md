# Django formları

Blogumuzda yapmak istediğimiz son şey blog yazılarını eklemek ve düzenlemek için güzel bir yapı oluşturmak. Django'nun `admin` arayüzü çok havalı, ama özelleştirilmesi ve güzel hale getirilmesi oldukça zor. `Formlar` kullanarak kendi arayüzümüz üstünde mutlak bir güce sahip olacağız - neredeyse hayal ettiğimiz her şeyi yapabiliriz!

Django formlarının iyi olmasının nedeni, ister sıfırdan bir form tanımlayabiliriz ister sonuçları modele kaydedecek bir `ModelForm` oluşturabiliriz.

Bu tam da bizim yapmak istediğimiz şey: `Post` modelimiz için bir form oluşturmak.

Django'nun diğer önemli parçaları gibi, formlarda kendi dosyalarına sahipler: `forms.py`.

`Blog` dizinimizde bu isimde bir dosya oluşturmalıyız.

    Blog └── forms.py
    

Tamam, hadi dosyayı açalım ve aşağıdaki kodu yazalım:

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Önce Django formları (`from django import forms`) ve tabi ki de `Post` modelimizi (`from .models import Post`) import etmeliyiz).

`PostForm`, muhtemelen tahmin ettiğiniz gibi, formumuzun ismi. Django'ya bu formun bir `ModelForm` olduğunu anlatmalıyız. Bunu `forms.ModelForm` sayesinde Django bizim için yapacaktır.

Sırada Django'ya bu formu (`model = Post`) oluşturmak için hangi modelin kullanılması gerektiğini anlattığımız `class Meta` var).

Son olarak, bizim formumuza hangi alan(lar)ın girmesi gerektiğini söyleyebiliriz. Bu senaryoda sadece `title` ve `text` alanlarının gösterilmesini istiyoruz - `author` şu anda giriş yapmış olması gereken kişidir (yani siz!) ve biz ne zaman yeni bir yazı oluşturursak (yani kod içinde) `created_date` otomatik olarak ayarlanmalıdır, değil mi?

Hepsi bu kadar! Şimdi tek yapmamız gereken formu bir *view* (görünüm) içinde kullanıp, şablon içinde göstermek.

Bir kez daha: sayfaya bir bağlantı, bir URL, bir görünüm ve bir şablon üreteceğiz.

## Form içeren sayfaya link oluşturma

Şimdi `blog/templates/blog/base.html` görünümünü açma zamanı. Öncelikle `page-header` adlı `div` öğesinin içine bir link ekleyeceğiz:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Yeni view'i `post_new` olarak isimlendirdik.

Yukarıdaki satırı ekledikten sonra html dosyanız böyle gözükmeli:

```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Dökümanı kaydedip http://127.0.0.1:8000 sayfasını yeniledikten sonra, siz de `NoReverseMatch` hatasına benzer bir hata görüyor olmalısınız, değil mi?

## URL

`blog/urls.py` dosyasını açalım ve yeni bir satır ekleyelim:

```python
    url(r'^post/new/$', views.post_new, name='post_new'),
```

Ve son kod şu şekilde gözükecektir:

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

Sayfayı yeniledikten sonra, `AttributeError` şeklinde bir hata görmeliyiz. Bunun sebebi de henüz `post_new` görünümünü kodlamamış olmamız. Şimdi bu dosyayı da ekleyelim.

## post_new view

Şimdi `blog/views.py` dosyasını açıp aşağıdaki satırları `from` satırının olduğu yere ekleyelim:

```python
from .forms import PostForm
```

ve bizim *view*'ımız:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Yeni bir `Post` formu oluşturmak için `PostForm()` fonksiyonunu çağırıp dönüş değerini template katmanına iletmeliyiz. Bu *view*'a geri döneceğiz, fakat öncesinde form için bir template oluşturalım.

## Template

Öncelikle `blog/templates/blog` klasöründe `post_edit.html` isimli bir dosya yaratmalıyız. Çalışan bir form oluşturmak için yapılması gerekler şunlar:

*   form'u görüntülemeliyiz. Bunu basitçe bu şekilde yapabiliriz: `{% raw %}{{ form.as_p }}{% endraw %}`.
*   yukarıdaki örnek satır HTML form etiketi içine alınmalı: `<form method="POST">...</form>`
*   Bir `Kaydet` butonuna ihtiyacımız var. Bunu bir HTML butonu ile yapıyoruz: `<button type="submit">Kaydet</button>`
*   sonunda, tam `<form ...>` taginden sonra `{% raw %}{% csrf_token %}{% endraw %}` i eklememiz lazım. Bu çok önemlidir, çünkü formlarımızı güvenli yapar! Django bunu yapmadan çalıştırmaya kalkarsak şikayet eder:

![CSFR Korumalı sayfa][1]

 [1]: images/csrf2.png

Peki, şimdi de `post_edit.html` in içindeki HTML kodunun nasıl görünmesi gerektiğine bakalım:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>Yeni gönderi</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Kaydet</button>
    </form>
{% endblock %}
```

Yenileme zamanı! Hey! Formun görüntülendi!

![Yeni form][2]

 [2]: images/new_form2.png

Ama, bir dakika! `title` ve `text` alanlarına birşey yazıp kaydettiğimizde ne olacak?

Hiç birşey! Yine aynı sayfaya döndük ve bütüm yazdıklarımız kayboldu... ve de yeni bir post da eklenmemiş. Ne hata yaptık?

Yanıt: Hiç bir hata olmadı. *view* da biraz daha iş yapmak gerekiyor.

## Form'u kaydetme

Tekrar `blog/views.py` dosyasını açalım. Şuan `post_new` view'ı içinde sadece bunlar var:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Form'u gönderdiğimizde tekrar aynı view'e yönlendirileceğiz, ama bu sefer `request` nesnesinde daha spesifik olmak gerekirse `request.POST` (isimlendirmesinin bizim blog "post"umuz (gönderimiz) ile alakası yok, gerçekte veri gönderdiğimiz ("postaladığımız") için isimlendirme bu şekilde) içerisinde daha fazla veri olacak. HTML dosyasındaki `<form>` tanımında `method="POST"` adında bir değişken olduğunu hatırlıyor musun? Formdaki tüm alanlarda şimdi `request.POST` var. `POST` un ismini değiştirmememiz lazım (`method` için geçerli olan diğer değer sadece `GET` dir, ama şimdi bunların farklarını anlatacak kadar vaktimiz yok).

Yarattığımız *view* da iki farklı durumu halletmemiz gerek. İlk olarak: sayfamız ilk erişildiği zaman boş bir form olmasını istiyoruz. İkincisi: *view* a geri dönüldüğü zaman form'u daha önce girilmiş bütün verilerle beraber görmek istiyoruz. Yani bir koşul eklememiz gerekiyor (bunun için `if` kullanacağız).

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Şimdi `[...]` ları doldurma zamanı geldi. `method` `POST` ise o zaman `PostForm` u verilerle oluşturmamız lazım, değil mi? Bunu yapmak için:

```python
form = PostForm(request.POST)
```

Çok kolay! Şimdi de formu doğrulamamız lazım (yani tüm alanların oluştuğu ve hatalı değerlerin saklanmadığı). Bunuda `form.is_valid()` ile yapıyoruz.

Formun doğruluğunu kontrol ediyoruz ve doğru ise kaydedebiliriz!

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Burada iki basit şey yaptık: formu `form.save` ile kaydettik, ve bir yazar ekledik (`PostForm`'da daha önce bir `author` tanımlı değildi, oysa ki bu zorunlu bir alan!). `commit=False`, `Post` modelini henüz kaydetmek istemediğimizi belirtir - zira ilk önce yazarı eklememiz lazım. Genellikle `form.save()`, `commit=False` olmadan kullanılır, ama bu sefer, kullanmamız gerekiyor. `post.save()` değişiklikleri korur (yazarı ekler) ve yeni blog postunu yaratır!

Hemen `post_detail` sayfasına gidip yeni yaratmış olduğumuz blog postunu görsek harika olur, degil mi? Bunu yapabilmek için önemli bir şey daha lazım:

```python
from django.shortcuts import redirect
```

Bunu dosyanın en başına ekleyelim. Şimdi yeni yarattığımız blog postu için `post_detail` sayfasına gidebiliriz.

```python
return redirect('blog.views.post_detail', pk=post.pk)
```

`blog.views.post_detail` gitmek istediğimiz view un ismidir. Unutmayalım ki bu *view* için bir `pk` değişkeni lazım. Bu değeri viewlara aktarmak için `pk=post.pk` yazarız. Burada `post` yeni yarattığımız blog postudur!

Çok şey söyledik ama herhalde *view* u tümüyle bir görmek isteriz artık, değil mi?

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Bakalım çalışacak mı? http://127.0.0.1:8000/post/new/ sayfasına gidip bir `başlık` ve `yazı` ekleyelim, sonra da kaydedelim... ve işte! Yeni blog postu eklenmiş ve `post_detail` sayfasına yönlendirildik!

Postu kaydetmeden önce yayin tarihine değer atandığını fark etmiş olabilrsin. Daha sonra *yayına butonu* nu **Django Girls Tutorial: Ek konular** da anlatacağız.

Süper!

## Form doğrulama

Şimdi de Django formlarının ne kadar cool olduğunu görelim. Bir blog postunun `başlık` ve `yazı` alanları olmalı. `Post` modelimizde bu alanlar mecburi değil demedik ( `published_date` demiş olduğumuz gibi), dolayısı ile Django bu alanlara değer atanması gerektiğini varsayar.

`Başlık` veya `yazı` olmadan formu kaydetmeye çalışın. Ne olacak, tahmin et!

![Form doğrulama][3]

 [3]: images/form_validation2.png

Django tüm alanlara doğru tür değerlerin atandığını bizim için kontrol ediyor. Ne güzel, değil mi?

> Yakın zamanda Django'nun admin arayüzünü kullandığımız için, sistem bizi hala oturumda varsayıyor. Bazı durumlar bizim oturumdan çıkmış olmamıza neden olabilir (web tarayıcısını kapatmak, veritabanını tekrar başlatmak, vb). Eğer oturumda olan kullanıcı olmadığı için post yaratmada hata alırsak admin sayfası olan http://127.0.0.1:8000/admin gidip tekrar bir oturum açmalıyız. Bu durumu geçici de olsa da halleder. Kalıcı çözüm, ana tutorialdan sonra **Ödev: Web sitene güvenik ekleme!** bölümünde anlatılacak.

![Oturum hatası][4]

 [4]: images/post_create_error.png

## Form editleme (düzenleme)

Artık yeni bir form oluşturmayı biliyoruz. Peki, mevcut bir formu güncellemek için ne yapmalı? Demin yaptığımıza çok benziyor. Şimdi, hızlıca bir kaç şey yaratalım (anlamadığın bir şey olduğu zaman, mentöre veya önceki bölümlere danışabilirsin, çünkü bu adımları daha önce yaptık).

`blog/templates/blog/post_detail.html` dosyasını açıp şu satırı ekleyelim:

```python
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

ki şablonumuz buna benzesin:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endblock %}
```

`blog/urls.py` dosyasına şu satırı ekleyelim:

```python
    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```

Daha önce kullandığımız `blog/templates/blog/post_edit.html` şablonunu tekrar kullanacağız, tek eksik bir *view*.

Şimdi `blog/views.py` dosyasını açıp en sonuna şu satırı ekleyelim:

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Bu nerdeyse bizim `post_new` view a benziyor, değil mi? Ama, tam de değil. İlk önce: Url'den ekstra bir `pk` parameteresi yolladık. Sonra: güncellemek istediğimiz `Post` modelini `get_object_or_404(Post, pk=pk)` ile alıp, bir form yarattığımızda bu postu bir `instance` olarak hem formu kaydettiğmizde yolluyoruz:

```python
form = PostForm(request.POST, instance=post)
```

hem de güncellemek istediğimiz postu görmek için form açtığımız zaman yolluyoruz:

```python
form = PostForm(instance=post)
```

Haydi, deneyelim. Bakalım çalışacak mı? `post_detail` sayfasına gidelim. Sağ üst köşede bir edit (güncelleme) butonu olmalı:

![Düzenle butonu][5]

 [5]: images/edit_button2.png

Butona tıklarsak blog postunu görmemiz lazım:

![Formu düzenle][6]

 [6]: images/edit_form2.png

İstediğimiz gibi başlık ve yazıyı değiştirebilir ve sonra da kaydedebilriz!

Tebrikler! Uygulaman gittikçe tamamlanıyor!

Django formları hakkında daha fazla bilgi bulmak için https://docs.djangoproject.com/en/1.8/topics/forms/ adresindeki dokümanlara bakabilirsin

## Güvenlik

Bir linke tıklayarak yeni bir blog oluşturabilmek harika! Ancak, şu haliyle siteye gelen herkes bir blog yaratıp kaydedebilir. Bu da istenen bir durum değil. Butonun sadece sana görünmesini sağlayalım.

`blog/templates/blog/base.html` dosyasında yarattığımız `page-header` `div` ve anchor taglarını bulalım. Şuna benziyor olmalı:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Şimdi bir `{% if %}` tagi daha ekleyeceğiz ki link sadece admin olarak oturum açmış kişilere görünsün. Şimdilik, bu kişi sadece sensin! `<a>` tagini şöyle değiştirelim:

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Bu `{% if %}` linkin tarayıcıya ancak kullanıcı oturum açmış ise gönderilmesini sağlar. Bu yeni post yaratılmasını kesin olarak engellemese de iyi bir başlangıç. Güvenlik konusu ek derslerde daha çok ele alınacak.

Oturum içi olduğumuz için, şimdi sayfayı refresh edersek, farklı bir şey görmeyeceğiz. Sayfayı farklı bir tarayıcıda veya incognito bir pencerede yükleyelim. O zaman linkin görünmeyecek!

## Bir şey daha: deployment zamanı!

Bakalım PythonAnywhere'de calışacak mı? Tekrar deploy edelim!

*   İlk önce kodumuzu commit edelim, sonra Github'a push edelim

```
$ git status
$ git add -A .
$ git status
$ git commit -m "Web sitesinde blog yaratacak ve güncelleyecek viewlar eklendi."
$ git push
```

*   Sonra bir [PythonAnywhere Bash console][7] una gidip:

 [7]: https://www.pythonanywhere.com/consoles/

```
$ cd my-first-blog
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```

*   Nihayet, [Web tab][8] ına gidip **Reload** edelim.

 [8]: https://www.pythonanywhere.com/web_app_setup/

O kadar! Tebrikler :)