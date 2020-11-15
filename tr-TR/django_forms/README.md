# Django Forms

Blogumuzda yapmak istediğimiz son şey blog yazılarını eklemek ve düzenlemek için güzel bir yapı oluşturmak. Django'nun `admin` arayüzü çok havalı, ama özelleştirilmesi ve güzel hale getirilmesi oldukça zor. `forms` (formlar) ile kendi arayüzümüz üstünde mutlak bir güce sahip olacağız - neredeyse hayal ettiğimiz her şeyi yapabiliriz!

Django formlarının güzel yanı, hem sıfırdan bir form tanımlayabilmemiz hem de sonuçları modele kaydedecek bir `ModelForm` oluşturabilmemizdir.

Tam olarak yapmak istediğimiz şey: `Post` modelimiz için bir form oluşturmak.

Django'nun diğer önemli parçaları gibi, formların da kendi dosyası var: `forms.py`.

`blog` dizinimizde bu isimde bir dosya oluşturmalıyız.

    blog
       └── forms.py
    

Tamam, hadi dosyayı açalım ve aşağıdaki kodu yazalım:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Önce Django formları (`from django import forms`) ve tabii ki `Post` modelimizi (`from .models import Post`) import komutu ile dahil etmeliyiz.

Tahmin etmiş olabileceğiniz gibi, formumuzun ismi `PostForm`. Django'ya bu formun bir `ModelForm` olduğunu belirtmeliyiz. Bunu `forms.ModelForm` sayesinde Django bizim için yapacaktır.

Sırada Django'ya bu formu oluşturmak için hangi modelin kullanılması gerektiğini (`model = Post`) anlattığımız `class Meta` var.

Son olarak, formumuzda hangi alan(lar)ın bulunması gerektiğini söyleyebiliriz. Bu senaryoda sadece `title` ve `text` alanlarının gösterilmesini istiyoruz - `author` şu anda giriş yapmış olması gereken kişidir (yani siz!) ve biz ne zaman yeni bir yazı oluşturursak `created_date` otomatik olarak (örn. kod içinde) ayarlanmalıdır, değil mi?

Ve hepsi bu kadar! Şimdi tek yapmamız gereken formu bir *view* içinde kullanıp, template (şablon) içinde göstermek.

Bir kere daha sayfaya bir bağlantı, bir url, bir view ve bir template oluşturacağız.

## Formun bulunduğu sayfaya bağlantı oluşturma

Şimdi `blog/templates/blog/base.html` isimli örnek dosyayı açma zamanı. Öncelikle `page-header` adlı `div` öğesinin içine bir bağlantı ekleyeceğiz:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Yeni view'in (görünümün) adını `post_new` koymak istiyoruz. `"glyphicon glyphicon-plus"` class'ı kullandığımız bootstrap teması tarafından sağlanıyor ve bizim için bir artı işareti gösterecek.

Satırı ekledikten sonra, HTML dosyanız bu şekilde görünmelidir:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load staticfiles %}
< html>
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

Dosyayı kaydedip http://127.0.0.1:8000 sayfasını yeniledikten sonra, siz de bilindik `NoReverseMatch` hatasını görüyor olmalısınız, görüyorsunuz değil mi? Güzel!

## URL

`blog/urls.py` dosyasını açıp şu satırı ekleyelim:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

Ve kodun son hali şu şekilde görünecektir:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

Sayfayı yeniledikten sonra `post_new` view'ını oluşturmadığımız için `AttributeError` hatası alacağız. Şimdi onu ekleyelim.

## post_new view

Şimdi `blog/views.py` dosyasını açıp aşağıdaki satırları diğer `from` satırlarının olduğu yere ekleyelim:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Ve sonra bizim *view*'ımız:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Yeni bir `Post` formu oluşturmak için `PostForm()` fonksiyonunu çağırmak ve template'e iletmek gerekir. *view* kısmına geri döneceğiz, ancak şimdilik form için bir template oluşturalım.

## Template

Öncelikle `blog/templates/blog` dizininde `post_edit.html` isimli bir dosya oluşturmalıyız. Bir formu çalışır hale getirmek için birkaç şeye ihtiyacımız var:

* Formu göstermek zorundayız. Örneğin bunu şu şekilde yapabiliriz {% raw %}`{{ form.as_p }}`{% endraw %}.
* Yukarıdaki örnek satır HTML form etiketi içine alınmalı: `<form method="POST">...</form>`.
* Bir `Kaydet` butonuna ihtiyacımız var. Bunu Bir HTML butonu ile yapıyoruz: `<button type="submit">Kaydet</button>`.
* Ve son olarak, açılıştan hemen sonra `<form ...>` etiketini eklememiz gerekiyor {% raw %}`{% csrf_token %}`{% endraw %}. Formlarımızın güvenliğini sağladığı için bu çok önemlidir! Eğer bu kısmı unutursak, formu kaydetmeye çalıştığımızda Django şikayet edecektir:

![CSFR Korumalı sayfa](images/csrf2.png)

Tamam, hadi `post_edit.html` deki HTML'e bakalım:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>Yeni post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Kaydet</button>
    </form>
{% endblock %}
```

Yenileme zamanı! Hey! Formun görüntülendi!

![Yeni form](images/new_form2.png)

Ama, bekle bir dakika! `title` ve `text` alanlarına bir şey yazdığımızda ve kaydetmeye çalıştığımızda, ne olacak?

Hiçbir şey! Bir kere daha aynı sayfadayız, metnimiz gitmiş ve yeni gönderi de eklenmemiş. Peki neyi yanlış yaptık?

Yanıt: hiçbir şeyi. Sadece *view*'ımızda biraz daha iş yapmamız gerekiyor.

## Formu kaydetme

Bir kez daha `blog/views.py`'yi açalım. Hali hazırda `post_new` view'ının tamamı aşağıdaki gibi olmalı:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Formu gönderdiğimizde, aynı view'a yönlendirileceğiz, bu sefer `request` içinde daha fazla bilgi olacak, özellikle `request.POST` içinde (isimlendirmenin blog gönderisiyle bir bağlantısı yoktur; daha fazla veri göndermemizle ilgilidir). HTML dosyasında `<form>` tanımımızdaki `method="POST"` değişkenini hatırlıyor musunuz ? Formdan gelen tüm alanlar şimdi `request.POST`'un içerisinde. `POST`'un ismini değiştirmememiz lazım (`method` için geçerli diğer değer sadece `GET`'dir, ama şimdi ikisi arasındaki farkın ne olduğunu anlatacak kadar vaktimiz yok).

*view* içinde ele almamız gereken iki farklı durum var: ilki, sayfaya ilk kez eriştiğimizde boş bir form döndürmek isteğimiz durum, ikincisi ise *view*'e forma girdiğimiz form verisiyle geri döndüğümüz durum. Yani bir koşul eklememiz gerekiyor (bunun için `if` kullanacağız):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Boşlukları doldurma zamanı `[...]`. Eğer `method` `POST` ise `PostForm`'u forma girilen veri ile oluşturmalıyız, değil mi? Bunu şu şekilde yapacağız:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Bir sonraki işimiz formun doğru olup olmadığını kontrol etmek (tüm gerekli alanlar ayarlanmış ve yanlış değer verilmediyse). Bunu şu şekilde yaparız `form.is_valid()`.

Formun doğruluğunu kontrol ediyoruz ve doğru ise kaydedebiliriz!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Temel olarak, burada iki şey yaptık: formu `form.save` ile kaydettik ve bir author (yazar) ekledik (`PostForm`'da bir `author` tanımlı olmadığı ve bu zorunlu bir alan olduğu için). `commit=False` `Post` modelini henüzkaydetmek istemiyoruz demektir - öncelikle yazarı eklemeliyiz. Çoğu zaman `form.save()`'i `commit=False` olmadan kullanacağız, fakat bu durumda bu parametre ile kullanmalıyız. `post.save()` değişiklikleri saklar (author ekleyerek) ve yeni blog yazısı oluşturulur!

Son olarak hızlı bir şekilde yeni oluşturulmuş blog gönderimiz için `post_detail` sayfasına gidebilirsek harika olurdu değil mi? Bunu yapmak için bir tane daha import yapmamız gerekli:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Bunu dosyanın en başına ekleyelim. Şimdi yeni yarattığımız blog postu için "`post_detail` sayfasına git" diyebiliriz:

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail`, gitmek istediğimiz view'ın adı. Unutmayalım ki bu *view* için bir `pk` değişkeni lazım. Bu değeri viewlere aktarmak için `pk=post.pk` yazarız. Burada `post` yeni yarattığımız blog postudur!

Çok şey söyledik ama artık *view*'ı tümüyle bir görmek isteriz, değil mi?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Bakalım çalışacak mı? http://127.0.0.1:8000/post/new/ sayfasına gidelim, bir `title` ve `text` ekleyelim, kaydedelim... ve işte oldu! Yeni blog postu eklendi ve `post_detail` sayfasına yönlendirildik!

Postu kaydetmeden önce publish date'e değer atandığını fark etmiş olabilirsin. Daha sonra *publish button*'nı **Django Girls Tutorial: Ek konular**'da anlatacağız.

Süper!

> Yakın zamanda Django'nun admin arayüzünü kullandığımız için, sistem hala giriş yaptığımızı düşünüyor. Bazı durumlar bizim oturumdan çıkmamıza neden olabilir (web tarayıcısını kapatmak, veritabanını tekrar başlatmak, vb). Eğer oturum açık olmadığı için post yaratmada hata alırsak admin sayfası olan http://127.0.0.1:8000/admin adresine gidip tekrar oturum açmalıyız. Bu sorunu geçici olarak düzeltecektir. Kalıcı çözüm, ana tutorialdan sonra **Ödev: Web sitene güvenlik ekleme!** bölümünde anlatılacak.

![Oturum hatası](images/post_create_error.png)

## Form doğrulama

Şimdi de Django formlarının ne kadar havalı olduğunu görelim. Bir blog postunun `title` ve `text` alanları olmalı. `Post` modelimizde bu alanların gerekli olmadığını söylemedik (`published_date`'te yaptığımızın tersine), bu yüzden Django varsayılan olarak bu alanın dolu olmasını bekliyor.

Formu `title` ve `text` olmadan kaydetmeye çalışalım. Ne olacak, tahmin edin!

![Form doğrulama](images/form_validation2.png)

Django tüm alanların doğruluğunu bizim için kontrol ediyor. Ne güzel, değil mi?

## Form düzenleme

Artık nasıl yeni bir post oluşturulacağını biliyoruz. Peki, mevcut bir formu güncellemek için ne yapmalı? Bu az önce yaptığımız şeyle çok benzer. Hızlıca bazı önemli şeyleri oluşturalım. (Eğer birşeyi anlamazsan, mentörüne sormalısın veya önceki bölümlere bakmalısın, çünkü bütün bu adımları daha önce bitirdik.)

`blog/templates/blog/post_detail.html` dosyasını açalım ve şu satırı ekleyelim

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

böylece şablon şöyle görünecektir:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

`blog/urls.py` dosyasını açıp şu satırı ekleyelim:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Daha önce kullandığımız `blog/templates/blog/post_edit.html` template'ini tekrar kullanacağız, geriye bir tek *view* kalıyor.

Şimdi `blog/views.py` dosyasını açıp en sonuna şu satırı ekleyelim:

{% filename %}blog/views.py{% endfilename %}

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
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Bu nerdeyse bizim `post_new` view'inin aynısı, değil mi? Ama, tam da değil. Öncelikle `urls`'ten ekstra bir `pk` parametresi geçiriyoruz. Sonra,`get_object_or_404(Post, pk=pk)` ile düzenlemek istediğimiz `Post` modelini alıyoruz ve daha sonra bir form oluşturduğumuzda bu yazı objesini `instance` olarak geçiriyoruz, aynı şekilde formu kaydettiğimizde de…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…ve düzenlemek için bu post ile ilgili bir form açtığımızda:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Tamam, çalışıp çalışmadığını test edelim! `post_detail` sayfasına gidelim. Sağ üst köşede bir düzenleme butonu olmalı:

![Düzenle butonu](images/edit_button2.png)

Butona tıklarsak blog postunu görmemiz lazım:

![Form düzenleme](images/edit_form2.png)

İstediğimiz gibi title ve text'i değiştirebilir ve sonra da kaydedebiliriz!

Tebrikler! Uygulamamız gittikçe tamamlanıyor!

Eğer Django formlarıyla ilgili daha çok bilgiye ihtiyacın varsa, dökümanı okumalısın: https://docs.djangoproject.com/en/2.2/topics/forms/

## Güvenlik

Bir linke tıklayarak yeni bir blog oluşturabilmek harika! Ama şu anda sizin sitenizi ziyaret eden herkes yeni bir blog post yapabilecek ve bu muhtemelen isteyeceğiniz bir şey değil. Butonun sadece bize görünmesini sağlayalım.

`blog/templates/blog/base.html` dosyasında yarattığımız `page-header` `div` ve anchor etiketlerini (tags) bulalım. Şuna benziyor olmalı:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Linkin sadece admin olarak giriş yapmış kullanıcılara gözükmesi için başka bir `{% if %}` etiketi ekleyeceğiz. Şu anda bu kişi sensin! `<a>` etiketini şöyle değiştirelim:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Bu `{% if %}` linkin sadece sayfayı görüntüleyen kullanıcı oturum açtıysa görüntülenmesini sağlayacak. Bu yeni post yaratılmasını kesin olarak engellemese de iyi bir başlangıç. Güvenlik konusu ek derslerde daha çok ele alınacak.

Az evvel detay sayfamıza eklediğimiz düzenle ikonunu hatırladınız mı? Aynı değişikliği oraya da eklemek istiyoruz. Böylelikle başka insanlar var olan gönderileri düzenleyemeyecekler.

`blog/templates/blog/post_detail.html` dosyasını açalım ve şu satırı ekleyelim:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Bu şekilde değiştirelim:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Yüksek olasılıkla login yapmış olduğunuz için sayfayı yenilediğinizde farklı bir şey göremeyeceksiniz. Sayfayı farklı bir tarayıcı veya görünmez pencere ile yükleyelim (Windows Edge üzerinde "InPrivate" olarak adlandırılan), göreceksiniz ki bağlantı ve ikon artık görüntülenmiyor!

## Son bir şey daha: deployment (yayına alma) zamanı!

Bakalım PythonAnywhere'de de çalışacak mı? Tekrar yayına alalım!

* İlk önce kodumuzu commit edelim, sonra Github'a push edelim:

{% filename %}komut-satırı{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Sonra bir [PythonAnywhere Bash konsol](https://www.pythonanywhere.com/consoles/) una gidip:

{% filename %}PythonAnywhere komut-satırı{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Açı parantezleri olmadan `<your-pythonanywhere-domain>`'i gerçek PythonAnywhere alt alan adınzla değiştirmeyi unutmayın.)

* Son olarak, ["Web" page](https://www.pythonanywhere.com/web_app_setup/) bölümüne geçin (konsolun sağ üst tarafındaki menü düğmesini kullanın) ve **Yeniden yükle** tuşuna basın. Değişiklikleri görmek için https://subdomain.pythonanywhere.com blogunuzu yenileyin.

İşte bu kadar! Tebrikler :)