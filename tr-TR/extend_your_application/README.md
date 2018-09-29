{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Uygulamanı genişlet

Websitemizi oluşturmak için gerekli adımların hepsini tamamladık: bir modelin, url'nin, view'ün ve template'in nasıl yazılacağını biliyoruz. Websitemizi nasıl güzelleştirebiliriz onu da biliyoruz.

Pratik zamanı!

Blog'umuzda lazım olan ilk şey bir gönderiyi göstermek için bir sayfa, değil mi?

Halihazırda bir `Post` modelimiz var, dolayısıyla `models.py` dosyasına bir şey eklememize gerek yok.

## Bir gönderinin detayı için bir template(şablon) linki oluşturun

`blog/templates/blog/post_list.html` dosyasına bir link (bağlantı) ekleyerek başlayacağız. Bu dosyayı kod düzenleyicisinde açalım, şimdiye kadar yaptıklarımızın şöyle gözüküyor olması lazım:

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

`post_detail` kısmı Django'nun `blog/urls.py/` dosyasının içinde post_detail adlı bir URL beklediği anlamına gelir.

Peki `pk=post.pk`? `pk` primary key (birincil anahtar) için kullanılan kısaltmadır, veritabanındaki her kayıt için verilen özgün (eşsiz) bir isimdir. `Post` modelimiz için bir primary key tanımlamamış olduğumuz için, Django onu bizim için otomatik olarak oluşturdu (genelde, her kayıt için bir artan numara ile, örnek 1, 2, 3) ve her post için `pk` adlı bir alan ekledi. Primary key'e erişmek için `post.pk` yazarız, tıpkı `Post` objesindeki diğer alanlara eriştiğimiz gibi (`title`, `author`, vb.)!

Şimdi http://127.0.0.1:8000/ adresine gittiğimizde bir hata ile karşılaşacağız (`post_detail` için bir URL ya da *görüntü (view)* olmadığı için hatayı almamız normal). Hata böyle görünecektir:

![NoReverseMatch error (Tersi yok hatası)](images/no_reverse_match2.png)

## Bir gönderinin detayı için URL oluşturun

`post_detail` *view*'ımız için `urls.py`'un içinde bir URL oluşturalım!

İlk gönderimizin detayının şu **URL**'de gösterilmesini istiyoruz: http://127.0.0.1:8000/post/1/

`blog/urls.py` dosyasında `post_detail` adında bir Django *view*'ına işaret eden bir URL yapalım. Bu <1>view</1> bir gönderinin tümünü gösterecek. Kod düzenleyicide `blog/urls.py` dosyasını açın ve `path('post/<int:pk>)/', views.post_detail, name='post_detail'),` satırını ekleyin, böylece dosya şöyle görünür:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

`post/<int:pk>/` kısmı bir URL kalıbı belirtir - sizin için bunu açıklayalım:

- `post/`, URL'nin **post** kelimesi ile başlayıp ardından ** / ** ile devam etmesi gerektiği anlamına gelir.
- `<int:pk>` - bu bölüm daha zorlayıcı. Django'nun bir tamsayı değeri beklediği ve onu `pk` adlı bir değişken olarak bir görünüme(view) aktaracağı anlamına gelir.
- `/` - URL'yi bitirmeden önce **/** 'e tekrar ihtiyacımız var.

Bu şu demek, eğer tarayıcınıza `http://127.0.0.1:8000/post/5/` yazarsanız, Django `post_detail` adında bir *view* aradığınızı anlar ve `pk` eşittir `5` bilgisini *view*'e aktarır.

Tamamdır.`blog/urls.py`!'e yeni bir URL kalıbı ekledik! Http://127.0.0.1:8000/ sayfasını yenileyelim.Boom! Sunucu çalıştırmayı tekrar durdurdu. Konsola göz at, beklendiği gibi bir hata daha var!

![AttributeError (Özellik hatası)](images/attribute_error2.png)

Bir sonraki adımın ne olduğunu hatırlıyor musunuz? Tabi ki: view(görünüm)'ü eklemek!

## Gönderi detayı için bir view ekleyin

Bu sefer *view*'ımıza `pk` adında bir parametre ekleyeceğiz. *view*'ümüzün onu yakalaması gerekiyor, değil mi? Fonksiyonumuzu `def post_detail(request, pk):` olarak tanımlayacağız. Dikkat edin, url'lerde kullandığımız ismin birebir aynısını kullanmamız gerekiyor (`pk`). Bu değişkeni kullanmamak yanlıştır ve hataya sebep olacaktır!

Şimdi sadece ve sadece bir tane blog gönderisi almak istiyoruz. Bunu yapmak için şunun gibi sorgu setlerini/kümelerini kullanabiliriz:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Ama bu kodun bir problemi var. Eğer gelen `primary key` (`pk` - tekil anahtar) ile bir `Post` (gönderi) yoksa, çok çirkin bir hatamız olacak!

![DoesNotExist error (Yok hatası)](images/does_not_exist2.png)

Bunu istemiyoruz! Ama tabi Django'da bunu ele alan bir şey var: `get_object_or_404`. Eğer verilen `pk` ile bir `Post` bulunamazsa, çok daha güzel bir sayfa gösterilecek (`Sayfa bulunamadı 404` sayfası.

![Page not found (Sayfa bulunamadı)](images/404_2.png)

İyi haber şu, kendi `Sayfa bulunamadı` sayfasını yapabilir ve istediğiniz kadar güzelleştirebilirsiniz. Ama şu anda çok önemli değil, o yüzden bu kısmı atlayacağız.

Tamam, `views.py` dosyamıza bir *view* ekleme zamanı!

`blog/urls.py` içinde `views.post_detail` denilen bir görünüm ifade eden `post_detail` adında bir URL kuralı oluşturduk. Bu, Django'nun ` blog/views.py </ 0> içinde <code> post_detail </ 0> adlı bir görünüm fonksiyonu bekleyeceği anlamına gelir.</p>

<p><code>blog/views.py` 'i açmalıyız ve diğer `from` satırının yanına şu kodları eklemeliyiz:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

Ve dosyanın sonuna kendi *view*'ımızı ekleyeceğiz:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Evet. http://127.0.0.1:8000/ sayfasını tazeleme zamanı

![Post list view (Gönderi listesi görünümü)](images/post_list2.png)

Çalıştı! Fakat blog gönderisi başlığındaki bir bağlantıya tıkladığınızda ne oluyor?

![TemplateDoesNotExist error (Template yok hatası)](images/template_does_not_exist2.png)

Of hayır! Başka bir hata! Ama onu nasıl halledeceğimizi biliyoruz, di mi? Bir template eklememiz gerekiyor!

## Post(gönderi) detayları için bir template(şablon) oluştur

`blog/templates/blog` dizininde `post_detail.html` adında bir dosya oluşturalım ve kod düzenleyicisinde açalım.

Şöyle görünmeli:

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

Bir kere daha `base.html` dosyasıa ekleme yapacağız. `content` blogunda bir gönderinin varsa published_date, title ve text'ini göstermek istiyoruz. Ama daha önemli şeyleri konuşmalıyız, değil mi?

{% raw %}`{% if ... %} ... {% endif %}` bir şeyi kontrol etmek istediğimizde kullanabileceğimiz bir şablon etiketidir. ( `if ... else ..` ifadelerini **Python'a Giriş** bölümünden hatırladın mı?) Bu durumda eğer gönderinin `published_date` kısmı boş değilse kontrol etmek isteriz.{% endraw %}

Tamam, şimdi sayfamızı yenileyerek `TemplateDoesNotExist` hatası kaybolmuş mu görebiliriz.

![Post detail page (Gönderi detay sayfası)](images/post_detail2.png)

Heyo! Çalışıyor!

# Yayına alma zamanı!

Sitenizin hala PythonAnywhere'de çalışıp çalışmadığına bakmakta fayda var, değil mi? Yeniden taşımayı deneyelim.

{% filename %}komut satırı{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Site için CSS ve ayrıntılı blog gönderisi için görünüm ve şablon eklendi."
    $ git push
    

Sonra bir [PythonAnywhere Bash konsol](https://www.pythonanywhere.com/consoles/) una gidip:

{% filename %}komut satırı{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Açı parantezleri olmadan `<your-pythonanywhere-username>`'i gerçek PythonAnywhere kullanıcı isminizle değiştirmeyi unutmayın).

## Sunucudaki statik dosyaları güncelleyelim

PythonAynwhere gibi sunucular "statik dosyalar"a (CSS dosyaları gibi) Python dosyalarından farklı davranır çünkü onları daha hızlı yüklenmesi için optimize edebilir. Sonuç olarak, CSS dosyalarında her değişiklik yaptığınızda, sunucuya onları güncellediğimizi söylemek için ilave bir komut çalıştırmalıyız. Bu komuta `collectstatic` adı verilir.

Daha önceden çalıştırdığın virtualenv'in hala etkin değilse tekrar aktive ederek başlayın. (PythonAnywhere bunu yapmak için `workon` adlı bir komut kullanır. Kendi bilgisayarında kullandığın `source myenv/bin/activate` komutu gibi.):

{% filename %}komut satırı{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (kullaniciadiniz.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

`manage.py collectstatic` komutu biraz `manage.py migrate` komutu gibidir. Kodumuzda bazı değişiklikler yapıp Django'ya bu değişiklikleri sunucunun statik dosyalar yığınına ya da veritabanına uygulamasını söyledik.

Her durumda, artık ["Web" sayfasına](https://www.pythonanywhere.com/web_app_setup/) (konsolun sağ üstündeki menü düğmesinden) atlamaya ve **Yeniden Yükle** seçeneğine tıklamaya hazırız ve sonucu görmek için https://adınız.pythonanywhere.com sayfasına bakın.

İşte bu kadar! Tebrikler :)