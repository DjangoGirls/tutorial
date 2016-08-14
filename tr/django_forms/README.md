# Django Forms

Günlüğümüzde son olarak yapmak istediğimiz şey, günlük yazılarını eklemek ve düzenlemek için güzel bir yapı oluşturmak. Django'nun `admin` arayüzü çok havalı, ama özelleştirilmesi ve güzelleştirilmesi oldukça zor. Bunu `forms` (formlar) kullanarak kendi arayüzümüz üstünde mutlak bir güce sahip olacağız - neredeyse hayal ettiğimiz her şeyi yapabiliriz!

Django formlarının güzel yanı, hem sıfırdan bir form tanımlayabilmemiz hem de sonuçları modele kaydedecek bir `ModelForm` oluşturabilmemizdir.

Tam olarak yapmak istediğimiz şey: `Post` modelimiz için bir form oluşturmak.

Django'nun diğer önemli parçaları gibi, formların da kendi dosyası var: `forms.py`.

`blog` dizinimizde bu isimde bir dosya oluşturmalıyız.

```
blog
   └── forms.py
```

Tamam, hadi dosyayı açalım ve aşağıdaki kodu yazalım:

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('baslik', 'yazi',)
```

Önce Django formları (`from django import forms`) ve tabii ki `Post` modelimizi içe aktarmalıyız (`from .models import Post`).

`PostForm`, tahmin etmiş olabileceğiniz gibi, formumuzun ismi. Django'ya bu formun bir `ModelForm` olduğunu belirtmeliyiz. Bunu `forms.ModelForm` sayesinde Django bizim için yapacaktır.

Sırada Django'ya bu formu (`model = Post`) oluşturmak için hangi modelin kullanılması gerektiğini anlattığımız `class Meta` var).

Son olarak, formumuzda hangi alan(lar)ın bulunması gerektiğini söyleyebiliriz. Bu senaryoda sadece `baslik` ve `yazi` alanlarının gösterilmesini istiyoruz - `yazar` şu anda giriş yapmış olması gereken kişidir (yani siz!) ve biz ne zaman yeni bir yazı oluşturursak `yaratilis_tarihi` otomatik olarak (örn. kod içinde) ayarlanmalıdır, değil mi?

Ve hepsi bu kadar! Şimdi tek yapmamız gereken formu bir *view* içinde kullanıp, template (şablon) içinde göstermek.

Bir kez daha: sayfaya bir bağlantı, bir URL, bir view ve bir template üreteceğiz.

## Formun bulunduğu sayfaya bağlantı oluşturma

Şimdi `blog/templates/blog/base.html` şablonunu açma zamanı. Öncelikle `page-header` adlı `div` öğesinin içine bir bağlantı ekleyeceğiz:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Yeni view'i `post_new` olarak isimlendirdik.

Yukarıdaki satırı ekledikten sonra html dosyanız böyle görünmeli:

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

Dokümanı kaydedip http://127.0.0.1:8000 sayfasını yeniledikten sonra, siz de tanıdık `NoReverseMatch` hatasını görüyor olmalısınız, değil mi?

## URL

`blog/urls.py` dosyasını açalım ve yeni bir satır ekleyelim:

```python
    url(r'^post/new/$', views.post_new, name='post_new'),
```

Ve kodun son hali şu şekilde görünecektir:

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

Sayfayı yeniledikten sonra, `AttributeError` şeklinde bir hata görürüz, bunun sebebi de henüz `post_new` view'ını (görünümünü) kodlamamış olmamız. Şimdi bu dosyayı da ekleyelim.

## post_new view

Şimdi `blog/views.py` dosyasını açıp aşağıdaki satırları diğer `from` satırlarının olduğu yere ekleyelim:

```python
from .forms import PostForm
```

ve bizim *view*'ımız:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Yeni bir `Post` formu oluşturmak için `PostForm()` fonksiyonunu çağırmak ve template'e iletmek gerekir. Bu *view*'a geri döneceğiz, fakat öncesinde form için hızlıca bir şablon oluşturalım.

## Template

Öncelikle `blog/templates/blog` dizininde `post_edit.html` isimli bir dosya oluşturmalıyız. Bir formu çalışır hale getirmek için birkaç şeye ihtiyacımız var:

*   form'u görüntülemeliyiz. Bunu basitçe bu şekilde yapabiliriz: `{% raw %}{{ form.as_p }}{% endraw %}`.
*   yukarıdaki örnek satır HTML form etiketi içine alınmalı: `<form method="POST">...</form>`
*   bir `Kaydet` butonuna ihtiyacımız var. Bunu bir HTML butonu ile yapıyoruz: `<button type="submit">Kaydet</button>`
*   son olarak, hemen `<form ...>` etiketinden sonra `{% raw %}{% csrf_token %}{% endraw %}` satırını eklememiz lazım. Formlarımızın güvenliğini sağladığı için bu çok önemlidir! Bunu koymayı unutup formu kaydedersek Django hata verecektir:

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

Ama, bir dakika! `baslik` ve `yazi` alanlarına bir şey yazıp kaydettiğimizde ne olacak?

Hiçbir şey! Yine aynı sayfaya döndük ve bütün yazdıklarımız kayboldu... ve yeni bir gönderi de eklenmemiş. Yanlış giden ne?

Yanıt: hiçbir şey. Sadece *view*'ımızda biraz daha iş yapmamız gerekiyor.

## Formu kaydetme

Tekrar `blog/views.py` dosyasını açalım. Şuan `post_new` view'ı içinde sadece bunlar var:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Formu kaydettiğimizde tekrar aynı view'a yönlendirileceğiz, ama bu sefer `request` nesnesinde, daha doğrusu `request.POST` (isimlendirmesinin, bizim blog uygulamasının "post" modeli ile alakası yok, gerçekte veri gönderdiğimiz (İngilizcede "post" işlemi) için isimlendirme bu şekilde) içerisinde, daha fazla verimiz olacak. HTML dosyasında `<form>` tanımımızdaki `method="POST"` değişkenini hatırlıyor musun? Formdan gelen tüm alanlar şimdi `request.POST`'un içerisinde. `POST`'un ismini değiştirmememiz lazım (`method` için geçerli diğer değer sadece `GET`'dir, ama şimdi ikisi arasındaki farkın ne olduğunu anlatacak kadar vaktimiz yok).

Oluşturduğumuz *view*'da iki ayrı durumu halletmemiz gerek. Birincisi: sayfaya ilk eriştiğimiz ve boş bir form istediğimiz zaman. İkincisi: henüz yazdığımız tüm form verileriyle *view*'a geri döndüğümüz zaman. Yani bir koşul eklememiz gerekiyor (bunun için `if` kullanacağız).

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Şimdi boşluğu `[...]` doldurma zamanı geldi. `method`, `POST` ise o zaman `PostForm`u verilerle oluşturmamız lazım, değil mi? Bunu yapmak için:

```python
form = PostForm(request.POST)
```

Çok kolay! Şimdi de formu (yani tüm gerekli alanların doldurulduğu ve hatalı değerlerin kaydedilmeyeceğini) kontrol etmemiz lazım. Bunu da `form.is_valid()` ile yapıyoruz.

Formun doğruluğunu kontrol ediyoruz ve doğru ise kaydedebiliriz!

```python
if form.is_valid():
    post = form.save(commit=False)
    post.yazar = request.user
    post.yayinlama_tarihi = timezone.now()
    post.save()
```

Temel olarak, burada iki şey yaptık: formu `form.save` ile kaydettik ve bir yazar ekledik (`PostForm`'da bir `yazar` tanımlı olmadığı ve bu zorunlu bir alan olduğu için!). `commit=False`, `Post` modelini henüz kaydetmek istemediğimizi belirtir - ilk önce yazarı eklemek istiyoruz. Genellikle `form.save()`, `commit=False` olmadan kullanacaksınız, ama bu durumda, bunu kullanmamız gerekiyor. `post.save()` değişiklikleri (yazarı ekleme) koruyacaktır ve yeni bir blog gönderisi oluşturulur!

Hemen `post_detail` sayfasına gidip yeni yaratmış olduğumuz blog postunu görsek harika olur, degil mi? Bunu yapabilmek için önemli bir şey daha lazım:

```python
from django.shortcuts import redirect
```

Bunu dosyanın en başına ekleyelim. Şimdi yeni yarattığımız blog postu için `post_detail` sayfasına gidebiliriz.

```python
return redirect('blog.views.post_detail', pk=post.pk)
```

`blog.views.post_detail` gitmek istediğimiz görünümün ismidir. Unutmayalım ki bu *view* için bir `pk` değişkeni lazım. Bu değeri görünümlere aktarmak için `pk=post.pk` yazarız. Burada `post` yeni yarattığımız blog postudur!

Çok şey söyledik ama herhalde *view* u tümüyle bir görmek isteriz artık, değil mi?

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.yazar = request.user
            post.yayinlama_tarihi = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Bakalım çalışacak mı? http://127.0.0.1:8000/post/new/ sayfasına gidip bir `baslik` ve `yazi` ekleyelim, sonra da kaydedelim... ve işte! Yeni blog postu eklenmiş ve `post_detail` sayfasına yönlendirildik!

Postu kaydetmeden önce yayin tarihine değer atandığını fark etmiş olabilrsin. Daha sonra *yayınla butonu* nu **Django Girls Tutorial: Ek konular** da anlatacağız.

Süper!

## Form doğrulama

Şimdi de Django formlarının ne kadar havalı olduğunu görelim. Bir blog postunun `baslik` ve `yazi` alanları olmalı. `Post` modelimizde bu alanlar mecburi değil demedik ( `yayinlama_tarihi` demiş olduğumuz gibi), dolayısı ile Django bu alanlara değer atanması gerektiğini varsayar.

`baslik` veya `yazi` olmadan formu kaydetmeye çalışın. Ne olacak, tahmin et!

![Form doğrulama][3]

 [3]: images/form_validation2.png

Django tüm alanlara doğru tür değerlerin atandığını bizim için kontrol ediyor. Ne güzel, değil mi?

> Yakın zamanda Django'nun admin arayüzünü kullandığımız için, sistem bizi hala oturumda varsayıyor. Bazı durumlar bizim oturumdan çıkmamıza neden olabilir (web tarayıcısını kapatmak, veritabanını tekrar başlatmak, vb). Eğer oturumda olan kullanıcı olmadığı için post yaratmada hata alırsak admin sayfası olan http://127.0.0.1:8000/admin gidip tekrar bir oturum açmalıyız. Bu durumu geçici de olsa da halleder. Kalıcı çözüm, ana tutorialdan sonra **Ödev: Web sitene güvenlik ekleme!** bölümünde anlatılacak.

![Oturum hatası][4]

 [4]: images/post_create_error.png

## Form düzenleme

Artık yeni bir form oluşturmayı biliyoruz. Peki, mevcut bir formu güncellemek için ne yapmalı? Demin yaptığımıza çok benziyor. Şimdi, hızlıca bir kaç şey yaratalım (anlamadığın bir şey olduğu zaman, mentöre veya önceki bölümlere danışabilirsin, çünkü bu adımları daha önce yaptık).

`blog/templates/blog/post_detail.html` dosyasını açıp şu satırı ekleyelim:

```python
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

ki template buna benzesin:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.yayinlama_tarihi %}
            <div class="date">
                {{ post.yayinlama_tarihi }}
            </div>
        {% endif %}
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h1>{{ post.baslik }}</h1>
        <p>{{ post.yazi|linebreaksbr }}</p>
    </div>
{% endblock %}
```

`blog/urls.py` dosyasına şu satırı ekleyelim:

```python
    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```

Daha önce kullandığımız `blog/templates/blog/post_edit.html` template'i tekrar kullanacağız, tek eksik bir *view*.

Şimdi `blog/views.py` dosyasını açıp en sonuna şu satırı ekleyelim:

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.yazar = request.user
            post.yayinlama_tarihi = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Bu nerdeyse bizim `post_new` view'e benziyor, değil mi? Ama, tam da değil. İlk önce: Url'den ekstra bir `pk` parameteresi yolladık. Sonra: güncellemek istediğimiz `Post` modelini `get_object_or_404(Post, pk=pk)` ile alıp, bir form yarattığımızda bu postu bir `örnek kopya` (instance) olarak hem formu kaydettiğmizde yolluyoruz:

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

Bir bağlantıya (link) tıklayarak yeni bir blog oluşturabilmek harika! Ancak, şu haliyle siteye gelen herkes bir blog yaratıp kaydedebilir. Bu da istenen bir durum değil. Butonun sadece sana görünmesini sağlayalım.

`blog/templates/blog/base.html` dosyasında yarattığımız `page-header` `div` ve anchor etiketlerini (tags) bulalım. Şuna benziyor olmalı:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Şimdi bir `{% if %}` etiketi daha ekleyeceğiz ki link sadece admin olarak oturum açmış kişilere görünsün. Şimdilik, bu kişi sadece sensin! `<a>` etiketini şöyle değiştirelim:

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Bu `{% if %}` linkin tarayıcıya ancak kullanıcı oturum açmış ise gönderilmesini sağlar. Bu yeni post yaratılmasını kesin olarak engellemese de iyi bir başlangıç. Güvenlik konusu ek derslerde daha çok ele alınacak.

Oturum içi olduğumuz için, şimdi sayfayı yenilersek, farklı bir şey görmeyeceğiz. Sayfayı farklı bir tarayıcıda veya incognito bir pencerede yükleyelim. O zaman bu link görünmeyecek!

## Bir şey daha: deployment (yayına alma) zamanı!

Bakalım PythonAnywhere'de calışacak mı? Tekrar yayına alalım!

*   İlk önce kodumuzu commit edelim, sonra Github'a push edelim

```$ git status
$ git add --all .
$ git status
$ git commit -m "Web sitesine güncelleme ve yaratma için view eklendi."
$ git push
```

*   Sonra bir [PythonAnywhere Bash konsol][7] una gidip:

 [7]: https://www.pythonanywhere.com/consoles/

```
$ cd ilk-blogum
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```

*   Nihayet, [Web tab][8] ına gidip **Reload** edelim.

 [8]: https://www.pythonanywhere.com/web_app_setup/

O kadar! Tebrikler :)
